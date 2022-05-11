## java

* 准备工作

1. Java虚拟机-JVM(核心)

> 因为jvm的存在，决定了它的跨平台性。试运行所有java程序的假象计算机，是java程序的运行环境，我们编写的java程序都运行在JVM之上。

2. JRE-Java Runtime Environment

> 是java运行时的环境，包含JVM和运行时所需要的核心类库。

3. JDK-Java Development Kit

> 是java程序开发包，包含JRE和开发人员使用的工具

综上：如果说要运行java程序，那么安装JRE即可。如果要进行开发就需要安装JDK，关系如下：JDK=JRE+TOOLS 

JRE = JVM + LIB                        JVM = 运行核心！



* FIRST PROGRAMING

1. JAVA程序开发三步骤：
2. 编写源代码
3. 编译javac helloworld.java 将源代码转换成字节码文件，生成一个class文件
4. 运行 java helloworld

```java
public class HelloWorld { 
    /*
    这里的类名（HelloWorld）要和源文件名一样
    */
    public static void main(String[] args){
    /*
    这里代表的是程序运行的起点main方法
    */
        System.out.println("Hello,World!\nThis is my first programing!");
    /*
    这里表示打印输出语句。
    */
    }
}
注释语法：// 单行注释注释  
/*
	多行注释
*/
```

* 关键字

1. 完全小写的字母
2. 在IDE中基本上会进行高亮

* 标识符

1. 可以是 英文字母（大小写）、0~9、$和_
2. 不能以数字开头
3. 不能是关键字

* 命名规范

1. 首字母大写后面小写（大驼峰 HelloWorld
2. 变量名规范：首字母小写，后面每个单词首字母大写（小驼峰式
3. 方法名规范：与变量名规范同样

* 常量

1. 字符串常量-用双引号引起来的"123" "Hello" "123"
2. 整数常量：直接写上的数字 123 19o0 1800
3. 浮点数常量：直接写上的小鼠 2.5 -3.14
4. 字符常量：用单引号引起来的单个字符 'A','B'
5. 布尔常量：true or false
6. 空常量：null，代表没有任何数据

* 基本数据类型

1. 整数型 byte  short int long 1 2 4 8 字节
2. 浮点型 float double 4 8 
3. 字符型 char 1 
4. 布尔型 boolean 1 

* 注意事项

1. 字符串不是基本类型、二十引用类型
2. 浮点型可能只是一个近似值，并非精确的值
3. 浮点数中 默认类型是double，如果一定要使用float类型，需要加上一个后缀F
4. 如果是整数，默认为int,如果一定要使用long类型，需要加上一个后缀L，推荐使用大写后缀。

* 变量

1. 变量的定义

```java
int num1;
num1 = 100;
int num1 = 100;
byte num2 = 30;
float num3 = 2.5F;
char num4 = 'A';
zifu = '中国';
boolean num5 = true;
```

* 数据类型转换

1. 当数据类型不一样是，将会自动发生数据类型转换

2. 自动转换类型（隐式）**数据范围从小到大**

   1. 特点：代码不需要特殊处理，自动完成。
   2. 规则：**数据范围从小到大**。
   3. float num3 = 30L; double > float > long > int 

   

3. 强制类型转换（显式）**数据范围从大到小**
   1. 特点：代码需要特殊的格式处理，不能自动完成。
   2. 格式：范围小的变量名 = （范围小的类型） 原本范围大的数据;
   3. int num = (int) 100L;将100的long类型转换成int;
   4. 不太推荐使用强制类型转换，容易出现数据溢出、精度损失。
   5. byte/short/char这三类都会在运算的时候，转换成int，然后再计算。
4. String的+法
   1. String str1 = "hello";
   2. str1 + 20 = "hello20";

* 多元运算符

1. 一元运算符：只需要一个数据就可以操作的运算符。例如取反！、自增++、自减--。

2. 二元运算符：需要两个数据才可以进行操作的运算符。例如：+、-、*、%。

3. 三元运算符：需要三个数据才可以进行运算的运算符。

   > 格式：数据类型 变量名称 = 条件判断？式A：式B;
   >
   > 流程：
   >
   > 首先判断条件是否成立：
   >
   > ​			如果条件成立true，那么表达式A的值赋给左侧
   >
   > ​			不成立false，那么表达式B的值赋值给左侧。

* JAVA的项目构成

1. Project
2. Module
3. package



* JAVA的方法

1. 方法的定义：修饰符 返回值类型 方法名称(参数类型 参数名称, ...){方法体;return 返回值;}

2. public static:修饰符

3. void ：返回值类型

4. 方法名() {实现过程;}

5. 注意事项

   > 1、方法应该定义在类中，不能再方法中再定义方法。
   >
   > 2、方法定义的前后顺序无所谓。
   >
   > 3、方法定义之后不会执行。
   >
   > 4、如果方法有返回值，那么必须写上return返回值。
   >
   > 5、return后面的返回值数据，必须和方法的返回值类型对应起来
   >
   > 6、对于void无返回值的方法，不能写return后面的返回值。
   >
   > 7、对于方法当中最后一行的return可以省略不急。

* 方法的重载

  > 方法的重载 overload，多个方法的名称一样，但是参数列表不一样。
  >
  > 方法重载与下列因素相关
  >
  > 1. 参数个数
  > 2. 参数类型

* 数组

  > 1、动态初始化（指定长度）数据类型[] 数组名称 = new 数组类型[数组长度];
  >
  > eg:int [] num = new int [3];
  >
  > 2、静态初始化（指定内容）

* JAVA中的内存分配

  > 内存指的是内存条内部存储。每次申请的内存都划分为5个小块，分隔开存储变量。
  >
  > 1、栈（stack）:存放方法函数中的局部变量。**方法的运行移动要在栈当中运行**。
  >
  > 2、堆（Heap) ：**凡是new出来的东西，都在堆当中。**堆内存中的东西都有一个地址值：16禁止。堆里面的默认数据，
  >
  > int = 0;
  >
  > float = 0.0;
  >
  > char = ''\u000';
  >
  > bool = false;
  >
  > 3、方法区(Method Area):存储.class相关信息，包含方法的信息。
  >
  > 4、本地方法栈(Native Mthod Stack):与操作系统相关。
  >
  > 5、寄存器(pc Register):与CPU相关。

* 两个引用指向同一个数组：例如 

  int[] arrayB = arrayA;相当于把A的地址给了传给了B。B是接盘侠

### 面向对象

1. 概述：当需要实现一个功能的时候，不关心具体的步骤，而是找一个已经具有该功能的人，来帮我做事儿。



* ArrayList存储基本数据类型：

> 如果希望向集合ArrayList当中存储基本类型数据，必须要使用基本类型对应的“包装类”
>
> 基本类型	包装类	
>
> byte	Byte
>
> short 	Short
>
> int	**Integer**
>
> long	Long
>
> float	Float
>
> char	 **Character**

```java
ArrayList<Integer> list = new ArrayList<>();
list.add(100);
```

* 权限修饰符

> public > protected > default > private
>
> 同一个类

|              | public | proteced | default | private |
| ------------ | ------ | -------- | ------- | ------- |
| 同一个类     | YES    | YES      | YES     | YES     |
| 同一个包     | yes    | yes      | yes     | no      |
| 不同包子类   | yes    | yes      | no      | no      |
| 不同包非子类 | yes    | no       | no      | no      |

面向对象三大特征：封装、继承、动态

**继承**：

> 解决的问题是：方法的复用。当发现多个类有共同的方法时，可以引入继承的方法。
>
> 定义一个父类
>
> ```java
> public class father{
>     //...
>     int numFu = 10;
>     methods;
> }
> ```
>
> 定义一个子类
>
> ```java
> public class son1 extends father{
>     //...
>     int Zi = 20;
> }
> ```
>
> 使用子类
>
> ```java
> public static void main(String[] args) {
>     son1 son = new son1();
>     son.methods;
> }
> ```
>
> 成员变量：
>
> ​		要记住，继承中只有子类能访问父类的对象，不能反过来。
>
> ​		如果成员变量重名，等号左边是谁优先用谁的成员变量。
>
> ​		

**接口**

**多态**

Object类：

> Object类，所有的类基本都继承了Object类，所以在任何类中都可以调用它的方法。
>
> 这里面经常会重写两个方法：
>
> ToString()：用来转换字符串。
>
> equals():用来判断两个类是否一样

Date类：

> java.util.Date:表示日期和时间类。表示特定的瞬间，精确到毫秒。
>
> 毫秒值的作用：可以对时间和日期进行计算。
>
> 方法:
>
> gettime():把日期转换成毫秒。=System.currentTimeMillis()

DateFormat类：

> 因为Date类默认返回的是英文，看起来不太友好。
>
> DateFormat是一个抽象类，因为无法直接创建对象使用，可以使用DateFormat的子类->SimpleDateFormat。
>
> 方法：
>
> format:按照指定规则，把时间转换成固定格式。
>
> parse:把符合模式的字符串，解析为Date日期。
>

System类：

> 可以获取与系统相关的信息或系统操作。
>
> 方法：
>
> currentTimeMillis:返回以毫秒为单位的当前时间
>
> arraycopy:拷贝数组

Collection:

> 集合是java提供的一种容器，可以用来存储多个数据。
>
> 数组的长度是固定的，集合的长度是可变的。
>
> 数组中存储的是同一类型的元素，可以存储基本数据类型值，集合存储的都是对象，而且对象的类型可以不一致。
>
> add\remove\clear\isEmpty\contains

Interaotr:

> Interator是一个接口，无法直接使用，需要使用Iterator接口的实现对象类，获取实现类的方法。
>
> 迭代器，对集合进行遍历。
>
> hasNext判断是否还有元素可以迭代
>
> next返回迭代的下一次元素
>
> 这里要注意：迭代器是直接将元素取出，取一个少一个。

增强for循环：

> 遍历集合和数组。
>
> for(集合/数组的数据类型	变量名: 集合名/数组名)

泛型：

> 是一种未知的数据类型，当数据类型不确定的时候可以使用泛型。
>
> 可以避免类型转换的麻烦，存储的什么类型，取出的就是什么类型。
>
> ```java
> ArrayList<String> list = new ArrayList<>();
> list.add('aaa');
> list.add(1);
> ```
>
> 即定义一个类，不给定数据类型。

异常：

> throw关键字:在指定的方法中抛出指定的异常
>
> 1. throw new xxxException("异常产生的原因")
> 2. throw关键字必须写在方法的内部
> 3. throw关键字后边new对象必须是Exception获其子类对象
> 4. throw关键字抛出指定的异常对象，我们就必须处理这个异常对象
>    1. throw关键字后边创建的是RuntimeException或者是其子类对象，我们可以不处理，交给jvm去打印，中断程序。
>    2. throw关键字后边创建的是编译异常（写代码的时候报错），我们就必要要处理这个异常，选择throw或者try catch
>
> throws:异常处理的第一种方式，交给别人处理
>
> 1. throws关键字必须写在方法声明处
> 2. throws关键字后边声明的异常必须是Exception获其子类对象
>
> try...catch:异常处理的第二种方式，自己处理异常
>
> try{
>
> ​	可能产生异常的代码
>
> }catch(异常类型 异常变量) {
>
> ​	异常处理
>
> }
>
> 1. 使用try..catch不会中断程序，会继续往下执行













JDBC:Aava DataBase Connectivity =》Java数据库连接，Java语言操作数据库。

步骤：

1. 导入驱动jar包
   1. 在根目录创建一个libs文件夹
   2. 复制jar包到libs文件夹中
   3. 右键libs文件夹，然后add as library
2. 注册驱动
   1. Class.forName("com.mysql.cj.jdbc.Driver");
3. 获取数据库连接对象
   1. Connection conn = DriverManager.getConnection()
4. 定义Sql
   1. String sql = "show tables";
5. 获取执行sql语句的对象StateMent
   1. Statement stml = conn.createStatement();
6. 执行sql，接受返回结果。
   1. stml.executeQuery(sql)
7. 处理结果
   1. System.out.println(stml.executeQuery(sql));
8. 释放资源
   1. stml.close();
      conn.close();

实例代码：

```
public static void main(String[] args) throws ClassNotFoundException, SQLException {
    //1.导入mysql jar包
    //2.注册驱动
    Class.forName("com.mysql.cj.jdbc.Driver");
    //3.连接数据库
    Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bilibili?serverTimezone=GMT%2B8",
            "root",
            "root"
    );
    //4.定义sql语句
    String sql = "show tables";
    //5.获取执行sql的对象 Statement
    Statement stml = conn.createStatement();
    //6.执行sql
    System.out.println(stml.executeQuery(sql));
    //7.释放资源
    stml.close();
    conn.close();
}
```

DriverManager:驱动管理对象。

1. 注册驱动：告诉java要用那个数据库/mysql5之后可以不写。
2. 获取数据库连接DriverManager.getConnection
   1. url:指定连接路径jdbc:mysql://ip:port/database//如果数据库在本地，可以简写jdbc:mysql://database
   2. user:用户名
   3. password:密码

Connection：数据库连接对象。

1. 获取执行的sql的对象
   1. Statement stml = conn.createStatement();
   2. PreparedStatement prepareStatement(String sql)
2. 管理事务：
   1. 开启事务:void setAutoCommit(boolean autoCommit)
   2. 提交事务:commit()
   3. 回滚事务:rollback()

Statement：执行sql的对象。

1. sql执行
   1. boolean execute(String sql):可以执行任意的sql
   2. int executeUpdate(String sql):执行DML(insert、update、delete)语句、DDL(create、alter、drop)语句，返回值是修改的行数。我们可以通过这个返回的行数来判断执行的成功与否。
   3. ResultSet executeQuery(String sql):执行DQL(select)语句。

ResultSet:结果集对象，封装查询结果。

1. next():游标向下一行
2. getxxx(参数):获取数据,xxx表示数据类型。getInt()获取int类型的值。
   1. 参数：
      1. int：代表列的代号
      2. String:代表列的名称
3. 使用方法：
   1. 游标向下一行
   2. 判断是否存在数据while(rs.next()){遍历}
   3. 获取数据

JDBCUtils工具类：方便我们更好的操作sql。

1. 目的：简化书写
2. 分析：
   1. 注册驱动与抽取
   2. 抽取一个方法获取连接对象
      1. 不想传递参数，还得保证工具类的通用性。
      2. 解决：配置文件。
      3. jdbc.properties:通过读取这个配置文件来连接数据库
      4. 文件的读取：static方法

PreparedStatement:功能更强大的执行sql对象。

1. 用于解决事务问题，类似于sql注入。
2. 预编译的SQL：参数使用?来代替。
3. 使用方法:
   1. 获取驱动
   2. 连接数据库
   3. sql的参数使用?作为占位符。如select * from users where username = ?  and password = ?;
   4. 获取执行sql语句的对象prepareStatement
4. 我们一般用这个来验证信息。

数据库连接池：

> 相当于一个容器，专门用于与数据库进行交互，用户只需要与容器进行交互即可完成访问。
>
> 好处：节约资源、用户访问高效。
>
> 实现：
>
> 1. 标准接口javax.sql包下。
> 2. C3P0:数据库连接池技术
> 3. Druid:数据库连接池技术，阿里巴巴提供。
>
> C3P0:

Spring JDBC:JDBC Tamplate



XML:

> 概念：可扩展标记语言（Extensible Markup Language）指的是标签都是自定义的。
>
> 功能：
>
> 1. 存储数据
>
> xml与html的区别：
>
> 1. xml标签是自定义的，html标签给预定义的。
> 2. xml的语法严格，html语法松散。
> 3. xml是存储数据，html是展示数据。
>
> 语法：
>
> 1. xml的文档后缀名.xml
> 2. xml的第一行必须定义为文档声明
> 3. xml文档中有且仅有一个根标签。
> 4. 属性值必须使用引号(单双都可以)引起来
> 5. 标签必须正确关闭(/标签名)
>
> 组成部分：
>
> 1. 文档声明
>    1. 格式：<?xml 属性列表 ?>注意问号之后不要空格。
>    2. 属性列表：
>       1. version:版本号，必须要写。
>       2. encoding:编码方式，告知解析引擎当前文档
>       3. standalone:是否独立：是否依赖于其他文件。//一般不设置
> 2. 指令：结合css
> 3. 标签：
>    1. 规则：
>       1. 不能数字标签符号开头
>       2. 不能字母xml\XML\Xml
>       3. 名称不能包含空格
> 4. 属性：
>    1. id属性值唯一，不能重复。
> 5. 文本：
>    1. CDATA:在该区域中的数据会被原样展示。
>    2. 格式：<![CDATA[ 数据 ]]>
> 6. 约束：规定xml文档的书写规则。
>    1. 谁编写xml? -- 用户，软件使用者
>    2. 谁解析xml? -- 软件
>    3. 分类：
>       1. DTD：一种简单的约束技术
>       2. Schema:一种复杂的约束技术
>    4. DTD:
>       1. 引入dtd文档到xml文档中
>          1. 内部dtd:将约束规则定义在xml文档中
>          2. 外部dtd:将约束的规则定义在外部的dtd恩减重
>             1. 本地：<!DOCTYPE students SYSTEM "student.dtd">
>    5. Schema:
>       1. 后缀名为xsd文件

Jsoup:

> Jsoup工具类，可以解析html或xml文档，返回document对象。常用于帮助我们获取页面的元素。
>
> 1. parse:解析html或xml文档，返回document对象.
>    1. parse(File in,String CharserName):解析xml或html文件的。
>    2. parse(String html)解析xml或html字符串
>    3. parse(URL url,int timeoutMillis)：通过网络路径获取指定的html文档对象（理解成爬虫）
> 2. Document对象，代表内存中的dom树。
> 3. Element:元素对象
>    1. 或者Elements对象
>       1. getElementsByTag(String tagName)根据标签获取。
>    2. 
> 4. Node:节点对象。

Servlet：

> 1. 软件架构
>    1. C/S：客户端/服务器端
>    2. B/S：浏览器/服务器端=》web
> 2. 资源分类
>    1. 静态资源：html、css、js、img....
>    2. 动态资源：即数据库交互渲染出来的资源如：servlet/jsp,php,asp...
> 3. 网络通信三要素
>    1. IP：电子设备在网络中的唯一标识。
>    2. 端口：应用程序在计算机中的唯一标识。0~65536
>    3. 传输协议：规定了数据通信的规则。
>       1. tcp:安全协议，三次握手，速度稍慢。
>       2. udp:不安全协议，速度快。

服务器：

> 安装了服务器软件的计算机。
>
> 服务器软件：接受用户的请求，处理请求，做出响应。
>
> web服务器软件：接受用户的请求，处理请求，做出相应。
>
> 1. 在web服务器软件中，可以部署Web项目，让用户通过浏览器来访问这些项目。
> 2. Web容器。
> 3. 常见的java相关的Web服务器软件。
>    1. webLogic:oracle公司，大型的javaEE服务器，支持所有的javaEE规范，收费。
>    2. webSphere:IBM公司，收费。
>    3. JBOSS:JBOSS公司，收费。
>    4. **Tomcat:**Apahce公司，中小型的javaEE服务器，仅仅支持少量的javaEE规范servlet/jsp。开源免费。
>    5. javaEE:Java语言在企业级开发中使用的技术规范的总和，一共规定了13项大的规范。

Tomcat:

> Web服务器软件。
>
> 下载：https://tomcat.apache.org/download-80.cgi
>
> 安装：解压压缩包即可。安装目录最好不要有中文和空格。
>
> 卸载：删除目录即可。
>
> 1. conf:配置文件目录
> 2. webapps:里面存放我们的动静态资源。存放web项目
> 3. work：存放运行时的数据
>
> 启动：
>
> 1. 找到start.bat文件启动。
> 2. 输入http://192.168.123.211:8080/（局域网下访问）
> 3. 输入http://127.0.0.1:8080/（本地访问）
> 4. 如果打开一闪而过：没有正确配置JAVA_HOME环境变量。
> 5. 如果启动报错端口占用：
>    1. 暴力：直接关闭占用8080端口的进程杀死。
>    2. 温柔：修改8080端口，在conf文件中server.xml文件中<Connector port=''>中修改端口号。一般会修改为80端口，80端口是http协议的默认端口号。
> 6. 字体乱码：打开conf/logging.propertied找到 **java.util.logging.ConsoleHandler.encoding = utf-8**修改为 **java.util.logging.ConsoleHandler.encoding = GBK**
>
> 
>
> 关闭：
>
> 1. 正常关闭：
>    1. 点击/bin/shutdown.bat关闭。
>    2. ctrl+c
> 2. 强制关闭：直接点击窗口的关闭//部队见
>
> 配置：
>
> 1. 部署项目的方式：
>    1. 直接将项目放到Webapps下
>    2. 访问：http://127.0.0.1/hello/demo1.html
>    3. 简化部署：将项目打包成一个war包，然后放入webapps目录下，然后会自动解压缩。
> 2. 配置conf/server.xml文件，在HOST标签体中配置//一般不用这种方法
>    1. <Context docBase="D:\hello" path="/hehe">
>    2. 表示http://127.0.0.1/hehe 即可访问到hello下的demo1.html页面//一般不会选择这种方法。
> 3. 一般选择在conf/Catalina/localhost下创建一个xxx.xml文件，然后写入<Context docBase="D:\hello">即可
>    1. 通过访问http://127.0.0.1/xxx/demo1.html即可。
> 4. 静态项目和动态项目：
>    1. 目录结构
>       1. java动态项目的目录结构
>          1. 项目的根目录
>             1. WEB-INF目录：
>                1. web.xml：web项目的核心配置文件
>                2. classes目录：防止字节码的文件目录
>                3. lib目录：存放依赖的jar包
> 5. 将Tomcat集成到IDEA中，并且创建javeEE的的项目，部署项目。
>    1. Run->edit-configurations->Tamplates->Tomcat-server->configure->添加路径即可。

Servlet:

> Servlet: Server applet:可以理解成就是一个接口，定义了Java类被浏览器识别的规则。将来我们自定义一个类，实现Servlet接口，复写方法。
>
> 1. 创建一个JavaEE项目
>
> 2. 定义一个类，实现Servlet接口。
>
>    1. ```java
>       public class ServletDemo1 implements Servlet
>       ```
>
> 3. 实现接口中的抽象方法。
>
> 4. 在web.xml中根标签内部配置Servlet。
>
>    1. ```xml
>       <!--    配置Servlet-->
>           <servlet>
>               <servlet-name>demo1</servlet-name>
>               <servlet-class>cn.itcast.web.servlet.ServletDemo1</servlet-class>
>           </servlet>
>           <servlet-mapping>
>               <servlet-name>demo1</servlet-name>
>               <url-pattern>/demo1</url-pattern>
>           </servlet-mapping>
>       ```
>
> 5. 执行原理：
>
>    1. 当服务器接受到客户端浏览器的请求后，会解析请求URL路径，获取访问的Servlet的资源路径
>    2. 查找web.xml文件，是否有对应的<url-pattern>标签体内容。
>    3. 如果有，则在找到对应的<servlet-class>全类名
>    4. Tomcat会将字节码文件加载进内存，并且创建其对象。
>    5. 调用其方法。
>
> 6. 生命周期：
>
>    1. 生命周期：
>       1. 被创建->init
>          1. Servlet什么时候被创建
>             1. 正常情况下，第一次被访问时被创建。
>             2. 可以在web.xml中配置<load-on-startup>，设置为复数则访问创建，正整数则启动时就创建。
>          2. Servlet的init方法只执行一次，说明一个Servlet在内存中只存在一个对象，Servlet是单例的。
>             1. 多个用户同时访问时，可能存在线程安全问题。
>             2. 所以尽量不要在Servlet中定义成员变量，即使定义了成员变量，也不要对修改值。
>       2. 提供服务->service
>          1. 执行多次，每次访问Servlet时，Service都会被调用一次。
>       3. 被销毁->destory
>          1. Servlet被销毁时执行，服务器关闭时，Servlet被销毁。
>          2. 只要服务器正常关闭前一瞬间，才会执行destory。一般用于释放资源。
>    2. init:只会执行一次，在启动执行的时候。
>    3. getServletConfig:Servlet配置对象
>    4. service:提供服务方法，每一次Servlet被访问时，都会被调用。
>    5. getServletInfo:获取Servlet的信息，版本，作者等等..
>    6. destory:在Servlet被杀死时执行，即服务器被关闭时执行。
>
> 7. Servlet3.0:
>
>    1. 好处：
>       1. 支持注解配置，可以不需要Web.xml了。
>    2. 步骤：
>       1. 创建JavaEE项目，选择Servlet3.0版本以上。
>       2. 定义一个类，实现Servlet方法
>       3. 复写方法。
>
> 8. Servlet:
>
>    1. 体系结构：Servlet有两个接口方法
>       1. GenericServlet--抽象类
>          1. 将Servlet接口中其他的方法做了默认实现，我们只需要重写Service()方法即可。
>       2. HttpServlet--抽象类//这是对http协议的封装， 方便我们的操作。
>          1. 这个类可以帮助我们区浏览器返回的请求方式。
>
> 9. Servlet相关配置：
>
>    1. urlparttrn:Servlet的访问路径
>    2. 一个Servlet来定义多个访问路径@WebService({"/d4","/dd4"})这样就可以多个url访问这个页面。
>       1. /xxx
>       2. /xxx/xx：多层路径
>       3. *.do：通过任意xxx.do都可以访问
>
> 10. HTTP协议：
>
>     1. 请求消息数据格式：
>        1. 请求行：GET /login.html HTTP/1.1
>           1. GET：
>              1. 请求参数在url后
>              2. 请求的url长度是有限制的。
>           2. POST:
>              1. 请求参数在请求体中。
>              2. 请求的url长度没有限制的。
>           3. 
>        2. 请求头： 请求头值
>           1. 请求头名称：请求头值
>        3. 请求空行：分割请求头和正文消息
>        4. 请求体：指的就是征文。
>
> 11. Request
>
>     1. Request和Response都是由服务器来创建的，我们使用他们来执行我们的操作。
>
> 12. Request的继承体系：
>
>     1. ServletRequest---接口
>     2. HttpServletRequest---接口
>
> 13. request功能：
>
>     1. 获取请求消息数据
>        1. 获取请求行
>           1. 请求方式GET：String getMethod()
>           2. 虚拟目录/day13：String getContextPath()
>           3. 获取Servlet路径/demo1：String getServletPath()
>           4. 获取get方式请求参数name =zhangsan：String getQueryString()
>           5. 获取请求URL：String getRequestURL()
>              1. URL:统一资源定位符：http://localhost/req/demo1
>              2. URI:统一资源标识符：/req/demo1
>           6. 获取协议及版本HTPP/1.1:String getProcotol()
>           7. 获取客户端IP地址：String getRemoteAddr()
>        2. 获取请求头
>           1. getHeader(String name):根据请求头的名称获取请求头的值
>           2. getHeaderNames():获取所有的请求头名称。
>        3. 获取请求体
>           1. 只有POST请求方式，才有请求体。
>              1. BUfferedReader getReader():获取字符输入流。只能操作字符数据
>              2. servletInputStream getInputStram()：获取字节输入流，可以操作所有类型数据（涉及到文件上传使用）
>     2. 其他功能：
>        1. 请求参数通用方式（无论GET OR POST都可以使用如下方法）：
>           1. getParameter(String name):根据参数名称获得参数值
>           2. getParameterValues(String name)：当一个参数名多个值时，均会被获取。
>           3. getParameterNames():获取所有请求的参数名称。
>           4. getParameterMap():获得所有参数，以键值对的形式返回。
>           5. 中文乱码问题：
>              1. get方式：tomcat8已经解决
>              2. post方式：需要设置流的编码requset.setCharacterEncoding("utf-8")
>        2. 请求转发
>           1. 一种在服务器内部的资源跳转方式
>           2. 步骤
>              1. 通过request对象获取请求转发其对象RequestDispatcher getRequestDispatcher (String path)
>              2. 使用RequestDispatcher对象来转发 forward(ServletRequest request,ServlerResponse response)
>           3. 特点：
>              1. 浏览器地址不会发生变化
>              2. 只能访问当前服务器内部的网址。
>              3. 转发时一次请求。
>        3. 共享数据
>           1. 域对象：一个有作用范围的对象，可以在范围内共享数据。
>              1. request域：代表一次请求的范围，一般用于请求转发的多个资源中共享数据
>              2. setAttribute(String name,Object obj):存储数据
>              3. getAttitude(String name):通过键获取值。
>              4. removeAttribute(String name);通过键移除数据。
>        4. 获取ServletContext：
>           1. getServletContext()
>     
> 14. BeanUtils用于封装数据：
>
>     1. JavaBean:标准的java类、
>        1. 要求
>           1. 类必须被public修饰
>           2. 必须提供空参的构造器
>           3. 成员变量必须使用private修饰
>           4. 提供公共setter和getter方法
>        2. 功能:封装数据:feet:
>     2. 概念：
>        1. 成员变量
>        2. 属性：setter和getter方法截取后的产物
>     3. 方法：
>        1. setProperty:设置属性值
>        2. getProperty:获得属性值
>        3. populate(obj,Map,map):将map集合的键值对信息，封装到对应的JavaBean对象中。

Response：

1. 功能:设置响应消息。
   1. 响应行
      1. 格式HTTP/1.1 200 ok
      2. 设置状态码：setStatus(int sc);
   2. 响应头：setHeader(String name,String value)
   3. 响应体
      1. 获取输出流
         1. 字符输出流。
         2. 字节输出流。
      2. 使用输出流，将数据输出到客户端浏览器。
2. 重定向：sendRedirect("/虚拟目录/页面.html")
   1. 地址栏发生变化
   2. 重定向可以访问其他站点。
   3. 重定向是发生两次请求。
3. 转发：
   1. 地址栏不变
   2. 不能访问其他站点。
   3. 一次请求。//表示可以用request来共享数据，重定向不行。
4. 路径的写法：
   1. 路径的分类：
      1. 相对路径：通过相对路径不能确定唯一资源。
      2. 绝对路径：通过绝对路径可以确定唯一资源/req/1.jpg
         1. 规则，判断请求是谁发出的
            1. 给客户端用，需要添加虚拟目录
            2. 给服务器用，不需要添加虚拟目录



验证码应用：

1. 本质：图片
2. 目的：防止恶意表单注册

ServletContext对象

1. 概念:代表整个web应用，可以和程序的容器（服务器）来通信。
2. 获取：
   1. 通过request对象获取
      1. request.getServletContext();
   2. 通过HttpServlet获取
      1. this.getServletContext();
3. 功能：
   1. 获取MIME类型:MIME(在互联网通信过程中定义的一种文件数据类型)
   2. 域对象：共享数据
   3. 获取文件的真是路径。

Content[会话技术、JSP]

> 1. 会话技术：
>    1. cookie
>    2. session
> 2. JSP入门学习
>
> ## 会话技术
>
> 1. 会话：一次会话中包含多次请求与相应
> 2. 功能：在一次会话的范围内，共享数据。
> 3. 方式：
>    1. 客户端会话技术：Cookie
>    2. 服务器端会话技术：Session
>
> Cookie:
>
> 1. 概念：将数据保存到客户端。
> 2. 快速入门：
>    1. 创建Cookie对象，绑定数据
>       1. new Cookie(name,value)
>    2. 发送Cookie对象
>       1. response.addCookie(Cookie,cookie)
>    3. 获取Cookie，拿到对象。
>       1. request.getCookies()
>
> JSP(java servlet page java服务器端页面):
>
> 1. 即一个特殊的html页面，可以内嵌java代码。
> 2. 原理：jsp实际上就是一个Servlet
> 3. jsp的脚本：
>    1. <% 代码 %>：定义的java代码，在service方法中，service方法中可以定义什么，该脚本中就可以定义什么。
>    2. <%! 代码 !%>：定义的java代码在转换后的java类的成员位置。
>    3. <%= 代码 %>：定义的java代码会输出到页面上。
> 4. jsp的内置对象:
>    1. 在jsp页面中不需要获取和创建，可以直接使用的对象。
>    2. jsp一共有9个内置对象。
>       1. request
>       2. response
>       3. out:可以将数据输出到页面上。
> 5. 指令：
>    1. 作用：配置JSP页面，导入资源文件。
>    2. 格式：
>       1. <%@ 指令名称 属性名1=属性值1 ... %>
>    3. 分类：
>       1. page:配置JSP页面的
>          1. 可以用于页面发生错误的异常处理
>       2. include:页面包含的。导入页面的资源文件
>          1. 导入其他页面的信息到当前页面。
>       3. taglib:导入资源
>          1. 导入代码补充。
> 6. 注释
> 7. 内置对象:
>    1. pageContext:
>    2. session
>    3. application
>    4. request
>    5. page
>    6. out
>    7. config
>    8. exception
>
> Session:
>
> 1. 概念：服务器端会话技术，在一次绘画的多次请求间，共享数据，将数据保存在服务器端的对象中。
> 2. 方法HttpSession对象:
>    1. getAttribute(String name)
>    2. setAttribute(String name,)
>    3. removeAttribute(String name)
>
> MVC(Model View Controller):
>
> 1. Model模型:进行业务逻辑//类似于查数据库。JavaBean
> 2. View视图：html等其他的展示页面。JSP
> 3. Controller控制器：接受用户的指令，告诉程序该去干嘛。Servlet
>
> 解决JSP中内嵌过多java代码的问题：
>
> > EL表达式
> >
> > 1. 概念：Expression Language 表达式的语言
> > 2. 作用：简化jsp页面
> > 3. 语法：${ java代码 }
> > 4. 注意：
> >    1. jsp默认支持EL表达式。
> > 5. 使用：
> >    1. 需要使用时查阅文档。
> >
> > JSTL
> >
> > 1. 概念：JavaServer Pages Tag Library:JSP标准标签库。
> > 2. 作用：简化jsp页面
> > 3. 使用：
> >    1. 导入jstl相关的jar包
> >    2. 引入标签库:taglib指令<%@ taglib %>
> >    3. 使用标签。
>
> 三层架构：软件设计架构
>
> 1. 界面层（表示层）：用户通过界面上的组件和服务器进行交互。
> 2. 业务逻辑层：处理业务逻辑的。
> 3. 数据访问层：操作数据存储文件。
>
> Filter:过滤器
>
> 1. 作用：
>    1. 一般用于完成通用的操作。如：登陆验证、统一编码处理、敏感字符过滤。

JSON：

1. 概念：javascript object notation js的对象表示法
2. 语法：
   1. 基本规则
      1. 键值对构成
   2. 获取数据

maven依赖管理工具：

> 下载->配置环境变量->mvn -v即可。
>
> 仓库：本地仓库、远程仓库、中央仓库。默认启动一个mvn工程，jar包的使用顺序为本地-远程-中央。
>
> 常见目录结构：
>
> > 核心代码部分
> >
> > 配置文件部分
> >
> > 测试代码部分
> >
> > 测试配置文件
>
> maven目录结构：
>
> > src/main/java目录，核心代码部分
> >
> > src/main/resources 配置文件部分
> >
> > src/test/java目录 测试代码部分。
> >
> > src/test/resources 测试配置文件
> >
> > src/main/webapp 页面资源，js,css,img等等。
>
> mvn+常用命令：
>
> > clean:将src/main/java编译完的所有信息删除，方便我们重新编译。
> >
> > compile:将src/main/java中的代码进行编译放在了target目录下。
> >
> > test:将测试文件目录下的java代码进行编译。同时会把main代码进行编译。
> >
> > package:打包项目。
> >
> > install:最终完成所有项目。
>
> 生命周期：
>
> > 初始化clean//一般要先执行这个
> >
> > 编译compile
> >
> > 测试test
> >
> > 打包package
> >
> > 安装install
> >
> > 发布deploy
>
> 概念模型：
>
> > pom:项目对象模型pom.xml包含了这个项目的自身信息，运行依赖jar包信息，运行环境信息jdk,tomcat信息。

Springboot:

> 快速创建SpringBoot项目。
>
> 1. 主程序已经自动生成，我们只需要我们自己的逻辑。
> 2. resources文件夹中目录结构
>    1. static:静态资源 js css images
>    2. templates:所有的模板页面。
>    3. application.properties:springboot应用的配置文件。
>
> ## 配置文件
>
> > 存放路径：src/main/resources或者类路径/config下
> >
> > Spring Boot使用一个全局的配置文件//配置文件名是固定的：
> >
> > 1. application.properties
> > 2. application.yml
> >
> > yaml简介：是一个标记语言。
> >
> > 1. 基本语法:
> >    1. key: value:表示一堆键值对（空格必须要有）
> >    2. 以空格的缩进来控制层级关系；只要是左对齐的一列数据，都是一个层级的。
> >    3. 值的写法：
> >       1. 数字、字符串（默认不用加上单双引号，单引号用于转义）、布尔
> >       2. 对象、MAP（属性和值）：转一行来进行值。
> >       3. 数组：用- 值来表示数组中的一个元素 - cat\ - dog















1. Java SE（Java Platform，Standard Edition）。Java SE 是做电脑上运行的软件。

Java SE 以前称为 J2SE。它允许开发和部署在桌面、服务器、嵌入式环境和实时环境中使用的 Java 应用程序。Java SE 包含了支持 Java Web 服务开发的类，并为 Java Platform，Enterprise Edition（Java EE）提供基础。



2. Java EE（Java Platform，Enterprise Edition）。Java EE 是用来做网站的（我们常见的JSP技术）。

这个版本以前称为 J2EE。企业版本帮助开发和部署可移植、健壮、可伸缩且安全的服务器端 Java 应用程序。Java EE 是在 Java SE 的基础上构建的，它提供 Web 服务、组件模型、管理和通信 API，可以用来实现企业级的面向服务体系结构（service-oriented architecture，SOA）和 Web 2.0 应用程序。



3. Java ME（Java Platform，Micro Edition）。Java ME 是做手机软件的。

这个版本以前称为 J2ME。Java ME 为在移动设备和嵌入式设备（比如手机、PDA、电视机顶盒和打印机）上运行的应用程序提供一个健壮且灵活的环境。Java ME 包括灵活的用户界面、健壮的安全模型、许多内置的网络协议以及对可以动态下载的连网和离线应用程序的丰富支持。基于 Java ME 规范的应用程序只需编写一次，就可以用于许多设备，而且可以利用每个设备的本机功能。

