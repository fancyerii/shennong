# simple makefile to simplify repetitive build env management tasks under posix

PYTHON ?= python
PYTEST ?= pytest

.PHONY: build doc test

clean:
	$(PYTHON) setup.py clean
	rm -rf .eggs .pytest_cache doc/build test/__pycache__

build:
	$(PYTHON) setup.py build

develop: build
	$(PYTHON) setup.py develop

install: build
	$(PYTHON) setup.py install

doc: build
	$(PYTHON) setup.py build_sphinx

test: build
	$(PYTEST)

xtest: build
	$(PYTEST) -x