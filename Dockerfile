# ベースイメージとしてRubyを使用
FROM ruby:3.1

# Node.jsとPostgreSQLクライアントをインストール
RUN apt-get update -qq && apt-get install -y nodejs 

# 作業ディレクトリを設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピーし、bundle installを実行
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . /myapp

# 必要なポートを開放
EXPOSE 3000

# デフォルトのコマンドとしてRailsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
