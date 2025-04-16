DC=docker-compose
DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml

all:
	mkdir -p /home/jinsecho/data/db
	mkdir /home/jinsecho/data/wp
	@$(DC) -f $(DOCKER_COMPOSE_FILE) up --build -d
down:
	@$(DC) -f $(DOCKER_COMPOSE_FILE) down
ps:
	@$(DC) -f $(DOCKER_COMPOSE_FILE) ps
clean:
	@$(DC) -f $(DOCKER_COMPOSE_FILE) down -v
fclean: clean
	rm -rf /home/jinsecho/data
re:	fclean all

.PHONY:	all down clean fclean re

