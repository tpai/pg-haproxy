#!/bin/bash
PGUSER=postgres PGPASSWORD=adminpass psql -c "CREATE EXTENSION IF NOT EXISTS pg_stat_statements;"

mkdir -p /bitnami/postgresql/conf/conf.d
cat <<EOF > /bitnami/postgresql/conf/conf.d/pg_extended.conf
listen_addresses='*'
max_connections=400       # Default value is 100.
shared_buffers=1GB        # Default value is 128MB. The amount of memory the database server uses for shared memory buffers (shared_buffers=RAM*0.25)
max_wal_size=1GB          # Default value is 1GB.
min_wal_size=80MB         # Default value is 80MB. (min_wal_size=max_wal_size*0.25)
work_mem=4MB              # Default value is 4MB. Maximum amount of memory to be used by a query operation. (work_mem=RAM*0.25/max_connections)
maintenance_work_mem=64MB # Default value is 64MB. For maintenance operations, such as VACUUM and CREATE INDEX.
effective_cache_size=4GB  # Default value is 4GB. The size of the disk cache that is available to a single query and it does not actually allocate the memory.

# tracking statistics of all executed SQL statements
pg_stat_statements.max=10000
pg_stat_statements.track=all
EOF
