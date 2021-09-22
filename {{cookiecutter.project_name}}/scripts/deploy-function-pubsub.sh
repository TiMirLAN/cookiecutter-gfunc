#!/usr/bin/env sh

source ./.env

project_name='{{ cookiecutter.project_name }}'

poetry export -f requirements.txt --without-hashes --output requirements.txt

if [[ $1 == '--initial' ]]
then
    # Create pubsup topic to connect shceduler with function.
    gcloud pubsub topics create $project_name

    # Create a scheduler to call a function every 1 hour.
    gcloud scheduler jobs create pubsub $project_name\
            --schedule="0 */1 * * *"\
            --topic=$project_name\
            --message-body="scheduled"
fi

envars="\
LOG_LEVEL=$LOG_LEVEL\
"
# Create cloud function to call by schedule.
gcloud functions deploy $project_name\
        --entry-point=hook\
        --runtime=python39\
        --set-env-vars=${envars}\
        --trigger-topic=$project_name
