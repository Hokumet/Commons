unit HEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, HolderEdits, AdoDB, Contnrs, Data.DB;

type
  TfrmHEdit = class(TForm)
    Panel3: TPanel;
    LblAangemaakDoor: TLabel;
    lblAangemaaktOp: TLabel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    btnReset: TBitBtn;
    pnlLabels: TPanel;
    pnlFields: TPanel;
    CurrQuery: TADOQuery;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    sFieldName: String;
    sFieldValue: String;
    procedure fillCmb(cmb:TComboBox; def:String);
  protected
    ID: Integer;
    CurrTable: TADOTable;
    OwnerId: Integer;
    OwnerKey: String;
    MasterKey: String;
    TableObjectList: TObjectList;
    TFilter: TADOTable;
    Loading: boolean;
    function getFieldName(edtField: TControl):String;
    function getFieldValue(edtField: TControl):String;
    procedure loadField(eField: TControl);
    procedure saveField(eField:TControl);
    procedure loadEditField(edtField:TEdit);
    procedure loadRbtnGroupField(rbtnGrpField:TRadioGroup);
    procedure loadCheckBoxField(ckbField:TCheckBox);
    procedure loadComboField(comboField:TComboBox);
    procedure loadCurrencyField(currField:THCurrencyEdit);
    procedure loadFloatField(floatField:THFloatEdit);
    procedure loadDateField(dateField:TDateTimePicker);
    procedure loadMemoField(memoField:TMeMo);
    procedure loadDetails; virtual;
    procedure loadDetailsTables; virtual;
    procedure loadFields(); virtual;
    procedure saveEditField(edtField:TEdit);
    procedure saveRbtnGroupField(rbtnGrpField:TRadioGroup);
    procedure saveCheckBoxField(ckbField:TCheckBox);
    procedure saveComboField(comboField:TComboBox);
    procedure saveCurrencyField(currField:THCurrencyEdit);
    procedure saveFloatField(floatField:THFloatEdit);
    procedure saveDateField(dateField:TDateTimePicker);
    procedure saveMemoField(memoField:TMeMo);
    procedure saveFields(); virtual;
    procedure cancelFields();
    procedure loadOnce(); virtual;
    procedure loadOnceAfter(); virtual;
    procedure filterTable(FieldName: String; Value: Integer); overload;
    procedure filterTable(FieldName: String; Operation:String; Value: String);  overload;
  public
    constructor Create(Owner: TComponent; ID: Integer; AdoTable: TADOTable); overload;
    constructor Create(Owner: TComponent; ID: Integer; AdoTable: TADOTable; Key: String); overload;
    constructor Create(Owner: TComponent; ID: Integer; AdoTable: TADOTable; OwnerId: Integer; OwnerKey:String); overload;
  end;

var
  frmHEdit: TfrmHEdit;

implementation

uses Main;
{$R *.dfm}
{ TfrmEditAlgemeen }

constructor TfrmHEdit.Create(Owner: TComponent; ID: Integer;
  AdoTable: TADOTable);
begin
  inherited Create(Owner);
  Loading := true;
  TableObjectList := TObjectList.Create;
  CurrTable := AdoTable;
  CurrQuery.Connection := CurrTable.Connection;
  loadOnce();
  Self.Id := Id;
  if Id = 0 then begin
    CurrTable.Insert;
    loadFields();
  end
  else if Id = -1 then begin
  end
  else begin
    CurrTable.Locate('ID', ID, []);
    loadFields();
    loadDetailsTables();
    loadDetails();
    CurrTable.Edit;
  end;
  loadOnceAfter;
  btnReset.Visible := not(Id = 0);
  Loading := false;
end;

procedure TfrmHEdit.btnCancelClick(Sender: TObject);
begin
  cancelFields();
end;

procedure TfrmHEdit.btnResetClick(Sender: TObject);
begin
  CurrTable.Cancel;
  loadFields();
  loadDetailsTables();
  loadDetails();
  CurrTable.edit;
end;

procedure TfrmHEdit.btnSaveClick(Sender: TObject);
var user: String;
begin
  if CurrTable.FieldByName('AangemaaktDoor').AsString = '' then begin
    if Owner is TfrmMain then
      CurrTable.FieldByName('AangemaaktDoor').AsString := TfrmMain(Owner).user;
    CurrTable.FieldByName('AangemaaktOp').AsDateTime := Date;
  end;
  saveFields();
end;

procedure TfrmHEdit.cancelFields;
var I: Integer;
begin
  for I := 0 to TableObjectList.Count -1 do begin
    try
      TADOTable(TableObjectList.Items[I]).CancelBatch;
    except
    on E: Exception do
       //
    end;
  end;
  CurrTable.Cancel;
end;

constructor TfrmHEdit.Create(Owner: TComponent; ID: Integer;
  AdoTable: TADOTable; OwnerId: Integer; OwnerKey:String);
begin
  Self.OwnerId := OwnerId;
  Self.OwnerKey := OwnerKey;
  Create(Owner, ID, AdoTable);
end;

constructor TfrmHEdit.Create(Owner: TComponent; ID: Integer;
  AdoTable: TADOTable; Key: String);
begin
  inherited Create(Owner);
  Loading := true;
  TableObjectList := TObjectList.Create;
  CurrTable := AdoTable;
  CurrQuery.Connection := CurrTable.Connection;
  loadOnce();
  Self.Id := Id;
  MasterKey := Key;
  if Id = 0  then begin
    CurrTable.Insert;
    loadFields();
  end
  else begin
    CurrTable.Locate('ID', ID, []);
    loadFields();
    loadDetailsTables();
    loadDetails();
    CurrTable.Edit;
  end;
  loadOnceAfter;
  btnReset.Visible := not(Id = 0);
  Loading := false;
end;

procedure TfrmHEdit.fillCmb(cmb: TComboBox; def: String);
var I: Integer;
    table:String;
    field:String;
begin
  table :=  cmb.Hint;
  field := cmb.TextHint;
  CurrQuery.SQL.Clear;
  CurrQuery.SQL.Add('Select *  from '+ table);
  CurrQuery.ExecSQL;

  CurrQuery.Open;
  CurrQuery.First;

  for I := 0 to CurrQuery.RecordCount -1 do begin
    cmb.AddItem(CurrQuery.FieldByName(field).AsString, Pointer(CurrQuery.FieldByName('Id').AsInteger));
    if(CurrQuery.FieldByName(field).AsString = def) then begin
      cmb.ItemIndex := I;
    end;
    CurrQuery.Next;
  end;
  if cmb.ItemIndex = -1 then
    cmb.ItemIndex := 0;
end;

procedure TfrmHEdit.filterTable(FieldName: String; Value: Integer);
begin
  TFilter.Filtered := false;
  TFilter.Filter := FieldName + '=' + IntToStr(Value);
  TFilter.Filtered := true;
end;

procedure TfrmHEdit.filterTable(FieldName, Operation, Value: String);
begin
  TFilter.Filtered := false;
  TFilter.Filter := FieldName + Operation + QuotedStr(Value+'%');
  TFilter.Filtered := true;
end;

procedure TfrmHEdit.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    CurrTable.Cancel;
    Close
  end;
end;

function TfrmHEdit.getFieldName(edtField: TControl): String;
var
  edt: TEdit;
  curr: THCurrencyEdit;
  combo: TComboBox;
begin
  if edtField is TEdit then  begin
    edt := TEdit(edtField);
    Result := edt.HelpKeyword;
  end
  else if edtField is THCurrencyEdit then  begin
    curr := THCurrencyEdit(edtField);
    Result := curr.HelpKeyword;
  end
  else if edtField is TComboBox then  begin
    combo := TComboBox(edtField);
    Result := combo.HelpKeyword;
  end;
end;

function TfrmHEdit.getFieldValue(edtField: TControl): String;
var
  value: String;
  edt: TEdit;
  curr: THCurrencyEdit;
  combo: TComboBox;
begin
  if edtField is TEdit then  begin
    edt := TEdit(edtField);
    value := edt.HelpKeyword;
  end
  else if edtField is THCurrencyEdit then  begin
    curr := THCurrencyEdit(edtField);
    value := curr.HelpKeyword;
  end
  else if edtField is TComboBox then  begin
    combo := TComboBox(edtField);
    value := combo.HelpKeyword;
  end;
end;

procedure TfrmHEdit.loadCheckBoxField(ckbField: TCheckBox);
begin
  ckbField.Checked := CurrTable.FieldByName(ckbField.HelpKeyword).AsBoolean;
end;

procedure TfrmHEdit.loadComboField(comboField: TComboBox);
var
  value: String;
begin
  if comboField.HelpKeyword <> '' then begin
    value := CurrTable.FieldByName(comboField.HelpKeyword).AsString;
    fillCmb(comboField,  value);
  end;
end;

procedure TfrmHEdit.loadCurrencyField(currField: THCurrencyEdit);
var
  value: Double;
begin
  value := CurrTable.FieldByName(currField.HelpKeyword).AsFloat;
  currField.Value := value;
end;

procedure TfrmHEdit.loadDateField(dateField: TDateTimePicker);
var
  value: TDateTime;
begin
  value := CurrTable.FieldByName(dateField.HelpKeyword).AsDateTime;
  if dateField.ImeName <> '' then begin
    if value > EncodeDate(2012, 12, 12) then
      dateField.Date := value
  end
  else if value > EncodeDate(2012, 12, 12) then
    dateField.Date := value
  else
    dateField.Date := Date;
end;

procedure TfrmHEdit.loadDetails;
var I: Integer;
begin
  for I := 0 to TableObjectList.Count -1 do begin
    TADOTable(TableObjectList.Items[I]).Filtered := False;
    TADOTable(TableObjectList.Items[I]).Filter := Masterkey+ '= '+ IntToStr(Id);
    TADOTable(TableObjectList.Items[I]).Filtered := True;
  end;
  // verder vullen bij kind
//  frameDagen.lvwItems.Clear;
end;

procedure TfrmHEdit.loadDetailsTables;
begin
//vullen bij kind
//  TDagen := TfrmMain.GetTableDagen;
//  TableObjectList.Add(TDagen);
//  frameDagen.FTable := TDagen;
end;

procedure TfrmHEdit.loadEditField(edtField: TEdit);
var
  value: String;
begin
  value := CurrTable.FieldByName(edtField.HelpKeyword).AsString;
  edtField.Text := value;
end;

procedure TfrmHEdit.loadField(eField: TControl);
var I: Integer;
begin
  if eField is TEdit then  begin
    loadEditField(TEdit(eField));
  end
  else if eField is THCurrencyEdit then  begin
    loadCurrencyField(THCurrencyEdit(eField));
  end
  else if eField is THFloatEdit then  begin
    loadFloatField(THFloatEdit(eField));
  end
  else if eField is TComboBox then  begin
    loadComboField(TComboBox(eField));
  end
  else if eField is TDateTimePicker then  begin
    loadDateField(TDateTimePicker(eField));
  end
  else if eField is TMemo then  begin
    loadMemoField(TMemo(eField));
  end
  else if eField is TRadioGroup then  begin
    loadRbtnGroupField(TRadioGroup(eField));
  end
  else if eField is TPanel then    begin
    for I := 0 to TPanel(eField).ControlCount - 1 do begin
      if TPanel(eField).Controls[I].Visible then
        loadField(TPanel(eField).Controls[I]);
    end;
  end

end;

procedure TfrmHEdit.loadFields;
var I: Integer;
begin
  for I := 0 to pnlFields.ControlCount - 1 do begin
    loadField(pnlFields.Controls[I]);
  end;
  LblAangemaakDoor.Caption := 'Aangemaakt door: ' + CurrTable.FieldByName('AangemaaktDoor').AsString ;
  lblAangemaaktOp.Caption := 'Aangemaakt op: ' + CurrTable.FieldByName('AangemaaktOp').AsString;
end;


procedure TfrmHEdit.loadFloatField(floatField: THFloatEdit);
var
  value: Double;
begin
  value := CurrTable.FieldByName(floatField.HelpKeyword).AsFloat;
  floatField.Value := value;
end;

procedure TfrmHEdit.loadMemoField(memoField: TMeMo);
var
  value: String;
begin
  value := CurrTable.FieldByName(memoField.HelpKeyword).AsString;
  memoField.Lines.Add(value);
end;

procedure TfrmHEdit.loadOnce;
begin

end;

procedure TfrmHEdit.loadOnceAfter;
begin
///
end;

procedure TfrmHEdit.loadRbtnGroupField(rbtnGrpField: TRadioGroup);
var
  value: String;
begin
  value := CurrTable.FieldByName(rbtnGrpField.HelpKeyword).AsString;
  rbtnGrpField.ItemIndex := rbtnGrpField.Items.IndexOf(value);
end;

procedure TfrmHEdit.saveCheckBoxField(ckbField: TCheckBox);
begin
  CurrTable.FieldByName(ckbField.HelpKeyword).AsBoolean := ckbField.Checked;
end;

procedure TfrmHEdit.saveComboField(comboField: TComboBox);
var
  field: String;
begin
  field := comboField.HelpKeyword;
  CurrTable.FieldByName(field).AsString := comboField.Text;
end;

procedure TfrmHEdit.saveCurrencyField(currField: THCurrencyEdit);
var
  field: String;
begin
  field := currField.HelpKeyword;
  CurrTable.FieldByName(field).AsCurrency := currField.Value;
end;

procedure TfrmHEdit.saveDateField(dateField: TDateTimePicker);
var
  field: String;
begin                     
  field := dateField.HelpKeyword;
  CurrTable.FieldByName(field).AsDateTime := dateField.DateTime;
end;

procedure TfrmHEdit.saveEditField(edtField: TEdit);
var
  field: String;
begin
  field := edtField.HelpKeyword;
  CurrTable.FieldByName(field).AsString := edtField.Text;
end;

procedure TfrmHEdit.saveField(eField: TControl);
var I: Integer;
begin
  if eField.HelpKeyword <> '' then begin
    if eField is TEdit then  begin
      saveEditField(TEdit(eField));
    end
    else if eField is THCurrencyEdit then  begin
      saveCurrencyField(THCurrencyEdit(eField));
    end
    else if eField is THFloatEdit then  begin
      saveFloatField(THFloatEdit(eField));
    end
    else if eField is TComboBox then  begin
      saveComboField(TComboBox(eField));
    end
    else if eField is TDateTimePicker then  begin
      saveDateField(TDateTimePicker(eField));
    end
    else if eField is TMemo then  begin
      saveMemoField(TMemo(eField));
    end
    else if eField is TRadioGroup then  begin
      saveRbtnGroupField(TRadioGroup(eField));
    end
  end
  else if eField is TPanel then    begin
    for I := 0 to TPanel(eField).ControlCount - 1 do begin
      if TPanel(eField).Controls[I].Visible then
        saveField(TPanel(eField).Controls[I]);
    end;
  end

end;

procedure TfrmHEdit.saveFields;
var I: Integer;
begin
  for I := 0 to pnlFields.ControlCount - 1 do begin
    saveField(pnlFields.Controls[I]);
  end;
  if OwnerId > 0 then
    CurrTable.FieldByName(OwnerKey).AsInteger := OwnerId;

  if CurrTable.FieldByName('AangemaaktDoor').AsString = '' then begin
    if Owner is TfrmMain then
      CurrTable.FieldByName('AangemaaktDoor').AsString := TfrmMain(Owner).user;
    CurrTable.FieldByName('AangemaaktOp').AsDateTime := Date;
  end;

  if self.Hint <> 'Detail' then begin
    for I := 0 to TableObjectList.Count -1 do begin
      TADOTable(TableObjectList.Items[I]).UpdateBatch;
    end;
    CurrTable.UpdateBatch;
  end;
end;


procedure TfrmHEdit.saveFloatField(floatField: THFloatEdit);
var
  field: String;
begin
  field := floatField.HelpKeyword;
  CurrTable.FieldByName(field).AsFloat := floatField.Value;
end;

procedure TfrmHEdit.saveMemoField(memoField: TMeMo);
var
  field: String;
begin
  field := memoField.HelpKeyword;
  CurrTable.FieldByName(field).AsString := memoField.Lines.Text;
end;

procedure TfrmHEdit.saveRbtnGroupField(rbtnGrpField:TRadioGroup);
var
  field: String;
begin
  field := rbtnGrpField.HelpKeyword;
  CurrTable.FieldByName(field).AsString := rbtnGrpField.Items[rbtnGrpField.ItemIndex];
end;

end.
