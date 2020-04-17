## Manjaro使用笔记

> #### 基础安装
> #### 基础开发工具
> #### 常见问题 

## 正文
### 1. 换源
### 2. wechat,qq,baidunetdisk
### 3. proxy,polipo,shadowsocks
### 4. mysql

> sudo pacman -S mysql
>
> sudo mysqld --initialize --user=mysql --basedir=/usr --datadir=/var/lib/mysql
>
> get localhost passwd
>
> sudo systemctl start mysql.service 
>
> systemctl status mysqld.service
>
> sudo systemctl enable mysqld.service 
>
> mysql -uroot -p
>
> mysql> show databases; 
> ERROR 1820 (HY000): You must reset your password using ALTER USER statement before e
> xecuting this statement.
>
> alter user 'root'@'localhost' identified by 'ouyang4283658';
>
> done!

### 5. wechat
### 6. some qustions

* Time 

  > 手动设置时间
  >
  > sudo timedatectl set-local-rtc true

