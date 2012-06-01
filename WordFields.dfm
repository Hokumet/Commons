object frmKeywords: TfrmKeywords
  Left = 195
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Anahtar Kelimeler'
  ClientHeight = 248
  ClientWidth = 485
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 214
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    ExplicitWidth = 569
    ExplicitHeight = 266
    object pageControl: TPageControl
      Left = 5
      Top = 5
      Width = 475
      Height = 204
      ActivePage = tshAlg
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 559
      ExplicitHeight = 256
      object tshAlg: TTabSheet
        Caption = 'Genel Adres'
        ExplicitWidth = 551
        ExplicitHeight = 228
        object Label1: TLabel
          Left = 3
          Top = 16
          Width = 468
          Height = 13
          Caption = 
            'Word programinda kullanabileceginiz anahtar s'#246'zc'#252'kler: Bu s'#246'zc'#252'k' +
            'ler yerine asil veriler ge'#231'ecektir '#39
        end
        object memAlg: TMemo
          Left = 3
          Top = 35
          Width = 238
          Height = 134
          Enabled = False
          Lines.Strings = (
            'Sira No                   = __LidNr__'
            'Aid Soyadi              = __Naam__'
            'Adres                     = __Straat__'
            'Posta kodu             = __PostCode__'
            'Sehir                       = __Plaats__'
            'Kategori                  = __Categorie__'
            'Telefon                   = __Telefoonnr__'
            'E-mail                      = __Email__'
            'A'#231'iklama                  = __Omschrijving__')
          TabOrder = 0
        end
      end
      object tshDon: TTabSheet
        Caption = 'Aylik Bagis'
        ExplicitWidth = 551
        ExplicitHeight = 228
        object Label2: TLabel
          Left = 3
          Top = 16
          Width = 468
          Height = 13
          Caption = 
            'Word programinda kullanabileceginiz anahtar s'#246'zc'#252'kler: Bu s'#246'zc'#252'k' +
            'ler yerine asil veriler ge'#231'ecektir '#39
        end
        object Memo1: TMemo
          Left = 3
          Top = 35
          Width = 238
          Height = 134
          Lines.Strings = (
            'Sira No                   = __LidNr__'
            'Aid Soyadi              = __Naam__'
            'Adres                     = __Straat__'
            'Posta kodu             = __PostCode__'
            'Sehir                       = __Plaats__'
            'Kategori                  = __Categorie__'
            'Telefon                   = __Telefoonnr__'
            'E-mail                      = __Email__'
            'A'#231'iklama                  = __Omschrijving__')
          TabOrder = 0
        end
      end
      object tshWees: TTabSheet
        Caption = 'Yetim Kardes Aile'
        ExplicitWidth = 551
        ExplicitHeight = 228
        object Label3: TLabel
          Left = 3
          Top = 16
          Width = 468
          Height = 13
          Caption = 
            'Word programinda kullanabileceginiz anahtar s'#246'zc'#252'kler: Bu s'#246'zc'#252'k' +
            'ler yerine asil veriler ge'#231'ecektir '#39
        end
        object Memo2: TMemo
          Left = 3
          Top = 35
          Width = 238
          Height = 134
          Lines.Strings = (
            'Sira No                   = __LidNr__'
            'Aid Soyadi              = __Naam__'
            'Adres                     = __Straat__'
            'Posta kodu             = __PostCode__'
            'Sehir                       = __Plaats__'
            'Kategori                  = __Categorie__'
            'Telefon                   = __Telefoonnr__'
            'E-mail                      = __Email__'
            'A'#231'iklama                  = __Omschrijving__')
          TabOrder = 0
        end
      end
      object tshArm: TTabSheet
        Caption = 'Fair Kardes Aile'
        ImageIndex = 3
        ExplicitWidth = 551
        ExplicitHeight = 228
        object Label4: TLabel
          Left = 3
          Top = 16
          Width = 468
          Height = 13
          Caption = 
            'Word programinda kullanabileceginiz anahtar s'#246'zc'#252'kler: Bu s'#246'zc'#252'k' +
            'ler yerine asil veriler ge'#231'ecektir '#39
        end
        object Memo3: TMemo
          Left = 3
          Top = 35
          Width = 238
          Height = 134
          Lines.Strings = (
            'Sira No                   = __LidNr__'
            'Aid Soyadi              = __Naam__'
            'Adres                     = __Straat__'
            'Posta kodu             = __PostCode__'
            'Sehir                       = __Plaats__'
            'Kategori                  = __Categorie__'
            'Telefon                   = __Telefoonnr__'
            'E-mail                      = __Email__'
            'A'#231'iklama                  = __Omschrijving__')
          TabOrder = 0
        end
      end
      object tshVrijw: TTabSheet
        Caption = 'G'#246'n'#252'll'#252
        ImageIndex = 4
        ExplicitWidth = 551
        ExplicitHeight = 228
        object Label5: TLabel
          Left = 3
          Top = 16
          Width = 468
          Height = 13
          Caption = 
            'Word programinda kullanabileceginiz anahtar s'#246'zc'#252'kler: Bu s'#246'zc'#252'k' +
            'ler yerine asil veriler ge'#231'ecektir '#39
        end
        object Memo4: TMemo
          Left = 3
          Top = 35
          Width = 238
          Height = 134
          Lines.Strings = (
            'Sira No                   = __LidNr__'
            'Aid Soyadi              = __Naam__'
            'Adres                     = __Straat__'
            'Posta kodu             = __PostCode__'
            'Sehir                       = __Plaats__'
            'Kategori                  = __Categorie__'
            'Telefon                   = __Telefoonnr__'
            'E-mail                      = __Email__'
            'A'#231'iklama                  = __Omschrijving__')
          TabOrder = 0
        end
      end
      object tshSpaa: TTabSheet
        Caption = 'Kumbara'
        ImageIndex = 5
        ExplicitWidth = 551
        ExplicitHeight = 228
        object Label6: TLabel
          Left = 3
          Top = 16
          Width = 463
          Height = 13
          Caption = 
            'Word programinda kullanabileceginiz anahtar s'#246'zc'#252'kler: Bu s'#246'zc'#252'k' +
            'ler yerine asil veriler ge'#231'ecektir'
        end
        object Memo5: TMemo
          Left = 3
          Top = 35
          Width = 238
          Height = 134
          Lines.Strings = (
            'Sira No                   = __LidNr__'
            'Aid Soyadi              = __Naam__'
            'Adres                     = __Straat__'
            'Posta kodu             = __PostCode__'
            'Sehir                       = __Plaats__'
            'Kategori                  = __Categorie__'
            'Telefon                   = __Telefoonnr__'
            'E-mail                      = __Email__'
            'A'#231'iklama                  = __Omschrijving__')
          TabOrder = 0
        end
      end
      object tshBeurs: TTabSheet
        Caption = 'Burs'
        ImageIndex = 6
        ExplicitWidth = 551
        ExplicitHeight = 228
        object Label7: TLabel
          Left = 3
          Top = 16
          Width = 463
          Height = 13
          Caption = 
            'Word programinda kullanabileceginiz anahtar s'#246'zc'#252'kler: Bu s'#246'zc'#252'k' +
            'ler yerine asil veriler ge'#231'ecektir'
        end
        object Memo6: TMemo
          Left = 3
          Top = 35
          Width = 238
          Height = 134
          Lines.Strings = (
            'Sira No                   = __LidNr__'
            'Aid Soyadi              = __Naam__'
            'Adres                     = __Straat__'
            'Posta kodu             = __PostCode__'
            'Sehir                       = __Plaats__'
            'Kategori                  = __Categorie__'
            'Telefon                   = __Telefoonnr__'
            'E-mail                      = __Email__'
            'A'#231'iklama                  = __Omschrijving__')
          TabOrder = 0
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 214
    Width = 485
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    ExplicitTop = 266
    ExplicitWidth = 569
    object OKBtn: TButton
      Left = 321
      Top = 2
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 401
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
