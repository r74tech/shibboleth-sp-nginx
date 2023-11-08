FROM nginx:latest

ENV SPURL=sp.example.org

# 必要なパッケージをインストール
RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
    openssl 

# ホストからスクリプトをコンテナにコピー
COPY ./keygen.sh /sp-certs/keygen.sh

# 実行権限を付与
RUN chmod +x /sp-certs/keygen.sh

WORKDIR /sp-certs
