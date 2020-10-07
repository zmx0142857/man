#!/usr/bin/env bash

MAVEN=/home/zmx/.m2/repository

java -cp "$MAVEN/org/apache/tomcat/embed/tomcat-embed-core/9.0.26/tomcat-embed-core-9.0.26.jar:$MAVEN/org/apache/tomcat/embed/tomcat-embed-jasper/9.0.26/tomcat-embed-jasper-9.0.26.jar:$MAVEN/javax/annotation/javax.annotation-api/1.3.1/javax.annotation-api-1.3.1.jar:target/classes" com.demo.Main 2>&1
