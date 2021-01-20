script_path="~/org-to conky.lisp"

#sbcl --script $script_path | sed 's/\* /\*\t/g' | sed 's/\*\*\t/\*\*/g'
ccl -l $script_path -e "(quit)" | sed 's/\* /\*\t/g' | sed 's/\*\*\t/\*\*/g'

