# Spring

Spring 是 Rod Johnson (计算机、音乐博士) 于 2004 年的春天 (啊哈!) 3 月 24 日推出 (1.0 版) 的 java 框架.

* spring 是一个开源框架 (容器)
* spring 是一个轻量级、非入侵式框架
* spring 的核心是控制反转 (IoC)、面向切面编程 (AOP)
* 支持事务处理、支持框架整合

*IOC: 对象由 spring 创建、管理、装配*

## cheatsheet

`spring.xml`
```xml
<?xml version="1.0" encoding="utf-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"

    xsi:schemaLocation="
       http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/aop
       http://www.springframework.org/schema/aop/spring-aop.xsd
       http://www.springframework.org/schema/tx
       http://www.springframework.org/schema/tx/spring-tx.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd
       http://www.springframework.org/schema/mvc
       http://www.springframework.org/schema/mvc/spring-mvc.xsd
">
    <context:annotation-config/>

</beans>
```

## quick start

### 新建项目

使用 idea 新建 maven 项目, 填写项目名、组织名 (groupId)、包名 (artifactId)

导入依赖

`pom.xml`
```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>5.3.4</version>
</dependency>
```

现在可以删除 src 目录, 用 idea 新建子项目 (module), 子项目的依赖由父项目的 pom.xml 一手包办, 无需过多操心.

### maven 项目的典型结构

    .
    |-- pom.xml
    `-- src
        |-- main
        |   |-- java
        |   |   `-- com.zmx # 包名
        |   |       |-- bean
        |   |       |-- controller
        |   |       |-- service
        |   |       `-- dao
        |   `-- resources # classpath 根目录
        |       `-- beans.xml
        `-- test
            `-- MyTest.java # 这里推荐用 junit5 测试, 也可以写 main 方法来测试

### hello world

`Hello.java`
```java
package com.zmx.bean;

public class Hello {
    private String name;

    // getter/setter 方法可以由 idea 自动生成
    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
}
```

在 pom.xml 引入 lombok 依赖后, 只需简单注解 @Data 即可生成 getter/setter:

`Hello.java` (与上面等价)
```java
package com.zmx.bean;

@Data
public class Hello {
    private String name;
}
```

`MyTest.java` (普通)
```java
public class MyTest {
    public static void main(String[] args) {
        Hello hello = new Hello();
        hello.setName("World");
        System.out.println("Hello, " + hello.getName());
    }
}
```

点击 main 方法左侧的绿色小箭头即可运行.

### hello spring

在 spring 中，每个 bean 都是一个只含有属性及其 getter/setter 方法的简单
java 类，我们用 property 标签设置它的属性。
spring 可以改变 Hello 类的属性而不影响 java 代码。

`beans.xml`
```xml
<?xml version="1.0" encoding="utf-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="
   http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans.xsd
">

    <!-- class 应该使用全名 -->
    <bean id="hello" class="com.zmx.bean.Hello">
        <property name="name" value="Spring"></property>
    </bean>
</beans>
```

下面这个文件中，单击报错位置，使用 alt-enter 完成 import 语句。

`MyTest.java` (框架)
```java
public class MyTest {
    public static void main(String[] args) {
        // 读取配置，创建 spring 容器
        // 在 idea 中输入 CPX<tab> 可补全类名
        // alt+enter 引入局部变量
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        // 用 FileSystemXmlApplicationContext，需要完整路径
        //ApplicationContext context = new ClassPathXmlApplicationContext("/path/to/beans.xml");
        // ApplicationContext 包含 BeanFactory 的所有功能，通常用前者即可
        //XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("beans.xml"));
        // 传入 id，从容器中获取 bean 实例
        Hello hello = (Hello)context.getBean("hello");
        System.out.println("Hello, " + hello.getName());
    }
}
```

## spring 配置

### beans.xml

```xml
<!-- id 和 class 必填，其它可选 -->
<bean id="myBean" class="MyBean"
    name="别名1,别名2;别名3 别名4"
    parent=""
    lazy-init="true/false"
    abstract="true/false"
    init-method="init" destroy-method="destroy"
    scope="singular/prototype"
    autowire="byName/byType/constructor"
>
    <property name="name" value="Spring"/> <!-- 基本类型 -->
    <property name="hello" ref="Hello"/> <!-- 引用类型 -->
</bean>

<import resource="other-beans.xml"/>
```

### lifecycle

```java
public class MyBean implements InitializingBean {
    @Override
    void afterPropertiesSet() throws Exception {

    }
}

public class MyBean implements DisposableBean {
    @Override
    void destroy() throws Exception {

    }
}
```

但常用的方法是不实现接口，只需设置

    <bean init-method="init" destroy-method="destroy">

如果所有的 bean 都有相同的生命周期方法接口，可以设置

    <beans default-init-method="init" default-destroy-method="destroy">

事实上大多数 <bean> 的属性都可以在 <beans> 中设置默认值。

在非 web 项目中使用 destroy() 时，需要在 Main 函数结束前调用

    context.registerShutdownHook();

### dependency injection

#### 传统依赖：

```java
public class TextEditor {
    private SpellChecker spellChecker;
    public TextEditor() {
        spellChecker = new SpellChecker();
    }
}
```

#### 控制反转（通过setter）：

```java
public class TextEditor {
    private SpellChecker spellChecker;
    public void setSpellChecker(SpellChecker spellChecker) {
        this.spellChecker = spellChecker;
    }
}
```

```xml
<bean id="textEditor" class="TextEditor">
    <!-- 传对另一个 bean 的引用，用 ref；传值用 value -->
    <property name="spellChecker" ref="spellChecker"/>
</bean>
<bean id="spellChecker" class="SpellChecker"/>
```

以上 xml 可简写为：

```xml
<bean id="textEditor" class="TextEditor"
    p:spellChecker-ref="spellChecker"/>
<bean id="spellChecker" class="SpellChecker"/>
```

或者等价地，使用内部 bean：

```xml
<bean id="textEditor" class="TextEditor">
    <property name="spellChecker">
        <bean id="spellChecker" class="SpellChecker"/>
    </property>
</bean>
```

#### 控制反转（通过构造方法）：

```java
public class TextEditor {
    private SpellChecker spellChecker;
    public TextEditor(SpellChecker spellChecker) {
        this.spellChecker = spellChecker;
    }
}
```

```xml
<bean id="textEditor" class="TextEditor">
    <!-- index 和 type 都是可选的 -->
    <constructor-arg index="0" type="SpellChecker" ref="spellChecker"/>
</bean>
```

### collection

```xml
<property name="myArray">
    <array>
        <value>v1</value>
        <value>v2</value>
        <value>v3</value>
    </array>
</property>

<!-- java.util.List -->
<property name="myList">
    <list>
        <value>v1</value>
        <value>v2</value>
        <value>v3</value>
    </list>
</property>

<!-- java.util.Set -->
<property name="mySet">
    <set>
        <value>v1</value>
        <value>v2</value>
        <value>v3</value>
    </set>
</property>

<!-- java.util.Map -->
<property name="myMap">
    <map>
        <entry key="1" value="v1"/>
        <entry key="2" value="v2"/>
        <entry key="3" value="v3"/>
    </map>
</property>

<!-- java.util.Properties -->
<property name="myProp">
    <props>
        <prop key="1">p1</prop>
        <prop key="2">p2</prop>
        <prop key="3">p3</prop>
    </props>
</property>
```

xml 扩展
```xml
<!-- property 命名空间 -->
<beans xmlns:p="http://www.springframework.org/schema/p" ...>
<bean id="user" class="User" p:name="小明" p:age="18"/>

<!-- constructor-arg 命名空间 -->
<beans xmlns:c="http://www.springframework.org/schema/c" ...>
```

### annotation

导入 context 命名空间并开启注解配置方式
```xml
<?xml version="1.0" encoding="utf-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:context="http://www.springframework.org/schema/context"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd">
    <context:annotation-config/>
</beans>
```

* @Autowired 自动装配。这是最常用的注解。可以用在属性上、setter 上或构造函数上。相当于 autowired="byType"
* @Required 如果相应属性没有在 xml 中配置，将得到一个异常。默认情况下 @Autowired 隐含了 @Required
* @Qualifier("name") 与 @Autowired 配合使用，将相同类型的 bean 区分开
* @Resource 是 java 的注解而不是 spring 的。与 @Autowired 类似，也可以引用一个 bean。先按 byName 规则匹配，若失败再按 byType 规则匹配
* @PostConstruct 和 @PreDestroy 可以控制生命周期

### 使用注解配置

与 XML 配置

```xml
<bean id="user" class="com.zmx.bean.User">
    <property name="username" value="咕咕"/>
</bean>
```

等价的写法：

```java
package com.zmx.bean.User;

@Component // 表明这是一个组件, spring 会将它放入容器
public class User {
    @Value("咕咕")
    private String username;
}
```

以下三个注解和 @Component 功能相同，但更语义化：
```java
@Controller // controller 放入容器
public class UserController {}

@Service // service 放入容器
public class UserService {}

@Repository // dao 放入容器
public class UserDao {}
```

### configuration class

可以用 java 配置类完全取代 xml。与 XML 配置

```xml
<beans>
    <bean id="user" class="com.zmx.bean.User" />
</beans>
```

等价的写法：

```java
package com.zmx.config;

@Configuration // 这样的类称为配置类
public class MyConfig {
    @Bean // 放进容器
    public User user() {
        return new User();
    }
}
```

并用下面的代码加载：

```java
    ApplicationContext context = new AnnotationConfigApplicationContext(MyConfig.class);
    User user = context.getBean(User.class);
```

* @Import(MyConfig.class) 用于导入一个配置类
* @Bean(initMethod = "init", destroyMethod = "cleanup") 又一种生命周期配置
* @Scope("prototype") 指定 bean 的范围

## spring aop

aop 可以在不改变原来代码的情况下，在方法前后插入日志

使用方法
```xml
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
    <version>1.9.4</version>
</dependency>
```

```xml
<?xml version="1.0" encoding="utf-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="
       http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/aop
       http://www.springframework.org/schema/aop/spring-aop.xsd
">

    <bean id="service" class="com.zmx.demo.ServiceImpl"/>
    <bean id="log" class="com.zmx.log.Log"/>
    <aop:config>
        <!-- 定义切入点 (即, 执行的时机) -->
        <aop:pointcut id="pointcut" expression="execution(* com.zmx.demo.ServiceImpl.*(..))"/>
        <!-- 定义要执行的方法 (即, 打印日志) -->
        <aop:advisor advice-ref="log" pointcut-ref="pointcut"/>
    </aop:config>
</beans>
```

## spring mvc

### hello-mvc

按 [servlet.md](servlet.md) 的方法, 新建一个 java web 项目,
并配置一个内嵌 tomcat.  添加一个启动类 Main.java

<pre>
hello-mvc
|-- pom.xml
`-- src
    `-- main
        |-- java
        |   `-- com.zmx
        |       |-- controller
        |       |   |-- <a href="#FirstController.java">FirstController.java</a>
        |       |   `-- <a href="#SecondController.java">SecondController.java</a>
        |       `-- <a href="servlet.md#Main.java" target="_blank">Main.java</a>
        |-- resources
        `-- webapp
            |-- WEB-INF # 该目录对浏览器不可见, 需经过 servlet 处理
            |   |-- <a href="#web.xml">web.xml</a> # 主配置文件
            |   `-- <a href="#dispatcher-servlet.xml">dispatcher-servlet.xml</a>
            `-- <a href="#index.jsp">index.jsp</a>
</pre>

<code id="index.jsp">index.jsp</code>
```jsp
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Hello world</title>
</head>
<body>
  <h1>${message}</h1>
</body>
</html>
```

使用 spring mvc, 不再需要直接编写 servlet, 只需写 controller,
由 DispatcherServlet 调用我们编写的 controller.

<code id="FirstController.java">FirstController.java</code>
```java
import org.springframework.web.servlet.mvc.Controller;
public class FirstController implements Controller {
    public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 模型与视图
        ModelAndView mv = new ModelAndView();
        // 向 model 添加数据, 达到向 jsp 页面传参的目的
        mv.addObject("message", "First Controller!");
        // 指定 view 的名字, 和 dispatcher-servlet.xml 中的前缀后缀一起,
        // 拼接成完整路径 /index.jsp
        mv.setViewName("index");
        return mv;
    }
}
```

<code id="SecondController.java">SecondController.java</code>
```java
package com.zmx.controller;

@Controller // 注明这是一个控制器
@RequestMapping("/second")
public class SecondController {
    // 处理 get 请求, 也可以写全称:
    // @RequestMapping(value = "/1", method = RequestMethod.GET)
    @GetMapping("/1")
    public String sayHello(Model model) { // 也可以用 ModelMap
        model.addAttribute("message", "Second Controller (1)!");
        return "index";
    }

    @GetMapping("/2")
    public String sayHello2(Model model) {
        model.addAttribute("message", "Second Controller (2)!");
        return "index";
    }
}
```

显然 `SecondController` 简单得多, 也是开发是常用的.

在 <code id="web.xml">web.xml</code> 中配置一个 DispatcherServlet 代理我们的请求.

```xml
<!DOCTYPE web-app PUBLIC
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
        "http://java.sun.com/dtd/web-app_2_3.dtd">
<web-app>
   <display-name>My Spring MVC App</display-name>

   <servlet>
      <servlet-name>dispatcher</servlet-name>
      <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
      <!-- 关联配置文件, 遵循默认命名规范的情况下, 可省略
      <init-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:dispatcher-servlet.xml</param-value>
      </init-param>
      -->
      <!-- 启动优先级 1, 数字越小越优先 -->
      <load-on-startup>1</load-on-startup>
   </servlet>

   <!-- /* 匹配所有请求 -->
   <!-- / 匹配除了 .jsp 的所有请求 -->
   <servlet-mapping>
      <servlet-name>dispatcher</servlet-name>
      <url-pattern>/</url-pattern>
   </servlet-mapping>

    <!-- 配置过滤器, 防止乱码 -->
    <filter>
        <filter-name>encoding</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>utf-8</param-value>
        </init-param>
    </filter>

    <!-- 只写 /* 匹配不到 /name, 必须写 / -->
    <filter-mapping>
        <filter-name>encoding</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
</web-app>
```

DispatcherServlet 关联到一个 spring beans 配置文件.
默认情况下, 该配置文件和 `web.xml` 位于同一目录, 命名规范是 `名字-servlet.xml`,
这里我们命名为 <code id="dispatcher-servlet.xml">dispatcher-servlet.xml</code>:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"

       xsi:schemaLocation="
       http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd
       http://www.springframework.org/schema/mvc
       http://www.springframework.org/schema/mvc/spring-mvc.xsd
">
    <!-- 以下为 spring mvc 的核心三要素.  DispatcherServlet 会依次调用它们进行工作.  1. 2. 的配置都是可以省略的 -->

    <!-- 1. 处理器映射, 作用是根据 url 找到 handler (即, 由 /first 找到 FirstController) -->
    <!-- <bean class="org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping"/> -->

    <!-- 2. 适配器, 作用是对接 controller 的接口 -->
    <!-- <bean class="org.springframework.web.servlet.mvc.SimpleControllerHandlerAdapter"/> -->

    <!-- 3. 视图解析器, 根据 model and view 找到 jsp 页面 -->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/"/>
        <property name="suffix" value=".jsp"/>
    </bean>

    <!-- 方式一, 手动配置处理器 (handler) -->
    <bean id="/first" class="com.zmx.controller.FirstController"/>

    <!-- 方式二, 开启包扫描, 即可轻松找出 @Controller, @Service, @Component 等, 并自动添加到 spring 容器 -->
    <context:component-scan base-package="com.zmx" />

    <!-- 让 spring mvc 不处理静态资源 .css .js .html .jpg 等 -->
    <!-- <mvc:default-servlet-handler /> -->

    <!-- 开启 mvc 注解驱动 -->
    <!-- <mvc:annotation-driven /> -->

</beans>
```

启动应用, 访问 http://localhost:8080/first 和 /second/1, /second/2.
可以尝试访问 /index.jsp, 这时 message 值为空, 这是因为未经过 controller
传值.

#### Controller 方法

Controller 中, 每个方法处理一个请求, 这些方法的参数与返回值的形式非常丰富, 比如

使用 Servlet API:

```java
@GetMapping("/1")
public void test1(HttpServletRequest req, HttpServletResponse resp) throws
IOException {
    // 一些 servlet doGet 代码
}
```

转发与重定向, 注意, 使用 `forward:` 和 `redirect:` 时, 路径前后缀不生效,
需要写全路径.

```java
return "index"; // 默认是转发

return "forward:/index.jsp"; // 转发

return "redirect:/index.jsp"; // 重定向
```

### student 表单

让我们在 hello world 的基础上继续。

`student.jsp`
```jsp
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
  <title>Spring MVC Form Handling</title>
</head>
<body>

<h1>Student</h1>
<form:form method="POST" action="/addStudent">
  <table>
    <tr>
      <td><form:label path="id">id</form:label></td>
      <td><form:input path="id" /></td>
    </tr>
    <tr>
      <td><form:label path="age">age</form:label></td>
      <td><form:input path="age" /></td>
    </tr>
    <tr>
      <td><form:label path="name">name</form:label></td>
      <td><form:input path="name" /></td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="submit"/>
      </td>
    </tr>
  </table>
</form:form>
</body>
</html>
```

`result.jsp`
```jsp
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
  <title>Spring MVC Form Handling</title>
</head>
<body>

<h1>Submit Success</h1>
  <table>
    <tr>
      <td>ID</td>
      <td>${id}</td>
    </tr>
    <tr>
      <td>Age</td>
      <td>${age}</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>${name}</td>
    </tr>
  </table>
</body>
</html>
```

`Student.java`
```java
package com.zmx.bean;

@Data
public class Student {
    private Integer id;
    private Integer age;
    private String name;
}
```

`StudentController.java`
```java
package com.zmx;

@Controller
public class StudentController {
    @RequestMapping(value = "/student", method = RequestMethod.GET)
    public ModelAndView student() {
        return new ModelAndView("student", "command", new Student());
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("SpringWeb")Student student, ModelMap model) {
        model.addAttribute("id", student.getId());
        model.addAttribute("age", student.getAge());
        model.addAttribute("name", student.getName());
        return "result";
    }
}
```

## spring jdbc

<pre>
.
`-- src
    |-- com.jdbcdemo
    |   |-- model
    |   |   `-- Customer.java
    |   |-- dao
    |   |   |-- impl
    |   |   |   `-- CustomerDaoImpl.java
    |   |   `-- CustomerDao.java (interface)
    |   `-- Main.java
    `-- spring.xml
</pre>

`customer.sql`
```sql
create table customer (
    id int(10) primary key,
    name varchar(100),
    age int(10) unsigned
);
```

model: `Customer.java`
```java
@Data
public class Customer {
    private int id;
    private String name;
    private int age;
}
```

Data Access Object:
增 insert
删 delete
改 update
查 query

`CustomerDao.java`
```java
public interface CustomerDao {
    void insert(Customer customer);
    Customer query(int id);
}
```

DAO implement: `CustomerDaoImpl.java`

```java
public class CustomerDaoImpl extends JdbcDaoSupport implements CustomerDao {
    public void insert(Customer customer) {
        getJdbcTemplate().update(
            "INSERT INTO CUSTOMER (ID, NAME, AGE) VALUES (?, ?, ?)",
            new Object[] { customer.getId(), customer.getName(), customer.getAge() }
        );
    }

    public void query(int id) {
        return getJdbcTemplate().queryForObject(
            "SELECT * FROM CUSTOMER WHERE ID = ?",
            ParameterizedBeanPropertyRowMapper.newInstance(Customer.class),
            id
        );
    }
}
```

`spring.xml`
```
<beans ...>
    <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
        <property name="driverClassName" value="com.mysql.jdbc.Driver" />
        <property name="url" value="jdbc:mysql://localhost:3306/dbname" />
        <property name="username" value="root" />
        <property name="password" value="password" />
    </bean>
    <bean id="customerDao" class="com.jdbcdemo.dao.impl.CustomerDaoImpl">
        <property name="dataSource" ref="dataSource" />
    </bean>
</beans>
```

`Main.java`
```java
public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        CustomerDao customerDao = (CustomerDao)context.getBean("customerDao");
        customerDao.insert(new Customer(1, "Fran", 20));
    }
}
```
