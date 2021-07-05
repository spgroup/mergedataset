 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f 3444ebbc05b99a164474c14d6a6784f749514428

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```
## 3.1 Open the pom file in **spring-boot/spring-boot-parent/pom.xml** and remove the plugins bellow, when applicable:
```xml
    <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-resources-plugin</artifactId>
                <executions>
                    <execution>
                        <id>checkstyle-prepare</id>
                        <phase>validate</phase>
                        <goals>
                            <goal>copy-resources</goal>
                        </goals>
                        <configuration>
                            <outputDirectory>${project.build.directory}</outputDirectory>
                            <resources>
                                <resource>
                                    <directory>${main.basedir}/spring-boot-parent/src/checkstyle</directory>
                                    <includes>
                                        <include>checkstyle-import-control.xml</include>
                                    </includes>
                                </resource>
                            </resources>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-checkstyle-plugin</artifactId>
                <executions>
                    <execution>
                        <id>checkstyle-validation</id>
                        <phase>validate</phase>
                        <configuration>
                            <skip>${disable.checks}</skip>
                            <configLocation>src/checkstyle/checkstyle.xml</configLocation>
                            <suppressionsLocation>src/checkstyle/checkstyle-suppressions.xml</suppressionsLocation>
                            <headerLocation>src/checkstyle/checkstyle-header.txt</headerLocation>
                            <propertyExpansion>checkstyle.build.directory=${project.build.directory}</propertyExpansion>
                            <encoding>UTF-8</encoding>
                            <consoleOutput>true</consoleOutput>
                            <failsOnError>true</failsOnError>
                            <includeTestSourceDirectory>true</includeTestSourceDirectory>
                        </configuration>
                        <goals>
                            <goal>check</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
```

## 4. Open the pom file in **spring-boot/spring-boot/pom.xml** and add the code into tag **<plugins>**:
```xml
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

```
## 5. Inside the folder  **spring-boot** run the command:
    mvn clean compile -DskipTests assembly:single

## 6. Check the content folder: 
    spring-boot/spring-boot/target

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 3444ebbc05b99a164474c14d6a6784f749514428
    Receive the output: 93700d00de8135ba1c5d2d95d91e69e21f3f8ed9 11d59df3fd71a656a7869ace4303a8d72e6f777c

## 8. Checkout to left commit hash and repeat steps 3 to 6:
    git checkout -f 93700d00de8135ba1c5d2d95d91e69e21f3f8ed9

## 9. Checkout to right commit hash and repeat steps 3 to 6:
    git checkout -f 11d59df3fd71a656a7869ace4303a8d72e6f777c

##9.1 Add the version tag for the dependency bellow in the file **spring-boot/spring-boot/pom.xml**:
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-configuration-processor</artifactId>
    <optional>true</optional>
    <version>1.2.6.RELEASE</version>
</dependency>
```
## 10. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 93700d00de8135ba1c5d2d95d91e69e21f3f8ed9 11d59df3fd71a656a7869ace4303a8d72e6f777c
    Receive the output: 86d5c1925916043ca69da3e3443baf5b1ae4f8ad

## 11. Checkout to base commit hash and repeat steps 3 to 6:
    git checkout -f 86d5c1925916043ca69da3e3443baf5b1ae4f8ad

##11.1 Add the version tag for the dependency bellow in the file **spring-boot/spring-boot/pom.xml**:
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-configuration-processor</artifactId>
    <optional>true</optional>
    <version>1.2.6.RELEASE</version>
</dependency>