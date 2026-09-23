[**English**](README.md) / 日本語

# 概要
Linuxサーバ構築時に必要な基本コンポーネントを提供します。

## ansible
- Ansibleをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| ansible.package | String | インストールするパッケージ。`ini_file` は community.general に含まれるため `ansible-core` ではなく `ansible` を指定する | ansible |
| ansible.enablerepo | String | インストール時に有効化するリポジトリ。リリース 2023 未満では `epel`、2023 以降では空になる。AL2023 は ansible を OS 標準のリポジトリで提供するため。空の場合は `enablerepo` を渡さない | OS のメジャーバージョンによる条件式 |
| ansible.config | String | ansible.cfg のフルパス | /etc/ansible/ansible.cfg |
| ansible.log | String | ansible ログのフルパス | /var/log/ansible.log |
| ansible.log_mode | String | ansible ログのパーミッション | 0640 |
| ansible.logrotate | String | logrotate 設定のフルパス | /etc/logrotate.d/ansible |
| ansible.logrotate_frequency | String | ローテートの頻度 | weekly |
| ansible.logrotate_rotate | String | 保持する世代数 | 4 |

## aws-sam-cli
- AWS SAM CLIをインストールします。

## certbot
- Let's Encryptコマンドをインストールします。
- 証明書のインストールは別途コマンドの実行が必要です。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **certbot.domain** | String | 証明書を発行するドメイン | example.com |
| certbot.packages | Array | pip でインストールするパッケージ。Python 3.7 では certbot 2.8.0 以降が動かないため `certbot==2.7.4` を指定する | certbot, certbot-apache, certbot-dns-route53 |
| certbot.pip_state | String | packages にバージョンを固定した場合は `present` を指定 | latest |
| certbot.venv_path | String | virtualenv のパス。空の場合はシステムの pip3 を使う | '' |
| certbot.venv_command | String | virtualenv を作るコマンド。先頭の語が Python の実体で、別のバージョンを指すと role が virtualenv を作り直す | /usr/bin/python3 -m venv |
| certbot.python_packages | Array | venv_command が指す Python を提供するパッケージ。空の場合は OS 同梱の Python を使う | [] |
| certbot.authenticator | String | certbot renew に渡す認証プラグイン | dns-route53 |
| certbot.cert_name | String | --cert-name に渡す lineage。空の場合はホスト上の全 lineage を更新する | '' |
| certbot.auto_update_script_path | String | 更新スクリプトのフルパス | /usr/local/bin/update_cert.sh |
| certbot.deploy_cert_to | Array | httpd 以外への配布先。各要素は cert_src、cert_dest、key_src、key_dest、reload を取る | [] |
| certbot.cron_packages | Array | cron の実体を提供するパッケージ。AL2023 の AMI には含まれない | cronie |
| certbot.cron_service | String | cron のサービス名 | crond |

## drdb
- DRDBをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **drdb.partition** | array | 同期させるパーティションの情報 | 指定なし |

## elasticsearch
- Elasticsearchをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Apacheをソースから入れるか否か | false |
| httpd.kibana_conf | String | Kibana用Apache Configファイルのパス | /etc/httpd/conf.d/kibana.conf |

## fping
- Zabbix Serverインストール時に必要となる、fpingをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.fping** | String | fpingのバージョン名 | defaultsに指定の値 |
| **zabbix.conf** | String | zabbix.confのフルパス | 指定なし |

## gitlab
- GitLabをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Apacheをソースから入れるか否か | 指定なし |
| gitlab.email_from | String | 送信メール元アドレス | example@example.com |
| gitlab.email_display_name | String | 送信メール名 | Example |

## greengrass
- AWS Greengrassをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.greengrass** | String | greengrassのバージョン名 | defaultsに指定の値 |

## httpd
- Apacheをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.httpd** | String | httpdのバージョン名 | defaultsに指定の値 |
| **version.apr** | String |aprのバージョン名 | defaultsに指定の値 |
| **version.apr_util** | String | apr_utilのバージョン名 | defaultsに指定の値 |
| httpd.server_admin | String | サーバアドミン | webmaster@apache.org |
| httpd.ssl_enabled  | Bool | SSL対応の可否 | false |
| httpd.pass | String | httpdユーザのログインパスワード | password |
| httpd.timeout | String | 接続タイムアウト | 60 |
| httpd.max_keepalive_requests | String |  一回の接続で受け付け可能なリクエストの数 | 100 |
| httpd.keepalive_timeout | String | 接続を閉じる前に待つ秒数 | 5 |
| httpd.start_servers | String | 起動時に生成される子サーバプロセスの数 | 5 |
| httpd.min_spare_servers | String | アイドルな子サーバの希望最小プロセス数 | 5 |
| httpd.max_spare_servers | String | アイドルな子サーバの希望最小プロセス数 | 10 |
| httpd.max_request_workers | String | 応答可能な同時リクエスト数 | 250 |
| httpd.server_limit | String | MaxRequestWorkers に設定可能な上限値 | 256 |
| httpd.max_connections_per_child | String | 子プロセスが扱うことのできるリクエスト数の上限 | 0（無限） |
| httpd.cros | String | クロスドメインを許可するURL | null |
| **ssl.dir** | String | SSLのインストールディレクト(httpd.ssl_enabled=trueのときのみ) | 指定なし |
| httpd.compile_from_src | Bool | Apache をソースからビルドするか否か。false にするとディストリビューションのパッケージを使う | true |
| httpd.packages | Array | compile_from_src=false のときに導入するパッケージ | httpd, httpd-tools, mod_ssl |
| httpd.conf_d | String | 追加設定を置くディレクトリ (compile_from_src=false のときのみ) | /etc/httpd/conf.d |
| httpd.service | String | systemd で管理するサービス名 (compile_from_src=false のときのみ) | httpd |
| httpd.neutralized_conf | Array | 内容を空にするパッケージ同梱の設定。autoindex.conf は /icons/ を、welcome.conf は /poweredby.png を公開する | autoindex.conf, welcome.conf, userdir.conf |
| httpd.ssl_conf_filename | String | mod_ssl が置く設定ファイル名。role が内容を差し替える | ssl.conf |
| httpd.ssl_protocol | String | SSLProtocol の値 (compile_from_src=false のときのみ) | -all +TLSv1.2 +TLSv1.3 |
| httpd.ssl_cipher_suite | String | SSLCipherSuite の値。PROFILE=SYSTEM は OS の crypto-policies に従う | PROFILE=SYSTEM |
| httpd.min_spare_threads | String | event と worker MPM のアイドルスレッドの最小数 | 25 |
| httpd.max_spare_threads | String | event と worker MPM のアイドルスレッドの最大数 | 75 |

### SSL証明書

- httpd.ssl_enabled を true に設定した場合、以下のSSL証明書キーを設置する必要があります。

| ファイル | ディレクトリ |
| --- | --- |
| 証明書 | /tmp/server.crt もしくは httpd.ssl_cert_file にて指定した位置 |
| 秘密鍵 | /tmp/server.key　もしくは httpd.ssl_key_file にて指定した位置 |

### 静的モジュール
- 有効化している静的モジュールは以下の通りです。

| モジュール名 | 機能 | 備考 |
| ---- | ---- | ---- |
| core_module | 常に使用可能な Apache HTTP サーバのコア機能 | |
| auth_digest_module | Digest認証 | configureコマンド実行時に--enable-auth_digest=staticを付加 |
| so_module | 起動時や再起動時に実行コードとモジュールをサーバにロードする | configureコマンド実行時に--enable-soを付加 |
| http_module | | |

### 動的モジュール
- 有効化している静的モジュールは以下の通りです。

| モジュール名 | 機能 | 備考 |
| ---- | ---- | ---- |
| authn_file_module | テキストファイルを用いたユーザ認証 | |
| authn_core_module | 認証のコア機能 | |
| authz_host_module | ホストに基づいたグループ認証 | |
| authz_groupfile_module | プレーンテキストファイルを用いたグループ認証 | |
| authz_user_module | ユーザ認証 | |
| access_compat_module | ホストに基づいたグループ認証 | |
| auth_basic_module | Basic認証 | |
| socache_shmcb_module | shmcbによる共有オブジェクトプロバイダ | SSL対応版のみ |
| reqtimeout_module | リクエストタイムアウトの設定 | |
| mime_module | ファイルの拡張子とファイルの振る舞いとを関連付け | |
| log_config_module | サーバへのリクエストのロギング | |
| env_module | CGI スクリプト及び SSI ページに渡される環境変数を変更する機能を提供 | |
| headers_module | HTTP リクエストのヘッダと応答のヘッダのカスタマイズ | |
| setenvif_module | リクエストの特徴に基づいた環境変数の設定が可能 | SSL対応版のみ |
| ssl_module | SSL対応 | SSL対応版のみ |
| mpm_prefork_module | スレッドを使わず、先行して fork を行なう | |
| unixd_module | Unix OSへ標準的なセキュリティ機能を提供、User, Groupディレクティブの提供 | |
| status_module | サーバの性能等に関する情報を提供 | |
| dir_module | スラッシュのリダイレクト | |
| alias_module | エイリアス機能 | |
| php_module | PHP対応 | |

## httpd-for-zabbix
- Zabbix用のApacheをインストールします。

## jenkins
- Jenkinsをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Apacheをソースから入れるか否か | false |
| httpd.jenkins_conf | String | Jenkins用Apache Configファイルのパス | /etc/httpd/conf.d/jenkins.conf |

### インストール後に行う設定
- Unlock Jenkins
以下に記述されたパスワードをセットアップ画面に入力する
 
> /var/lib/jenkins/secrets/initialAdminPassword

- Proxyの設定
  - 「**Jenkinsの管理**」-「**プラグインの管理**」-「高度な設定」
  - 「サーバ」は、http://等の記述は不要
  - 「対象外ホスト」は、192.168.*等で記述する
- オススメのPluginをインストール
- ユーザの作成
- Gitlab Hook Pluginのインストール

## jmeter
- jmeterをインストールします。
- 実行後、OSの再起動が必要です。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.jmeter** | String | jmeterのバージョン名 | defaultsに指定の値 |
| jmeter.client_ip | String | jmeterのclient ip | 192.168.0.1 |

## lsyncd
- lsyncdをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| lsyncd.exec_user | String | lsyncd実行ユーザ | root |
| **sync.source_dir** | String | 同期元ディレクトリ | 指定なし |
| **sync.dest_address** | String | 同期先サーバ | 指定なし |
| sync.module_name | String | 同期先モジュール名 | sync |

## mariadb
- MariaDBをインストールします。
- このRoleを実行すると**Postfix**が削除されてしまう場合があるので注意してください。
- プロジェクトごとに以下の値の設定が必要です。詳細は該当のPlaybookを参照してください。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| mariadb.table_open_cache | String | 開いたままにするファイル数 | 400 |
| mariadb.query_cache_size | String | クエリ結果をキャッシュするために割り当てられたメモリーの量 | 0M |
| mariadb.wait_timeout | String | 非インタラクティブな接続を閉じる前に、サーバーがその接続上でアクティビティーを待機する秒数 | 28800sec |
| mariadb.interactive_timeout | String | 対話型の接続で、対話型の接続を閉じる前にアクティビティーを待機する秒数 | 28800sec |
| mariadb.thread_cache_size | String | 再使用のためにキャッシュするスレッドの数 | 0 |
| mariadb.max_connections | String | 許可される最大のクライアントの同時接続数 | 151 |
| mariadb.back_log | String | 保持できる未処理の接続リクエストの数 | 50 | 
| mariadb.open_files_limit | String | オペレーティングシステムでmysqld が開くことを許可するファイル数 | 0 | 
| mariadb.key_buffer_size | String | インデックスブロックに使用されるバッファのサイズ | 8388608 |
| mariadb.sort_buffer_size | String | ソートに使用されるバッファのサイズ | 2097144 |

## mariadb-for-zabbix
- Zabbix用のMariaDBをインストールします。
- CentOS7以上で動作
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.mariadb** | String | mariadbのバージョン名 | defaultsに指定の値 |

## mongodb
- MongoDBをインストールします。

## mysql-for-zabbix
- Zabbix用のMySQLをインストールします。

## openssl
- OpenSSLをインストールします。
- SSLの証明書やキーを配置する場合は、/tmpに必要なファイルを事前に設置しておく必要があります。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.ssl** | String | opensslのバージョン名 | defaultsに指定の値 |

## pacemaker
- Pacemakerをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| pacemaker.primary_ip | String | プライマリサーバのアドレス | 192.168.1.101 |
| pacemaker.primary_host | String | プライマリサーバのホスト名 | cluster01 |
| pacemaker.secondary_ip | String | セカンダリサーバのアドレス | 192.168.1.102 |
| pacemaker.secondary_host | String | セカンダリサーバのホスト名 | cluster02 |
| pacemaker.domain | String | ドメイン | example.com |

- プロジェクトごとに以下のグループの設定が必要です。

| 変数名 | 内容 |
| ---- | ---- | 
| primary | プライマリサーバが属するインベントリグループ |

## php
- PHPをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.php** | String | phpのバージョン名 | defaultsに指定の値 |
| php.configure_options | String | PHPコンパイルオプション | --enable-mbstring --with-apxs2=/usr/bin/apxs --with-config-file-path=/etc --disable-libxml --disable-xmlwriter --disable-xmlreader --disable-simplexml --disable-xml --disable-dom --without-pear |
| php.file_uploads_disabled | Bool | ファイルアップロードの可否 | false | 
| php.mysql_enabled | Bool | MySQL(MariaDB)利用の可否 | false |
| php.memory_limit | String | スクリプトが確保できる最大メモリ | 16M |
| httpd.conf | String | httpd.confのフルパス | 指定なし |
| httpd.compile_from_src | Bool | Apacheをソースコードから入れたか否か | true |  
| **httpd.ctlbin** | String | Apache実行ファイルのフルパス (httpd.compile_from_src=trueのときのみ) | 指定なし |
| **mariadb.sock** | String | MariaDB Sockファイルのフルパス (php.mysql_enabled=trueのときのみ) | 指定なし |
| php.compile_from_src | Bool | PHP をソースからビルドするか否か。false にするとディストリビューションのパッケージを使う | true |
| php.packages | Array | compile_from_src=false のときに導入するパッケージ。版数を名前に含むディストリビューションでは php8.2-* のように指定する | php, php-fpm, php-opcache, php-mbstring |
| php.conf_d | String | 追加の .ini を置くディレクトリ (compile_from_src=false のときのみ) | /etc/php.d |
| php.ini_filename | String | その .ini のファイル名。数字が大きいほど後に読まれる | 99-ansible.ini |
| php.fpm_enabled | Bool | php-fpm で動かすか否か。PHP 8.2 の mod_php を提供しないディストリビューションがあるため既定で true | true |
| php.fpm_service | String | php-fpm のサービス名 | php-fpm |
| php.timezone | String | date.timezone | Asia/Tokyo |
| php.charset | String | default_charset | UTF-8 |
| php.max_execution_time | String | max_execution_time | 300 |
| php.upload_max_filesize | String | upload_max_filesize | 2M |
| php.post_max_size | String | post_max_size | 8M |
| php.max_file_uploads | String | max_file_uploads | 20 |
| php.opcache_tuning | Bool | opcache の既定値を上書きするか否か。opcache はパッケージの既定で有効 | false |
| php.opcache_memory_consumption | String | opcache.memory_consumption (opcache_tuning=true のときのみ) | 128 |
| php.opcache_max_accelerated_files | String | opcache.max_accelerated_files (opcache_tuning=true のときのみ) | 4000 |
| php.opcache_revalidate_freq | String | opcache.revalidate_freq (opcache_tuning=true のときのみ) | 2 |
| php.extra_settings | Dict | 上記に当てはまらない php.ini の設定をキーと値で指定 | {} |

### モジュール
- 有効化しているモジュールの一覧です。

| モジュール名 | 機能 | 備考 |
| ---- | ---- | ---- |
| Core | コア機能 | 標準でインストール |
| ctype | 文字タイプチェック | 標準でインストール |
| date | 日付・時刻 | 標準でインストール |
| fileinfo | ファイル情報 | |
| filter | データのフィルタリング | 標準でインストール |
| hash | HASH メッセージダイジェストフレームワーク | 標準でインストール |
| iconv | 文字コードの変換 | 標準でインストール |
| json | JSON処理 | 標準でインストール |
| mbstring | マルチバイト文字列処理 | configureコマンド実行時に--enable-mbstringを付加 |
| mysqli | MySQL 改良版拡張モジュール | configureコマンド実行時に--with-mysqliを付加 |
| mysqlnd | MySQL Native Driver | configureコマンド実行時に--with-pdo-mysql=shared,mysqlndを付加 |
| openssl | OpenSSL | configureコマンド実行時に--with-pdo-sqlite=sharedを付加 |
| pcre |Perl互換正規表現 | 標準でインストール |
| PDO | PHP Data Objects | 標準でインストール |
| Phar | Phar アーカイブ | |
| posix | POSIX | 標準でインストール |
| Reflection | リフレクション | 標準でインストール |
| session |　セッション処理 | 標準でインストール |
| SPL | Standard PHP Library　| 標準でインストール |
| sqlite3 | SQLite | 標準でインストール |
| standard | | 標準でインストール |
| tokenizer | PHPトークン処理 | 標準でインストール |

## php-mongodb
- phpで使用可能なmongodbドライバをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| httpd.compile_from_src | Bool | Apacheをソースから入れるか否か | false |
| php.phpize | String | phpizeのパス | /usr/bin/phpize |
| php.php_config | String | php-configのパス | /usr/bin/php-config |

## python
- Pythonをインストールします。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| ssl.dir | String | OpenSSLのディレクトリ | /usr/local/ssl |
| **version.python** | String | pythonのバージョン名 | defaultsに指定の値 |

## repo
- CentOS7リポジトリを設定します。

## rsyncd
- rsyncdをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **sync_user** | String | 同期実行ユーザ | 指定なし | 
| **sync_group** | String | 同期実行グループ | 指定なし | 
| **sync_module_name** | String | 同期先モジュール名 | 指定なし | 
| **sync_allow_hosts** | String | 許可する同期元サーバアドレス | 指定なし |  
| **sync_dest_path** | String | 同期先ディレクトリ | 指定なし |

## rundeck
- Rundeckをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Apacheをソースから入れるか否か | false |
| httpd.rundeck_conf | String | Jenkins用Apache Configファイルのパス | /etc/httpd/conf.d/rundeck.conf |

## setup
- OSインストール直後に行う必要のある、基本パッケージのインストール、およびセキュリティ設定をします。

## sphinx
- Sphinxをインストールします。

## swap
- Swap領域を作成します。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| swap.mag | Integer | 物理メモリの何倍Swapを用意するか | 2 |

### インストール後に行う設定
- Tex Liveのインストール

## snmptt
- SNMPTTをインストールします。
- CentOS7以上で動作
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **snmp.vendormibs** | String | MIB格納先のフルパス | 指定なし |
| **zabbix.conf** | String | zabbix.confのフルパス | 指定なし |
| **zabbix.start_snmptrapper** | String | StartSNMPTrapper | 指定なし |

## sox
- SoXをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.sox** | String | soxのバージョン名 | defaultsに指定の値 |

## vsftpd
- vsftpdをインストールします。

## zabbix
- ZABBIXサーバをインストールします。
- 実行後、OSの再起動が必要です。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.zabbix** | String | zabbixのバージョン名 | defaultsに指定の値 |
| zabbix.start_pollers | String | StartPollers | 10 |
| zabbix.start_db_syncers | String | StartDBSyncers | 4 |
| zabbix.cache_size | String | CacheSize | 32M |

## zabbix-agent
- Zabbixエージェントをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **version.zabbix_agent** | String | zabbix_agentのバージョン名 | defaultsに指定の値 |
| **zabbix.server** | String | Zabbixサーバのアドレス | 指定なし |