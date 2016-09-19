12factor-readconfig-helper
==========================

Putting this into your Python project's `requirements.txt` or setup.py
dependencies will put `readconfig.sh` into your virtualenv's `bin/` folder.

`readconfig.sh` is a small shell script that makes it easy to load environment
variables from files similar to the ones in `/etc/default`, i.e. text files
that list `key=value` pairs that are meant to be set as environment variables.

`readconfig.sh's` arguments are a list of files and folders. In the folders it
reads all files with an UPPERCASE filename. It then sets all environment
variables contained in these files. Then it executes the remainder of its
command-line after a separator `--` as it's wrapped command.

Example:

.. code-block:: shell

    bin/readconfig.sh /etc/appconfig/myapp -- bin/django-admin.py migrate \
        --settings=myapp.settings


Alternatives
------------
You can just as well use `envdir` or similar options. This is just a convenient
shell script to ship with your Python projects.


Caveats
-------
This is meant to be used for easy command-line loading of environment-based
configuration. To launch server programs, you should use the support
infrastructure of your daemon tooling which will have better logging and error
handling. For example: for `systemd` use `EnvironmentFile=` and for djb
`daemontools` use `envdir`.
