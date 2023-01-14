build:
	mkdir -p /Users/mmoumni/Desktop/INCEPTION/data_wp
	mkdir -p /Users/mmoumni/Desktop/INCEPTION/data_db
	docker-compose -f  $(PWD)/srcs/docker-compose.yml build
up:
	docker-compose -f  $(PWD)/srcs/docker-compose.yml up -d
run: build up
down:
	docker-compose -f  $(PWD)/srcs/docker-compose.yml down

stop:
	docker-compose -f $(PWD)/srcs/docker-compose.yml stop
reset:
	docker system prune --all
clean:
	rm -rf /Users/mmoumni/Desktop/INCEPTION/data_wp
	rm -rf /Users/mmoumni/Desktop/INCEPTION/data_db