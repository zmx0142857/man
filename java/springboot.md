# spring boot

* 一个快速开发的脚手架
* 基于 SpringBoot 可以快速开发单个微服务
* 约定大于配置

## getting started

### 新建项目
在 start.spring.io 新建项目, 添加 spring web 依赖, 生成并下载


    .
    |-- pom.xml // 依赖管理
    `-- src
       `-- main
           |-- java/
           |   `-- com.demo.springboot
           |       |-- DemoApplication.java // 启动类
           |       `-- controller
           |           `-- DemoController // 控制器
           `-- resources/application.properties // 配置文件

### 编写代码

依赖管理 pom.xml

```xml
<!-- 经典的 web 场景 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
<!-- html 模板引擎 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
<!-- jdbc -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jdbc</artifactId>
</dependency>
<!-- mysql -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
</dependency>
<!-- 改用 druid 数据源 (默认是 hikari) -->
<dependency>
    <groupId>com.alibaba</groupId>
    <artifactId>druid-spring-boot-starter</artifactId>
    <version>1.1.17</version>
</dependency>
<!-- mybatis: sql 框架 -->
<dependency>
    <groupId>org.mybatis.spring.boot</groupId>
    <artifactId>mybatis-spring-boot-starter</artifactId>
    <version>2.1.4</version>
</dependency>
<!-- mybatis-plus -->
<dependency>
    <groupId>com.baomidou</groupId>
    <artifactId>mybatis-plus-boot-starter</artifactId>
    <version>3.4.2</version>
</dependency>
<!-- redis -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>
<!-- actuator -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>

<!-- 热替换（仮） -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
    <optional>true</optional>
</dependency>
<!-- 配置文档自动补全 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-configuration-processor</artifactId>
    <optional>true</optional>
</dependency>
<!-- 自动生成 getter/setter -->
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <optional>true</optional>
</dependency>
<!-- 测试 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>

<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
            <configuration>
                <excludes>
                    <exclude>
                        <groupId>org.springframework.boot</groupId>
                        <artifactId>spring-boot-configuration-processor</artifactId>
                    </exclude>
                    <exclude>
                        <groupId>org.projectlombok</groupId>
                        <artifactId>lombok</artifactId>
                    </exclude>
                </excludes>
            </configuration>
        </plugin>
    </plugins>
</build>
```

启动类 DemoApplication.java

```java
package com.demo.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// 表明这是一个 spring boot 启动类
// 相当于三个注解
// 1. @SpringBootConfiguration 表明这是一个配置类
// 2. @EnableAutoConfiguration 表明启用 springboot 自动配置功能
// 3. @ComponentScan 自动扫描当前包下的 java 类
@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        // 返回 IoC 容器
        // ConfigurableApplicationContext run =
        SpringApplication.run(SpringbootDemoApplication.class, args);

        // 查看容器中的 bean
        // for (String name: names) {
        //     System.out.println(name);
        // }
        // System.out.println(run.containsBean("pet"));
    }

}
```

控制器类 DemoController.java

```java
package com.demo.springboot.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController // 相当于 @Controller @ResponseBody, 返回字符串给浏览器
public class DemoController {

    @RequestMapping("/hello")
    public String hello() {
        return "hello, spring boot";
    }
}
```

### 运行

用命令行运行

    mvn spring-boot:run

或者打包并运行

    mvn package && java -jar target/<???>.jar

现在打开浏览器 http://localhost:8080/hello

## spring boot 套路

### 常用配置

    server.port=8080
    spring.banner.localtion=classpath:banner.jpg # springboot 启动图标
    debug=true # 显示 bean 的装配过程

    使用 application.properties 会造成中文乱码, 建议改为 application.yml
    非要使用 .properties 文件的话, 起一个不同于默认的文件名,
    如 my.properties, 然后在主类上注解:

    @PropertySource(value = "classpath:my.properties",encoding = "UTF-8") // 防止 .properties 文件乱码

### 常用注解

```java
// [bean]

@Data // 用 lombok 生成 getter/setter
@ToString // 生成 toString() 方法
@AllArgsContructor // 全参数构造器, 类似有 @NoArgsConstructor
// 表明这是一个组件. 另一种声明这是一个组件的做法是在一个
// @Configuration 类上标注 @EnableConfigurationProperties(Person.class)
@Component
// @Order(Ordered.HIGHEST_PRECEDENCE) // 指定优先级, 数字越小越优先
@ConfigurationProperties(prefix=???) // 与某个配置项关联
public class Person {
    private String name;
    private int age;
}

// [controller]

@Slf4j // 使用日志, 在方法中可以使用 log.info 等
// 相当于两个注解:
// 1. @Controller // 表明这是个 controller
// 2. @ResponseBody // 方法返回的内容直接传给浏览器, 而不跳转到视图
@RestController
public class MyController {
    // 直接使用容器中的 bean
    @Autowired
    Person person;

    // 既能处理 get, 也能处理 post
    // 类似有 @GetMapping @PostMapping @PutMapping @DeleteMapping
    @RequestMapping("/person")
    Person person(@RequestParam("name") String name) {
        return this.person;
    }
}

// [configuration]

// 表明这是一个配置类, 不保证单实例以提升性能
@Configuration(proxyBeanMethods = false)
public class MyConfig {
    @Bean // 表明这是一个 bean
    public Person person() {
        return new Person("Gugu", 24);
    }
}
```
