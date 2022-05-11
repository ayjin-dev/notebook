# Vue

ES6的模块化实现：

> 导出函数:export
>
> 导入函数:import

webpack使用：

> 解决多个js文件依赖: webpack ./src/main.js ./dist/bundle.js
>
> const path = require('path')//这是node的库所以需要初始化项目npm int
>
> path.resolve(__dirname,'dist')这里是获得绝对路径
>
> 本地安装webpack: cnpm install webpack@3.6.0 --save-dev
>
> css-loader:打包Css文件进入js cnpm install --save-dev css-loader
>
> style-loader:将样式导入到dom中
>
> 

第一个程序：

```javascript
//实例化一个Vue对象
var app = new Vue({
    //element这里是获取要操作的元素#id .class一般使用id选择器，可以使用其他的标签但注意不要使用html和body元素
    el: ".app",
    //自定义一组数据
    data: {
        message: "ayjin"
        school:{
        	name:'欧阳',
        	mobile:'12345678901'
        }
    }
})
```
el:	element这里是获取要操作的元素#id .class一般使用id选择器，可以使用其他的标签但注意不要使用html和body元素这里要注意，{{message}}可以在标签内部无限嵌套。
data:  如果我们需要取Data中的元素{{school[0]}}等等诸如此类的方法。

假设存在一个div标签

v-text:设置标签的内的文本值

v-html:设置标签的innerHTML

v-on:为元素绑定事件@click

> 传递自定义参数，事件修饰符。

v-show:根据表达式的真假，切换元素的显示和隐藏。display=none

v-if:根据表达式的真假，切换元素的显示和隐藏(操纵dom元素)直接删除元素

v-bind:设置**元素的属性。**:src

v-for:根据数据生成列表结构。

v-model:获取和设置表单元素的值（双向绑定）这里的意思是将文本框中的值与message绑定，动态变化。

list.splice(index,1);表示删除列表中的index个

网络应用axios+vue:

axios:网络请求库

axios.get("url").then(fun(1),fun(2));

axios.post("url",{key:"value"}).then(fun(1),fun(2));

如果要和vue一起使用，记得this是会改变的，需要把返回的信息赋给新的变量才可以绑定信息。

nodejs和vue安装：

1. 下载nodejs并安装 https://nodejs.org/zh-cn/
2. 打开cmd:输入 node -V npm -v
3. 更换为国内源：npm install -g cnpm *--registry=https://registry.npm.taobao.org*
4. cnpm install -g @vue/cli
5. 输入vue -V
6. 输入vue ui进入浏览器即可完成安装

vue-cli:

> 安装：cnpm install -g @vue-cli
>
> 兼容2版本：cnpm install -g @vue/cli-init
>
> 脚手架2创建项目：
>
> 1. vue init webpack my-project//创建项目文件夹
> 2. Projectname:项目名字
> 3. ProjectDescription:项目描述
> 4. Author默认为git账号
> 5. Runtime+Compiler or Runtime-only:第一个更友好，第二个运行效率高
> 6. vue-router:是否安装路由
> 7. ESLint:对js代码规范（慎重选择！），它会自动审查你的js编码格式。建议不要选。如果开了，可以在config/index.js中关掉。
> 8. set up unit tests:单元测试一般不用
> 9. e2e测试（端到端测试） nightwatch:selenium自动化测试框架
> 10. npm/yarn/选择要管理项目的工具。
>
> 运行脚手架：npm run dev
>
> 生成dist:node build
>
> 脚手架3创建：
>
> 1. vue create testvuecli3
> 2. default(babel,eslint)表示默认配置，会直接安装。
> 3. manually select feature手动配置我们选择3
> 4. 然后根据上下按空格选择要的插件
> 5. 选择你要存放的配置文件位置:dedicated config files(单独配置文件) or packages.json
> 6. 是否要把此次创建选择保存为模板方便下次创建。
>
> 运行脚手架：npm run serve
>
> 启动图形化配置界面：vue ui
>
> 以下内容以cli4进行介绍。

箭头函数的使用和this的指向：

> 箭头函数：也是一种定义函数的方法=>
>
> const ccc =(args) => {函数体}。用的多的还是修复this的指向
>
> 一定要记住在箭头函数中this引用的最近作用域的对象。

vue-Router

安装方法：npm install vue-router --save

使用方法：

1. 把router里的index.js初始化，创建应该使用的组件。
2. import Vue from 'vue'
3. import VueRouter from 'vue-router'
4. Vue.use(VueRouter)
5. 配置路由映射，组件和路径的映射关系。
6. 在vue实例中挂在创建的路由实例

router取消哈希只需要在router实例中添加mode: 'history'属性即可。如果需要重定向在routes中加入path= ' ',redirect: '/home'即可重定向到home中。

router-link属性：

>  to = "/home"路由到home页面
>
> tag="button"渲染成button按键。
>
> replace 不允许用户点击后返回

动态路由：

> 类似于url/user/ayjin这样的动态网址。
>

路由的懒加载：

> 首先我们可以尝试打包一下原有项目：npm run build。我们会发现js文件非常大，影响加载速度。
>
> 懒加载：当需要用到js文件时再进行请求。一个组件分为一个js文件。
>
> 就是在向index.js文件中导入index.js组件时采用
>
> ```
> const home = () => import('../components/home')
> const about = () => import('../components/about')
> const user = () => import('../components/user')
> ```

嵌套路由：

> 类似于url/home
>
> 1. 创建子组件
> 2. 组件内部使用router-view

router传递参数：

> $router:是全局路由
>
> $route:是当前路由
>
> params如上的index.js中:id 
>
> query:正常配置路由。
>
> 实例：
>
> $route.params.id取出index.js中的参数值
>
> $route.query:取出vue实例中传进去的数值。

导航守卫：

> 监听用户在来回跳转的过程。
>
> 例如，为每个页面设置Title名。
>
> 首先给每个路由添加meta元素。
>
> ```
> router.beforeEach((to,from,next)=>{
>   // 从from跳转到to
>   document.title =to.meta.title;
>   next();
> })
> ```

vue-router-keep-alive:

> keep-alive是vue内置的一个组件，可以使被包含的组件保留状态，或者避免重新渲染。
>
> router-view也是一个组件，如果被包在keep-alive里面，所有路径匹配到的视图组件都会被缓存。

Promise：是异步编程的一种解决方案

> 常用于网络请求中。一般对异步操作进行封装。
>
> 三种状态:sync同步 async异步 pending等待状态 fulfill满足状态 回调then reject拒绝状态,回调catch

Vuex:

> 理解成一个公共数据池，各个组件均可以进行调用。常用于登陆状态的保存。

Vuex：



Element-UI

一、登陆页面的布局

准备工作：

> 进入vue项目目录下使用git status查看项目是否干净。
>
> 然后创建一个登陆页面的分支git checkout -b login
>
> 查看当前分支git branch
>

el-form:

el-form-item:

el-input:

el-button:

字体图标:




