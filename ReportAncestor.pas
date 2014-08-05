unit ReportAncestor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, frxExportPDF, ADODB;

type
  TfrmReportAnchestor = class(TForm)
    frxReportAnchestor: TfrxReport;
    frxAnchestorMasterData: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    constructor Create(Owner: TComponent; ID: Integer; MasterTable: TADOTable); overload;
  end;

var
  frmReportAnchestor: TfrmReportAnchestor;

implementation

{$R *.dfm}

{ TfrmReportAnchestor }

constructor TfrmReportAnchestor.Create(Owner: TComponent; ID: Integer;
  MasterTable: TADOTable);
begin
  inherited Create(Owner);
  //frxAnchestorMasterData.DataSet := MasterTable;
end;

end.
