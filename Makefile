up:
	docker-compose up -d
down:
	docker-compose down

restart: down up

up_example:
	docker-compose -f ./example/httpd.yml up -d

down_example:
	docker-compose -f ./example/httpd.yml down

test:
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/
	curl http://localhost:80/

enter_fluentd:
	docker exec -it dockerefk_fluentd_1 bash

teardown: down_example down
	-docker volume prune -f
