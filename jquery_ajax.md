**JavaScript**

DOM:Document Object Model文档对象模型。

如我们获取网页元素节点就需要document.方法（document指的就是网页）

方法：

> getElementById("id名字")
>
> var btn = document.getElementById("btn");
>
> btn.innerHTML表示获取btn这个标签中的HTML属性值。

事件：文档和浏览器窗口发生交互的瞬间。

> javascript和文档交互就是通过事件来实现的。例如点击、移动等等。
>
> 使用方法就是我们在源标签中设置一些方法属性，当触发方法时执行对应的js代码。
>
> 方法的种类可以查看文档的javascript参考手册
>
> btn.onclick=function(){}这个是响应函数。

文档的加载：浏览器的加载页面是自上而下的，所以javascript需要在标签后面进行定义。

> 如果需要在head中进行定义。那么需要引入
>
> window.onload = function(){
>
> }；一定要加分号。
>
> 这里就可以等待页面加载完后执行js代码。
>
> **但是如果元素本身存在默认方法需要先取消。**
>
> 在函数后添加return false;取消默认行为。或者在a>href="javascript:;"取消行为。
>
> <script type="text/javascript">
> 			var allA = document.getElementsByTagName("a");
> 			for(var i = 0; i < allA.length; i++){
> 				allA[i].onclick = function(){
>                     //这里的this表示当前的a元素，parentNode表示获得父亲节点。
> 					var tr = this.parentNode.parentNode;
> 					tr.parentNode.removeChild(tr);
> 					return false;
> 				}
> 			}
> 		</script>

**return false：**

　　在大多数情况下,为事件处理函数返回false,可以防止默认的事件行为.例如,默认情况下点击一个<a>元素,页面会跳转到该元素href属性指定的页。

```
  js中return false作用一般是用来取消默认动作 / 阻止提交表单 / 阻止继续执行下面的代码。

  注意：return false 只在当前函数有效，不会影响其他外部函数的执行。
```

for循环与this与响应函数：

> 这里要知道javascript在页面中是从上往下执行。
>
> for中嵌套响应函数function我们要知道，for是马上执行，响应函数是事件发生才会执行。所用在循环中引用this来获得当前的循环结果。

修改元素样式：

> 元素.style.属性 = 值
>
> box1.style.width = "100px";
>
> 如果属性中存在-例如：background-color那么需要修改成驼峰命名法然后去掉-号
>
> 例如：box1.style.backgroundColor="green";//这里显示的是html中的内联样式。
>
> 获取当前正在显示的样式
>
> //缺陷只支持IE浏览器。alert(box1.currentstyle.width);
>
> 其他浏览器可以采用：var box1 = getComputedStyle(box1,null)返回的是一个对象
>
> 我们可以用box1.width获得。

事件的冒泡：

> 指的是事件的向上传导，当我们的后代元素事件触发时，之后也会触发祖先的元素。
>
> event = event || window.event;使用
>
> event.cancelBubble = true;来取消冒泡。

事件的委派：利用了事件的冒泡特性。

> 我们希望只绑定一次事件，即可应用到多个元素上，即使元素是后添加的。
>
> 我们可以尝试把事件绑定到他们共同的祖先元素上。
>
> 缺陷：点击到祖先元素的任意地方都会触发。我们希望的是点击指定的子元素再去触发。那么我们就要给每个子元素都给一个类名。
>
> 可以用event.target.className来获取当时点击的子元素。

事件的绑定：

> 如果要实现多重事件绑定需要添加监听器。
>
> addEventListener(参数)
>
> **注意在使用这个方法时，不允许用return false来取消默认事件，需要使用event.preventDefault;取消默认行为。**
>
> 参数：
>
> 1. 事件的字符串，不要用on
> 2. 回调函数，当事件触发时该函数会被调用。
> 3. 是否在捕获阶段触发事件，需要一个布尔值，一般是false
>
> 例子:
>
> ```javascript
> var btn = document.getElementById("btn01");
> 				btn.addEventListener("click",function(){
> 					alert(1);
> 				},false);
> 				btn.addEventListener("click",function(){
> 					alert(2);
> 				},false);
> btn.addEventListener("click",function(){
> 					alert(3);
> 				},false);
> ```

鼠标滚轮：

> event.wheelDelta:它可以获得鼠标滚轮的上下移动，上为+，下为-;

**BOM**：浏览器对象模型。

> BOM使我们可以通过JS来操作浏览器。
>
> 提供了api用来完成对浏览器的操作
>
> window
>
> ​	- 代表的是整个浏览器窗口，同时window也是网页中的全局对象
>
> Navigator
>
> 	- 代表的是浏览器信息，通过该对象可以识别不同的浏览器 
> 	- navigator.userAgent用的最多。
>
> Location
>
> ​	- 代表浏览器的地址栏信息。URL处，可以进行页面跳转
>
> History
>
> ​	- 代表浏览器的历史记录，可以通过该对象来操作浏览器的历史记录。前翻或者后翻一页。
>
> Screen
>
> ​	- 代表用户屏幕的信息，通过该对象可以获取到用户的显示器相关信息。

js循环中定时操作：

> 如果希望一段程序，可以每间隔一段时间执行一次，可以使用定时调用。
>
> setInterval(参数);
>
> 参数：
>
> 1. 回调函数。
> 2. 每次调用间隔的时间。
>
> ```
> var tiemre = set Interval(function(){
> 	count.innerHTML = num++;
> 	if(num==10){
> 	clearInterval(timer);
> 	}
> },1000)
> ```
>
> 3. 关掉定时clearInterval(timer);

延时调用：

> 指的是一个函数不马上执行，而是隔一段时间后执行。只执行一次，和定时调用的区别就是一次与多次。
>
> setTimeout(参数，时间)
>
> clearTimeout();

轮播图：

> 定义一个盒子，内部设置一个横向列表，然后设置好样式，再对里面的li元素进行左移，然后隐藏溢出。通过js来控制导航页面、自动轮播。

类的操作：

> css:我们可以自己定义一个css样式，然后切换类名为自定义的。
>
> 例如box.className += " b2";**注意这里要有空格class = "b1 b2"**

Jquery:

> 入口函数		$(function(){});
>
> $（）可接受的参数
>
> 1. 接受一个函数：$(function(){});
> 2. 接收一个字符串 : var $box1 = $(".box1")
> 3. 接收一个字符串选择器var $box2= $("#box1")
> 4. 接收一个字符串代码片段：var $p = $("<p>我是段落");
> 5. 接收一个代码片段
> 6. 接收一个DOM元素var $span = $(span);

Jquery对象:

> Jquery对象实际上是一个伪数组。

Jquery静态方法与实际方法：

> ```javascript
> 		<script type="text/javascript">
> 			function Aclass() {
> 				
> 			}
> 			Aclass.staticMethod = function() {
> 				alert("这是静态方法。");
> 			}
> 			Aclass.prototype.instanceMethod = function(){
> 				alert("这是实例方法。");
> 			}
> 			var a = new Aclass();
> 			a.instanceMethod();
> 			a.staticMethod();
> 		</script>
> 
> ```
>
> 通过以上代码可以看出，静态方法是仅自身才能调用。实例方法是创建实例后仅对象可调用。

Jquery静态方法:

> each:
>
> 首先要了解原生foreach方法是遍历数组，但不能遍历伪数组。
>
> $.each(arr,function(index,value) {...});
>
> map:
>
> trim:
>
> var res = $.trim(str)去除掉str的字符串的空格并返回结果/
>
> isWindow:
>
> var res = $.isWindow(arr):判断传入的对象是不是window对象。
>
> isArray:
>
> var res = $.isArray(arr):判断传入对象是不是数组。
>
> isFunction:
>
> var res = $.isFunction(fun):判断传入对象是不是函数。
>
> holdready:**等待所有资源加载完再执行ready代码**
>
> $.holdready(true);
>
> $.ready(){...}
>
> $.holdready(false);

jquery选择器：

> empty:
>
> $("div:empty")找到div中既没有文本也没有子元素的div标签
>
> parent:
>
> $("div:parent")找到div中有文本或者子元素的div标签
>
> contains(text)
>
> $("div:contains('hello')")找到div中**包含**文本hello的div标签只要有hello的都可以被找到
>
> has(text):
>
> $("div:has('span')")找到div中包含子元素span的标签。

属性与属性节点的获取：

> $("span").arrt("class")获取span class的属性值，但注意只能获取第一个。
>
> $("span").arrt("class","box")这里是把span的class属性更改为box，注意这里会将全部span的class属性都改变。如果设置的属性不存在，系统会自动添加。
>
> $("span").removeArrt("name")删除span name的标签，但注意这会全部删除。
>
> $("span").eq(0),prop("demo","fucking")这里是向第一个span元素添加demo属性，属性值为fucking。
>
> $("span").prop("demo")表示获取第一个span标签中的demo属性值。
>
> $("span").removeProp("demo")表示删除全部span标签中的demo属性。
>
> **attr这prop的区别是prop还可操作属性节点。**

CSS样式操作：

> addClass(class):添加类例如 $("div").addClass("class1 class2")
>
> removeClass(class):删除类 $("div").removeClass("class1 class2")
>
> toggleClass(class):切换类$("div").toggleClass("class1 class2")有就删除，没有就添加。
>
> ```css
> $("div").css({
>     width: "100px",
>     height: "100px",
>     backgroundColor: "red"
> })
> ```
>
> 获取css样式$("div").css("width");

自动触发方法：

> trigger(fun):会触发事件冒泡
>
> 例如
>
> $(".father").trigger("click");
>
> triggerHandler:不会触发事件冒泡

自定义事件：

> 1. 时间必须通过on绑定。
> 2. 时间必须通过trigger来触发。
>
> $(".son").on("myclick",function(){});
>
> $(".son").trigger("myclick");

给ul中的每个li添加一个事件

> $("ul>li").click(function(){..});
>
> 如果是动态添加
>
> $("ul").delegate("li","click",function(){})
>
> $("事件被委托者").delegate("委托事件的人","方法",函数)；
>
> 上面的意思就是li将事件委托给ul去干
>
> 



