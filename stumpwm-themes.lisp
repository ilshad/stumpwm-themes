(in-package #:stumpwm-themes)

(defparameter *reload-mode-line-p* t)

(defparameter *menu-prompt* "Select theme:")

(defvar *themes* (make-hash-table :test 'equal))

(defmacro define-theme (name &body body)
  `(setf (gethash ,name *themes*) #'(lambda () ,@body)))

(defun select-from-themes-menu ()
  (when-let* ((items (hash-table-keys *themes*))
	      (item (select-from-menu (current-screen) items *menu-prompt*)))
    (gethash (car item) *themes*)))

(defun reloads ()
  (update-color-map (current-screen))
  (when *reload-mode-line-p*
    (mode-line)
    (mode-line)))

(defun themes-menu ()
  (when-let (theme (select-from-themes-menu))
    (funcall theme)
    (reloads)))

(defcommand theme () () (themes-menu))
