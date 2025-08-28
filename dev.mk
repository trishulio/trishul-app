.PHONY: run

DEV := docker-compose --env-file app.env -f docker-compose.yml -f docker-compose-dev.yml

app-run:
	$(DEV) up -d
	docker logs -f app

app-down:
	$(DEV) down

app-restart:
	$(DEV) restart

app-reset:
	$(DEV) down &&\
	$(DEV) rm -v
	app-run
