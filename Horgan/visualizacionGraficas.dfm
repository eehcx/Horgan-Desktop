object formGraficos: TformGraficos
  Left = 192
  Top = 117
  BorderStyle = bsDialog
  Caption = 'formGraficos'
  ClientHeight = 371
  ClientWidth = 724
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 237
    Height = 30
    Caption = 'Gr'#225'ficos de Visualizaci'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Nunito Sans SemiBold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 371
    Height = 18
    Caption = 'Ver N'#250'mero de Espacios de Trabajo y Libros por cada Categor'#237'a'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Nunito Sans'
    Font.Style = []
    ParentFont = False
  end
  object btnAgregar: TPanel
    Left = 512
    Top = 88
    Width = 185
    Height = 41
    Cursor = crHandPoint
    BevelOuter = bvNone
    Caption = 'Ver Espacios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Nunito Sans SemiBold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnAgregarClick
  end
  object Chart1: TChart
    Left = 16
    Top = 88
    Width = 481
    Height = 265
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'TChart')
    Legend.Visible = False
    TabOrder = 1
    object Series1: THorizBarSeries
      Marks.Arrow.Visible = False
      Marks.ArrowLength = 20
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Color = clBlack
      Marks.Font.Height = -13
      Marks.Font.Name = 'Arial Narrow'
      Marks.Font.Style = [fsBold]
      Marks.Frame.Visible = False
      Marks.Style = smsValue
      Marks.Transparent = True
      Marks.Visible = True
      SeriesColor = clRed
      XValues.DateTime = False
      XValues.Name = 'Bar'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loNone
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Panel1: TPanel
    Left = 512
    Top = 136
    Width = 185
    Height = 41
    BevelOuter = bvNone
    Caption = 'Ver Libros'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Nunito Sans SemiBold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
