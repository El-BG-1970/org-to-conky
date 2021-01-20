# Org to conky colorizer
This is a quick script intended to colorize your org-mode todolists to display in conky.

## Getting started
To get a copy of the project, clone the repository.

## Prerequisites
To run the project, you need a common lisp interpreter. This project has been tested using Clozure CL and SBCL. 
ASDF is included in the package, to load libraries.
Finally, the package CL-PPCRE is included for regular expressions.

## Adding to conky
- Uncomment the line corresponding to the lisp interpreter you downloaded (or add your own if your interpreter is different) in org-to-conky.sh 
- If necessary, change the asdf and cl-ppcre paths in org-to-conky.lisp, to the location of the files on your machine
- If necessary, change the agenda path in org-to-conky.lisp
- Finally, add the following line to your conky config:
		${execp ~/ _path_/ _to_/org-to-conky.sh 30}
- Tinker and Enjoy!
