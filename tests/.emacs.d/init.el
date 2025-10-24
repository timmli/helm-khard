(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package helm
	:ensure t)

(use-package uuidgen
	:ensure t)

(use-package yaml-mode
	:ensure t)

(tool-bar-mode 0)
(setq inhibit-startup-screen t)

(use-package helm-khard
  :load-path "../../../helm-khard")

(message "Khard verson: %s" (helm-khard--get-version))

(setq helm-khard-test-dir (expand-file-name (concat user-emacs-directory "../"))
			;; (helm-khard-test-dir (file-name-directory (buffer-file-name)))
			helm-khard-config-file (expand-file-name (concat helm-khard-test-dir
																											 "khard.conf"))
			helm-khard-vdirsyncer-command "echo \"Faking the execution of vdirsyncer ...\""
			helm-khard--candidates nil
			helm-khard-insert-with-organisation nil
			helm-khard-sync-after-editing t
			helm-khard-sync-during-initialization t)

(setenv "HELM_KHARD_TEST_DIR" helm-khard-test-dir) ; used in khard.conf
;; (getenv "KHARD_CONFIG")

;;; Test Helm interface
(find-file "helm-khard-tests.el")
(goto-char (point-max))
(helm-khard)

