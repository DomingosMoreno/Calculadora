@echo off
::chcp 65001 PERMITE APRESENTAR AS ACENTUAÇÕES NO CMD
chcp 65001
color 02 
::dimensão da janela
mode 80,30

::mudar título da janela

title calculadora
color 02 
::username vai ser usado para testar se existe um usuário com o nome
::inicia com 0 para indicar falso
::ao longo do if esse valor é mudado para 1 caso seja verdadeiro
set username=0
set /p "nome=DIGITE SEU NOME:"
::testar todos os nomes usuários

if %nome%==Domingos ( 
	set /a username=1
)
if %nome%==Jailson ( 
	set /a username=1
)
if %nome%==Simao ( 
	set /a username=1
)


:password
::set /p "senha=DIGIE SUA SENHA:"
::Parte que faz com que a senha não apareça na tela

echo Digite sua senha:

:loop
for /f "delims=" %%# in ('xcopy /w "%~f0" "%~f0" 2^>nul') do if not defined key (set "key=%%#")

if "%key:~-1%" == "" goto fim

if not "%key:~-1%"=="" (
	set "senha=%senha%%key:~-1%"
	set /p "=*" <nul
) else (
	if not "%senha%"=="" set "senha=%senha:~0,-1%"
	set /p "= " <nul
)

set key=
goto loop

:fim
if %username%==0 ( 
	echo.
	echo Foi verificado que o nome do usuário não existe!
	echo Pressione enter para colocar os dados novamente.
	pause>nul
	cls
	::abrir de novo um novo arquivo calculadora.bat
	:: os parâmetros do comando START I->novo ambitente e manter na mesma janela -> /B
	start /I /B calculadora.bat
	::mudar o nome da janela no processo
	title calculadora
	exit
)

if not %senha%==calculadoras ( 
	echo.
	echo Senha errada!!!
	echo Vais ter que digitar todos os dados novamente.
	pause>nul
	cls
	start /I /B calculadora.bat
	title Calculadora
	exit
) 
cls
echo.

::inciar os dados de armazenamento1 e armazenamento2 com 0
::deste modo evita bugs de o usuário não digitar nada e fica a mostrar
::resultados anteriores
::set vazio=0
::echo %vazio% > dados\armazenamento1.txt
::echo %vazio% > dados\armazenamento2.txt



:inicio
color 06

:: FAZENDO EXTRAÇÃO CONSEGUIMOS SEPARAR A VARIAVEL DE UMA DETERMINADA POSIÇÃO ,SEPARANDO AS HORAS DE MINUTOS
set hora=%time:~0,2%
set min=%time:~2,3%


echo          SEJA BEM-VINDO A SISTEMA OPERATIVO 2020/2021
echo.
:: FAZENDO A CONCATENAÇÃO JUNTAMOS AS DUAS STRINGS DA VARIAVEL HORA E MINUTOS
echo   NOME DO UTILIZADOR:%nome% ^| DATA:%date% ^| HORA:%hora%h%min%min 
echo.
echo                TEMA B:MÁQUINA CALCULADORA
echo.



echo LEITURA DE OPERADORES
echo.
	::para a entrada usou-se um arq .exe para melhor tratar os dados
	::O comando CALL aqui funciona melhor que o START pois facilita a apresentação do ler.exe
     CALL bin\ler.exe
echo.
echo.

echo    -----------------------
echo   ^|  MENU DE OPERAÇÕES:  ^|  
echo    -----------------------
echo   ^|     1-ADIÇÃO         ^|
echo   ^========================
echo   ^|     2-SUBTRAÇÃO      ^|
echo.  ^========================
echo   ^|     3-DIVISÃO        ^|
echo.  ^======================== 
echo   ^|     4-MULTIPLICAÇÃO  ^|
echo.  ^========================
echo   ^|     5-SAIR           ^|
echo    -----------------------
echo.

set /p "op= ESCOLHA UMA OPERAÇÃO:"

::atrasar um pouco o script para evitar de encontrar bugs ao abrir armazenamento1.txt e armazenamento2.txt
for /l %%i in (1,1,70) do (
	:: atrasar=1 aqui só serve para o laço não ficar vazio
	set /a atrasar=1
)


:: TOMADA DE DECISÕES 
:: O START /B ABRE O ARQ .EXE NA MESMA JANELA
::mas eles não precisam ser mostrados na tela, só efetuam operações e gravam-nas em seguida
if "%op%" == "1" (
	START /B bin\somar.exe
)
if "%op%" == "2" ( 
	START /B bin\subtrair.exe
)
if "%op%" == "3" ( 
	START /B bin\dividir.exe
)
if "%op%" == "4" ( 
	START /B bin\multiplicar.exe
) 
if "%op%" == "5"  ( 
	echo Fechando...
	echo Pressione Enter!
	pause>nul
	exit 
)

:: CASO O USUARIO ECOLHA UMA OPÇÃO QUE NÃO ESTEJA NO MENO DE OPERAÇOES
::o BEL EMITE UM SINAL SONORO
if "%op%" lss "1"  (
	echo  
	echo Atenção! Opção não permitida, terás voltar a colocar os valores.
	echo Tecla enter para prosseguir.
	pause>nul 
	cls
	goto inicio

) 

if "%op%" gtr "5"  ( 
	echo  
	echo Atenção! Opção não permitida, terás voltar a colocar os valores.
	echo Tecla enter para prosseguir.
	pause>nul
	cls
	goto inicio
) 

:atualiza
::foi verificado que um script batch neste caso vai ser muito mais rápido do que criar um arq.txt então:
::caso o ficheiro exista vai utilizar um pequeno laço para atrasar o script
::caso não exista ele vai ser obrigado a dar um tempo para o .exe criar um
::depois o laço vai atrazar mais um pouquinho o script
if exist resultado.txt (
	for /l %%i in (1,1,70) do (
		:: atrasar=1 aqui só serve para o laço não ficar vazio
		set /a atrasar=1
	)
) else goto atualiza
color 07	
::variável que vai ler o resultado
SET /p resul=<resultado.txt
echo SAIDA DO RESULTADO DA OPERAÇÃO É: %resul%

del resultado.txt

pause >nul
cls
goto inicio
