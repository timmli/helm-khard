;;; helm-khard-test.el --- Tests for helm-khard.el   -*- lexical-binding: t -*-

(defun helm-khard-test (&optional test-dir-path)
  "Test `helm-khard'."
  (interactive)
  (let* ((helm-khard-test-dir (or test-dir-path
                                  (read-directory-name "Path to test directory: ")))
         ;; (helm-khard-test-dir (file-name-directory (buffer-file-name)))
         (helm-khard-config-file (expand-file-name (concat helm-khard-test-dir
                                                           "khard.conf")))
         (helm-khard-vdirsyncer-command "echo \"Faking the execution of vdirsyncer ...\"")
         (helm-khard--candidates nil)
         (helm-khard-insert-with-organisation nil)
         (helm-khard-sync-after-editing t)
         (helm-khard-sync-during-initialization t))
    (setenv "HELM_KHARD_TEST_DIR" helm-khard-test-dir) ; used in khard.conf
    ;; (getenv "KHARD_CONFIG")
    (require 'helm-khard)

   ;;; Populate `helm-khard--candidates'
    (helm-khard--make-candidates)

 ;;; Test Khard CLI
 ;;;  Accepted fields are "anniversary", "birthday", "categories", "email", "emails", "formatted_name", "index", "name", "nicknames", "notes", "organisations", "phone", "phone_numbers", "post_addresses", "roles", "titles", "uid", "version", "webpages".
    ;; (shell-command (concat helm-khard-executable
    ;;                        " -c " helm-khard-config-file
    ;;                        ;; " show d4435f29-9382-46c4-9ab7-99c9ff8eec3c"
    ;;                        ;; " list -F emails"
    ;;                        ;; " list -F phone_numbers"
    ;;                        ;; " list -F name"
    ;;                        ;; " list -F birthday"
    ;;                        ;; " list -F post_addresses"
    ;;                        " list -F categories"
    ;;                        ;; " list -F organisations"
    ;;                        ))

 ;;; Test Helm interface
    (helm-khard)

 ;;; Test specific functions
    ;; (helm-khard--search-candidates `(:name "John Doe"))
    ;; (helm-khard-edit-contact-action (cdr (car helm-khard--candidates)))
    ;; (helm-khard-insert-field-action (cdr (car helm-khard--candidates)))
    ;; (plist-get (car (cdr (car helm-khard--candidates))) :categories)
    ;; (let ((helm-khard--merge-ongoing t))(helm-khard))
    ;; (helm-khard--clean-up-complex-field "{'work': ['john.doe@job.org', 'john.doe@work.com'], 'home': ['johnny@doe.me']}")
    ;; (helm-khard--clean-up-complex-field "[['Doe GmbH'], ['Family']]")
    ;; (helm-khard--clean-up-complex-field "['Poker team']")
    ;; (helm-khard--clean-up-complex-field "['Poker team', 'vegetarian']")
    ;; (helm-khard--clean-up-complex-field "Poker team")
    ))


;; Local Variables:
;; indent-tabs-mode: nil
;; End:
