#!/usr/bin/env bash

usage() {
    echo "readconfig.sh reads all UPPERCASE filenames in a folder line by line and"
    echo "exports them as environment variables. It will do the same for any FILE"
    echo "passed to it directly. It then looks for a separator in its arguments"
    echo "(--) and execute anything after it."
    echo ""
    echo "For example, '/etc/appconfig/myapp/CONFIG' contains:"
    echo "DATABASE_URL=postgresql://user:pw@127.0.0.1:5432/test"
    echo ""
    echo "readconfig.sh /etc/appconfig/myapp -- django-admin.py migrate \\"
    echo "    --settings=myapp.settings"
    echo ""
    echo "will execute django-admin.py with DATABASE_URL set in the environment."
    echo ""
    exit 1;
}

if [ $# -lt 2 ]; then
    usage;
fi

READCONFIGSH_FOLDERS=()
READCONFIGSH_FILES=()

while [ "$1" != "--" ] && [ "$1" != "" ]; do
    if test -d $1; then
        READCONFIGSH_FOLDERS+=($1)
    fi
    if test -f $1; then
        READCONFIGSH_FILES+=($1)
    fi
    shift
done

if [ "$1" == "--" ]; then
    shift;
else
    echo "ERROR: It seems the command-line is missing the separator (--)"
    echo ""
    usage;
fi

for folder in "${READCONFIGSH_FOLDERS[@]}"; do
    for file in ${folder}/*; do
        if echo ${file} | grep -q "[A-Z]"; then
            echo "processing $file" >&2
            while read line; do
                if echo ${line} | grep -q "="; then
                    echo "exporting $(echo ${line} | cut -d'=' -f1)..." >&2
                    export ${line};
                fi
            done <${file}
        fi
    done
done

for file in "${READCONFIGSH_FILES[@]}"; do
    echo "processing $file" >&2
    while read line; do
        if echo ${line} | grep -q "="; then
            echo "exporting $(echo ${line} | cut -d'=' -f1)..." >&2
            export ${line};
        fi
    done <${file}
done

exec $*
