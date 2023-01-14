build:
	mkdir -p /home/mmoumni/data/data_wp
	mkdir -p /home/mmoumni/data/data_db
	docker-compose -f  $(PWD)/srcs/docker-compose.yml build
up:
	mkdir -p /home/mmoumni/data/data_wp
	mkdir -p /home/mmoumni/data/data_db
	docker-compose -f  $(PWD)/srcs/docker-compose.yml up -d
run: build up
down:
	docker-compose -f  $(PWD)/srcs/docker-compose.yml down

stop:
	docker-compose -f $(PWD)/srcs/docker-compose.yml stop
clean:
	rm -rf /home/mmoumni/data/data_wp
	rm -rf /home/mmoumni/data/data_db