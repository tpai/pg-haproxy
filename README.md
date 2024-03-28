# PostgreSQL HAProxy

Launch a hot-standby PostgreSQL cluster with auto failover.

## Usage

```sh
# start HAProxy and two Postgres instance
docker-compose up -d

# open HAProxy
open http://localhost:3000

# run healthcheck
./healthcheck.sh

# stop pg-0
docker-compose stop pg-0

# => the healthcheck is disconnected for few seconds
# => pg-1 becomes primary server
# => the healthcheck is back again

# start pg-0
docker-compose start pg-0

# => pg-0 becomes standby server
```

## References

- https://blog.shiftasia.com/postgres-failover-with-repmgr/
- https://docs.haproxy.org/2.9/configuration.html#3.1-external-check
- https://hub.docker.com/_/haproxy
- https://hub.docker.com/r/bitnami/postgresql-repmgr
