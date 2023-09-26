object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 356
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnClick = FormClick
  TextHeight = 15
  object Button1: TButton
    Left = 24
    Top = 48
    Width = 95
    Height = 25
    Caption = 'Teste Timeout'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 245
    Top = 48
    Width = 95
    Height = 25
    Caption = 'Com thread'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 136
    Top = 48
    Width = 95
    Height = 25
    Caption = 'Sem atualiza'#231#227'o'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 360
    Top = 48
    Width = 95
    Height = 25
    Caption = 'Sem thread'
    TabOrder = 3
    OnClick = Button4Click
  end
end
