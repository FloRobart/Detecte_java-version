# Script permettant de détecter la version de java
Permet de savoir si **java** est installé sur l'ordinateur sur lequel se script est lancé.
Si java est installé mais n'a pas la bonne version le scrip affiche une boite de dialogue permettant de télécharger automatiquement java jdk 16.


## Lancement du scrip
Pour lancer le script il existe deux solutions, la première via l'interface windows et la deuxième via un terminal. Il n'y a aucune réèl différence entre les deux méthode si se n'est que c'est plus rapide de passer par l'interface windows.

### Interface windows
Après l'avoir télécharger double cliquer sur le script

### Terminal windows
Après l'avoir télécharger dans le repertoire où se trouve le script écrivez dans la barre en haut **cmd** ou **powershell**. Dans le terminal écrivez `./VerifJavaVersion.bat`

![](./img/powershell.png "Illustration pour ouvrir un cmd ou un powershell")


## Modification du script
### Changer les versions valides
Si vous voulez changer les version de java valide il vous faut remplacer les nombres `"16 17 18 19"` à la ligne 11 par les versions de java valide dans votre cas d'utilisation.

Extrait de la ligne 11 :
```bat
FOR /F "usebackq delims=" %%A IN (`java -version 2^>^&1`) DO echo %%A | findstr /i "16 17 18 19" && (
```


### Changer le lien de téléchargement
Si vous voulez changer la version de java installez en cas d'abscence de java ou de version de java non valide il faut changer le lien après `start` à la ligne 33.

Extrait de la ligne 33 :
```bat
start https://www.techspot.com/downloads/downloadnow/7407/?evp=bb667956a140a1a0a56260d7df5d40bf^&file=9975
```

**Attention** même dans une url les caratères spéciaux doivent échappé avec le caratère d'échappement approprié !
