#!/bin/bash
export PYTHONPATH="$PYTHONPATH:/app/server/"

echo "Initializing..."
cp .devcontainer/local.py project_settings/settings/local.py

echo "Migrating..."
# TODO: automatically retry if SQL server can't be reached, instead of sleeping, hoping it will start quickly enough.
sleep 3s
python3 scripts/manage.py collectstatic --no-input
python3 scripts/manage.py makemigrations --noinput
python3 scripts/manage.py migrate --noinput
#python3 manage.py createsuperuser --noinput --username=fdev --email=webmaster@f.kth.se


if [ "${ACTION}" = "TEST" ]; then
    echo -e "\033[0;31mRunning tests.\033[0;31m"
    python3 scripts/manage.py test
else 
    echo "Starting server at $(hostname -i) (aka. \"backend\")."
    # Insecure allows for static file hosting.
    # TODO: disable this when running inside a devcontainer.
    #python3 scripts/manage.py runserver $(hostname -i):8000 --insecure
    python3 scripts/manage.py runserver 0.0.0.0:8080 --insecure
fi