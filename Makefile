docker:
	sudo docker-compose up --build

bash:
	sudo docker exec -it sopha-test-api_web_1 /bin/bash

debug:
	sudo docker attach $(container)

build:
	sudo docker-compose build

database:
	sudo docker exec -it sopha-test-api_db_1 /bin/bash