package com.demo;

import org.apache.catalina.Context;
import org.apache.catalina.WebResourceRoot;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;

import java.io.File;

public class Main {
    private static final String submodule = ""; // 如果项目以子模块运行, 这里要写上子模块名称, 如 02-hello-mvc/
    private static final String webapp = submodule + "web";
    private static final String classes = submodule + "target/classes";
    public static void main(String[] args) throws Exception {
        // 新建 tomcat
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.getInteger("port", 8080));
        tomcat.getConnector();
        // 创建 webapp
        Context ctx = tomcat.addWebapp("", new File(webapp).getAbsolutePath());
        WebResourceRoot resources = new StandardRoot(ctx);
        resources.addPreResources(new DirResourceSet(resources, "/WEB-INF/classes", new File(classes).getAbsolutePath(), "/"));
        ctx.setResources(resources);
        // 启动 tomcat
        tomcat.start();
        tomcat.getServer().await();
    }
}
