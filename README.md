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
