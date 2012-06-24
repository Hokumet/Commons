inherited frmSpaarpotImpl: TfrmSpaarpotImpl
  Caption = 'frmSpaarpotImpl'
  ClientHeight = 581
  ExplicitWidth = 415
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 502
    ExplicitTop = 502
  end
  inherited pnlLabels: TPanel
    Height = 502
    ExplicitHeight = 502
    inherited Label3: TLabel
      Top = 372
      ExplicitTop = 372
    end
    inherited Label11: TLabel
      Top = 248
      ExplicitTop = 248
    end
    inherited Label12: TLabel
      Top = 280
      ExplicitTop = 280
    end
    inherited Label13: TLabel
      Top = 402
      ExplicitTop = 402
    end
    object Label4: TLabel
      Left = 16
      Top = 216
      Width = 62
      Height = 13
      Caption = 'Kumbara No:'
    end
    object Label5: TLabel
      Left = 16
      Top = 312
      Width = 24
      Height = 13
      Caption = #220'lke:'
    end
    object Label6: TLabel
      Left = 16
      Top = 342
      Width = 58
      Height = 13
      Caption = #214'grenci adi:'
    end
  end
  inherited pnlFields: TPanel
    Height = 502
    ExplicitHeight = 502
    inherited cmbBetaling: TComboBox
      Top = 364
      TabOrder = 11
      ExplicitTop = 364
    end
    inherited edtTelefoon: TEdit
      Top = 240
      TabOrder = 7
      ExplicitTop = 240
    end
    inherited edtEmail: TEdit
      Top = 272
      TabOrder = 8
      ExplicitTop = 272
    end
    inherited edtOmschrijving: TMemo
      Top = 396
      Lines.Strings = ()
      TabOrder = 12
      ExplicitTop = 396
    end
    inherited edtAlgemeen: TEdit
      TabOrder = 13
    end
    object edtSpaarpotNr: TEdit
      Left = 6
      Top = 208
      Width = 121
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'SpaarpotNr'
      TabOrder = 6
    end
    object cmbLand: TComboBox
      Left = 6
      Top = 304
      Width = 145
      Height = 21
      Hint = 'Landen'
      HelpType = htKeyword
      HelpKeyword = 'Land'
      TabOrder = 9
      TextHint = 'Naam'
    end
    object edtYFONaam: TEdit
      Left = 6
      Top = 334
      Width = 219
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'YFONaam'
      TabOrder = 10
    end
    object edtSpaarpot: TEdit
      Left = 158
      Top = 144
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Spaarpot'
      TabOrder = 14
      Text = 'true'
      Visible = False
    end
  end
end
