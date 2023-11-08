# 証明書生成ディレクトリ
CERTS_DIR := ./sp/shibboleth/

# Docker イメージ名
IMAGE_NAME := shibboleth-sp-keygen

# Dockerfile の場所
DOCKERFILE_PATH := sp-certs

SPURL := sp.example.org
# 証明書生成
certs:
	@echo "ビルド中: Docker イメージ $(IMAGE_NAME)"
	@docker build $(DOCKERFILE_PATH) -t $(IMAGE_NAME)
	@echo "証明書を生成しています..."
	@docker run $(IMAGE_NAME) sh -c "\
./keygen.sh -h $(SPURL) -y 10 -e https://$(SPURL)/shibboleth -n sp-signing && \
./keygen.sh -h $(SPURL) -y 10 -e https://$(SPURL)/shibboleth -n sp-encrypt"

	@echo "ホストマシンに証明書をコピーしています..."
	@docker cp $$(docker ps -lq):/sp-certs/sp-encrypt-cert.pem $(CERTS_DIR)
	@docker cp $$(docker ps -lq):/sp-certs/sp-encrypt-key.pem $(CERTS_DIR)
	@docker cp $$(docker ps -lq):/sp-certs/sp-signing-cert.pem $(CERTS_DIR)
	@docker cp $$(docker ps -lq):/sp-certs/sp-signing-key.pem $(CERTS_DIR)
	@echo "証明書の生成が完了しました。"
	
up:
	@docker-compose up -d --build