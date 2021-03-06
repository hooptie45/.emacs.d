(defun myorg-update-parent-cookie ()
  (when (equal major-mode 'org-mode)
    (save-excursion
      (ignore-errors
        (org-back-to-heading)
        (org-update-parent-todo-statistics)))))

(defadvice org-kill-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(defadvice kill-whole-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(defun goto-notes ()
  (interactive)
  (let* ((persp (persp-new "notes")))
    (with-perspective "notes"
      (progn
        (make-directory (expand-file-name "~/org"))
        (find-file (expand-file-name "~/org/notes.org"))))))



(provide 'setup-org)
