#!/usr/bin/env bash

usage() {
    echo "readconfig.sh reads all UPPERCASE filenames in a folder line by line and "
    echo "exports them as environment variables."
    echo ""
    echo "For example, '/etc/appconfig/myapp/CONFIG' contains:"
    echo "DATABASE_URL=postgresql://user:pw@127.0.0.1:5432/test"
    echo ""
    echo "readconfig.sh /etc/appconfig/myapp django-admin.py migrate \\"
    echo "    --settings=myapp.settings"
    echo ""
    echo "will execute django-admin.py with DATABASE_URL set in the environment."
    echo ""
    exit 1;
}

if [ $# -lt 2 ]; then
    usage;
fi

FOLDER=$1
shift

if ! test -d $FOLDER; then
    echo "ERROR: $FOLDER is not a directory."
    echo ""
    usage;
fi

for file in $FOLDER/*; do
    if echo $file | grep -q "[A-Z]"; then
        echo "processing $file" >&2
        while read line; do
            if echo $line | grep -q "="; then
                echo "exporting $(echo $line | cut -d'=' -f1)..." >&2
                export $line;
            fi
        done <$file
    fi
done

exec $*
