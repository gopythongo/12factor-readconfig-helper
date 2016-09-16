#!/usr/bin/python
# -* encoding: utf-8 *-
from distutils.core import setup

_package_root = "."
_version = "1.0.0"

setup(
    name='readconfig-helper',
    version=_version,
    classifiers=[
        "Development Status :: 5 - Production/Stable",
        "Intended Audience :: Developers",
        "Intended Audience :: System Administrators",
        "Environment :: Console",
        "Programming Language :: Unix Shell",
        "License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)",
        "Operating System :: POSIX",
    ],
    scripts=[
        "readconfig.sh"
    ],
    author="Jonas Maurus (@jdelic)",
    author_email="jdelic-pypi@mncn.de",
    maintainer="@jdelic",
    description="Read files with UPPERCASE filenames in a folder line by line and and export them as environment "
                "variables. Then execute the rest of the command-line verbatim in the new environment. This is useful "
                "to set 12factor configuration for command-line utilities.",
)
