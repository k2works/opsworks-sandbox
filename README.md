# opsworks-sandbox
## 仮想マシンセットアップ
```
$ vagrant up
$ vagrant ssh
```
## レポジトリのセットアップ
### 秘密鍵・公開鍵のセットアップ
```
$ ssh-keygen
```
### AWS CodeCommitのセットアップ
+ [CodeCommitのGitリポジトリへの接続方法](http://dev.classmethod.jp/cloud/aws/using-codecommit-git-repository/)
+ [httpsとsshの両方でAWS CodeCommitを導入してみた(httpsでエラーが出た時の対処法も載せた)](http://qiita.com/hayashier/items/a6cf3f55536f976f9a28)
+ リモートレポジトリを追加する
```
$ git remote add aws ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/opsworks-sandbox
```
+ リモートレポジトリにプッシュする
```
$ git push -u aws --all
```
### GitHubのセットアップ
+ リモートレポジトリを作成する
+ 公開鍵を登録する
+ リモートレポジトリを追加する
```
$ git remote add github git@github.com:k2works/opsworks-sandbox.git
```
+ リモートレポジトリにプッシュする
```
$ git push -u github --all
```
### BitBucketのセットアップ
+ リモートレポジトリを作成する
+ 公開鍵を登録する
+ リモートレポジトリを追加する
```
$ git remote add bitbucket https://k2works@bitbucket.org/k2works/opsworks-sandbox.git
$ git push -u bitbucket --all
```

## chefの実行
### ローカルで実行する
```
$ cd /vagrant/chef-repo/
$ chef-client --local-mode hello.rb
```
### ローカルで実行する（クックブック）
```
$ cd /vagrant/chef-repo/
$ sudo chef-client --local-mode --runlist 'recipe[learn_chef_apache2]'
```
### ローカルで実行する2（クックブック）
```
$ cd /vagrant/learn-chef/cookbooks/awesome_customers_ubuntu/
$ berks vendor cookbooks
$ sudo chef-client --local-mode --runlist 'recipe[awesome_customers_ubuntu]'
```
### InSpecの実行
```
$ cd /vagrant/learn-chef/cookbooks/webserver_test/
$ chef gem install kitchen-docker
$ kitchen verify
```

### ChefSpecの実行
```
$ cd /vagrant/learn-chef/cookbooks/webserver_test/
$ chef exec rspec --color spec/unit/recipes/default_spec.rb
```

## Railsアプリケーション環境構築
### アプリケーションのセットアップ
```
$ cd /vagrant/rails-app/
$ cd app
$ bundle
$ rails s -b 0.0.0.0
```
### クックブックのセットアップ
```
$ cd /vagrant/rails-app/
$ mkdir cookbooks
$ chef generate cookbook cookbooks/rails_app_ubuntu
$ cd cookbooks/rails_app_ubuntu/
$ kitchen verify
$ chef exec rspec --color spec/unit/recipes/default_spec.rb 
```
### アプリケーションを別レポジトリに分離する
```
$ cd /vagrant/rails-app/app/
$ git init
$ git add .
$ git commit -am 'Setup'
$ git remote add origin git@github.com:k2works/opsworks-sandbox-rails-app.git
$ git push -u origin master
$ cd /vagrant
$ git rm -r rails-app/app/
$ rm -rf rails-app/app
$ git submodule add git@github.com:k2works/opsworks-sandbox-rails-app.git rails-app/app
$ git commit -am 'アプリケーションを別レポジトリに分離する'
```
### クックブックビルド（ローカル）
```
$ cd /vagrant/rails-app/cookbooks/rails_app_ubuntu
$ kitchen converge
```
### クックブックテスト（ローカル）
```
$ cd /vagrant/rails-app/cookbooks/rails_app_ubuntu
$ kitchen verify
$ chef exec rspec --color spec/unit/recipes/default_spec.rb 
```

## 参照
+ [git remote リポジトリを複数登録する](https://bayashi.net/diary/2012/0714)
+ [6.6 Git のさまざまなツール - サブモジュール](https://git-scm.com/book/ja/v1/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E3%82%B5%E3%83%96%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB)
+ [Application_Ruby Cookbook](https://supermarket.chef.io/cookbooks/application_ruby)
+ [AWS OpsWorks 入門ガイド:Linux](http://docs.aws.amazon.com/ja_jp/opsworks/latest/userguide/gettingstarted-linux.html)
+ [AWS OpsWorks で AWS CodePipeline を使用する](https://docs.aws.amazon.com/ja_jp/opsworks/latest/userguide/other-services-cp.html)
