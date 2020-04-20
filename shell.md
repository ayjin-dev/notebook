## SHELL

> 一个工具shell是能够方便我们运行脚本的
>
> 这里举个实例
>
> ![demo1](/home/ayjin/Documents/screenshot/demo1.png)
>
> 这里注意要给可执行权限

## 变量

> 基本语法
>
> LINUX SHELL的变量分为两种，**系统变量**和**用户变量**
>
> 1. 系统变量：拿来直接用
>
> 2. 用户变量：根据不用用户的需求自己定制的变量
>
> 3. 系统变量：$HOME	$PWD	$SHELL	$USER等等
>
> 4. 显示当前SHELL中的所有变量：set
>
> 
>
> > **定义变量：**变量=值
> >
> > 变量规则：
> >
> > > **不能以数字开头！**
> > >
> > > **等号两侧不能有空格**
> > >
> > > **变量名称要大写！**
> >
> > 
> >
> > 撤销变量：unset变量
> >
> > 声明静态变量：randonly变量  注意：不能unset
> >
> > ![shell](/home/ayjin/Documents/screenshot/unset.png)
> >
> > readonly
> >
> > ![read](/home/ayjin/Documents/screenshot/readonly.png)
> >
> > 从以上内容可以知道UNSET不允许实用静态变量
>
> ## 输出结果定义为变量
>
> > RESULT=$(ls -l)
> >
> > echo $RESULT
> >
> > ![img](/home/ayjin/Documents/screenshot/echo3.png)
>
> ## 设置环境变量
>
> > 基本语法：
> >
> > > export 变量名=变量值（让SHELL变量输出为环境变量）
> > >
> > > source 配置文件 （让修改后的配置信息立即生效）
> > >
> > > echo $变量名（查询环境变量的值）
> >
> > 使用实例
> >
> > > ![profile](/home/ayjin/Documents/screenshot/profile.png)
>
> ## 位置参数变量
>
> > 介绍
> >
> > 当我们执行一个SHELL脚本的十行，如果希望获得命令行的参数信息，就可以使用到位置参数变量，例如我的脚本中希望获得外部变量：./echo3.sh 100 200
> >
> > ![position](/home/ayjin/Documents/screenshot/position.png)
> >
> > $0=./position
> >
> > $1=100
> >
> > $2=200
> >
> > 
>
> ## 预定义变量
>
> > **基本定义**
> >
> > >  就是shell设计者事先已经定义好的变量，可以直接在SHELL脚本中实用
> >
> > **基本语法**
> >
> > > $$ 当前进程的进程号PID
> > >
> > > $! 后台运行的最后一个进程号PID
> > >
> > > $? 最后一次执行的命令返回状态，0表示正确执行，不为0则为错误。
> > >
> > > ![prebash](/home/ayjin/Documents/screenshot/prebash.png)
>
> ## 运算符
>
> > 基本介绍
> >
> > > SHELL中运算操作
> >
> > 基本语法
> >
> > >![cmpute](/home/ayjin/Documents/screenshot/compute.png)
>
> ## 判断语句
>
> > 基本语法
> >
> > >  [ condition ]
> > >
> > > #非空返回TRUE，可使用$s验证（0为TRUE，1为FALSE）
> >
> > 应用实例
> >
> > > [ OK ] ->TRUE
> > >
> > > []-> FALSE
> > >
> > > [ CONDITION ]&&ECHO OK || ECHO NOTOK
> >
> > 常用的判断条件
> >
> > > 两个整数的比较
> > >
> > > > =字符串比较
> > > >
> > > > -lt小于
> > > >
> > > > -le小于等于
> > > >
> > > > -eq等于
> > > >
> > > > -gt大于
> > > >
> > > > -ge大于等于
> > > >
> > > > -ne不等于
> > >
> > > 按照文件权限进行判断
> > >
> > > > -r 有读的权限
> > > >
> > > > -w 有写的权限
> > > >
> > > > -x 有执行的权限
> > >
> > > 按照文件类型进行判断
> > >
> > > > -f 文件存在且常规存在
> > > >
> > > > -e 文件存在
> > > >
> > > > -d文件存在且是目录
> > >
> > > 应用实例
> > >
> > > > ![cop](/home/ayjin/Documents/screenshot/compare.png)
>
> ## 流程控制
>
> > if判断
> >
> > > ```shell
> > > if[ condition ]
> > > then
> > > 	xxx
> > > elif[ condition ]
> > > then
> > > 	xxx
> > > fi
> > > 
> > > ```
> > >
> > > ![if](/home/ayjin/Documents/screenshot/if.png)
> >
> > case 语句
> >
> > > ![case](/home/ayjin/Documents/screenshot/case.png)
> >
> > for 循环
> >
> > >![for](/home/ayjin/Documents/screenshot/for.png)
> >
> > while循环
> >
> > >![while](/home/ayjin/Documents/screenshot/while.png)
>
> ## read读取控制台输入
>
> > -p:指定读取时的 提示符
> >
> > -t:指定读取值时等待的时间(秒),如果没有在指定的时间内输入,就不再等待了.
> >
> > 参数
> >
> > 变量:指定读取值的变量名
>
> ## 函数的概念
>
> >系统函数和自定义函数
> >
> >basename:dirname;
> >
> >自定义函数
> >
> >![ideafuc](/home/ayjin/Documents/screenshot/ideafuc.png)

