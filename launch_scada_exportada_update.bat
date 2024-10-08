@echo off
set verbose=NO
set quiet=NO
:: Define el servidor, la base de datos, el puerto y el usuario
SET server=localhost
SET database=postgres
SET port=5432
SET username=postgres
:: Si el codigo de la pagina es 932 guarda 1 o 0. Si es 1 configura otra codificacion del cliente
for /f "delims=" %%a in ('chcp ^|find /c "932"') do @ SET CLIENTENCODING_JP=%%a
if "%CLIENTENCODING_JP%"=="1" SET PGCLIENTENCODING=SJIS
if "%CLIENTENCODING_JP%"=="1" SET /P PGCLIENTENCODING="Client Encoding [%PGCLIENTENCODING%]: "
:: Ejecuta psql.exe conectandose con las variables ya definidas y ejecuta el archivo scada_exportada.sql
"C:\Program Files\PostgreSQL\14\bin\psql.exe" -h %server% -U %username% -d %database% -p %port% -f C:\Users\Administrador\Desktop\BatchScriptSQL\SQLs\scada_exportada.sql
:: Cierra
exit