#!/bin/bash

export CONT_VERSION=1.0

# Create the Image
docker buildx build --platform linux/amd64 -t niklaushirt/test-ui:$CONT_VERSION --load .
docker push niklaushirt/test-ui:$CONT_VERSION

# Run the Image
docker run -p 8080:8080 -e KAFKA_TOPIC=$KAFKA_TOPIC -e KAFKA_USER=$KAFKA_USER -e KAFKA_PWD=$KAFKA_PWD -e KAFKA_BROKER=$KAFKA_BROKER -e CERT_ELEMENT=$CERT_ELEMENT niklaushirt/test-ui:$CONT_VERSION

# Deploy the Image
oc apply -n default -f create-cp4mcm-event-gateway.yaml





exit 1

