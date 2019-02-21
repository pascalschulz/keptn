#!/bin/sh
REGISTRY_URI=$1
CHANNEL_URI=$2
NEW_ARTEFACT_CHANNEL=$3
START_DEPLOYMENT_CHANNEL=$4
DEPLOYMENT_FINISHED_CHANNEL=$5
START_TESTS_CHANNEL=$6
TESTS_FINISHED_CHANNEL=$7
START_EVALUATION_CHANNEL=$8
EVALUATION_DONE_CHANNEL=$9

rm -f config/gen/event-broker.yaml

cat config/event-broker.yaml | \
  sed 's~CHANNEL_URI_PLACEHOLDER~'"$CHANNEL_URI"'~' | \
  sed 's~NEW_ARTEFACT_CHANNEL_PLACEHOLDER~'"$NEW_ARTEFACT_CHANNEL"'~' | \
  sed 's~START_DEPLOYMENT_CHANNEL_PLACEHOLDER~'"$START_DEPLOYMENT_CHANNEL"'~' | \
  sed 's~DEPLOYMENT_FINISHED_CHANNEL_PLACEHOLDER~'"$DEPLOYMENT_FINISHED_CHANNEL"'~' | \
  sed 's~START_TESTS_CHANNEL_PLACEHOLDER~'"$START_TESTS_CHANNEL"'~' | \
  sed 's~TESTS_FINISHED_CHANNEL_PLACEHOLDER~'"$TESTS_FINISHED_CHANNEL"'~' | \
  sed 's~START_EVALUATION_CHANNEL_PLACEHOLDER~'"$START_EVALUATION_CHANNEL"'~' | \
  sed 's~EVALUATION_DONE_CHANNEL_PLACEHOLDER~'"$EVALUATION_DONE_CHANNEL"'~' | \
  sed 's~REGISTRY_URI_PLACEHOLDER~'"$REGISTRY_URI"'~' >> config/gen/event-broker.yaml 
  
kubectl apply -f config/gen/event-broker.yaml