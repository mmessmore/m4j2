.PHONY: clean-pyc clean-build docs clean

ifeq ($(OS),Windows_NT)
DEFTEST:=py27
else
DEFTEST:=all
endif
ifeq ($(OS),Windows_NT)
OPEN:=cygstart
else
OPEN:=open
endif
	

help:
	@echo "clean - remove all build, test, coverage and Python artifacts"
	@echo "clean-build - remove build artifacts"
	@echo "clean-pyc - remove Python file artifacts"
	@echo "clean-test - remove test and coverage artifacts"
	@echo "lint - check style with flake8"
	@echo "test - run tests quickly with the default Python"
	@echo "test-all - run tests on every Python version with tox"
	@echo "coverage - check code coverage quickly with the default Python"
	@echo "docs - generate Sphinx HTML documentation, including API docs"
	@echo "release - package and upload to pypi server"
	@echo "dist - package"
	@echo "rpm - bdist_rpm"
	@echo "install - install the package to the active Python's site-packages"

clean: clean-test clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -f junit-*.xml

lint:
	flake8 m4j2 tests

test: test-$(DEFTEST)

test-all:
	tox

test-py27:
	tox -e py27

test-py26:
	tox -e py26

coverage: test
	$(OPEN) htmlcov/index.html

docs:
	rm -f docs/m4j2.rst
	rm -f docs/modules.rst
	sphinx-apidoc -o docs/ m4j2
	$(MAKE) -C docs clean
	$(MAKE) -C docs html
	$(OPEN) docs/_build/html/index.html

release: clean
	python setup.py sdist upload -r internal
	python setup.py bdist_wheel upload -r internal

dist: clean
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist

rpm: clean
	python setup.py bdist_rpm

install: clean
	python setup.py install
