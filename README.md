# 概要
Linuxサーバ構築時に必要な基本コンポーネントを提供します。

## ansible
- Ansibleをインストールします。

## certbot
- Let's Encryptコマンドをインストールします。
- 証明書のインストールは別途コマンドの実行が必要です。

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

## httpd
- Apacheをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
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
| php7_module | PHP対応 | |

## httpd-for-zabbix
- Zabbix用のApacheをインストールします。

## Jenkins
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

## mongodb
- MongoDBをインストールします。

## mysql-for-zabbix
- Zabbix用のMySQLをインストールします。

## openssl
- OpenSSLをインストールします。
- SSLの証明書やキーを配置する場合は、/tmpに必要なファイルを事前に設置しておく必要があります。

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
| php.configure_options | String | PHPコンパイルオプション | --enable-mbstring --with-apxs2=/usr/bin/apxs --with-config-file-path=/etc --disable-libxml --disable-xmlwriter --disable-xmlreader --disable-simplexml --disable-xml --disable-dom --without-pear |
| php.file_uploads_disabled | Bool | ファイルアップロードの可否 | false | 
| php.mysql_enabled | Bool | MySQL(MariaDB)利用の可否 | false |
| php.memory_limit | String | スクリプトが確保できる最大メモリ | 16M |
| httpd.conf | String | httpd.confのフルパス | 指定なし |
| httpd.compile_from_src | Bool | Apacheをソースコードから入れたか否か | true |  
| **httpd.ctlbin** | String | Apache実行ファイルのフルパス (httpd.compile_from_src=trueのときのみ) | 指定なし |
| **mariadb.sock** | String | MariaDB Sockファイルのフルパス (php.mysql_enabled=trueのときのみ) | 指定なし |

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

## vsftpd
- vsftpdをインストールします。

## zabbix
- ZABBIXサーバをインストールします。
- 実行後、OSの再起動が必要です。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| zabbix.start_pollers | String | StartPollers | 10 |
| zabbix.start_db_syncers | String | StartDBSyncers | 4 |
| zabbix.cache_size | String | CacheSize | 32M |

## zabbix-agent
- Zabbixエージェントをインストールします。
- プロジェクトごとに以下の値の設定が必要です。

| 変数名 | 型 | 内容 | デフォルト値 |
| ---- | ---- | ---- | ---- |
| **zabbix.server** | String | Zabbixサーバのアドレス | 指定なし |
