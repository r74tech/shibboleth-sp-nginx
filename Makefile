# certs directory
CERTS_DIR := ./sp/shibboleth/

# Docker image name
IMAGE_NAME := shibboleth-sp-keygen

# Dockerfile path
DOCKERFILE_PATH := sp-certs

SPURL := sp.example.org

certs:
	@if [ -e $(CERTS_DIR)/sp-encrypt-cert.pem ]; then \
		read -p "certs already exists. overwrite? [y/N]: " yn; \
		case $$yn in \
			[Yy]* ) \
				echo "certs will be overwritten."; \
				;; \
			* ) \
				echo "abort."; \
				exit 1; \
				;; \
		esac \
	fi
	@echo "now building: Docker image $(IMAGE_NAME)"
	@docker build $(DOCKERFILE_PATH) -t $(IMAGE_NAME)
	@echo "generating certs..."
	@docker run $(IMAGE_NAME) sh -c "\
./keygen.sh -h $(SPURL) -y 10 -e https://$(SPURL)/shibboleth -n sp-signing && \
./keygen.sh -h $(SPURL) -y 10 -e https://$(SPURL)/shibboleth -n sp-encrypt"

	@echo "copying certs..."
	@docker cp $$(docker ps -lq):/sp-certs/sp-encrypt-cert.pem $(CERTS_DIR)
	@docker cp $$(docker ps -lq):/sp-certs/sp-encrypt-key.pem $(CERTS_DIR)
	@docker cp $$(docker ps -lq):/sp-certs/sp-signing-cert.pem $(CERTS_DIR)
	@docker cp $$(docker ps -lq):/sp-certs/sp-signing-key.pem $(CERTS_DIR)
	@echo "done."
	
up:
	@docker-compose up -d --build