TARGET=runjenkins
run:
	docker run --name jenkins --rm --detach \
  	  --privileged --network jenkins --network-alias docker \
  	  --env DOCKER_TLS_CERTDIR=/certs \
      --volume jenkins-data:/var/jenkins_home \
      --volume jenkins-docker-certs:/certs/client:ro \
      --mount type=bind,src=/Users/bernardo/git/jenkins/backup,target=/srv/backup \
      --publish 8080:8080 --publish 50000:50000 \
      docker:dind --storage-driver overlay2 \
      jenkins:1.0