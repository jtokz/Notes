#basics #dev 

Here i'm going to make a directory of bash and git commands

#### general commands

| Command | // use |
| ---- | ---- |
| `pwd` | // current directory |
| `ls` | // list folders in current directory |
| `cat` | // output content of a file in console |
| `rmd` | // delete a file permanently |
| `clear` | // clear the console |
| `cd` | // change directory |

## git

| command                               | // use                                                                                                                      |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `git status`                          | Shows actual status of files                                                                                                |
| `git clone *url*`                     | Clone a repository in current path                                                                                          |
| `rm -rf *file*`                       | Solve error: fatal: destination path 'XXXXX' already exists and is not an empty directory.                                  |
|                                       |                                                                                                                             |
| `git init`                            | Create a new repository in current folder                                                                                   |
| `git add .`                           | add all files                                                                                                               |
| `git add *archive-name.ext/*`         | only add a file or folder                                                                                                   |
| `git commit -m "comment"`             | Make a commit where `-m` is message                                                                                         |
| `git push -u origin *branch-name*`    | Sync local branch with remote, when using -u branchA branchB you set the tracking so in future pushes you just use git push |
| `git reset --soft`                    | remove a commit without deleting changes in the local repository                                                            |
| `git reset --hard`                    | remove a commit deleting changes in the local repository                                                                    |
| `git pull`                            | fetch current files from master or sub branch                                                                               |
| `git merge`                           | merges pulled files with your local branch                                                                                  |
|                                       |                                                                                                                             |
| `git checkout -b *new-branch*`        | Creates new local branch                                                                                                    |
| `git branch -d *branch-name*`         | Deletes local branch                                                                                                        |
| `git push origin :*branch-name*`      | Deletes remote branch                                                                                                       |
| `git branch`                          | Shows all branches                                                                                                          |
| `git checkout master/main`            | Go to master/main branch                                                                                                    |
| `git branch -m *old-name* *new-name*` | Rename a branch                                                                                                             |
| `git branch -m *new-name*`            | Rename current branch                                                                                                       |
|                                       |                                                                                                                             |

Credits https://gist.github.com/cferdinandi/ef665330286fd5d7127d

##### Esto listará todas las carpetas `.git` desde esa ruta, es decir, te dice dónde hay repositorios Git.
find /c/Users/TuUsuario -type d -name ".git"