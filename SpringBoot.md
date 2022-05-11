# SpringBoot

简介：用来简化Spring应用开发，约定大于配置，快速部署。

实战：员工管理系统

注解的解释：

> @Mapper:
>
> 1. @Mapper是mybatis自身带的注解
>
> @Repository:
>
> 1. @Repository是spring提供的注解，能够将该类注册成Bean
>
> @Controller:展示层Bean
>
> @RestController:
>
> 1. 用于标注控制层组件，表示这是个控制器bean,并且是将函数的返回值直 接填入HTTP响应体中,是REST风格的控制器；它是@Controller和@ResponseBody的合集。
>
> @ResponseBody:
>
> 1. 表示该方法的返回结果直接写入HTTP response body中
>
> @Component:
>
> 1. 泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注。
>
> @Bean:
>
> 1. 表示交给Spring来负责管理。
>
> @AutoWired:
>
> 1. 把配置好的Bean拿来用，完成属性、方法的组装，它可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。
>
> @RequestMapping:
>
> 1. RequestMapping是一个用来处理请求地址映射的注解；提供路由信息，负责URL到Controller中的具体函数的映射，可用于类或方法上。用于类上，表示类中的所有响应请求的方法都是以该地址作为父路径。
>
> @PathVariable:
>
> 1. 路径变量。参数与大括号里的名字一样要相同。
>
> @Async:
>
> 1. 告诉Spring要使用异步操作.
> 2. 记得要在主程序入口@EnableAsync开启异步

技术选型：

1. 导入静态资源
2. 首页
3. jsp，模板引擎Thymyleaf
4. 装配扩展SpringMVC
5. 增删改查
6. 拦截器
7. 国际化（中英文切换）

# 静态资源

在springboot中我们可以使用以下方法处理静态资源

1. 使用webjars导入到pom.xml文件中
2. 或者在在resources下可以创建public、resources、static文件夹，然后直接访问http://localhost:8080/1.js即可。记住优先级resources>static>public

# 首页

1. 直接在public、resources、static、或者根目录文件夹下创建index.html页面。然后直接访问http://localhost:8080/index.html即可。
2. 我们可以在templates中创建一个index.html页面，然后再controller中进行映射配置。

# 模板引擎thymeleaf

再pom.xml中导入

```
引入thymeleaf3.x-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
```

然后我们就可以再controller中进行页面跳转了。

在html中引用

```
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">//引入thymeleaf
```

基本语法：

1. th:text="${msg}"：获得后台传来的字符串。
2. 多余的需要去查询doc
3. 在引入资源时，我们需要th:href = @{/xx/xxx/xxx}
4. [[${session.loginUser}]]//获得session中loginUser



# 装配扩展SpringMVC

在运行文件目录中创建config文件夹，然后实现需要更改的接口进行定义。然后在这个文件夹内自己编码即可。



# 登陆页面的设置

1. 首先导入静态资源。通过启动项目进行访问，检查项目情况。

2. 根目录创建一个config文件夹，重新接管我们的MVC。

   ```
   package com.blog.config;
   
   import org.springframework.context.annotation.Configuration;
   import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
   import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
   
   
   @Configuration
   public class MyMvcConfig implements WebMvcConfigurer {
   
       //进行视图控制
       @Override
       public void addViewControllers(ViewControllerRegistry registry) {
           //这里创建映射关系，比如我访问localhost:8080/main.html=localhost:8080/dashboard
           registry.addViewController("/").setViewName("index");
           registry.addViewController("/index.html").setViewName("index");
           registry.addViewController("/main.html").setViewName("dashboard");
   
       }
   }
   
   ```

3. 创建一个LoginController

   ```
   package com.blog.controller;
   
   import org.springframework.stereotype.Controller;
   import org.springframework.ui.Model;
   import org.springframework.web.bind.annotation.RequestMapping;
   import org.springframework.web.bind.annotation.RequestParam;
   import org.thymeleaf.util.StringUtils;
   
   
   @Controller
   public class LoginController {
   
       @RequestMapping("/user/login")
       public String login(
               @RequestParam("username") String username,
               @RequestParam("password") String password,
               Model model){
           //具体业务
           if (!StringUtils.isEmpty(username) && "123456".equals(password)){
               //登陆成功后重定向到main.html
               return "redirect:/main.html";
           }else {
               //登陆失败
               model.addAttribute("msg","用户名或者密码错误。");
               return "index";
           }
       }
   }
   ```

4. 在登陆界面中为表单设置name属性。

# 登陆页面的拦截器

1. 在config文件夹下创建一个LoginHandlerInterceptor拦截器类。

   ```
   package com.blog.config;
   
   import org.springframework.web.servlet.HandlerInterceptor;
   
   import javax.servlet.http.HttpServletRequest;
   import javax.servlet.http.HttpServletResponse;
   
   //使用拦截器接口
   public class LoginHandlerInterceptor implements HandlerInterceptor {
       @Override
       public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
           //登陆成功后，应该有用户的session:
           Object loginUser = request.getSession().getAttribute("loginUser");
           if (loginUser==null){
               //未登录，返回信息
               request.setAttribute("msg","没有权限，请先登录！");
               //回到首页
               request.getRequestDispatcher("/index.html").forward(request,response);
               return false;
           }else {
               return true;
           }
   
       }
   
   }
   ```

2. 在MyMvcConfig中激活这个拦截器。

   ```
   //添加拦截器！
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
       registry.addInterceptor(new LoginHandlerInterceptor())
               .addPathPatterns("/**")//拦截所有请求
               .excludePathPatterns("/index.html",
                       "/",
                       "/user/login",
                       "/css/**",
                       "/js/**",
                       "/img/**");//允许回到index.html
   }
   ```

# 员工列表展示

1. 提取相同页面的组件。
   1. 在templates文件夹中创建一个commons文件夹用来存放组件。
   2. 在commons文件夹中创建commons.html文件，用来存放组件，
   3. 在需要提取组件的html标签中加入th:fragment="siderbar"
   4. 然后把这段代码见铁道commons.html中。
   5. 再回到组件原始html页面中，新建一个div使用th:replace="~{commons/commons::topbar}"属性添加这个组件。
   6. 如果要传递参数，
2. 列表循环展示。

# 增加员工显示。//增删改查均如此

1. 创建一个提交表单的页面add并添加到EmployeeController中

   ```
   //增加员工页面
   @GetMapping("/emp")
   public String toAddpage(Model model){
       //查出所有部门的信息。
       Collection<Department> departments = departmentDao.getDepartments();
       model.addAttribute("departments",departments);
       return "emp/add";
   }
   ```

2. 完善add.html页面。

3. 处理添加请求的POST。

   ```
   //增加员工表单POST处理
   @PostMapping("/emp")
   public String addEmp(Employee employee){
       //添加的操作 redirect和forward的区别
       employeeDao.save(employee);//调用底层业务方法保存员工信息。
       return "redirect:/emps";
   }
   ```

# 错误页面处理

1. 编写一个错误页面。
2. 再templates文件夹下创建一个error文件夹
3. 将错误页面移入error文件夹即可。

# JDBC

1. Application.yml配置数据库信息

   ```
   spring:
     datasource:
       username: root
       password: xxx
   #    useUnicode=true设置字符  characterEncoding=utf-8设置编码 serverTimezone=UTC设置时区。
       url: jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC
       driver-class-name: com.mysql.cj.jdbc.Driver
   ```

2. 在controller中实现业务逻辑

   ```
   @RestController
   public class JDBCController {
   
       @Autowired
       JdbcTemplate jdbcTemplate;
   
       //查询数据库的所有信息
       // 没有实体类，数据库中的东西无法存储，所以我们引用MAP
       @GetMapping("/userList")
       public List<Map<String,Object>> userList(){
           String sql = "select * from user";
           List<Map<String, Object>> list_maps = jdbcTemplate.queryForList(sql);
           return list_maps;
       }
   
   
       //增
       @GetMapping("/addUser")
       public String addUser(){
           String sql = "insert into blog.message(content,ip) values('test','192.168.1.1')";
           jdbcTemplate.update(sql);
           return "addOK!";
       }
   
       //删
       @GetMapping("/delUser/{id}")
       public String delUser(@PathVariable("id")Integer id){
           String sql = "delete from blog.message where id="+id;
           jdbcTemplate.update(sql);
           return "deleteOK!";
       }
   
       //改
       @GetMapping("/updateUser/{id}")
       public String updateUser(@PathVariable("id")Integer id){
           String sql = "update blog.message set content='修改成功嗷' where id="+id;
           jdbcTemplate.update(sql);
           return "updateOK!";
       }
   }
   ```



# Mybatis

1. 导入pom.xml

   ```
   <dependency>
       <groupId>org.mybatis.spring.boot</groupId>
       <artifactId>mybatis-spring-boot-starter</artifactId>
       <version>2.1.3</version>
   </dependency>
   ```

2. 配置application.properties

   ```
   spring.datasource.username=root
   spring.datasource.password=xxx
   spring.datasource.url=jdbc:mysql://localhost:3306/blog?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8
   spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
   
   # 整合mybatis
   mybatis.type-aliases-package=com.ayjin.pojo
   mybatis.mapper-locations=classpath:mybatis/mapper/*.xml
   ```

3. 首先根据自身数据库在pojo下创建一个数据类。

   ```
   package com.ayjin.pojo;
   
   import lombok.AllArgsConstructor;
   import lombok.Data;
   import lombok.NoArgsConstructor;
   
   //导入lombok使用Data
   @Data
   @NoArgsConstructor//无参构造
   @AllArgsConstructor//有参构造
   public class User {
       private int id;
       private String name;
       private String pwd;
   }
   ```

4. 然后在mapper下创建一个事务接口。

   ```
   package com.ayjin.mapper;
   
   
   import com.ayjin.pojo.User;
   import org.apache.ibatis.annotations.Mapper;
   import org.springframework.stereotype.Repository;
   
   import java.util.List;
   
   //这个注解表示了这是一个Mybatics的mapper接口类。dao层
   @Mapper
   @Repository
   public interface UserMapper {
       List<User> queryUserList();
       User queryUserById(int id);
       int addUser(User user);
       int updateUser(User user);
       int deleteUser(int id);
   }
   ```

5. 再将其映射到mybatis的mapper下UserMapper.xml中完成增删改查

   ```
   <?xml version="1.0" encoding="UTF-8" ?>
   <!DOCTYPE mapper
           PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
           "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
   <mapper namespace="com.ayjin.mapper.UserMapper">
   
       <select id="queryUserList" resultType="User">
           select * from users
       </select>
   
       <select id="queryUserById" resultType="User">
           select * from users where id = #{id}
       </select>
   
       <insert id="addUser" parameterType="User">
           insert into users (id,name,pwd) values (#{id},#{name},#{pwd})
       </insert>
   
       <update id="updateUser" parameterType="User">
           update user set name=#{name},pwd=#{pwd} where id=#{id}
       </update>
   
       <delete id="deleteUser" parameterType="User">
           delete from users where id = #{id}
       </delete>
   </mapper>
   ```

6. 回到controller中创建UserController集成mapper和事务。

   ```
   package com.ayjin.controller;
   
   import com.ayjin.mapper.UserMapper;
   import com.ayjin.pojo.User;
   import org.springframework.beans.factory.annotation.Autowired;
   import org.springframework.web.bind.annotation.GetMapping;
   import org.springframework.web.bind.annotation.PathVariable;
   import org.springframework.web.bind.annotation.RestController;
   
   import java.util.List;
   
   @RestController
   public class UserController {
       @Autowired
       private UserMapper userMapper;
   
       //查询所有用户
       @GetMapping("/queryUserList")
       public List<User> queryUserList(){
           List<User> userList = userMapper.queryUserList();
           for (User user : userList) {
               System.out.println(user);
           }
           return userList;
       }
   
       //添加一个用户
       @GetMapping("/addUser")
       public String addUser(){
           userMapper.addUser(new User(5,"阿毛","110101"));
           return "addUserDone!";
       }
   
       //修改一个用户
       @GetMapping("/updateUser")
       public String updateUser(){
           userMapper.updateUser(new User(5,"阿毛","110101"));
           return "updateUserDone!";
       }
   
       //删除一个用户
       @GetMapping("/deleteUser/{id}")
       public String deleteUser(@PathVariable("id")Integer id){
           userMapper.deleteUser(id);
           return "deleteUserDone!";
       }
   }
   ```

# Druid

1. 导入pom.xml

   ```
   <!--        druid-->
           <dependency>
               <groupId>com.alibaba</groupId>
               <artifactId>druid</artifactId>
               <version>1.1.23</version>
           </dependency>
   <!--        log4j-->
           <dependency>
               <groupId>log4j</groupId>
               <artifactId>log4j</artifactId>
               <version>1.2.12</version>
           </dependency>
   ```

2. 配置yml

   ```
   spring:
     datasource:
       username: root
       password: xxx
       #useUnicode=true设置字符  characterEncoding=utf-8设置编码 serverTimezone=UTC设置时区。
       url: jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC
       driver-class-name: com.mysql.cj.jdbc.Driver
       type: com.alibaba.druid.pool.DruidDataSource
       #druid数据源专有配置
       #初始化大小
       initialSize: 5
       #最小值
       minIdle: 5
       #最大值
       maxActive: 20
       #最大等待时间，配置获取连接等待超时，时间单位都是毫秒ms
       maxWait: 60000
       #配置间隔多久才进行一次检测，检测需要关闭的空闲连接
       timeBetweenEvictionRunsMillis: 60000
       #配置一个连接在池中最小生存的时间
       minEvictableIdleTimeMillis: 300000
       validationQuery: SELECT 1 FROM DUAL
       testWhileIdle: true
       testOnBorrow: false
       testOnReturn: false
       poolPreparedStatements: true
       # 配置监控统计拦截的filters，去掉后监控界面sql无法统计，
       #'wall'用于防火墙，SpringBoot中没有log4j，我改成了log4j2
       filters: stat,wall,log4j
       #最大PSCache连接
       maxPoolPreparedStatementPerConnectionSize: 20
       useGlobalDataSourceStat: true
       # 通过connectProperties属性来打开mergeSql功能；慢SQL记录
       connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=500
   ```

注意事项：

> 一定一定在application中配置好xml路径！！！！！
>
> 

# Shiro

Apache Shiro是一个安全权限框架。

1. 导入依赖

   ```
   <!--    shiro
       Subject 用户
       SecurityManager 管理所有用户
       Realm  连接数据
       -->
   <dependency>
       <groupId>org.apache.shiro</groupId>
       <artifactId>shiro-spring-boot-web-starter</artifactId>
       <version>1.5.3</version>
   </dependency>
   ```

2. 创建一个service文件夹。创建一个UserSercice接口类和一个UserSerciceImpl接口实现类

   ```
   //定义一个查询用户的接口
   public interface UserService {
       public User queryUserByname(String name);
   }
   ```

   ```
   //用户接口的实现
   @Service
   public class UserServiceImpl implements UserService{
       @Autowired
       UserMapper userMapper;
   
       @Override
       public User queryUserByname(String name) {
           return userMapper.queryUserByName(name);
       }
   
   }
   ```

3. 创建一个config文件夹。

4. 在文件夹中创建UserRealm类。（相当于一个管理员类）

   ```
   public class UserRealm extends AuthorizingRealm {
   
       @Autowired
       UserService userService;
   
   
       //2.授权
       @Override
       protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
           return null;
       }
   
       //1.认证
       @Override
       protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
           System.out.println("正在执行认证");
           UsernamePasswordToken userToken = (UsernamePasswordToken) authenticationToken;
   
           //查询数据库，如果返回值为空，返回错误信息。
           User user = userService.queryUserByname(userToken.getUsername());
           if (user==null){
               return null;
           }
           //进行密码认证。
           return new SimpleAuthenticationInfo(user,user.getPwd(),"");
       }
   }
   ```

5. 在文件夹中创建ShiroConfig类。(用于给创建的管理员设置网页过滤)

   ```
   @Configuration
   public class ShiroConfig {
       //1.创建realm对象
       @Bean
       public UserRealm userRealm(){
           return new UserRealm();
       }
       //2.将默认的网络安全管理员DefaultWebSecurityManager与realm对象联系。然后返回一个安全管理员
       @Bean
       public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm){
           DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
           securityManager.setRealm(userRealm);
           return securityManager;
       }
       //3.给安全管理员安排一个ShiroFilterFactoryBean方便其对网站进行管控。
       @Bean(name = "shiroFilterFactoryBean")
       public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("getDefaultWebSecurityManager") DefaultWebSecurityManager defaultWebSecurityManager){
           ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
           //设置安全管理器
           bean.setSecurityManager(defaultWebSecurityManager);
   
           //添加shiro的内置过滤器
           /*
               anon:无需认证就可以访问
               authc:必须认证才可以访问
               user: 必须拥有记住我 功能才可以访问
               perms: 拥有对某个资源的权限才可以访问。
               role: 拥有某个角色权限才可以访问。
            */
           //拦截
           Map<String, String> filterMap = new LinkedHashMap<>();
           //权限,如果没有权限则跳转。记住一定要先把要授权的写在前面。
           filterMap.put("/admin/*","perms[admin]");
           filterMap.put("/admin/*","authc");
           bean.setFilterChainDefinitionMap(filterMap);
           //设置登录的请求
           bean.setLoginUrl("/admin/login");
           //未授权的页面
           bean.setUnauthorizedUrl("/");
   
           return bean;
       }
   }
   ```

6. 



# Spring Security

解决web安全问题。结合shiro和security。都是为了解决安全问题。相当于加强的过滤器。

功能:

1. 权限分配
2. 访问权限
3. 菜单权限

使用：

1. 导入

   ```
   <!--        导入security-->
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-security</artifactId>
           </dependency>
   ```

2. 再config文件夹下配置访问权限。

   ```
   //AOP编程。
   @EnableWebSecurity
   public class SecurityConfig extends WebSecurityConfigurerAdapter {
       @Override
       protected void configure(HttpSecurity http) throws Exception {
           //首页所有人可以访问，功能页分权限。
           http.authorizeRequests()
                   .antMatchers("/").permitAll()
                   .antMatchers("/level1/**").hasRole("vip1")
                   .antMatchers("/level2/**").hasRole("vip2")
                   .antMatchers("/level3/**").hasRole("vip3")
           ;
           //如果没有权限，则会回到登录页,需要开启登录的页面。
           http.formLogin().loginPage("/toLogin").loginProcessingUrl("/login").usernameParameter("user").passwordParameter("pwd");
           //关闭csrf
           http.csrf().disable();
           //开启注销。回到首页
           http.logout().logoutSuccessUrl("/");
           //开启记住我功能 cookie，自定义接收前端的参数
           http.rememberMe().rememberMeParameter("remember");//默认cookie两天。
       }
       //认证，新版本记得要给密码进行编码，即加密！否则无法登录。
       @Override
       protected void configure(AuthenticationManagerBuilder auth) throws Exception {
   
           //这些数据最好从数据库中读取。
           auth.inMemoryAuthentication().passwordEncoder(new BCryptPasswordEncoder())
                   .withUser("ayjin").password(new BCryptPasswordEncoder().encode("123456")).roles("vip2","vip3")
                   .and()
                   .withUser("root").password(new BCryptPasswordEncoder().encode("123456")).roles("vip1","vip2","vip3")
                   .and()
                   .withUser("guest").password(new BCryptPasswordEncoder().encode("123456")).roles("vip1");
       }
   }
   ```

3. 导入security-thymeleaf整合包,方便再html中结合权限使用。

   ```
   <dependency>
       <groupId>org.thymeleaf.extras</groupId>
       <artifactId>thymeleaf-extras-springsecurity4</artifactId>
       <version>3.0.4.RELEASE</version>
   </dependency>
   
   
   
   
   <html lang="en" xmlns:th="http://www.thymeleaf.org"
       xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
   ```

# Lombok

方便创建数据的一个依赖,再需要使用的数据类上面使用

```
@Data
@AllArgsConstructor//有参构造
@NoArgsConstructor//无参构造
```



# Swagger

* API框架
* RestFul API 文档在线自动生成工具=>Api文档与API定义同步更新。
* 直接运行，可以在线测试API接口。

项目中使用Swagger需要Springfox;

* swagger2
* ui

SpringBoot集成Swagger

1. 导入相关依赖

   ```
   <!--        Swagger-->
           <dependency>
               <groupId>io.springfox</groupId>
               <artifactId>springfox-swagger2</artifactId>
               <version>2.9.2</version>
           </dependency>
           <dependency>
               <groupId>io.springfox</groupId>
               <artifactId>springfox-swagger-ui</artifactId>
               <version>2.9.2</version>
           </dependency>
   ```

2. 配置Swagger进项目

   ```
   @Configuration
   @EnableSwagger2
   public class SwaggerConfig {
   
   }
   ```

3. 链接：http://localhost:8080/swagger-ui.html

4. 配置Swagger

   ```
   //配置Swagger信息 = apiInfo
   private ApiInfo apiInfo(){
       //作者信息
       Contact contact = new Contact("ayjin","http://www.ayjin.cn","ayjinwk@163.com");
       return new ApiInfo(
               "Ayjin的SwaggerAPI文档",
               "江湖渺渺，再见已枉然",
               "V1.0",
               "http://www.ayjin.cn",
               contact,
               "Apache 2.0",
               "http://www.apache.org/licenses/LICENSE-2.0",
               new ArrayList());
   }
   ```

5. Swagger配置扫描接口

   ```
       //配置Swagger的Bean实例
       @Bean
       public Docket docket(){
           return new Docket(DocumentationType.SWAGGER_2)
                   .apiInfo(apiInfo())
                   .select()
                   //.enable(false)//设置了这个就关闭Swagger
                   //RequestHandlerSelectors 配置要扫描接口的方式
                   //basePackage指定要扫描的包
                   .apis(RequestHandlerSelectors.basePackage("com.ayjin.controller"))
                   //过滤的路径 ant(正则)
   //              .paths(PathSelectors.ant("/"))
                   .build();
       }
   ```

6. 配置Swagger是否启动。.enable

7. 配置API文档的分组。.groupName("xxx");可以设置多个返回,进行多个分组.

8. 注释

   1. @APIOpetation("xxx"):可以给每个映射规则写注释
   2. @APIModel("xxx"):可以给用户实体类写注释.

# 邮箱任务

1. 导入依赖

   ```
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-mail</artifactId>
   </dependency>
   ```

2. 配置mail

   ```
   # 设置mail
   spring.mail.username=ayjinwk@163.com
   spring.mail.password=xxxxxxxxxxxxx
   spring.mail.host=smtp.xxx.com
   ```

3. 查询资料进行使用.



# 定时任务

暂停.



# Dubbot + Zookeeper





# thymeleaf+shiro+mysql+log4j+druid+mabatis+lombok+Swagger

```
<!--        thymeleaf-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
        
        <!--    shiro-->
        <dependency>
            <groupId>org.apache.shiro</groupId>
            <artifactId>shiro-spring-boot-web-starter</artifactId>
            <version>1.4.1</version>
        </dependency>
<!--        shiro-thymeleaf-->
        <dependency>
            <groupId>com.github.theborakompanioni</groupId>
            <artifactId>thymeleaf-extras-shiro</artifactId>
            <version>2.0.0</version>
        </dependency>
        
<!--        sql驱动-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
        </dependency>
<!--        log4j日志 -->
        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>1.2.17</version>
        </dependency>
<!--        druid-->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.1.23</version>
        </dependency>
<!--        mybatis-->
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>2.1.3</version>
        </dependency>
<!--        lombok-->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
        </dependency>
        <!--        Swagger-->
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>2.9.2</version>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>2.9.2</version>
        </dependency>
```