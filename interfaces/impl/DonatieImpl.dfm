inherited frmDonatieImpl: TfrmDonatieImpl
  Caption = 'frmDonatieImpl'
  ExplicitWidth = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlLabels: TPanel
    inherited Label3: TLabel
      Top = 376
      ExplicitTop = 376
    end
    inherited Label11: TLabel
      Top = 312
      ExplicitTop = 312
    end
    inherited Label12: TLabel
      Top = 344
      ExplicitTop = 344
    end
    inherited Label13: TLabel
      Top = 406
      ExplicitTop = 406
    end
    object Label6: TLabel
      Left = 16
      Top = 280
      Width = 30
      Height = 13
      Caption = 'Ama'#231':'
    end
  end
  inherited pnlFields: TPanel
    inherited cmbBetaling: TComboBox
      Top = 368
      ExplicitTop = 368
    end
    inherited edtTelefoon: TEdit
      Top = 304
      TabOrder = 13
      ExplicitTop = 304
    end
    inherited edtEmail: TEdit
      Top = 336
      ExplicitTop = 336
    end
    inherited edtOmschrijving: TMemo
      Top = 400
      ExplicitTop = 400
    end
    object cmbDoel: TComboBox
      Left = 6
      Top = 272
      Width = 123
      Height = 21
      Hint = 'Doelen'
      HelpType = htKeyword
      HelpKeyword = 'Doel'
      TabOrder = 12
      TextHint = 'Naam'
    end
    object edtDonatie: TEdit
      Left = 158
      Top = 144
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Donatie'
      TabOrder = 14
      Text = 'true'
      Visible = False
    end
  end
end
