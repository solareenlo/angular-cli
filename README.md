# angular-cli
Angular CLIのDockerfile置き場.

## Requirement
### Dockerをインストール
**Ubuntu:** [Get Docker CE for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

**Mac:** [Install Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)

**Win:** [Install Docker Desktop for Windows](https://docs.docker.com/docker-for-windows/install/)

### docker-composeをインストール
[Install Docker Compose](https://docs.docker.com/compose/install/)

## Usage
### Dockerfileだけで動かす
```bash
# first-appを作成
docker run -it --rm -w /app -v $(pwd):/app solareenlo/angular-cli ng new first-app
# コンテナに入って作業する
docker run -it --rm -w /app -v $(pwd)/first-app:/app solareenlo/angular-cli sh
# コンポーネントを作成
docker run -it --rm -w /app -v $(pwd)/first-app:/app solareenlo/angular-cli ng g component sample-component
# コンテナを立ち上げる
docker run -d -w /app -v $(pwd)/first-app:/app -p 4200:4200 solareenlo/angular-cli ng serve --host 0.0.0.0
```
そして, 任意のブラウザで`localhost:4200`を開く.

### Dockerfileとdocker-compose.serve.ymlを使って動かす
```bash
# first-appを作成
docker run -it --rm -w /app -v $(pwd):/app solareenlo/angular-cli ng new first-app
# コンテナに入って作業する
docker run -it --rm -w /app -v $(pwd)/first-app:/app solareenlo/angular-cli sh
# docker-compose を使ってコンテナを立ち上げる
docker-compose -f docker-compose.serve.yml up -d
# コンテナの中に入って作業する
docker-compose -f docker-compose.serve.yml sh
# 関連するコンテンを全て止める
docker-compose -f docker-compose.serve.yml stop
# 関連するコンテナを全削除
docker-compose -f docker-compose.serve.yml rm
```
そして, 任意のブラウザで`localhost:4200`を開く.
