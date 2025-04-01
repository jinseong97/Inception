DC=docker-compose
DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml

all:
	mkdir -p /home/jinsecho/data/{db,wp}
	@$(DC) -f $(DOCKER_COMPOSE_FILE) up --build -d
down:
	@$(DC) -f $(DOCKER_COMPOSE_FILE) down
clean:
	@$(DC) -f $(DOCKER_COMPOSE_FILE) down -v
fclean: clean
	rm -r /home/jinsecho/data/db
	rm -r /home/jinsecho/data/wp
re:	clean all

.PHONY:	all down clean fclean re

