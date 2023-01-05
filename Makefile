build:
	docker-compose -f  $(PWD)/srcs/docker-compose.yml build
up:
	docker-compose -f  $(PWD)/srcs/docker-compose.yml up -d

run: build up

down:
	docker-compose -f  $(PWD)/srcs/docker-compose.yml down

stop:
	docker-compose -f $(PWD)/srcs/docker-compose.yml stop

restart: clean
	$(MAKE) down
	# docker rmi $(docker image ls -qa)
	docker system prune --all
	$(MAKE) build
	$(MAKE) up
clean:
	rm -rf /Users/mmoumni/Desktop/INCEPTION/srcs/data/*
	rm -rf /Users/mmoumni/Desktop/INCEPTION/srcs/data_db/*