# MyBatis

`User.java`

```java
package com.zmx.bean;

import lombok.Data;

@Data
public class User {
    // 各字段名要和数据库中的相同, 类型要匹配
    private Integer id;
    private String name;
    private Integer age;
    private String email;
}
```

`UserMapper.java`
```java
package com.zmx.mapper;

import com.zmx.bean.User;

import java.util.List;

public interface UserMapper {
    List<User> getUsers();
}
```

`UserMapper.xml`
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.zmx.mapper.UserMapper">
    <select id="getUsers" resultType="com.zmx.bean.User">
        select * from user
    </select>
</mapper>
```

`mybatis-config.xml`
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <typeAliases>
        <package name="com.zmx.bean"/>
    </typeAliases>
    <environments default="dev">
        <environment id="dev">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED"> <!-- type 写错的后果：class org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory cannot be cast to class org.apache.ibatis.datasource.DataSourceFactory -->
                <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://localhost:3306/zmx"/>
                <property name="username" value="root"/>
                <property name="password" value="root@mysql"/>
            </dataSource>
        </environment>
    </environments>
    <mappers>
        <!-- classpath (src/main/resources) 下的相对路径 -->
        <!-- 也可以指定 class="com.zmx.mapper.UserMapper" -->
        <mapper resource="com/zmx/mapper/UserMapper.xml"/> <!-- mapper 写错的后果: org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.zmx.mapper.UserMapper.getUsers -->
    </mappers>

    <!--
    <settings>
        <setting name="mapUnderscoreToCamelCase" value="true"/>
    </settings>
    -->
</configuration>
```
