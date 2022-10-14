object formCreateTask: TformCreateTask
  Left = 192
  Top = 117
  BorderStyle = bsDialog
  Caption = 'formCreateTask'
  ClientHeight = 177
  ClientWidth = 460
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 177
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 160
      Height = 27
      Caption = 'creaci'#243'n de Tareas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Nunito Sans SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAdd: TPanel
      Left = 280
      Top = 96
      Width = 153
      Height = 25
      Cursor = crHandPoint
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Caption = 'Siguiente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Nunito Sans SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAddClick
    end
    object EditTarea: TRzEdit
      Left = 24
      Top = 52
      Width = 409
      Height = 26
      Text = 'Nombra tu Tarea'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Nunito Sans'
      Font.Style = []
      FrameHotStyle = fsNone
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
    end
    object ComboCategories: TComboBox
      Left = 24
      Top = 96
      Width = 185
      Height = 24
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvRaised
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Nunito Sans'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
    end
    object ComboCategories2: TComboBox
      Left = 216
      Top = 96
      Width = 41
      Height = 24
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvRaised
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Nunito Sans'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  object PContainer2: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 177
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Label2: TLabel
      Left = 24
      Top = 24
      Width = 84
      Height = 22
      Caption = 'Fecha Inicio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Nunito Sans SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 240
      Top = 24
      Width = 82
      Height = 22
      Caption = 'Fecha Final:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Nunito Sans SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 64
      Width = 84
      Height = 44
      Caption = 'Descripci'#243'n de Tarea:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Nunito Sans SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object DateFinal: TRzDateTimeEdit
      Left = 328
      Top = 25
      Width = 97
      Height = 24
      FirstDayOfWeek = fdowMonday
      EditType = etDate
      Format = 'm/d/yyyy'
      FlatButtons = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Nunito Sans'
      Font.Style = []
      FrameHotTrack = True
      FrameHotStyle = fsFlat
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
    end
    object DateInicio: TRzDateTimeEdit
      Left = 112
      Top = 25
      Width = 97
      Height = 24
      FirstDayOfWeek = fdowMonday
      EditType = etDate
      Format = 'm/d/yyyy'
      FlatButtons = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Nunito Sans'
      Font.Style = []
      FrameHotTrack = True
      FrameHotStyle = fsFlat
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
    end
    object memoDescripcion: TRzMemo
      Left = 120
      Top = 64
      Width = 305
      Height = 57
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Nunito Sans'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      FrameVisible = True
    end
    object btnAgregar: TPanel
      Left = 272
      Top = 136
      Width = 153
      Height = 25
      Cursor = crHandPoint
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Caption = 'Agregar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Nunito Sans SemiBold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAgregarClick
    end
    object Edit1: TEdit
      Left = 8
      Top = 152
      Width = 105
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
      Visible = False
    end
    object Edit2: TEdit
      Left = 120
      Top = 152
      Width = 105
      Height = 21
      TabOrder = 5
      Text = 'Edit2'
      Visible = False
    end
  end
end
