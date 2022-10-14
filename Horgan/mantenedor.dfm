object formMantenedor: TformMantenedor
  Left = 192
  Top = 117
  BorderStyle = bsDialog
  Caption = 'formMantenedor'
  ClientHeight = 278
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 478
    Height = 278
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    TabStyle = tsSquareCorners
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Color = clWhite
      Caption = 'Mi Perfil'
      object PInfoUser: TPanel
        Left = 168
        Top = 16
        Width = 289
        Height = 193
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Color = clWhite
        TabOrder = 0
        object EditUsuario: TLabeledEdit
          Left = 24
          Top = 32
          Width = 241
          Height = 24
          EditLabel.Width = 41
          EditLabel.Height = 16
          EditLabel.Caption = 'Usuario:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clBlack
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Nunito Sans'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Nunito Sans'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object EditNombre: TLabeledEdit
          Left = 24
          Top = 80
          Width = 241
          Height = 24
          EditLabel.Width = 92
          EditLabel.Height = 16
          EditLabel.Caption = 'Nombre Completo:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clBlack
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Nunito Sans'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Nunito Sans'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EditCorreo: TLabeledEdit
          Left = 24
          Top = 128
          Width = 241
          Height = 24
          EditLabel.Width = 93
          EditLabel.Height = 16
          EditLabel.Caption = 'Correo Electronico:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clBlack
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Nunito Sans'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Nunito Sans'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object btnActualizar: TPanel
          Left = 160
          Top = 160
          Width = 105
          Height = 25
          Cursor = crHandPoint
          BevelInner = bvLowered
          BevelOuter = bvSpace
          Caption = 'Actualizar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Nunito Sans SemiBold'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnActualizarClick
        end
        object editID: TEdit
          Left = 24
          Top = 160
          Width = 25
          Height = 21
          TabOrder = 4
          Text = 'editID'
          Visible = False
        end
      end
      object btnSubir: TPanel
        Left = 16
        Top = 184
        Width = 137
        Height = 25
        Cursor = crHandPoint
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Caption = 'Subir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Nunito Sans SemiBold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnSubirClick
      end
      object P_IMG: TPanel
        Left = 16
        Top = 32
        Width = 137
        Height = 129
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Color = clWhite
        TabOrder = 2
        object img: TImage
          Left = 2
          Top = 2
          Width = 133
          Height = 125
          Align = alClient
          Center = True
          Proportional = True
          Stretch = True
        end
      end
      object EditRuta: TEdit
        Left = 16
        Top = 216
        Width = 137
        Height = 21
        TabOrder = 3
        Visible = False
      end
      object EditIMG: TEdit
        Left = 160
        Top = 216
        Width = 49
        Height = 21
        TabOrder = 4
        Text = 'EditIMG'
        Visible = False
      end
    end
    object TabSheet2: TRzTabSheet
      Color = clWhite
      Caption = 'Seguridad'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 234
        Height = 40
        Caption = 'Seguridad de la Aplicaci'#243'n'#13'Horgan Desktop'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Ubuntu Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 72
        Width = 412
        Height = 36
        Caption = 
          'Horgan Desktop Application. Tu informaci'#243'n esta segura con nosot' +
          'ros, '#13'se usar'#225' meramente para fines de uso de la aplicaci'#243'n.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Nunito Sans SemiBold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 16
        Top = 128
        Width = 217
        Height = 57
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 0
        object EditContrasenaActual: TLabeledEdit
          Left = 8
          Top = 20
          Width = 185
          Height = 21
          EditLabel.Width = 89
          EditLabel.Height = 13
          EditLabel.Caption = 'Contrase'#241'a actual:'
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object btnConfirmacion: TPanel
        Left = 16
        Top = 192
        Width = 217
        Height = 25
        Cursor = crHandPoint
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Caption = 'Confirmar Contrase'#241'a'
        TabOrder = 1
        OnClick = btnConfirmacionClick
      end
      object PActualizarContrasena: TPanel
        Left = 240
        Top = 128
        Width = 217
        Height = 57
        BevelInner = bvLowered
        TabOrder = 2
        object LabeledEditActualizarContrasena: TLabeledEdit
          Left = 16
          Top = 20
          Width = 185
          Height = 21
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Nueva contrase'#241'a:'
          Enabled = False
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object btnActualizarContrasena: TPanel
        Left = 240
        Top = 192
        Width = 217
        Height = 25
        Cursor = crHandPoint
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Caption = 'Actualizar Contrase'#241'a'
        Enabled = False
        TabOrder = 3
        OnClick = btnActualizarContrasenaClick
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 433
    Top = 40
  end
end
