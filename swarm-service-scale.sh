#!/bin/sh

limit=100000

i=1000; while [ $i -le $limit ]; do
  echo $i
  docker service scale $SERVICE=$i
  i=$(($i + 200))
  sleep 5
done
