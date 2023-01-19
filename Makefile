build:
	mkdir -p /home/mmoumni/data/data_db
	mkdir -p /home/mmoumni/data/data_wp
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
	rm -rf /home/mmoumni/data/data_db
	rm -rf /home/mmoumni/data/data_wp