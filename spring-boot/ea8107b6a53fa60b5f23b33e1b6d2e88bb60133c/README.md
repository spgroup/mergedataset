1. Clone the project:  
   `git clone https://github.com/spring-projects/spring-boot.git`
2. Checkout to merge commit hash:  
   `git checkout ea8107b6a53fa60b5f23b33e1b6d2e88bb60133c`
3. Edit the pom.xml at the spring-boot folder of the project:

```maven
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mavenapache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-parent</artifactId>
      <version>1.3.1.BUILD-SNAPSHOT</version>
      <relativePath>../spring-boot-parent</relativePath>
   </parent>
   <artifactId>spring-boot</artifactId>
   <name>Spring Boot</name>
   <description>Spring Boot</description>
   <url>http://projects.spring.io/spring-boot/</url>
   <organization>
      <name>Pivotal Software, Inc.</name>
      <url>http://www.spring.io</url>
   </organization>
   <properties>
      <main.basedir>${basedir}/..</main.basedir>
   </properties>
   <dependencies>
      <!-- Compile -->
      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-core</artifactId>
      </dependency>
      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-context</artifactId>
      </dependency>
      <!-- Optional -->
      <dependency>
         <groupId>ch.qos.logback</groupId>
         <artifactId>logback-classic</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>com.atomikos</groupId>
         <artifactId>transactions-jms</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>com.atomikos</groupId>
         <artifactId>transactions-jta</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>com.atomikos</groupId>
         <artifactId>transactions-jdbc</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>com.fasterxml.jackson.core</groupId>
         <artifactId>jackson-databind</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>com.sendgrid</groupId>
         <artifactId>sendgrid-java</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>com.google.code.gson</groupId>
         <artifactId>gson</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>com.googlecode.json-simple</groupId>
         <artifactId>json-simple</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>javax.jms</groupId>
         <artifactId>jms-api</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>javax.servlet</groupId>
         <artifactId>javax.servlet-api</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>junit</groupId>
         <artifactId>junit</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>log4j</groupId>
         <artifactId>log4j</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.logging.log4j</groupId>
         <artifactId>log4j-api</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.logging.log4j</groupId>
         <artifactId>log4j-core</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.httpcomponents</groupId>
         <artifactId>httpclient</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.tomcat.embed</groupId>
         <artifactId>tomcat-embed-core</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.tomcat.embed</groupId>
         <artifactId>tomcat-embed-jasper</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.tomcat.embed</groupId>
         <artifactId>tomcat-embed-logging-juli</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.velocity</groupId>
         <artifactId>velocity</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.apache.velocity</groupId>
         <artifactId>velocity-tools</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.codehaus.btm</groupId>
         <artifactId>btm</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.codehaus.groovy</groupId>
         <artifactId>groovy</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.codehaus.groovy</groupId>
         <artifactId>groovy-xml</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.eclipse.jetty</groupId>
         <artifactId>jetty-webapp</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.eclipse.jetty</groupId>
         <artifactId>jetty-util</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.eclipse.jetty</groupId>
         <artifactId>jetty-servlets</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>io.undertow</groupId>
         <artifactId>undertow-servlet</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.hamcrest</groupId>
         <artifactId>hamcrest-library</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.hibernate</groupId>
         <artifactId>hibernate-entitymanager</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.hibernate</groupId>
         <artifactId>hibernate-validator</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.json</groupId>
         <artifactId>json</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.liquibase</groupId>
         <artifactId>liquibase-core</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.slf4j</groupId>
         <artifactId>slf4j-api</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.slf4j</groupId>
         <artifactId>jul-to-slf4j</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-orm</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-test</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-web</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-webmvc</artifactId>
         <optional>true</optional>
      </dependency>
      <dependency>
         <groupId>org.yaml</groupId>
         <artifactId>snakeyaml</artifactId>
         <optional>true</optional>
      </dependency>
      <!-- Annotation processing -->
      <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-configuration-processor</artifactId>
         <optional>true</optional>
         <version>2.2.6.RELEASE</version>
      </dependency>
      <!-- Test -->
      <dependency>
         <groupId>org.apache.httpcomponents</groupId>
         <artifactId>httpasyncclient</artifactId>
         <scope>test</scope>
      </dependency>
      <dependency>
         <groupId>org.slf4j</groupId>
         <artifactId>jcl-over-slf4j</artifactId>
         <scope>test</scope>
      </dependency>
      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-context-support</artifactId>
         <scope>test</scope>
      </dependency>
      <dependency>
         <groupId>org.springframework.data</groupId>
         <artifactId>spring-data-redis</artifactId>
         <scope>test</scope>
      </dependency>
   </dependencies>
   <build>
      <plugins>
         <plugin>
            <artifactId>maven-assembly-plugin</artifactId>
            <configuration>
            <archive>
            <manifest>
               <mainClass>fully.qualified.MainClass</mainClass>
            </manifest>
            </archive>
            <descriptorRefs>
               <descriptorRef>jar-with-dependencies</descriptorRef>
            </descriptorRefs>
            </configuration>
            </plugin>
         <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-jar-plugin</artifactId>
            <executions>
               <execution>
                  <goals>
                     <goal>test-jar</goal>
                  </goals>
               </execution>
            </executions>
         </plugin>
      </plugins>
   </build>
</project>
```

4. Inside the folder spring-boot run the command:
   `mvn clean compile assembly:single`

   if you recive this error:

   ```
   [ERROR] [ERROR] Some problems were encountered while processing the POMs:
   [FATAL] Non-resolvable parent POM for org.springframework.boot:spring-boot:[unknown-version]: Could not find artifact org.springframework.boot:spring-boot-parent:pom:1.3.1.BUILD-SNAPSHOT and 'parent.relativePath' points at wrong local POM @ line 4, column 10
   ```

   replace the parent tags for:

   ```
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-dependencies</artifactId>
   <version>1.3.1.RELEASE</version>
   <relativePath>../spring-boot-dependencies</relativePath>
   ```

5. check the contents folder spring-boot/target.
6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)  
   Run: `git log --pretty=%P -n 1 ea8107b6a53fa60b5f23b33e1b6d2e88bb60133c`.  
   Receive the output: `dd4b9b1788862933e714700aa4caa425e3fc154c 2fe08194950356f247107a256da91a3560b80fa3`
7. Checkout to left commit hash and repeat steps 4 and 5:  
   `git checkout f01b90668be552ec5139264cda72c0924a5451e3`
8. Checkout to right commit hash and repeat steps 4 and 5:  
   `git checkout 0f3f4b75b0e8bb386dd1618b50e7240a572e6eda`
9. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)  
   Run: `git merge-base dd4b9b1788862933e714700aa4caa425e3fc154c 2fe08194950356f247107a256da91a3560b80fa3`.  
   Receive the output: `604ca524912c7a4e105746138bafc1eeedec3b50`
10. Checkout to base commit hash and repeat steps 4 and 5:  
    `git checkout 604ca524912c7a4e105746138bafc1eeedec3b50`
