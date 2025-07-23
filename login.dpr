program login;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

//Criar uma funcionalidade de login a partir de dados informados por um usuário
  //  - Usuario
  //  - Senha
  //Funcionalidades
  //  - Confirmar o acesso

  var logado: Boolean;

procedure MostrarMenu;
begin
  //Menu
    WriteLn('----------Menu----------');
    WriteLn('|   1 - Realizar login  |');
    WriteLn('|   9 - Sair            |');
    WriteLn('----------Menu----------');
    WriteLn('Digite seu destino: ');
end;

procedure MostrarMenuCadastro;
begin
  //Menu
    WriteLn('--------- Menu -----------');
    WriteLn('|  1 - Cadastrar usuário  |');
    WriteLn('|  2 - Calculadora        |');
    WriteLn('|  9 - Log-out            |');
    WriteLn('--------- Menu -----------');
    WriteLn('Digite seu destino: ');
end;

function ValidarEscolha(var opcao: string): Boolean;
Var Bol:Boolean;
begin
    Bol:=False;
    if (opcao <> '1') and (opcao <> '9') then
    begin
      while Bol = False do begin
        WriteLn('Selecione uma das duas alternativas na proxima tentativa. Mostrando o menu novamente ...');
        Sleep(100);
        MostrarMenu;
        ReadLn(opcao);
        if ((opcao = '1') or (opcao = '9')) then begin
          Bol:=True;
        end else begin
          Continue;
        end;
      end;
    end else begin
      Bol :=True;
    end;
    Result:= Bol;
end;
const usuarioadmin: string = 'Admin';
      senhaadmin: string = 'Admin';

function LoginValido(usuario, senha: string): Boolean;
begin
  Result :=  false;
  if (usuario = usuarioadmin) and (senha = senhaadmin) then begin
    logado:=True;
    Result := True;
  end;
end;

procedure CalculadoraMenu;
begin
    WriteLn('-------Calculadora------');
    WriteLn('|   1 - Iniciar Cálculos|');
    WriteLn('|   9 - Sair            |');
    WriteLn('----------Menu----------');
    WriteLn('Digite seu destino: ');
end;

function CalculoContasMenu: String;
begin
    WriteLn('-------Calculadora------');
    WriteLn('|   1 - Soma            |');
    WriteLn('|   2 - Subtração       |');
    WriteLn('|   3 - Divisão         |');
    WriteLn('|   4 - Multiplicação   |');
    WriteLn('|   9 - Sair            |');
    WriteLn('----------Menu----------');
    WriteLn('Digite seu destino: ');
end;

function ValidarEscolhaLogado(var opcaousuariologado: string): Boolean;
Var Bol:Boolean;
begin
    Bol:=False;
    if (opcaousuariologado <> '1') and (opcaousuariologado <> '2') and (opcaousuariologado <> '9') then
    begin
      while Bol = False do begin
        WriteLn('Selecione uma das duas alternativas na proxima tentativa. Mostrando o menu novamente ...');
        Sleep(100);
        MostrarMenu;
        ReadLn(opcaousuariologado);
        if ((opcaousuariologado = '1') or (opcaousuariologado = '2') or (opcaousuariologado = '9')) then
        begin
          Bol:=True;
        end else begin
          Continue;
        end;
      end;
    end else begin
      Bol :=True;
    end;
    Result:= Bol;
end;

function ValidarEscolhaCalc(var opcaooperador: string): Boolean;
Var Bol:Boolean;
begin
    Bol:=False;
    if (opcaooperador <> '1') and (opcaooperador <> '2') and (opcaooperador <> '3') and (opcaooperador <> '4') and (opcaooperador <> '9') then
    begin
      while Bol = False do begin
        WriteLn('Selecione uma das duas alternativas na proxima tentativa. Mostrando o menu novamente ...');
        Sleep(100);
        MostrarMenu;
        ReadLn(opcaooperador);
        if ((opcaooperador = '1') or (opcaooperador = '2') or (opcaooperador = '3') or (opcaooperador = '4') or (opcaooperador = '9')) then
        begin
          Bol:=True;
        end else begin
          Continue;
        end;
      end;
    end else begin
      Bol :=True;
    end;
    Result:= Bol;
end;

function Calculadora: String;
var num1, num2, total: Integer;
    resultado, opcao, opcaooperador, opcaocontinucao: String;
    bol, confirmacao, confirmacao2: Boolean;
begin
  CalculadoraMenu;
  ReadLn(opcao);
  confirmacao:=ValidarEscolha(opcao);
  if (confirmacao) and (opcao = '1') then begin
      CalculoContasMenu;
      ReadLn(opcaooperador);
      confirmacao2:=ValidarEscolhaCalc(opcaooperador);
      if (confirmacao2) and (opcaooperador = '1') then begin
        WriteLn('Digite o primeiro número: ');
        ReadLn(num1);
        WriteLn('Digite o segundo número: ');
        ReadLn(num2);
        total:=num1+num2;
        WriteLn(num1, ' + ', num2, ' = ', total, ', Aperte enter quando quiser continuar.');
        ReadLn;
      end else if (confirmacao2) and (opcaooperador = '2') then begin
        WriteLn('Digite o primeiro número: ');
        ReadLn(num1);
        WriteLn('Digite o segundo número: ');
        ReadLn(num2);
        total:=num1-num2;
        WriteLn(num1, ' - ', num2, ' = ', total, ', Aperte enter quando quiser continuar.');
        ReadLn;
      end else if (confirmacao2) and (opcaooperador = '3') then begin
        WriteLn('Digite o primeiro número: ');
        ReadLn(num1);
        WriteLn('Digite o segundo número: ');
        ReadLn(num2);
        total:=num1 div num2;
        WriteLn(num1, ' / ', num2, ' = ', total, ', Aperte enter quando quiser continuar.');
        ReadLn;
      end else if (confirmacao2) and (opcaooperador = '4') then begin
        WriteLn('Digite o primeiro número: ');
        ReadLn(num1);
        WriteLn('Digite o segundo número: ');
        ReadLn(num2);
        total:=num1 * num2;
        WriteLn(num1, ' X ', num2, ' = ', total, ', Aperte enter quando quiser continuar.');
        ReadLn;
      end else if (opcao = '9') then begin
        WriteLn('Você escolheu sair. encerrando sistema...');
        Sleep(3000);
        Exit;
      end;
  end else if (opcao = '9') then begin
        WriteLn('Você escolheu sair. encerrando sistema...');
        Sleep(3000);
        Exit;
  end;
end;


var
usuario, senha, opcao, opcaousuariologado, nomecadastro, emailcadastro: string;
confirmacao: Boolean;
i, idadecadastro:integer;

begin
  try
  //Menu
    MostrarMenu;
    ReadLn(opcao);
    confirmacao:=ValidarEscolha(opcao);
    if (confirmacao) and (opcao = '1') then begin
      WriteLn('Seja Bem-Vindo ao nosso site!');
      for i:=1 to 3 do begin
        WriteLn('Digite seu usuário: ');
        ReadLn(usuario);
        WriteLn('Digite sua senha: ');
        ReadLn(senha);
        if LoginValido(usuario, senha) then begin
          WriteLn('Autenticado com sucesso.');
          Sleep(1500);
          MostrarMenuCadastro;
          ReadLn(opcaousuariologado);
          ValidarEscolhaLogado(opcaousuariologado);
          if (opcaousuariologado = '1') then begin
            WriteLn('Digite o nome completo do usuário a ser cadastrado: ');
            ReadLn(nomecadastro);
            WriteLn('Digite a idade do usuário a ser cadastrado: ');
            ReadLn(idadecadastro);
            WriteLn('Digite o email completo do usuário a ser cadastrado: ');
            ReadLn(emailcadastro);

          end else if (opcaousuariologado = '2') then begin
            Calculadora;
          end else if(opcaousuariologado = '9') then begin
            WriteLn('Você escolheu sair. encerrando sistema...');
            Sleep(3000);
            Exit;
          end;

        end else if (i<=3) then begin
              WriteLn('Credenciais incorretas, Tente novamente...');
              Sleep(3000);
        end else begin
              WriteLn('Login inválido, encerrando aplicação...');
              Sleep(3000);
              Exit;
        end;
      end;
      ReadLn;
    end else if (opcao = '9') then begin
          WriteLn('Você escolheu sair. encerrando sistema...');
          Sleep(3000);
          Exit;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
