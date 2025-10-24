
emacs-test: khard
	. .venv/bin/activate && emacs --init-dir .emacs.d

emacs-test-0.19.1: khard-0.19.1
	. .venv/bin/activate && emacs --init-dir .emacs.d

emacs-test-0.17.0: khard-0.17.0
	. .venv/bin/activate && emacs --init-dir .emacs.d

venv:
	python -m venv .venv

khard: venv
	. .venv/bin/activate && pip install --upgrade khard

khard-0.19.1: venv
	. .venv/bin/activate && pip install khard==0.19.1

khard-0.17.0: venv
	. .venv/bin/activate && pip install khard==0.17.0

clean-up:
	rm -fr .venv
