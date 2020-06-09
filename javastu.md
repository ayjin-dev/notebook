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





















1. Java SE（Java Platform，Standard Edition）。Java SE 是做电脑上运行的软件。

Java SE 以前称为 J2SE。它允许开发和部署在桌面、服务器、嵌入式环境和实时环境中使用的 Java 应用程序。Java SE 包含了支持 Java Web 服务开发的类，并为 Java Platform，Enterprise Edition（Java EE）提供基础。



2. Java EE（Java Platform，Enterprise Edition）。Java EE 是用来做网站的（我们常见的JSP技术）。

这个版本以前称为 J2EE。企业版本帮助开发和部署可移植、健壮、可伸缩且安全的服务器端 Java 应用程序。Java EE 是在 Java SE 的基础上构建的，它提供 Web 服务、组件模型、管理和通信 API，可以用来实现企业级的面向服务体系结构（service-oriented architecture，SOA）和 Web 2.0 应用程序。



3. Java ME（Java Platform，Micro Edition）。Java ME 是做手机软件的。

这个版本以前称为 J2ME。Java ME 为在移动设备和嵌入式设备（比如手机、PDA、电视机顶盒和打印机）上运行的应用程序提供一个健壮且灵活的环境。Java ME 包括灵活的用户界面、健壮的安全模型、许多内置的网络协议以及对可以动态下载的连网和离线应用程序的丰富支持。基于 Java ME 规范的应用程序只需编写一次，就可以用于许多设备，而且可以利用每个设备的本机功能。

