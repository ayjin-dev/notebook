# Linux基础

## 文件系统目录结构

**window** C D E 盘的系统目录结构

**linux** 只有一个 */* 目录，其文件系统是采用层级式的树状目录结构，在次结构中最上层是根目录= */* 目录，然后基于这个目录下再创建其他的目录。

**<u>*在Linux的世界里，一切皆文件。*</u>**

## Linux 目录结构

| ***/dev***          | ***管理设备***            | ***将CPU、DISK、U盘等等硬件映射为文件系用进行存储***         |
| ------------------- | :------------------------ | ------------------------------------------------------------ |
| ***/media***        | ***外接设备***            | ***U盘插入、光驱等等***                                      |
| ***/bin***          | ***常用的指令包***        | ***类似于cp bash python mv 这一类的指令都存在那里***         |
| ***/etc***          | ***配置文件***            | ***所有的系统管理所需要的配置文件和子目录都在这里my.conf***  |
| ***/usr***          | ***软件目录***            | ***用户安装的软件基本都在这里面***                           |
| ***/boot***         | ***启动LINUX的文件目录*** | ***镜像文件部分存放***                                       |
| ***/proc/srv/sys*** | ***内核***                | ***系统底层代码存放***                                       |
| ***/tmp***          | ***临时存放目录***        |                                                              |
| ***/mnt***          | ***挂载别的文件系统***    | ***外部的存储可以挂载在/mnt/上，然后进入该目录即可查看内容*** |
| ***/opt***          | ***存放安装包***          |                                                              |

| /usr/local | 安装包                     | 编译源码方式安装的程序 |
| ---------- | -------------------------- | ---------------------- |
| ***/var*** | ***日志文件***             |                        |
| /lib       | 开机最基本的动态链接共享库 | 类似于windows的DLL文件 |
|            |                            |                        |
|            |                            |                        |



## vim

**三种模式：正常模式、插入模式、命令行模式**

* 正常模式：我们可以使用快捷键
* 插入模式：程序员可以输入内容



## 实操篇

* 用户管理

* 添加登录用户 

  > useradd -m  xxx
  >
  > 然后进入home目录可以查看到xxx文件
  >
  > 指定登录后所在文件夹
  >
  > useradd -d /xxx/xxx name
  >
  > 设置密码
  >
  > passwd xxx
  >
  > passwd name

* 删除用户

  > userdel xxx
  >
  > 删除用户保留家目录
  >
  > userdel -r xxx
  >
  > 删除用户不保留目录

* 权限管理

  > linux 文件分为七种
  >
  > ​    　 -：普通文件
  >
  > ​     　d：目录文件
  >
  > ​     　l： 软链接（类似Windows的快捷方式）
  >
  > ​    　　(**下面四种是特殊文件)**
  >
  > ​     　b：块设备文件（例如硬盘、光驱等）
  >
  > ​    　　 p：管道文件
  >
  > ​     　c：字符设备文件（例如猫等串口设备）
  >
  > ​     　s：套接口文件/数据接口文件（例如启动一个MySql服务器时会产生一个mysql.sock文件）
  >
  > ![power](/home/ayjin/Documents/screenshot/powerpic.png)
  >
  > ​		**drwxr-xr-x**表示：**d:目录文件**
  >
  > ​		**d rwx r-x r-x**
  >
  > ​		**rwx:表示u(文件属于USER)的可以读写执行**
  >
  > ​		**r-x:表示g(group)属于这个用户组的可以读和执行**
  >
  > ​		**r-x:表示o(other)其他用户可读可执行**

  

  > **文件权限对应关系**
  >
  > | 权限 | 对应数值 | 意义    |
  > | ---- | -------- | ------- |
  > | r    | 4        | read    |
  > | w    | 2        | write   |
  > | x    | 1        | execute |
  >
  > 所以结合上面的权限划分
  >
  > 如果是rwx对应的数值4+2+1=7 		r+x=5		r+x=5
  >
  > sudo chmod 755 test.txt
  >
  > 表示user:可读可写可执行  group:可读可执行  other:可读可执行

  

  > 查看权限 ls -l or ll
  >
  > ![check](/home/ayjin/Documents/screenshot/check.png)
  >
  > power link user group size lasttime 

  

  

  > chown:用来更改某个目录或文件的用户名和用户组
  >
  > chown root:root /tmp/tmp1 就是把tmp下的tmp1的用户名和用户组改成root和root
  >
  > （仅仅是修改这个文件夹的它属于谁）
  >
  > chown -R root:root /tmp/tmp1 就是把tmp下的tmp1下的所有文件的属组都改成root和root。
  >
  > -R（修改这个目录下的所有文件属于谁）

  > chmod:用来修改某个目录或文件的访问权限。
  >
  > sudo chmod a+x,g+x,o+x xxx.txt

  ## 用户组的管理

  >用户配置信息/etc/passwd
  >
  >![passwd](/home/ayjin/Documents/screenshot/passwd.png)
  >
  >用户名：密码x（已经加密的）:用户id：用户组id: 备注：家目录：用户shell
  >
  >组配置文件/etc/group
  >
  >![group](/home/ayjin/Documents/screenshot/group.png)
  >
  >组名：口令：组标识：组用户列表
  >
  >组配置信息（密码和登录信息）/etc/shadow
  >
  >![shadow](/home/ayjin/Documents/screenshot/message.png)
  >
  >用户名：口令：最后一次修改时间：最小时间间隔：最大时间间隔：警告时间：不活动时间：失效时间：标志
  >
  >创建用户组
  >
  >sudo groupadd xxx
  >
  >删除用户组
  >
  >sudo groupdel xxx
  >
  >添加新用户到用户组
  >
  >useradd -g 用户组 用户名（不指定组会默认创建到当前用户组内）
  >
  >查看当前用户所属组
  >
  >id xxx
  >
  >修改用户所属组
  >
  >usermod -g 用户组 用户名

  >

  ## 端口号查询

  > lsof -i
  >
  > lsof -i:3306

  ## 无线网络失效设置

  > 查看是否默认开启
  >
  > sudo rfkill list all
  >
  > 开启
  >
  > sudo rfkill unblock wifi; 
  >
  > sudo rfkill unblock all
  >
  > 

## 实用指令

> **指定运行级别**
>
> > ```undefined
> > 运行级别0（关机）：系统停机状态，系统默认运行级别不能设为0，否则不能正常启动 
> > 运行级别1（单用户）：找回丢失密码，单用户工作状态，root权限，用于系统维护，禁止远程登陆 。
> > 运行级别2（多用户）：多用户状态(没有网络服务) 
> > 运行级别3（多用户）：完全的多用户状态(有网络服务)，登陆后进入控制台命令行模式 
> > 运行级别4：系统未使用，保留 
> > 运行级别5（图形界面）：X11控制台，登陆后进入图形GUI模式 
> > 运行级别6（系统重启）：系统正常关闭并重启，默认运行级别不能设为6，否则不能正常启动
> > ```
>
> > 设置级别的目的是为了区分使用者
> >
> > 常用的实用模式是3 5 
> >
> > 系统的运行级别配置文件/etc/inittab
> >
> > 通过修改运行级别的对应配置文件重启即可进入对应的模式
>
> > 如何找回root密码
> >
> > 思路：进入单用户模式，然后修改root密码即可。因为进入单用户模式不需要密码就可以登录。
> >
> > 操作
> >
> > > 1、关机
> > >
> > > 2、进入kernel内核的命令行然后上网搜索修改模式的方案
> > >
> > > 3、进入模式后，然后passwd root
> > >
> > > 4、完成
>
> **帮助指令**
>
> > 当我们对某个指令不熟悉时们可以实用该指令进行
> >
> > man
> >
> > > man ls
> >
> > help 
> >
> > > help cd
>
> ## >指令与>>指令
>
> > **>**指令:输出重定向：会将原来的文件内容覆盖
> >
> > **>>**指令：不会覆盖 原来的内容，而是追加到文件的尾部
> >
> > 1、ls -l > a.txt 将ls -a 的输出结果写入并覆盖到a.txt文件
> >
> > ![ls>](/home/ayjin/Documents/screenshot/ls>.png)
> >
> > 2、ls -l >> a.txt
> >
> > ![ls>>](/home/ayjin/Documents/screenshot/ls>>.png)
> >
> > 3、cat a.txt > b.txt:将a文件的内容写入到b中
> >
> > ![cat>](/home/ayjin/Documents/screenshot/cat>.png)
> >
> > 4、echo "hello,echo" >> a.txt ::在a.txt的最后加一句hello,echo
>
> ## echo指令
>
> > echo:输出内容到控制台
> >
> > ![echo](/home/ayjin/Documents/screenshot/echo1.png)
>
> ## head指令
>
> > head a.txt(显示文件a的前十行)
> >
> > head -n a.txt(显示文件的前n行)
>
> ## tail指令
>
> > tail a.txt(显示文件a的后十行)
> >
> > tail -n a.txt(显示文件的后n行)
> >
> > tail -f a.txt(实时追踪该文档的所有更新。)
>
> ## ln指令 
>
> > ln也称软链接，类似于快捷方式，给图标提供一个路径。
> >
> > 基本语法ln -s 给原文件创建一个软链接
> >
> > ln -s /home/a.txt time:创建一个time的软件接到/home/a.txt
> >
> > ![ln](/home/ayjin/Documents/screenshot/lns.png)
>
> ## history指令
>
> > history:查看历史所有命令
> >
> > history10：查看最近10条指令
> >
> > !178:指令编号为178的指令
>
> ## find 指令
>
> > sudo find /home -name a.txt:在home目录下查找所有名为a.txt的文件
> >
> > ![findname](/home/ayjin/Documents/screenshot/findname.png) 
> >
> > sudo find /home -user ayjin -name a.txt:在home目录下查找文件名a.txt且属于ayjin用户的文件
> >
> > ![finduser](/home/ayjin/Documents/screenshot/finduser.png)
> >
> > sudo find /home size +1G:在home目录下查找文件大于1g的文件
> >
> > sudo find /home size -1G 小于1G 
> >
> > sudo find /home size 1G 等于1G
> >
> > ![findsize](/home/ayjin/Documents/screenshot/findsize.png)
>
> ## grep指令
>
> > grep过滤查找，管道符，“|”，表示将前一个命令的处理结果输出传递给后面的命令处理。
> >
> > 基本语法
> >
> > grep [选项] 查找内容 原文件
> >
> > cat time.txt | grep -ni yes
> >
> > 在time.txt文本中找到yes并显示行号
> >
> > -n:显示行号 -i 匹配方式不区分大小写
> >
> > ![grep](/home/ayjin/Documents/screenshot/grep.png)
>
> ## 压缩指令
>
> > gzip hello.txt
> >
> > 把hello.txt压缩为hello.txt.gz并删除了hello.txt文件
> >
> > gunzip hello.txt.gz
> >
> > 解压其并只有hello.txt文件
>
> > 如果是单个文件压缩
> >
> > zip test.zip test.txt 即可
> >
> > 如果是多个文件压缩需要递归压缩
> >
> > zip -r test.zip /home/Downloads/hello/*
> >
> > 解压
> >
> > unzip -d /home/Document/ test.zip : 将test.zip内的文件解压到/home/document中
>
> > tar指令 -> 生成tar.gz
> >
> > -z:打包同时压缩
> >
> > -c:产生tar打包文件
> >
> > -v:显示详细信息
> >
> > -f:指定压缩后的文件名
> >
> > -zcvf 表示
> >
> > 将a1.txt和a2.txt文件打包成a.tar.gz
> >
> > sudo tar -zcvf a.tar.gz a1.txt a2.txt
> >
> > ![tar1](/home/ayjin/Documents/screenshot/tar1.png)
> >
> >  将一个目录进行打包
> >
> > sudo tar -zcvf test.tar.gz test/
> >
> > ![tar](/home/ayjin/Documents/screenshot/tar2.png)
> >
> >  
> >
> > 解压
> >
> >  sudo tar -zxvf test.tar.gz -C /home/ayjin/downloads/
> >
> > 将test.tar.gz解压到downloads目录下
>
> ## 定时任务基本调度crontab
>
> > crontab -e 
> >
> > */1 * * * * date >> a1.txt 表示每一分钟都会将date命令执行结果加入到a1.txt中
> >
> > | 项目    | 含义               | 范围                  |
> > | ------- | ------------------ | --------------------- |
> > | 第一个* | 一个小时的第几分钟 | 0-59                  |
> > | 第二个* | 一天当中的第几小时 | 0-23                  |
> > | 第三个* | 一个月当中的第几天 | 1-31                  |
> > | 第四个* | 一年当中的第几月   | 1-12                  |
> > | 第五个* | 一周当中的星期几   | 0-7(0和7都表示星期天) |
> >
> > 特殊符号的说明
> >
> > 拿第一个*分钟来讨论:
> >
> > *表示一小时中每分钟都执行一次
> >
> > ,表示不连续的时间（0 8,12,16 * * *）表示每天的八点0分，12点0分，16点0分都执行一次命令。
> >
> > -表示连续的时间范围。(^0 5 * * 1-6)表示在周一到周六的凌晨5点0分执行命令。
> >
> > */n 表示每隔多久执行一次。比如^*  */10 * * * * 表示每隔10分钟就执行一次命令。
> >
> >  
> >
> > 实例：
> >
> > 1、编写一个shell脚本
> >
> > 2、给它可执行权限
> >
> > 3、添加到crontab中
> >
> > crontab -r 终止任务调度
> >
> > crontab -l 列出任务清单
> >
> > service crond restart 重启任务调度
>
> ## 分区管理
>
> > 1. df命令
> >
> > > sudo df -h 
> > >
> > > -a  显示所有的人间系统信息
> > >
> > > -h 让我们更加直观的看到容量信息
> > >
> > > -T 显示文件系统类型
> > >
> > > -m 以MB为单位显示容量
> > >
> > > -k 以kb为单位显示容量 默认为这个
> >
> > 2. du 命令,显示目录和所有子目录大小
> >
> > > du -a 显示每个子文件的磁盘占用量
> > >
> > > -h 使用习惯单位显示磁盘占用量
> > >
> > > -s 统计总占有量，而不列出子目录和子文件的占有量
> >
> > 3. 文件系统修复命令
> >
> > > fsck 分区设备名
> > >
> > > -a  不再显示用户提示，自动修复文件系统
> > >
> > > -y 自动修复 和-a作用一致，不过有些文件系统只支持-y
> >
> > 4. dumpe2fs 显示磁盘状态命令
> >
> > > dumpe2fs /dev/sdax
> >
> > 5. fdisk 分区管理
> >
> > > 1.分区
> > >
> > > fdisk /dev/sda
> > >
> > > 输入m查看如何分区，然后根据需求进行分区。
> > >
> > > 分区完然后
> > >
> > > partprobe重新读取分区表信息
> > >
> > > 2.格式化分区
> > >
> > > 注意不能格式化拓展分区
> > >
> > > mkfs -t ext4 /dev/sdbx
> > >
> > > 3.创建挂载点
> > >
> > > mkdir /disk1
> > >
> > > mount /dev/sdbx /disk1/
> > >
> > > mkdir /disk2
> > >
> > > mount /dev/sdbx /disk2/
>
> ## 查找文件
>
> > 在使用linux时，经常需要进行文件查找。其中查找的命令主要有find和grep。两个命令是有区的。
> >
> > 　　区别：
> >
> >     (1)find命令是根据文件的属性进行查找，如文件名，文件大小，所有者，所属组，是否为空，访问时间，修改时间等。
> >     (2)grep是根据文件的内容进行查找，会对文件的每一行按照给定的模式(patter)进行匹配查找。
> >     (3)which 查看可执行文件的位置 ，只有设置了环境变量的程序才可以用
> >     (4)whereis 寻找特定文件，只能用于查找二进制文件、源代码文件和man手册页
> >     (5)locate 配合数据库查看文件位置 ,详情：locate -h查看帮助信息
> > 1. find查找
> >
> > > 基本格式:find path expression
> > >
> > > ```
> > > 1.按照文件名查找
> > > (1)find / -name httpd.conf　　#在根目录下查找文件httpd.conf，表示在整个硬盘查找
> > > (2)find /etc -name httpd.conf　　#在/etc目录下文件httpd.conf
> > > (3)find /etc -name '*srm*'　　#使用通配符*(0或者任意多个)。表示在/etc目录下查找文件名中含有字符串‘srm’的文件
> > > (4)find . -name 'srm*' 　　#表示当前目录下查找文件名开头是字符串‘srm’的文件
> > > 
> > > 2.按照文件特征查找 　　　　
> > > (1)find / -amin -10 　　
> > > # 查找在系统中最后10分钟访问的文件(access time)
> > > (2)find / -atime -2　　 
> > > # 查找在系统中最后48小时访问的文件
> > > (3)find / -empty 　　
> > > # 查找在系统中为空的文件或者文件夹
> > > (4)find / -group cat 　　
> > > # 查找在系统中属于 group为cat的文件
> > > (5)find / -mmin -5 　　
> > > # 查找在系统中最后5分钟里修改过的文件(modify time)
> > > (6)find / -mtime -1 　　
> > > #查找在系统中最后24小时里修改过的文件
> > > (7)find / -user fred 　　
> > > #查找在系统中属于fred这个用户的文件
> > > (8)find / -size +10000c　　
> > > #查找出大于10000000字节的文件(c:字节，w:双字，k:KB，M:MB，G:GB)
> > > (9)find / -size -1000k 　　
> > > #查找出小于1000KB的文件
> > > 
> > > 3.使用混合查找方式查找文件
> > > 参数有： ！，-and(-a)，-or(-o)。
> > > (1)find /tmp -size +10000c -and -mtime +2 #在/tmp目录下查找大于10000字节并在最后2分钟内修改的文件
> > > (2)find / -user fred -or -user george 　　 #在/目录下查找用户是fred或者george的文件文件
> > > (3)find /tmp ! -user panda　　    
> > > #在/tmp目录中查找所有不属于panda用户的文件
> > > 
> > > ```
> > >
> > > 
> > >
> > > 

