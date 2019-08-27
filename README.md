# Org to conky colorizer
This is a quick script intended to colorize your org-mode todolists to display in conky.

## Getting started
To get a copy of the project, clone the repository.

## Prerequisites
To run the project, you need a common lisp interpreter. This project has been tested using Clozure CL and SBCL. 
You also need ASDF, to load libraries.
And finally, the package CL-PPCRE is required for the regular expressions.

## Adding to conky
- In order to add to conky, you need to change the "$script_path" in org-to-conky.sh to the path where org-to-conky.lisp is located.
- Then, uncomment the line corresponding to the lisp interpreter you downloaded (or add your own if your interpreter is different). 
- If necessary, change the paths to asdf and cl-ppcre in org-to-conky.lisp, to the location of the files on your machine
- If necessary, change the path to the agenda in org-to-conky.lisp
- Finally, add the following line to your conky config:
		${execp ~/ _path_/ _to_/org-to-conky.sh 30}
- And then, Tinker!
