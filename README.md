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
# 作ったfirst-appディレクトリに入る
cd first-app
# コンテナに入って作業する
docker run -it --rm -w /app -v $(pwd):/app solareenlo/angular-cli sh
# コンポーネントを作成
docker run -it --rm -w /app -v $(pwd):/app solareenlo/angular-cli ng generate component sample-component
docker run -it --rm -w /app -v $(pwd):/app solareenlo/angular-cli ng g c sample-component
# コンテナを立ち上げる
docker run -d -w /app -v $(pwd):/app -p 4200:4200 solareenlo/angular-cli ng serve --host 0.0.0.0
```
そして, 任意のブラウザで`localhost:4200`を開く.

### Dockerfileとdocker-compose.ymlを使って動かす
```bash
# first-appを作成
docker run -it --rm -w /app -v $(pwd):/app solareenlo/angular-cli ng new first-app
# first-appディレクトリに移動
cd first-app
# コンテナに入って作業する
docker run -it --rm -w /app -v $(pwd):/app solareenlo/angular-cli sh
# docker-compose を使ってコンテナを立ち上げる
docker-compose up -d
# コンテナの中に入って作業する
docker-compose exec angular sh
# コンポーネント作成
docker-compose exec angular ng generate component sample-component
docker-compose exec angular ng g c sample-component
# テストは作らずにコンポーネント作成
docker-compose exec angular ng g c sample-component --spec false
# コンポーネントの中にコンポーネントを作成
docker-compose exec angular ng g c sample-component/test --spec false
# マテリアルデザインをインストール
docker-compose exec angular ng add @angular/material
# 関連するコンテンを全て止める
docker-compose stop
# 関連するコンテナを全削除
docker-compose rm
```
そして, 任意のブラウザで`localhost:4200`を開く.
