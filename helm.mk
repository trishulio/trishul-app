.PHONY: install containerize login_repo publish deploy undeploy deploy containerize_local set_credentials

TARGET_UPLOAD_DIR:=/var/server/trishul
SOURCE_UPLOAD_DIR:=./dist
APP_NAME:=backend
VERSION:=1.0.0-SNAPSHOT

APP_NAME:=auth
VERSION:=1.0.0
AWS_ACCOUNT_ID:=992382473777
AWS_REGION:=ca-central-1
REGISTRY=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
VALUES_FILE:=values-development.yml
NAMESPACE:=local

HELM := docker-compose --env-file helm.env -f docker-compose-bin.yml run --rm --remove-orphans helm

deploy:
	(cd chart && ${HELM} upgrade --install -f values.yaml -f ${VALUES_FILE} -n ${NAMESPACE} ${APP_NAME} . --set image.tag=${VERSION})

undeploy:
	(cd chart && ${HELM} uninstall -n ${NAMESPACE} ${APP_NAME})
