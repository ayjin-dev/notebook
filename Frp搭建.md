## Frp搭建

内网穿透,使局域网设备能够通过SSH远程登录.

首先我们要明白什么哪个是服务器,哪个是客户端.

在Frp中,能够让外部链接的机器叫做客户端(例如树莓派),进行转接的机器叫服务器(云服务器,具备公网IP)

### 服务器篇

> 这里以腾讯云ubuntu18.04为例
>
> 下载frp linux 64位[链接](https://github.com/fatedier/frp/releases/download/v0.34.3/frp_0.34.3_linux_amd64.tar.gz)
>
> 下载后,通过scp 上传到服务器启动.
>
> 如果采用默认配置,需要在安全组打开6000\7000双向通信的端口.
>
> 6000端口:负责给远程设备链接.
>
> 7000端口:负责给局域网设备链接.
>
> 运行nohup ./frps -c frps.ini > /logs/frpslogs.log 2>&1 &

### 客户端篇

> 这里以树莓派为例.
>
> 因为树莓派自带关闭ssh和scp权限.
>
> 打开ssh
>
> ```
> $ raspi-config #自行打开.
> ```
>
> 打开scp权限remote_port = 6000
>
> 首先把需要连接的目录通过chown 改为当前用户
>
> 然后赋予写入权限chown 755
>
> 下载frp **arm版本**[地址](https://github.com/fatedier/frp/releases/download/v0.34.3/frp_0.34.3_linux_arm.tar.gz)
>
> 运行nohup ./frpc -c frpc.ini > /logs/frpclogs.log 2>&1 &

### 远程连接篇

> 通过ssh -p 6000 pi@ip(这里的Ip是指公网ip)

