@echo off
cls
color 0C
echo.
echo    ***********************************************
echo    ***                                         ***
echo    ***    Script de Backup para MYSQL DUMP     ***
echo    ***         feito por Mateus Couto          ***
echo    ***                                         ***
echo    ***********************************************
echo.

for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set DateTime=%%a

set Yr=%DateTime:~0,4%
set Mon=%DateTime:~4,2%
set Day=%DateTime:~6,2%
set Hr=%DateTime:~8,2%
set Min=%DateTime:~10,2%
set Sec=%DateTime:~12,2%

set timeScript=%Day%-%Mon%-%Yr%-%Hr%-%Min%-%Sec%.SQL

Rem Login e Senha do MYSQL
set Login="root"
set PW="boot123"
Rem Caminho para Salvar o Backup do MYSQL
set BackupFile="I:\Full Stack\Cursos\backupSQL_%timeScript%.sql"

set AppExePathMYSQL="C:\Program Files\MySQL\MySQL Server 5.6\bin\mysqldump.exe"
Rem Para salvar mais de um Banco adicione um espaco e nome do Banco
set DatabaseMYSQL=wordpress apirest_cliente

Rem Salva a Estrutura, Dados e Procedures
%AppExePathMYSQL% -u %Login% --password=%PW% --databases %DatabaseMYSQL% --routines > %BackupFile%

cscript backup.vbs "O Backup foi realizado com Sucesso."