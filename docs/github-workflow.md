# Github Workflow

## En interne

Le projet utilise ce workflow :

- Une branche `master` lié aux releases
- Une branche `develop` pour le développement
- Des branches `features/feature` ou autres

Chaque push à la branche `master` publiera une release sur le Play Store.

Une pipeline CI/CD est mise en place pour compiler et tester automatiquement.

## En Open Source

Avant enchainer sur le Github Flow, il est recommandé d'[ouvrir un Issue](Creating an issue - GitHub Docs
docs.github.com › managing-your-work-on-github › crea...) afin de voir si les développeurs n'ont pas déjà réfléchies sur le problème.

Nous utilisons principalement le [Github Flow](https://guides.github.com/introduction/flow/). Voici toutes les étapes en détails :

- Le dépôt est [_fork_](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) par le contributeur sur Github.

- Une fois _fork_, le contributeur clone ce dépôt sur son ordinateur.

```sh
git clone git@github.com:[contributeur]/minitel-app.git  # SSH
```

- Après le clone, le dépôt `origin` est `git@github.com:[contributeur]/minitel-app.git`. Afin que le dépôt soit toujours à jour par rapport au projet à contribuer, le contributeur doit ajouter le dépôt distant dit `upstream` :

```sh
git remote add upstream git@github.com:Darkness4/minitel-app.git
```

- A partir de ce moment, le contributeur peut travailler sur son dépôt en local. Exemple de commandes :

```sh
git add .
git commit -m "[task_name] This has changed"
git push
```

- Les push sont envoyés dans le dépôt du contributeur.

- Une fois le travail terminé, le contributeur voudra merge son dépôt distant `git@github.com:[contributeur]/minitel-app.git` vers `git@github.com:Darkness4/minitel-app.git`. Cependant, le dépôt distant du contributeur doit être mis à jour. Si la branche du contributeur s'appelait `fix-stuff` et la branche cible du dépôt original s'appelait `develop`, alors il faudra mettre à jour `fix-stuff` en faisant :

```sh
git fetch --all
git checkout fix-stuff
git merge upstream/develop
# Fixer les éventuels conflits:
# git mergetool
#
git push
```

- Le contributeur peut alors ouvrir un [Pull Request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests) et request un Code Review.

- Les développeurs du projets pourra alors Code Review et merge.
