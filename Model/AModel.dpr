program AModel;

uses
  Forms,
  Controls,
  AModelMain in 'AModelMain.pas' {AModelMainForm},
  AData in 'AData.pas' {ADMSystem: TDataModule},
  APubUnit in 'APubUnit.pas',
  APubLocateUnit in 'APubLocateUnit.pas',
  APubLogin in 'APubLogin.pas' {APubLoginForm},
  AModelBrowser in 'AModelBrowser.pas' {AModelBrowserFrame: TFrame},
  APubSetupPass in 'APubSetupPass.pas' {APubSetupPassForm},
  AModelEditor in 'AModelEditor.pas' {AModelEditorForm},
  AhVisible in 'AhVisible.pas' {AhVisibleFrame: TFrame},
  APubSort in 'APubSort.pas' {APubSortForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TADMSystem, ADMSystem);
  APubLoginForm:=TAPubLoginForm.Create(Application);
  if APubLoginForm.ShowModal=mrOK then
     begin
       Application.CreateForm(TAModelMainForm, AModelMainForm);
       Application.Run;
     end;

end.
