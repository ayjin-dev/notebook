## 首先通过SSH与远程仓库绑定

> 首先最好回到Home目录，因为会生成.ssh隐藏文件
>
> ssh-keygen -t rsa
>
> 回车回车
>
> 然后检查是否生成了.ssh文件
>
> ls -a
>
> cd .ssh
>
> cat id_rsq.pub
>
> 复制内容
>
> 打开[github](https://github.com/ay1Jin/)
>
> 进入setting中导入刚刚复制的SSHkey
>
> 然后检查是否链接成功
>
> ssh -T git@github.com
>
> OK完成绑定

## 其次安装GIT

> sudo pacman -S git
>
> 找到一个地方存放自己的项目并进去
>
> cd ~/Documents/
>
> ![project](/home/ayjin/Documents/screenshot/copy.png)
>
> git clone git@github.com:ay1Jin/notebook.git
>
> 进入项目
>
> cd notebook
>
> 将项目内所有文件提交暂存区域
>
> git add *
>
> 将暂存区文件存放到仓库区，输入git commit -m '',单引号之间可以加注释，作为此次操作的标记
>
> git commit -m "update-notebook"
>
> 同步您的Github远程仓库，默认在您的master分支上
>
> git push origin master