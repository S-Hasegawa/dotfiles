# このディレクトリについて

`secret_rc` は `.bashrc` のうちgithubに置けないものを切り出したものだが、このディレクトリには各種ソフトウェアのdotfileのうち、公開できないものを配置するものとする。

# 補足

## mysql

### homebrewで導入したmysqlの設定ファイルのありか

my.cnfは

- `/etc/my.cnf`
- `/etc/mysql/my.cnf`
- `/usr/local/etc/my.cnf`
- `~/.my.cnf`

の順番で読み込まれる。

- 参考
 - http://starzero.hatenablog.com/entry/2012/11/10/103047

### mysqlの落としあげ

デーモン化はしない場合の起動と停止方法。

- 開始
 - `mysql.server start`
- 停止
 - `mysql.server stop`

以下、`homebrew install mysql` をした時のログ。

```
==> Pouring mysql-5.7.13.yosemite.bottle.tar.gz
==> /usr/local/Cellar/mysql/5.7.13/bin/mysqld --initialize-insecure --user=s-hasegawa --basedir=/usr/local/Cellar/mysql/5.7.13 --datadir
==> Caveats
We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation

To connect run:
    mysql -uroot

To have launchd start mysql now and restart at login:
  brew services start mysql
Or, if you don't want/need a background service you can just run:
  mysql.server start
==> Summary
🍺  /usr/local/Cellar/mysql/5.7.13: 13,344 files, 446.2M
```
