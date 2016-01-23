#!/usr/bin/env python


try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup


readme = open('README.rst').read()
history = open('HISTORY.rst').read().replace('.. :changelog:', '')

setup(
    name='m4j2',
    version='0.1.0',
    description='Simple Raspberry Pi based robot stuff',
    long_description=readme + '\n\n' + history,
    author='Mike Messmore',
    author_email='mike@messmore.org',
    url='https://github.com/mmessmore/m4j2',
    packages=[
        'm4j2',
    ],
    package_dir={'m4j2': 'm4j2'},
    include_package_data=True,
    install_requires=[
    ],
    license='MIT',
    zip_safe=False,
    keywords='m4j2',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Natural Language :: English',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: Implementation :: PyPy',
    ],
)
