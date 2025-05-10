English / [**日本語**](README_JP.md)

# Overview
This provides basic components required for Linux server setup.

## ansible
- Installs Ansible.

## aws-sam-cli
- Installs AWS SAM CLI.

## certbot
- Installs Let's Encrypt commands.
- Certificate installation requires separate command execution.

## drdb
- Installs DRDB.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **drdb.partition** | array | Synchronization partition information | Not specified |

## elasticsearch
- Installs Elasticsearch.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Whether to install Apache from source | false |
| httpd.kibana_conf | String | Path to Kibana Apache config file | /etc/httpd/conf.d/kibana.conf |

## fping
- Installs fping required for Zabbix Server installation.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.fping** | String | fping version | Value specified in defaults |
| **zabbix.conf** | String | Full path to zabbix.conf | Not specified |

## gitlab
- Installs GitLab.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Whether to install Apache from source | Not specified |
| gitlab.email_from | String | Sender email address | example@example.com |
| gitlab.email_display_name | String | Sender name | Example |

## greengrass
- Installs AWS Greengrass.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.greengrass** | String | Greengrass version | Value specified in defaults |

## httpd
- Installs Apache.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.httpd** | String | httpd version | Value specified in defaults |
| **version.apr** | String | apr version | Value specified in defaults |
| **version.apr_util** | String | apr_util version | Value specified in defaults |
| httpd.server_admin | String | Server admin | webmaster@apache.org |
| httpd.ssl_enabled | Bool | SSL support | false |
| httpd.pass | String | httpd user login password | password |
| httpd.timeout | String | Connection timeout | 60 |
| httpd.max_keepalive_requests | String | Maximum requests per connection | 100 |
| httpd.keepalive_timeout | String | Seconds to wait before closing connection | 5 |
| httpd.start_servers | String | Number of child server processes created at startup | 5 |
| httpd.min_spare_servers | String | Minimum number of idle child server processes | 5 |
| httpd.max_spare_servers | String | Maximum number of idle child server processes | 10 |
| httpd.max_request_workers | String | Maximum number of simultaneous requests | 250 |
| httpd.server_limit | String | Upper limit for MaxRequestWorkers | 256 |
| httpd.max_connections_per_child | String | Limit on the number of requests a child process handles | 0 (unlimited) |
| httpd.cros | String | URL to allow cross-domain | null |
| **ssl.dir** | String | SSL installation directory (only when httpd.ssl_enabled=true) | Not specified |

### SSL Certificates
- When httpd.ssl_enabled is set to true, the following SSL certificate keys must be installed:

| File | Directory |
| --- | --- |
| Certificate | /tmp/server.crt or location specified by httpd.ssl_cert_file |
| Private Key | /tmp/server.key or location specified by httpd.ssl_key_file |

### Static Modules
- The following static modules are enabled:

| Module Name | Function | Notes |
| ---- | ---- | ---- |
| core_module | Core Apache HTTP Server features that are always available | |
| auth_digest_module | Digest Authentication | Add --enable-auth_digest=static during configure |
| so_module | Loads executable code and modules into server during startup/restart | Add --enable-so during configure |
| http_module | | |

### Dynamic Modules
- The following dynamic modules are enabled:

| Module Name | Function | Notes |
| ---- | ---- | ---- |
| authn_file_module | User authentication using text files | |
| authn_core_module | Core authentication functionality | |
| authz_host_module | Group authorization based on host | |
| authz_groupfile_module | Group authorization using plain text files | |
| authz_user_module | User authorization | |
| access_compat_module | Host-based group authorization | |
| auth_basic_module | Basic authentication | |
| socache_shmcb_module | Shared object cache provider using shmcb | SSL version only |
| reqtimeout_module | Request timeout settings | |
| mime_module | Associates file extensions with file behaviors | |
| log_config_module | Server request logging | |
| env_module | Modifies environment variables passed to CGI scripts and SSI pages | |
| headers_module | Customization of HTTP request and response headers | |
| setenvif_module | Sets environment variables based on request characteristics | SSL version only |
| ssl_module | SSL support | SSL version only |
| mpm_prefork_module | Non-threaded, pre-forking web server | |
| unixd_module | Provides Unix OS standard security features, User and Group directives | |
| status_module | Provides server performance information | |
| dir_module | Slash redirects | |
| alias_module | URL aliasing functionality | |
| php_module | PHP support | |

## httpd-for-zabbix
- Installs Apache for Zabbix.

## jenkins
- Installs Jenkins.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Whether to install Apache from source | false |
| httpd.jenkins_conf | String | Path to Jenkins Apache config file | /etc/httpd/conf.d/jenkins.conf |

### Post-Installation Configuration
- Unlock Jenkins
Enter the password found in the following file into the setup screen:
 
> /var/lib/jenkins/secrets/initialAdminPassword

- Proxy Configuration
  - "**Manage Jenkins**" - "**Manage Plugins**" - "Advanced"
  - "Server" does not require http:// prefix
  - "Exclude hosts" can be written as 192.168.* etc.
- Install recommended plugins
- Create users
- Install Gitlab Hook Plugin

## jmeter
- Installs JMeter.
- OS restart required after installation.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.jmeter** | String | JMeter version | Value specified in defaults |
| jmeter.client_ip | String | JMeter client IP | 192.168.0.1 |

## lsyncd
- Installs lsyncd.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| lsyncd.exec_user | String | lsyncd execution user | root |
| **sync.source_dir** | String | Source directory for sync | Not specified |
| **sync.dest_address** | String | Destination server | Not specified |
| sync.module_name | String | Destination module name | sync |

## mariadb
- Installs MariaDB.
- **Note**: Running this Role might remove **Postfix**.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| mariadb.table_open_cache | String | Number of open files to maintain | 400 |
| mariadb.query_cache_size | String | Memory allocated for caching query results | 0M |
| mariadb.wait_timeout | String | Seconds to wait before closing non-interactive connections | 28800sec |
| mariadb.interactive_timeout | String | Seconds to wait before closing interactive connections | 28800sec |
| mariadb.thread_cache_size | String | Number of threads to cache for reuse | 0 |
| mariadb.max_connections | String | Maximum allowed concurrent client connections | 151 |
| mariadb.back_log | String | Number of unprocessed connection requests to hold | 50 |
| mariadb.open_files_limit | String | Number of files mysqld is allowed to open | 0 |
| mariadb.key_buffer_size | String | Buffer size for index blocks | 8388608 |
| mariadb.sort_buffer_size | String | Buffer size for sorting | 2097144 |

## mariadb-for-zabbix
- Installs MariaDB for Zabbix.
- Works on CentOS 7 and above
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.mariadb** | String | MariaDB version | Value specified in defaults |

## mongodb
- Installs MongoDB.

## mysql-for-zabbix
- Installs MySQL for Zabbix.

## openssl
- Installs OpenSSL.
- SSL certificates and keys must be placed in /tmp beforehand if needed.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.ssl** | String | OpenSSL version | Value specified in defaults |

## pacemaker
- Installs Pacemaker.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| pacemaker.primary_ip | String | Primary server address | 192.168.1.101 |
| pacemaker.primary_host | String | Primary server hostname | cluster01 |
| pacemaker.secondary_ip | String | Secondary server address | 192.168.1.102 |
| pacemaker.secondary_host | String | Secondary server hostname | cluster02 |
| pacemaker.domain | String | Domain | example.com |

- The following group settings are required per project:

| Variable Name | Description |
| ---- | ---- |
| primary | Inventory group to which primary server belongs |

## php
- Installs PHP.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.php** | String | PHP version | Value specified in defaults |
| php.configure_options | String | PHP compile options | --enable-mbstring --with-apxs2=/usr/bin/apxs --with-config-file-path=/etc --disable-libxml --disable-xmlwriter --disable-xmlreader --disable-simplexml --disable-xml --disable-dom --without-pear |
| php.file_uploads_disabled | Bool | Enable/disable file uploads | false |
| php.mysql_enabled | Bool | Enable/disable MySQL(MariaDB) | false |
| php.memory_limit | String | Maximum memory a script can allocate | 16M |
| httpd.conf | String | Full path to httpd.conf | Not specified |
| httpd.compile_from_src | Bool | Whether Apache was installed from source | true |
| **httpd.ctlbin** | String | Full path to Apache executable (only when httpd.compile_from_src=true) | Not specified |
| **mariadb.sock** | String | Full path to MariaDB sock file (only when php.mysql_enabled=true) | Not specified |

### Modules
- List of enabled modules:

| Module Name | Function | Notes |
| ---- | ---- | ---- |
| Core | Core functionality | Installed by default |
| ctype | Character type checking | Installed by default |
| date | Date and time | Installed by default |
| fileinfo | File information | |
| filter | Data filtering | Installed by default |
| hash | HASH message digest framework | Installed by default |
| iconv | Character encoding conversion | Installed by default |
| json | JSON processing | Installed by default |
| mbstring | Multi-byte string processing | Add --enable-mbstring during configure |
| mysqli | MySQL improved extension | Add --with-mysqli during configure |
| mysqlnd | MySQL Native Driver | Add --with-pdo-mysql=shared,mysqlnd during configure |
| openssl | OpenSSL | Add --with-pdo-sqlite=shared during configure |
| pcre | Perl Compatible Regular Expressions | Installed by default |
| PDO | PHP Data Objects | Installed by default |
| Phar | Phar archives | |
| posix | POSIX | Installed by default |
| Reflection | Reflection | Installed by default |
| session | Session handling | Installed by default |
| SPL | Standard PHP Library | Installed by default |
| sqlite3 | SQLite | Installed by default |
| standard | | Installed by default |
| tokenizer | PHP token processing | Installed by default |

## php-mongodb
- Installs MongoDB driver for PHP.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| httpd.compile_from_src | Bool | Whether to install Apache from source | false |
| php.phpize | String | Path to phpize | /usr/bin/phpize |
| php.php_config | String | Path to php-config | /usr/bin/php-config |

## python
- Installs Python.

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| ssl.dir | String | OpenSSL directory | /usr/local/ssl |
| **version.python** | String | Python version | Value specified in defaults |

## repo
- Configures CentOS 7 repository.

## rsyncd
- Installs rsyncd.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **sync_user** | String | Sync execution user | Not specified |
| **sync_group** | String | Sync execution group | Not specified |
| **sync_module_name** | String | Sync destination module name | Not specified |
| **sync_allow_hosts** | String | Allowed sync source server address | Not specified |
| **sync_dest_path** | String | Sync destination directory | Not specified |

## rundeck
- Installs Rundeck.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **httpd.compile_from_src** | Bool | Whether to install Apache from source | false |
| httpd.rundeck_conf | String | Path to Rundeck Apache config file | /etc/httpd/conf.d/rundeck.conf |

## setup
- Performs basic package installation and security configuration required after OS installation.

## sphinx
- Installs Sphinx.

## swap
- Creates swap space.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| swap.mag | Integer | Multiplier for physical memory to determine swap size | 2 |

### Post-Installation Configuration
- Install Tex Live

## snmptt
- Installs SNMPTT.
- Works on CentOS 7 and above
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **snmp.vendormibs** | String | Full path to MIB storage | Not specified |
| **zabbix.conf** | String | Full path to zabbix.conf | Not specified |
| **zabbix.start_snmptrapper** | String | StartSNMPTrapper | Not specified |

## sox
- Installs SoX.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.sox** | String | SoX version | Value specified in defaults |

## vsftpd
- Installs vsftpd.

## zabbix
- Installs Zabbix server.
- OS restart required after installation.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.zabbix** | String | Zabbix version | Value specified in defaults |
| zabbix.start_pollers | String | StartPollers | 10 |
| zabbix.start_db_syncers | String | StartDBSyncers | 4 |
| zabbix.cache_size | String | CacheSize | 32M |

## zabbix-agent
- Installs Zabbix agent.
- The following values need to be configured per project:

| Variable Name | Type | Description | Default Value |
| ---- | ---- | ---- | ---- |
| **version.zabbix_agent** | String | Zabbix agent version | Value specified in defaults |
| **zabbix.server** | String | Zabbix server address | Not specified |