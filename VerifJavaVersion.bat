@echo off

:: Permet de savoir si java existe, si ce n'est pas le cas ouvre une alerte puis télécharge java jdk 16 ::
java -version || (
    call :javaInvalide "Vous n'avez pas java, cliquez sur ""OK"" pour télécharge Java jdk 16"
    goto :eof
)


:: Vérifie la version de java ::
FOR /F "usebackq delims=" %%A IN (`java -version 2^>^&1`) DO echo %%A | findstr /i "16 17 18 19" && (
    call :versionValide
    goto :eof
) || (
    call :javaInvalide "Votre version de java inférieur à 16, cliquez sur ""OK"" pour télécharge java jdk 16"
    goto :eof
)


:: Si java est valide, lance la boite de dialogue disant que java est valide ::
:versionValide
    ECHO msgbox "Votre version de java est valide" > alertjava.vbs
    alertjava.vbs
    del alertjava.vbs
goto :eof


:: Si java n'est pas valide, lance la boite de dialogue pour télécharge java jdk 16 ::
:javaInvalide
    ECHO msgbox "%~1" > alertjava.vbs
    alertjava.vbs
    del alertjava.vbs
    start https://www.techspot.com/downloads/downloadnow/7407/?evp=bb667956a140a1a0a56260d7df5d40bf^&file=9975
goto :eof