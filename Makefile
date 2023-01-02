build:
	docker-compose -f $(PWD)/srcs/docker-compose.yml build
up:
	docker-compose -f $(PWD)/srcs/docker-compose.yml up
run:
	up build
down:
	docker-compose -f $(PWD)/srcs/docker-compose.yml down
stop:
	docker-compose -f $(PWD)/srcs/docker-compose.yml stop
clean:
	rm -rf /Users/mmoumni/Desktop/INCEPTION/srcs/data/*
	rm -rf /Users/mmoumni/Desktop/INCEPTION/srcs/data_db/*