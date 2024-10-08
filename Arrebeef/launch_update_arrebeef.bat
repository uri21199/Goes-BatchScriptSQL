@echo off

    setlocal enableextensions disabledelayedexpansion

    set "source=\\DESKTOP-EQ6HIDK\Logs"
    set "target=C:\Users\Administrador\Desktop\Arrebeef\Scripts\Latest data"

    for %%a in (ArchivioTT01_01C ArchivioFIT06_01 ArchivioFIT05_01 ArchivioFIT08_01 ArchivioAIT06_01 ArchivioFIT01_05A ArchivioFIT01_05B ArchivioFIT02_02 ArchivioFIT02_01 ArchivioFIT02_03 ArchivioFIT02_05 ArchivioPotenza ArchivioWIT05_01) do (
        set "first=1"
        for /f "delims=" %%b in ('
            dir /a-d /tw /o-d /b "%source%\%%a*.csv"
        ') do if defined first (
            set "first="
            copy /b /y "%source%\%%~b" "%target%\%%a%%~xb"
        )
    )

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
:: Ejecuta psql.exe conectandose con las variables ya definidas y ejecuta el archivo update_arrebeef.sql
"C:\Program Files\PostgreSQL\14\bin\psql.exe" -h %server% -U %username% -d %database% -p %port% -f C:\Users\Administrador\Desktop\BatchScriptSQL\Arrebeef\SQLs\update_arrebeef.sql
:: Cierra
exit