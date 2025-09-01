.PHONY: install containerize login_repo publish deploy undeploy deploy containerize_local set_credentials

APP_NAME:={{cookiecutter.project_slug}}-backend
VERSION:=1.0.0-SNAPSHOT
VALUES_FILE:=values-development.yml
NAMESPACE:=local

HELM := docker-compose --env-file helm.env -f docker-compose-bin.yml run --rm --remove-orphans helm

deploy:
	(cd chart && ${HELM} upgrade --install -f values.yaml -f ${VALUES_FILE} -n ${NAMESPACE} ${APP_NAME} . --set image.tag=${VERSION})

undeploy:
	(cd chart && ${HELM} uninstall -n ${NAMESPACE} ${APP_NAME})
