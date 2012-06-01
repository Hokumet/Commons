unit WordFields;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmKeywords = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pageControl: TPageControl;
    tshAlg: TTabSheet;
    tshDon: TTabSheet;
    tshWees: TTabSheet;
    OKBtn: TButton;
    CancelBtn: TButton;
    tshArm: TTabSheet;
    tshVrijw: TTabSheet;
    tshSpaa: TTabSheet;
    tshBeurs: TTabSheet;
    memAlg: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Memo2: TMemo;
    Label4: TLabel;
    Memo3: TMemo;
    Label5: TLabel;
    Memo4: TMemo;
    Label6: TLabel;
    Memo5: TMemo;
    Label7: TLabel;
    Memo6: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKeywords: TfrmKeywords;

implementation

{$R *.dfm}

end.

