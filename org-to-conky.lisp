;; loading up necessary libraries
(require 'asdf "~/quicklisp/asdf.lisp")
(setf asdf:*central-registry*
      (list* '*default-pathname-defaults*
	     #p"~/.asdf/"
	     asdf:*central-registry*))
(asdf:operate 'asdf:load-op 'cl-ppcre)
;; (require 'asdf)
;; (load "cl-ppcre.asd")
;; (asdf:operate :cl-ppcre :type :fasl)
;; (load "cl-ppcre.fas")
;; (require 'cl-ppcre)
;; (use-package "cl-ppcre")


;; default font
(defvar *font* "Iosevka")

;; string concatenation
(defun cc (&rest list)
  (format nil "~{~a~^ ~}" (remove-if-not #'stringp list)))


(defun color (c)
  (list "${color " c "}" "${color}"))

(defun font (f)
  (list "${font " f "}" "${font}"))

;; list of regex/operation pairs
(defvar *replace-list*
  (list
   (list "^(\\*+)"		(color "#888800"));;"#555555"))
   (list "(TODO)"		(color "#436EEE"))
   (list "(DONE)"		(color "#AAFF88"))
   (list "(TODO|DONE|EVENT|TEST |AMIS|ANNIV|LONGTERM|TEUF|NEXT|PROJECT)"		(font (cc *font* ":style=bold:pixelsize=15")))
   (list "(<.*>)"		(color "#AA77FF"));;"#AAAAFF"))
   (list "(<.*>)"		(font (cc *font* ":style=bold:pixelsize=14")))
   (list "(DAY|PERSONAL|HOMEWORK|TESTS)"		(font (cc *font* ":bold:pixelsize=20")))
   (list "(EVENT)"		(color "#B8860B"))
   (list "(TEST )"		(color "#698B22"))
   (list "(PROJECT )"	(color "#ff2222"))
   (list "(AMIS)"		(color "#008B8B"))
   (list "(ANNIV)"		(color "#CD69C9"))
   (list "(LONGTERM)"	(color "#698B22"))
   (list "(TEUF)"		(color "#FFD700"))
   (list "(NEXT)"		(color "#FF1111"))))

;; path to agenda
;;(defvar agenda (open "~/.todolist.org"))
(defvar agenda (open "~/.todolist.org"))
;; loading agenda to lines
(defvar lines (loop for line = (read-line agenda nil nil)
		 while line
		 collect (cl-ppcre:regex-replace
			  "[\[[].*?[link]\]]"
			  (cl-ppcre:regex-replace "^(\\*)" line "")
			  "")))

;; function to colorize and set font to ONE line
(defun colorize (text)
  (loop 
     for pair in *replace-list* 
       
     do (setf text (if (cl-ppcre:scan (car pair) text)
		       (cl-ppcre:regex-replace (car pair)
					       text
					       (format nil "~A ~A~A~A ~A"
						       (car (cadr pair))
						       (cadr (cadr pair))
						       (caddr (cadr pair))
						       (cl-ppcre:scan-to-strings (car pair) text)
						       (cadddr (cadr pair))))
		       text))
     when (string-equal (car pair) (caar (last *replace-list*)))
     return text))


;; function to colorize and set font to list of lines
(defun colorize-lines (lines)
  (loop for line in lines
     collect (colorize line)))

;; output
(format t "~{~a~%~}" (colorize-lines lines))
;; close file
(close agenda)
