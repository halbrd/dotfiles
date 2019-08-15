function help_docker_cleaning
  echo 'kill all running containers with:    docker kill $(docker ps -q)'
  echo 'delete all stopped containers with:  docker rm $(docker ps -a -q)'
  echo 'delete all images with:              docker rmi $(docker images -q)'
end
