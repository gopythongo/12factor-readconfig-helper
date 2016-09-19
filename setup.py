#!/usr/bin/python
# -* encoding: utf-8 *-
import os
from distutils.core import setup

HERE = os.path.dirname(__file__)

try:
    long_description = open(os.path.join(HERE, 'README.rst')).read()
except IOError:
    long_description = None


setup(
    name='12factor-readconfig-helper',
    version="1.0.0",
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
    url="https://github.com/gopythongo/12factor-readconfig-helper/",
    author="Jonas Maurus (@jdelic)",
    author_email="jonas-readconfig-helper@gopythongo.com",
    maintainer="@jdelic",
    description="Read files with UPPERCASE filenames in a folder line by line and and export them as environment "
                "variables. Then execute the rest of the command-line verbatim in the new environment. This is useful "
                "to set 12factor configuration for command-line utilities.",
    long_description=long_description,
)
