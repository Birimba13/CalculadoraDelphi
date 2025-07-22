program login;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

//Criar uma funcionalidade de login a partir de dados informados por um usu�rio
  //  - Usuario
  //  - Senha
  //Funcionalidades
  //  - Confirmar o acesso

procedure MostrarMenu;
begin
  //Menu
    WriteLn('----------Menu----------');
    WriteLn('|   1 - Realizar login  |');
    WriteLn('|   9 - Sair            |');
    WriteLn('----------Menu----------');
    WriteLn('Digite seu destino: ');
end;

function ValidarEscolha(opcao: string): Boolean;
begin
  Var Bol:Boolean;
    Bol:=True;
    if not((opcao = '1') or (opcao = '9')) then
    begin
      while Bol do begin
        WriteLn('Selecione uma das duas alternativas na proxima tentativa. Mostrando o menu novamente ...');
        Sleep(2000);
        MostrarMenu;
        ReadLn(opcao);
        Bol:=not((opcao = '1') or (opcao = '9'));
      end;
    end;
    Result:= Bol;
end;
const usuarioadmin: string = 'Admin';
      senhaadmin: string = 'Admin';

function LoginValido(usuario, senha: string): Boolean;
begin
  Result := (usuario = usuarioadmin) and (senha = senhaadmin);
end;

var
usuario, senha, opcao: string;

begin
  try
  //Menu
    MostrarMenu;
    ReadLn(opcao);
    ValidarEscolha(opcao);


    if (opcao='1') then begin
      WriteLn('Seja Bem-Vindo ao nosso site!');
      WriteLn('Digite seu usu�rio: ');
      ReadLn(usuario);
      WriteLn('Digite sua senha: ');
      ReadLn(senha);

      if LoginValido(usuario, senha) then begin
        WriteLn('Autenticado com sucesso.');
      end else begin
        WriteLn('Credenciais incorretas, encerrando o sistema');
        Sleep(3000);
        Exit;
      end;
      ReadLn;
    end else if (opcao = '9') then begin
          WriteLn('Voc� escolheu sair. encerrando sistema...');
          Sleep(3000);
          Exit;
    end else begin
          WriteLn('Op��o inv�lida, encerrando o sistema...');
          Sleep(3000);
          Exit;
    end;

  //Informa��es do usuario

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
