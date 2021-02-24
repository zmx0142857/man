## getting started

在 start.spring.io 新建项目, 添加 spring web 依赖, 生成并下载


```
.
`-- src
   `-- main
       |-- java/
       |   `-- com.demo
       |       |-- DemoApplication.java // 启动类
       |       `-- controller // 控制器
       `-- resources/application.properties // 配置文件
```

启动类

    package com.demo;

    import org.springframework.boot.SpringApplication;
    import org.springframework.boot.autoconfigure.SpringBootApplication;

    @SpringBootApplication // 标明 spring boot 启动类
    public class DemoApplication {

        public static void main(String[] args) {
            SpringApplication.run(SpringbootDemoApplication.class, args);
        }

    }

控制器类

    package com.demo.controller;

    import org.springframework.web.bind.annotation.RestController;
    import org.springframework.web.bind.annotation.RequestMapping;

    @RestController // 相当于 @Controller @ResponseBody, 返回字符串给浏览器
    public class DemoController {

        @RequestMapping("/hello")
        public String hello() {
            return "hello, spring boot";
        }
    }

在 IDE 中运行启动类, 打开浏览器 http://localhost:8080/hello
也可以用命令行
    ./mvnw spring-boot:run
或者
    mvn package && java -jar target/<???>.jar
