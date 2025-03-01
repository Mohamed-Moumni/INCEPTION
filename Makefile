build:
	mkdir -p /home/mmoumni/data/data_db
	mkdir -p /home/mmoumni/data/data_wp
	docker compose -f $(PWD)/srcs/docker-compose.yml build

start:
	docker compose -f $(PWD)/srcs/docker-compose.yml up -d

run: build start