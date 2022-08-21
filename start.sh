#/bin/bash
## place your local enviornment file name here
ENV=local.env

case "$1" in
start)
   echo "STARTING"
   docker compose --env-file=$ENV -f docker-compose.yml up
   ;;
stop)
   echo "STOPPING"
   docker compose --env-file=$ENV -f docker-compose.yml down
   ;;
restart)
   $0 stop
   $0 start
   ;;
rebuild)
   echo "REBUILD"
   docker compose --env-file=$ENV -f docker-compose.yml up --build
   ;;
upgarde)
   echo "UPGRADING CONTAINERS"
   docker compose pull
   ;;

*)
   echo "Usage: $0 {start|stop|rebulid|upgrade}"
esac

exit 0
