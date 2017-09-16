object AModelMainForm: TAModelMainForm
  Left = 189
  Top = 148
  Width = 803
  Height = 586
  Align = alClient
  Caption = 'AModelMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object fcStatusBar1: TfcStatusBar
    Left = 0
    Top = 532
    Width = 795
    Height = 20
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel0'
        Style = psNumLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '80'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel1'
        Style = psCapsLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '80'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel2'
        Style = psOverWrite
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '80'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel3'
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '100'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel4'
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '100'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel5'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '100'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel6'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
    SimplePanel = False
    StatusBarText.CapsLock = 'Caps'
    StatusBarText.Overwrite = 'Overwrite'
    StatusBarText.NumLock = 'Num'
    StatusBarText.ScrollLock = 'Scroll'
  end
  object CoolBar2: TCoolBar
    Left = 0
    Top = 48
    Width = 795
    Height = 39
    Anchors = [akLeft, akRight]
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 35
        Width = 791
      end>
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 778
      Height = 35
      AutoSize = True
      ButtonHeight = 35
      ButtonWidth = 31
      Caption = 'ToolBar1'
      DisabledImages = ADMSystem.ImageList2
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#32048#26126#39636
      Font.Style = []
      Images = ADMSystem.ImageList1
      ParentFont = False
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object BtnNew: TToolButton
        Left = 0
        Top = 0
        Action = ActionNew
        AutoSize = True
        Caption = #26032#22686
      end
      object BtnEdit: TToolButton
        Left = 35
        Top = 0
        Action = ActionEdit
        AutoSize = True
        Caption = #20462#25913
      end
      object BtnDelete: TToolButton
        Left = 70
        Top = 0
        Action = ActionDelete
        AutoSize = True
        Caption = #21034#38500
      end
      object SptRefresh: TToolButton
        Left = 105
        Top = 0
        Width = 8
        Caption = 'SptRefresh'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object BtnRefresh: TToolButton
        Left = 113
        Top = 0
        Action = ActionRefresh
        AutoSize = True
        Caption = #21047#26032
      end
      object BtnBrowser: TToolButton
        Left = 148
        Top = 0
        Action = ActionBrowser
        AutoSize = True
        Caption = #28687#35261
      end
      object BtnSearch: TToolButton
        Left = 183
        Top = 0
        Action = ActionSearch
        AutoSize = True
        Caption = #26597#25214
      end
      object BtnFilter: TToolButton
        Left = 218
        Top = 0
        Action = ActionFilter
        AutoSize = True
        Caption = #25130#21462
      end
      object SptSelect: TToolButton
        Left = 253
        Top = 0
        Width = 8
        Caption = 'SptSelect'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object BtnPropert: TToolButton
        Left = 261
        Top = 0
        Action = ActionPropert
        AutoSize = True
      end
      object ToolButton1: TToolButton
        Left = 296
        Top = 0
        Action = ActioncClose
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 795
    Height = 48
    AutoSize = True
    Bands = <
      item
        Break = False
        Control = Panel6
        FixedSize = True
        ImageIndex = -1
        MinHeight = 22
        Width = 792
      end
      item
        Break = False
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 20
        Width = 791
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #26032#32048#26126#39636
    Font.Style = []
    ParentFont = False
    object ToolBar1: TToolBar
      Left = 9
      Top = 24
      Width = 778
      Height = 20
      AutoSize = True
      ButtonHeight = 20
      ButtonWidth = 67
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      PopupMenu = PopupMenu1
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 22
      AutoSize = True
      TabOrder = 1
    end
  end
  object cxDBTreeList1: TcxDBTreeList
    Left = 0
    Top = 87
    Width = 207
    Height = 445
    Align = alLeft
    Bands = <
      item
        Caption.Text = 'Band1'
      end>
    BufferedPaint = False
    DataController.DataSource = DAcMenu
    DataController.ParentField = 'Parent_Name'
    DataController.KeyField = 'Menu_Name'
    Images = ADMSystem.ImageList1
    LookAndFeel.Kind = lfUltraFlat
    OptionsSelection.CellSelect = False
    OptionsView.ScrollBars = ssVertical
    OptionsView.Headers = False
    PopupMenu = PopupMenu2
    RootValue = -1
    TabOrder = 3
    OnDblClick = cxDBTreeList1DblClick
    OnGetNodeImageIndex = cxDBTreeList1GetNodeImageIndex
    object cxDBTreeList1Menu_Name: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'Menu_Name'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Menu_Desc: TcxDBTreeListColumn
      DataBinding.FieldName = 'Menu_Desc'
      Width = 13700
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Parent_Name: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'Parent_Name'
      Width = 150
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 207
    Top = 87
    Width = 8
    Height = 445
    HotZoneClassName = 'TcxMediaPlayer8Style'
    Control = cxDBTreeList1
    Visible = False
  end
  object dxPageControl1: TcxPageControl
    Left = 215
    Top = 87
    Width = 580
    Height = 445
    Align = alClient
    Style = 5
    TabOrder = 5
    TabPosition = tpBottom
    ClientRectBottom = 445
    ClientRectRight = 580
    ClientRectTop = 0
  end
  object PopupMenu2: TPopupMenu
    Images = ADMSystem.ImageList1
    Left = 705
    Top = 76
    object TreeCollapse: TMenuItem
      Action = ActionCollapse
    end
    object TreeExpand: TMenuItem
      Action = ActionExpand
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 675
    Top = 76
    object MenuTree: TMenuItem
      Action = ActionTree
    end
    object MenuIsColor: TMenuItem
      Caption = #24425#33394#28687#35261#31383#21475
      Checked = True
      OnClick = MenuIsColorClick
    end
    object MenuEditIsColor: TMenuItem
      Caption = #24425#33394#32232#36655#31383#21475
      OnClick = MenuEditIsColorClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 646
    Top = 76
  end
  object ActionList1: TActionList
    Left = 612
    Top = 76
    object ActionNew: TAction
      Tag = 2
      Caption = #26032' '#22686
      Hint = #26032#22686#36039#26009
      ImageIndex = 0
      ShortCut = 113
    end
    object ActionEdit: TAction
      Tag = 4
      Caption = #20462' '#25913
      Hint = #20462#25913#36039#26009
      ImageIndex = 1
      ShortCut = 114
    end
    object ActionDelete: TAction
      Tag = 8
      Caption = #21034' '#38500
      Hint = #21034#38500#36039#26009
      ImageIndex = 2
      ShortCut = 115
    end
    object ActionCopy: TAction
      Caption = #22797#21046
      Hint = #22797#21046
      ImageIndex = 3
      ShortCut = 16451
    end
    object ActionPaste: TAction
      Caption = #31896#36028
      Hint = #31896#36028
      ImageIndex = 4
      ShortCut = 16470
    end
    object ActionRefresh: TAction
      Caption = #21047' '#26032
      Hint = #21047#26032#30070#21069#35352#37636
      ImageIndex = 5
      ShortCut = 116
    end
    object ActionBrowser: TAction
      Caption = #28687' '#35261
      Hint = #28687#35261
      ImageIndex = 6
      ShortCut = 117
    end
    object ActionSearch: TAction
      Caption = #26597' '#25214
      Hint = #26597#25214
      ImageIndex = 7
      ShortCut = 118
    end
    object ActionFilter: TAction
      Caption = #25130' '#21462
      Hint = #25130#21462#36039#26009
      ImageIndex = 8
      ShortCut = 119
    end
    object ActionPropert: TAction
      Caption = #23660#24615
      Hint = #39023#31034#23660#24615
      ImageIndex = 19
      ShortCut = 16463
    end
    object ActionTree: TAction
      Caption = #39023#31034#23566#33322#22120
      Hint = #39023#31034#23566#33322#22120
      ImageIndex = 12
      OnExecute = ActionTreeExecute
    end
    object ActionCollapse: TAction
      Caption = #20840#37096#25910#21512
      Hint = #20840#37096#25910#21512
      ImageIndex = 26
      OnExecute = ActionCollapseExecute
    end
    object ActionExpand: TAction
      Caption = #20840#37096#23637#38283
      Hint = #20840#37096#23637#38283
      ImageIndex = 27
      OnExecute = ActionExpandExecute
    end
    object ActioncClose: TAction
      Caption = #38364#38281
      Hint = #38364#38281#31383#21475
      ImageIndex = 22
      OnExecute = ActioncCloseExecute
    end
  end
  object DAcMenu: TDataSource
    AutoEdit = False
    Left = 10
    Top = 114
  end
  object TreeStore: TcxPropertiesStore
    Active = False
    Components = <>
    StorageName = 'TreeStore'
    Left = 580
    Top = 76
  end
  object wwIntl1: TwwIntl
    Navigator.ConfirmDeleteMessage = 'Delete record?'
    Navigator.Hints.FirstHint = 'Move to first record'
    Navigator.Hints.PriorHint = 'Move to prior record'
    Navigator.Hints.NextHint = 'Move to next record'
    Navigator.Hints.LastHint = 'Move to last record'
    Navigator.Hints.InsertHint = 'Insert new record'
    Navigator.Hints.DeleteHint = 'Delete current record'
    Navigator.Hints.EditHint = 'Edit current record'
    Navigator.Hints.PostHint = 'Post changes of current record'
    Navigator.Hints.CancelHint = 'Cancel changes made to current record'
    Navigator.Hints.RefreshHint = 'Refresh the contents of the dataset'
    Navigator.Hints.PriorPageHint = 'Move backward %d records'
    Navigator.Hints.NextPageHint = 'Move forward %d records'
    Navigator.Hints.SaveBookmarkHint = 'Bookmark current record'
    Navigator.Hints.RestoreBookmarkHint = 'Go back to saved bookmark'
    Navigator.Hints.RecordViewDialogHint = 'View current record'
    Navigator.Hints.LocateDialogHint = 'Locate a specific record'
    Navigator.Hints.FilterDialogHint = 'Filter the dataset'
    Navigator.Hints.SearchDialogHint = 'Search the dataset'
    SearchDialog.SearchCharLabel = '&Search Characters'
    SearchDialog.SearchCharShortLabel = '&Search Char'
    SearchDialog.SearchByLabel = 'Search &By'
    SearchDialog.StatusRecLabel = 'Rec #'
    SearchDialog.StatusOfLabel = 'of'
    SearchDialog.SearchCharHint = 'Enter characters for incremental search'
    SearchDialog.SearchByHint = 'Incremental searching and sorting order'
    LocateDialog.FieldValueLabel = 'Field &Value'
    LocateDialog.SearchTypeLabel = '&Search Type'
    LocateDialog.CaseSensitiveLabel = '&Case-sensitive'
    LocateDialog.MatchExactLabel = '&Exact Match'
    LocateDialog.MatchStartLabel = '&Partial Match at Beginning'
    LocateDialog.MatchAnyLabel = 'Partial Match &Anywhere'
    LocateDialog.FieldsLabel = '&Fields'
    LocateDialog.BtnFirst = 'Fi&rst'
    LocateDialog.BtnNext = '&Next'
    LocateDialog.BtnCancel = 'Cancel'
    LocateDialog.BtnClose = 'Close'
    LocateDialog.FieldValueHint = 'Enter field'#39's search value'
    LocateDialog.CaseSensitiveHint = 'Searching is case-sensitive'
    LocateDialog.MatchExactHint = 'Match occurs only if there is an exact match'
    LocateDialog.MatchStartHint = 'Match occurs if the start of the field'#39's value matches'
    LocateDialog.MatchAnyHint = 'Match occurs if any part of the field matches'
    LocateDialog.BtnFirstHint = 'Find first match'
    LocateDialog.BtnNextHint = 'Find next match from current record'
    LocateDialog.FieldNameHint = 'Select the field to search on'
    MonthCalendar.PopupYearLabel = 'Edit Year'
    MonthCalendar.EnterYearPrompt = 'Enter Valid Year'
    FilterDialog.BtnViewSummary = #39023#31034#32080#26524
    FilterDialog.BtnViewSummaryHint = #39023#31034#30070#21069#26597#25214#32080#26524
    FilterDialog.BtnNewSearch = #37325#26032#26597#25214
    FilterDialog.BtnNewSearchHint = #37325#26032#26597#25214
    FilterDialog.FieldOrderLabel = #25490#24207
    FilterDialog.FieldOrderHint = #25353#23383#27597#38918#24207#25110#37007#36655#38918#24207
    FilterDialog.AlphabeticLabel = #25353#23383#27597#38918#24207
    FilterDialog.LogicalLabel = #37007#36655
    FilterDialog.AllFieldsLabel = #25152#26377'(&A)'
    FilterDialog.SearchedFieldsLabel = #26597#25214
    FilterDialog.StartingRangeLabel = #36664#20837#33539#22285#36215#22987#20540
    FilterDialog.EndingRangeLabel = #36664#20837#33539#22285#32066#27490#20540
    FilterDialog.StartingRangeHint = #36664#20837#26597#25214#33539#22285#36215#22987#20540
    FilterDialog.EndingRangeHint = #36664#20837#26597#25214#33539#22285#32066#27490#20540
    FilterDialog.BtnClearMin = #28165#38500#26597#25214#36215#22987#20540
    FilterDialog.BtnClearMax = #28165#38500#26597#25214#32066#27490#20540'(&E)'
    FilterDialog.BtnClearFilterValue = #28165#38500'(&C)'
    FilterDialog.BtnClearMinHint = #28165#38500#26597#25214#33539#22285#30340#36215#22987#20540
    FilterDialog.BtnClearMaxHint = #28165#38500#26597#25214#33539#22285#30340#32066#27490#20540
    FilterDialog.BtnClearFilterValueHint = #28165#38500#30070#21069#26597#25214#23383#27573
    FilterDialog.ByValueLabel = #25353#22823#23567
    FilterDialog.ByRangeLabel = #25353#33539#22285
    FilterDialog.FieldValueLabel = #23383#27573#30340#20540
    FilterDialog.FieldValueHint = #36664#20837#26597#25214#23383#27573#30340#20540
    FilterDialog.SearchTypeLabel = #26597#25214#39006#22411
    FilterDialog.SearchTypeHint = #35498#26126#25353#20309#39006#22411#27604#36611
    FilterDialog.MatchExactLabel = #23436#20840#21305#37197
    FilterDialog.MatchStartLabel = #38283#22987#20301#32622#37096#20998#21305#37197
    FilterDialog.MatchAnyLabel = #20219#24847#20301#32622#37096#20998#21305#37197
    FilterDialog.CaseSensitiveLabel = #21312#20998#22823#23567#23531
    FilterDialog.CaseSensitiveHint = #26597#25214#21312#20998#22823#23567#23531
    FilterDialog.NonMatchingLabel = #25214#19981#21040#21305#37197#30340#35352#37636
    FilterDialog.NonMatchingHint = #39023#31034#19981#21305#37197#30340#35352#37636
    FilterDialog.SummaryFieldLabel = #23383#27573
    FilterDialog.SummarySearchLabel = #26597#25214#39006#22411
    FilterDialog.SummaryValueLabel = #20540
    FilterDialog.FieldsLabel = #23383#27573
    FilterDialog.ValueRangeTabHint = #25353#22823#23567#25110#33539#22285#26597#25214
    FilterDialog.AllSearchedTabHint = #39023#31034#25152#26377#23383#27573#25110#30070#21069#26597#25214#23383#27573
    FilterDialog.ViewSummaryNotText = 'NOT'
    RichEdit.FontNameComboHint = 'Font | Changes the font of the selection'
    RichEdit.FontSizeComboHint = 'Font Size | Changes the font size of the selection'
    RichEdit.NewButtonHint = 'New | Creates a new document'
    RichEdit.LoadButtonHint = 'Load | Load from file'
    RichEdit.SaveAsButtonHint = 'Save As | Save to file'
    RichEdit.PrintButtonHint = 'Print | Prints the active document'
    RichEdit.FindButtonHint = 'Find | Finds the specified text'
    RichEdit.CutButtonHint = 'Cut | Cuts the selection and puts it on the Clipboard'
    RichEdit.CopyButtonHint = 'Copy | Copies the selection and puts it on the Clipboard'
    RichEdit.UndoButtonHint = 'Undo | Reverses the last action'
    RichEdit.RedoButtonHint = 'Redo | Reverses the last undo action'
    RichEdit.PasteButtonHint = 'Paste | Inserts Clipboard contents'
    RichEdit.BoldButtonHint = 'Bold | Makes the selection bold (toggle)'
    RichEdit.ColorButtonHint = 'Color | Formats the selection with a color'
    RichEdit.UnderlineButtonHint = 
      'Underline | Formats the selection with a continuous underline (t' +
      'oggle)'
    RichEdit.ItalicButtonHint = 'Italic | Makes the selection italic (toggle)'
    RichEdit.LeftButtonHint = 'Align Left | Left-justifies paragraph (toggle)'
    RichEdit.CenterButtonHint = 'Center | Center-justifies paragraph (toggle)'
    RichEdit.RightButtonHint = 'Align Right | Right-justifies paragraph (toggle)'
    RichEdit.JustifyButtonHint = 'Justify | Full Justification for paragraph (toggle)'
    RichEdit.BulletButtonHint = 'Bullets | Inserts a bullet on this line (toggle)'
    RichEdit.HighlightButtonHint = 'Highlight Text | Makes the selection highlighted'
    RichEdit.SaveExitHint = 'Save And Exit | Saves changes and exits editor'
    RichEdit.PageSetupHint = 'Page Setup | Changes page layout settings'
    RichEdit.ExitHint = 'Exit'
    RichEdit.ClearHint = 'Erases the Selection'
    RichEdit.SelectAllHint = 'Selects all of the text'
    RichEdit.FindNextHint = 'Repeats the last find'
    RichEdit.ReplaceHint = 'Replaces specific text with different text'
    RichEdit.InsertObjectHint = 'Inserts new embedded object'
    RichEdit.SpellCheckHint = 'Check spelling'
    RichEdit.ToolbarHint = 'Shows or hides the toolbar'
    RichEdit.FormatBarHint = 'Shows or hides the format bar'
    RichEdit.ViewStatusBarHint = 'Shows or hides the status bar'
    RichEdit.OptionsHint = 'Sets options'
    RichEdit.FontHint = 'Selects font for current selection'
    RichEdit.ParagraphHint = 'Formats current or selected paragraph(s)'
    RichEdit.TabsHint = 'Sets tabs'
    RichEdit.CAPLockCaption = 'CAP'
    RichEdit.NUMLockCaption = 'NUM'
    RichEdit.MenuLabels.FileCaption = '&File'
    RichEdit.MenuLabels.LoadCaption = '&Load'
    RichEdit.MenuLabels.SaveAsCaption = 'Save &As'
    RichEdit.MenuLabels.SaveExitCaption = '&Save and Exit'
    RichEdit.MenuLabels.PrintCaption = '&Print'
    RichEdit.MenuLabels.PageSetupCaption = 'Page Set&up'
    RichEdit.MenuLabels.ExitCaption = 'E&xit'
    RichEdit.MenuLabels.EditCaption = '&Edit'
    RichEdit.MenuLabels.UndoCaption = '&Undo'
    RichEdit.MenuLabels.CutCaption = 'Cu&t'
    RichEdit.MenuLabels.CopyCaption = '&Copy'
    RichEdit.MenuLabels.PasteCaption = '&Paste'
    RichEdit.MenuLabels.ClearCaption = 'Cle&ar'
    RichEdit.MenuLabels.SelectallCaption = 'Select A&ll'
    RichEdit.MenuLabels.FindCaption = '&Find'
    RichEdit.MenuLabels.FindNextCaption = 'Find &Next'
    RichEdit.MenuLabels.ReplaceCaption = 'R&eplace'
    RichEdit.MenuLabels.InsertObjectCaption = '&Object...'
    RichEdit.MenuLabels.ToolCaption = '&Tools'
    RichEdit.MenuLabels.SpellCheckCaption = 'Check &Spelling'
    RichEdit.MenuLabels.InsertCaption = '&Insert'
    RichEdit.MenuLabels.RulerCaption = '&Ruler'
    RichEdit.MenuLabels.ViewCaption = '&View'
    RichEdit.MenuLabels.ToolbarCaption = '&Toolbar'
    RichEdit.MenuLabels.FormatBarCaption = '&Format Bar'
    RichEdit.MenuLabels.ViewStatusBarCaption = '&Status Bar'
    RichEdit.MenuLabels.OptionsCaption = '&Options'
    RichEdit.MenuLabels.FormatCaption = 'F&ormat'
    RichEdit.MenuLabels.FontCaption = '&Font'
    RichEdit.MenuLabels.BulletStyleCaption = '&Bullet Style'
    RichEdit.MenuLabels.ParagraphCaption = '&Paragraph'
    RichEdit.MenuLabels.TabsCaption = '&Tabs'
    RichEdit.MenuLabels.HelpCaption = 'Help'
    RichEdit.PopupMenuLabels.EditCaption = '&Edit'
    RichEdit.PopupMenuLabels.ViewCaption = '&View'
    RichEdit.PopupMenuLabels.CutCaption = 'Cu&t'
    RichEdit.PopupMenuLabels.CopyCaption = '&Copy'
    RichEdit.PopupMenuLabels.PasteCaption = '&Paste'
    RichEdit.PopupMenuLabels.FontCaption = '&Font'
    RichEdit.PopupMenuLabels.BulletStyleCaption = '&Bullet Style'
    RichEdit.PopupMenuLabels.BoldCaption = 'B&old'
    RichEdit.PopupMenuLabels.ItalicCaption = '&Italic'
    RichEdit.PopupMenuLabels.UnderlineCaption = '&Underline'
    RichEdit.PopupMenuLabels.ParagraphCaption = 'P&aragraph'
    RichEdit.PopupMenuLabels.TabsCaption = '&Tabs'
    RichEdit.PopupMenuLabels.FindCaption = 'Fin&d'
    RichEdit.PopupMenuLabels.ReplaceCaption = '&Replace'
    RichEdit.PopupMenuLabels.InsertObjectCaption = 'Insert &Object...'
    RichEdit.PopupMenuLabels.ObjectPropertiesCaption = 'Object P&roperties'
    RichEdit.PopupMenuLabels.SpellCheckCaption = 'Check &Spelling'
    RichEdit.ParagraphDialog.ParagraphDlgCaption = 'Paragraph'
    RichEdit.ParagraphDialog.IndentationGroupBoxCaption = 'Indentation'
    RichEdit.ParagraphDialog.LeftEditHint = 'Left Indentation'
    RichEdit.ParagraphDialog.RightEditHint = 'Right Indentation'
    RichEdit.ParagraphDialog.FirstLineEditHint = 'First Line of Paragraph Indentation'
    RichEdit.ParagraphDialog.AlignmentHint = 'Changes Alignment of Paragraph'
    RichEdit.ParagraphDialog.LeftEditCaption = 'Left:'
    RichEdit.ParagraphDialog.RightEditCaption = 'Right:'
    RichEdit.ParagraphDialog.FirstLineEditCaption = 'First line:'
    RichEdit.ParagraphDialog.SpacingGroupCaption = 'Spacing'
    RichEdit.ParagraphDialog.BeforeParagraphCaption = '&Before'
    RichEdit.ParagraphDialog.AfterParagraphCaption = 'Aft&er'
    RichEdit.ParagraphDialog.WithinParagraphCaption = 'Li&ne Spacing'
    RichEdit.ParagraphDialog.WithinParagraphAtCaption = '&At'
    RichEdit.ParagraphDialog.AlignmentCaption = 'Alignment'
    RichEdit.ParagraphDialog.AlignLeft = 'Left'
    RichEdit.ParagraphDialog.AlignRight = 'Right'
    RichEdit.ParagraphDialog.AlignCenter = 'Center'
    RichEdit.ParagraphDialog.AlignJustify = 'Justify'
    RichEdit.TabDialog.TabDlgCaption = 'Tab'
    RichEdit.TabDialog.TabGroupBoxCaption = '&Tab Stop Position'
    RichEdit.TabDialog.SetTabButtonCaption = 'Set'
    RichEdit.TabDialog.ClearTabButtonCaption = 'Clear'
    RichEdit.TabDialog.ClearAllButtonCaption = 'Clear All'
    RichEdit.TabDialog.TabPositionEditHint = 'Tab Position Edit Box'
    RichEdit.TabDialog.ListBoxHint = 'List of tabs and their positions'
    RichEdit.TabDialog.SetButtonHint = 'Set a new tab position'
    RichEdit.TabDialog.ClearButtonHint = 'Clear the selected tab position'
    RichEdit.TabDialog.ClearAllButtonHint = 'Clear all the tabs'
    UserMessages.wwDBGridDiscardChanges = 'Discard changes to this record?'
    UserMessages.PictureValidateError = 'Invalid characters. Field : '
    UserMessages.LocateNoMatches = 'No matches found'
    UserMessages.LocateNoMoreMatches = 'No more matches found'
    UserMessages.MemoChangesWarning = 'Changes have been made!  Are you sure you wish to cancel?'
    UserMessages.RichEditExitWarning = 'Changes have been made!  Do you wish to save your changes?'
    UserMessages.RichEditClearWarning = 'Clear entire text?'
    UserMessages.RichEditSpellCheckComplete = 'The spell check is complete.'
    UserMessages.RichEditMSWordNotFound = 'Unable to start Microsoft Word'#39's Spell Checker.'
    UserMessages.FilterDlgNoCriteria = 'You have not selected any search criteria'
    UserMessages.RecordViewExitWarning = 'Changes have been made!  Do you wish to save your changes?'
    OKCancelBitmapped = False
    BtnOKCaption = #30906#23450'(&O)'
    BtnCancelCaption = #21462#28040'(&C)'
    CheckBoxInGridStyle = cbStyleAuto
    VersionInfoPower = '4000.0.4'
    FilterMemoSize = 65536
    DialogFontStyle = []
    Connected = True
    Left = 548
    Top = 77
  end
end
