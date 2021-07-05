 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f 958a0a45f164601d01cb706c19f22ed3e25eff56

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 3.1 Open the pom file in **spring-boot/spring-boot-parent/pom.xml** and remove the plugin bellow, when applicable:
```xml
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

## 4. Open the pom file in **spring-boot/spring-boot-autoconfigure/pom.xml** and add the code:
```xml
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
        </plugins>
    </build>
```

## 5. Inside the folder  **spring-boot-autoconfigure** run the command:
    mvn clean compile -DskipTests assembly:single

## 6. Check the content folder: 
    spring-boot/spring-boot-autoconfigure/target

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 958a0a45f164601d01cb706c19f22ed3e25eff56
    Receive the output: 33b1f52fa5cc14f0a9d4a3ef7424b2ca42217de5 779537551edfa0c0bc430e0727b1277ec0a8a57e

## 8. Checkout to left commit hash and repeat the steps 3 to 6:
    git checkout -f 33b1f52fa5cc14f0a9d4a3ef7424b2ca42217de5

## 9. Checkout to right commit hash:
    git checkout -f 779537551edfa0c0bc430e0727b1277ec0a8a57e

## 10. Comment or remove the dependency of **spring-boot-autoconfigure/pom.xml** and repeat the steps 3 to 6:
```xml
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot</artifactId>
        <type>test-jar</type>
        <scope>test</scope>
    </dependency>
```

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 33b1f52fa5cc14f0a9d4a3ef7424b2ca42217de5 779537551edfa0c0bc430e0727b1277ec0a8a57e
    Receive the output: 13403a0f723fdf0680b1bff2897c4b47df53397d

## 12. Checkout to base commit hash, execute the step 10 and repeat of the 3 to 6:
    git checkout -f 13403a0f723fdf0680b1bff2897c4b47df53397d