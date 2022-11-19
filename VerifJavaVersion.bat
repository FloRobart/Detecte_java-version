@echo off

:: Permet de savoir si java existe, si ce n'est pas le cas ouvre une alerte puis télécharge java jdk 16 ::
java -versio || (
    call :javaInvalide "Vous n'avez pas java, Voulez-vous télécharger Java jdk 16 ?"
    goto :eof
)


:: Vérifie la version de java ::
FOR /F "usebackq delims=" %%A IN (`java -version 2^>^&1`) DO echo %%A | findstr /i "16 17 18 19" && (
    call :versionValide
    goto :eof
) || (
    call :javaInvalide "Votre version de java inférieur à 16, Voulez-vous télécharger java jdk 16 ?"
    goto :eof
)


:: Si java est valide, lance la boite de dialogue disant que java est valide ::
:versionValide
    ECHO msgbox "Votre version de java est valide", vbOKOnly, "Java valide" > javaValide.vbs
    javaValide.vbs
    del javaValide.vbs
goto :eof


:: Si java n'est pas valide, lance la boite de dialogue pour télécharge java jdk 16 ::
:javaInvalide
    :: Ecrit le script qui vas generer la boite de dialogue pour installer java ::
    echo result = MsgBox("Vous n'avez pas java, Voulez-vous télécharger Java jdk 16 ?", vbYesNo+vbQuestion) > javaInvalide.vbs
    echo If result = vbYes Then >> javaInvalide.vbs
    echo     WScript.CreateObject ("Wscript.shell").run("installationJava16.bat"), 0 >> javaInvalide.vbs
    echo End If >> javaInvalide.vbs

    :: Ecrit le script pour télécharger java jdk 16 ::
    echo @echo off > installationJava16.bat
    echo start https://www.techspot.com/downloads/downloadnow/7407/?evp=bb667956a140a1a0a56260d7df5d40bf^^^&file=9975 >> installationJava16.bat
    echo goto :eof >> installationJava16.bat

    call javaInvalide.vbs
    timeout /t 02>nul
    del javaInvalide.vbs
    del installationJava16.bat
goto :eof
