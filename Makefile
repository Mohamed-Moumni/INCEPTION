build:
	mkdir -p /home/$USER/data/data_db
	mkdir -p /home/$USER/data/data_wp
	docker compose -f  /tmp/INCEPTION/srcs/docker-compose.yml build

up:
	docker compose -f  /tmp/INCEPTION/srcs/docker-compose.yml up -d

run: build up

down:
	docker compose -f  /tmp/INCEPTION/srcs/docker-compose.yml down

stop:
	docker compose -f /tmp/INCEPTION/srcs/docker-compose.yml stop

reset:
	docker system prune --all

clean:
	rm -rf /home/$USER/data/data_db
	rm -rf /home/$USER/data/data_wp
