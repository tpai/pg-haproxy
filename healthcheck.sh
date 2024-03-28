#!/bin/bash

docker run --network host --rm -it -e PGPASSWORD='apipass' \
  postgres:13-alpine bash -c "while true; do psql -h localhost -U apiuser apidb -c \"SELECT 1;\"; sleep 1; done"
