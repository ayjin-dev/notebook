# web安全学习笔记

## 环境搭建

> DVWA+UBUNTU
>
> 官方建议使用DVWA+XAMPP快速部署靶机
>
> 这里先进入[DVWA](http://www.dvwa.co.uk/)和[XAMPP](https://www.apachefriends.org/index.html)的官网进行下载
>
> XAMPP
>
> > apache mysql php一键部署
> >
> > 下载的run文件：sudo chmod 755 xxx.run
> >
> > 安装：sudo ./xxx.run
>
> DVWA
>
> > 解压出dvwa
> >
> > mv dvwa-master-> dvwa
> >
> > 然后sudo cp -R /opt/lampp/htdocs/dvwa
> >
> > cd /opt/lampp/htdocs/dvwa/config
> >
> > sudo cp config.inc.php.dist  config.inc.php
> >
> >  sudo vim config.inc.php
> >
> > 去掉数据库中的密码，并修改难度为low保存退出
>
> 打开[浏览器](http:127.0.0.1/dvwa/setup.pho)
>
> 点击最下面Create/Reset Database
>
> 账号密码admin/password
>
> 部署完成
>
> 局域网测试网址：http://192.168.123.191/dvwa/login.php

