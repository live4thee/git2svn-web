git2svn-web
===========

`git2svn-web` is a simple web application based on `Sinatra`.

User can upload a Git patch and the back-end will convert it to a
patch in Subversion format.  It is useful when users are using git-svn
to manage a Subversion repository, and the code review system is based
on Subversion.


Configuration
-------------
Modify `git2svn.sh` to set `SVN_REPO` to the path of you svn repo.


Running the Web Server
----------------------
`./run-server.sh`

It will listen on port 8080.
