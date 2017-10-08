program app2;

{$APPTYPE CONSOLE}

uses
    SysUtils
  , shellapi
  , windows
  , forms
  ;

procedure getDatas(out exe: string; out params: string);
begin
  exe := includeTrailingPathDelimiter(extractFileDir(Application.ExeName)) + 'app1.exe';
  params := '"param1"' + ' ' + '"param2"' + ' ' + '"param space"';
end;

procedure launchShellExecute;
var
  exe: string;
  params: string;
begin
  writeln('launch app 1 with shellexecute');
  getDatas(exe, params);

  shellexecute(0, 'open', PChar(exe), PChar(params), nil, SW_SHOWDEFAULT);
end;

function launchCreateProcess: cardinal;
var
  exe: string;
  StartInfo : TStartupInfo;
  ProcessInformation : TProcessInformation;
  pPath: string;
  Params: string;
  i: Integer;
begin
  writeln('launch app 1 with createprocess');
  getDatas(exe, params);

  ZeroMemory(@StartInfo, sizeof(StartInfo));
  StartInfo.cb:=sizeof(StartInfo);
  UniqueString(exe);
  Params:='"'+exe+'"'+' '+Params;
  UniqueString(Params);
  pPath:=extractfiledir(exe);
  UniqueString(pPath);

  CreateProcess(pchar(exe),
                pChar(Params),
                 nil,
                 nil,
                 true,
                 0,
                 nil,
                 pChar(pPath),
                 StartInfo,
                 ProcessInformation);
  // Attente de la fin du processus.
  WaitForSingleObject(ProcessInformation.hProcess, INFINITE);

  // Récupération du code de sortie.
  GetExitCodeProcess(ProcessInformation.hProcess, result);
end;

var
  value: string;
begin
  try
    { TODO -oUtilisateur -cCode du point d'entrée : Placez le code ici }
  writeln('welcome in app 2');
  writeln('1 : launch app 1 with shellexecute');
  writeln('2 : launch app 1 with createprocess');
  writeln('3 : launch app 1 with shellexecute and createprocess');
  readln(value);

  if value = '1' then
    launchShellExecute
  else
  if value = '2' then
    launchCreateProcess
  else
  if value = '3' then
  begin
    launchShellExecute;
    launchCreateProcess;
  end;
  readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
