#!/bin/bash
PGUSER=postgres PGPASSWORD=adminpass psql -c "CREATE EXTENSION IF NOT EXISTS pg_stat_statements;"
