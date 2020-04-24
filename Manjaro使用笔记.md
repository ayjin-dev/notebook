## Manjaro使用笔记

> #### 基础安装
> #### 基础开发工具
> #### 常见问题 

## 正文
### 1. 换源

> sudo pacman-mirros -i -m rank -c China
>
> 随便选一个
>
> 然后sudo pacman -Syyu
>
> 添加软件源，证书，密钥
>
> sudo vim /
>
> 尾部添加
>
> [archlinuxcn]
> SigLevel = Optional TrustedOnly
> Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
>
> 更新
>
> sudo pacman -Syyu && sudo pacman -S archlinux-keyring 

### 2. wechat,qq,baidunetdisk

> yay -S electron-wechat
>
> yay -S baidunetdisk

### 3. mysql

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
> alter user 'root'@'localhost' identified by 'password';
>
> done!

### 4. some qustions

* Time 

  > 手动设置时间
  >
  > sudo timedatectl set-local-rtc true

### 5.shadowsocks or shadowsocksr

> linux ss
>
> yay -S shadowsocks-libev
>
> 然后进入shadowsocks-qt5或shadowsocks中配置文件config
>
> sudo systemctl  start shadowsocks-libev@config.service
>
> 设置端口转发
>
> yay -S polipo
>
> 配置polipi
>
> sudo vim /etc/polipo/config
>
> \# connect: 
>
> proxyAddress = "::0"     # both IPv4 and IPv6 
> \# proxyAddress = "0.0.0.0"   # IPv4 only 
> proxyPort = 1081
>
> \# Uncomment this if you want to use a parent SOCKS proxy: 
>
> socksParentProxy = "localhost:1080" 
> socksProxyType = socks5
>
> sudo systemctl restart polipo
>
> 接下来可以从火狐或者谷歌中进行测试
>
> 火狐
>
> 修改浏览器中proxy 127.0.0.1 1081
>
> 谷歌
>
> google-chrome-stable --proxy-server="socks5://127.0.0.1:1080" -no-sandbox
>
> 登录谷歌帐号，下载switchomega
>
> 然后配置switchomega
>
> 从url导入配置信息
>
> https://raw.githubusercontent.com/Shadowsocks-Help/Shadowsocks/master/Download/OmegaOptions-1080.bak
>
> 完成

> linux ssr
>
> \# 需要本地git 环境
> yum install -y git
> git clone https://github.com/ay1Jin/gfwlist2privoxy.git
>
> 
>
> mv ssr /usr/local/bin
> chmod +x /usr/local/bin/ssr
>
> 安装配置
> [root@localhost ~]# ssr install
> Cloning into ‘/usr/local/share/shadowsocksr’…
> remote: Counting objects: 5490, done.
> remote: Total 5490 (delta 0), reused 0 (delta 0), pack-reused 5490
> Receiving objects: 100% (5490/5490), 1.71 MiB | 410.00 KiB/s, done.
> Resolving deltas: 100% (3799/3799), done.
>
> [root@localhost ~]# ssr config      # 配置文件路径 /usr/local/share/shadowsocksr/config.json
> {
> “server”: “0..0.0.0″,   // ssr服务器ip
> “server_ipv6″: “::”,
> “server_port”: 8080,   // ssr服务器端口
> “local_address”: “127.0.0.1″,
> “local_port”: 1080,
>
> “password”: “123456″,     // 对应password
> “method”: “none”,       // 这里对应SSGlobal配置中的Encryption
> “protocol”: “auth_chain_a”,     //对应protocl
> “protocol_param”: “”,
> “obfs”: “http_simple”,     //对应obfs
> “obfs_param”: “hello.world”,   //对应obfs_param
> “speed_limit_per_con”: 0,
> “speed_limit_per_user”: 0,
>
> “additional_ports” : {}, // only works under multi-user mode
> “additional_ports_only” : false, // only works under multi-user mode
> “timeout”: 120,
> “udp_timeout”: 60,
> “dns_ipv6″: false,
> “connect_verbose_info”: 0,
> “redirect”: “”,
> “fast_open”: false
> }
>
> 启动/关闭ssr start
> ssr stop
>
> 卸载
> ssr uninstall # 这里操作会删除/usr/local/share/shadowsocksr
>
> 以上，本地监听服务已经配置完成了，在填写的过程中，要注意你的本地监听地址和监听端口，默认是127.0.0.1:1080，如果你修改了设置，那么在后续配置中也要配合修改。


