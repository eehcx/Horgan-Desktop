object formCreateEspacios: TformCreateEspacios
  Left = 192
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Crear un Espacio'
  ClientHeight = 271
  ClientWidth = 479
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object L_Txt: TLabel
    Left = 24
    Top = 16
    Width = 287
    Height = 34
    Caption = 'crea un Espacio de Trabajo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Nunito Sans'
    Font.Style = []
    ParentFont = False
  end
  object EditEspacios: TEdit
    Left = 40
    Top = 80
    Width = 377
    Height = 31
    BevelInner = bvLowered
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Nunito Sans Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Nombra tu Espacio de Trabajo'
  end
  object ComboCategory: TComboBox
    Left = 40
    Top = 136
    Width = 377
    Height = 31
    BevelInner = bvLowered
    BevelKind = bkFlat
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Nunito Sans Light'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 1
    Text = '  Selecciona una categor'#237'a'
    OnKeyPress = ComboCategoryKeyPress
  end
  object btnCrear: TPanel
    Left = 296
    Top = 192
    Width = 121
    Height = 33
    Cursor = crHandPoint
    BevelOuter = bvNone
    Caption = 'Crear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Nunito Sans Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCrearClick
    OnMouseMove = btnCrearMouseMove
  end
  object ComboCategory2: TComboBox
    Left = 432
    Top = 136
    Width = 41
    Height = 31
    BevelInner = bvLowered
    BevelKind = bkFlat
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Nunito Sans Light'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
end
