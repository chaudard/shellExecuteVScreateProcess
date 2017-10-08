program app1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

begin
  try
    { TODO -oUtilisateur -cCode du point d'entrée : Placez le code ici }
    writeln('welcome in app 1');
    if paramstr(0) <> '' then
      writeln('param 0 is : ' + paramstr(0))
    else
      writeln('param 0 is empty');
    if paramstr(1) <> '' then
      writeln('param 1 is : ' + paramstr(1))
    else
      writeln('param 1 is empty');
    if paramstr(2) <> '' then
      writeln('param 2 is : ' + paramstr(2))
    else
      writeln('param 2 is empty');
    if paramstr(3) <> '' then
      writeln('param 3 is : ' + paramstr(3))
    else
      writeln('param 3 is empty');
    if paramstr(4) <> '' then
      writeln('param 4 is : ' + paramstr(4))
    else
      writeln('param 4 is empty');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
