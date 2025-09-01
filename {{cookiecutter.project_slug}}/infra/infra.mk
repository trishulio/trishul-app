.PHONY: infra infra-reset infra-restart

DOCKER_COMPOSE_INFRA := docker-compose --env-file infra.env -f docker-compose-infra.yml

infra:
	$(DOCKER_COMPOSE_INFRA) up -d

infra-restart:
	$(DOCKER_COMPOSE_INFRA) down && \
	$(DOCKER_COMPOSE_INFRA) rm && \
	$(DOCKER_COMPOSE_INFRA) up -d

infra-reset:
	$(DOCKER_COMPOSE_INFRA) down -v && \
	$(DOCKER_COMPOSE_INFRA) rm && \
	$(DOCKER_COMPOSE_INFRA) up -d
