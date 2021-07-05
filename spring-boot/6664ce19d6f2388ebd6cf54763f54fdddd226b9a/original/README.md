 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f 6664ce19d6f2388ebd6cf54763f54fdddd226b9a

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
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
## 5. Comment the spring-boot-test-support dependency:
```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-test-support</artifactId>
            <scope>test</scope>
        </dependency>
```

## 6. Search the files: MustacheViewResolver.java, in paths: spring-boot/src/main/java/org/springframework/boot/web/reactive/result/view and /spring-boot/src/main/java/org/springframework/boot/web/servlet/view. Comment the import: import org.springframework.web.servlet.view.AbstractUrlBasedView;. Comment all the method AbstractUrlBasedView buildView in both classes

Next move the class spring-boot/spring-boot/src/test/java/org/springframework/boot/jta/atomikos/AtomikosPropertiesTests.java to the new location spring-boot/spring-boot/src/main/java/org/springframework/boot/jta/atomikos/AtomikosPropertiesTests.java

## 7. Inside the folder  **spring-boot** run the command:
    mvn clean compile -DskipTests assembly:single

## 8. Check the content folder: 
    spring-boot/spring-boot/target

## 9. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 6664ce19d6f2388ebd6cf54763f54fdddd226b9a
    Receive the output: 337e6452632827804f661e9695de7ecad6dcaeb3 544d516563a0d449f7a8dabe142362ba6d6f4778

## 10. Checkout to left commit hash and repeat steps 3 to 8:
    git checkout -f 337e6452632827804f661e9695de7ecad6dcaeb3

## 11. Checkout to right commit hash and repeat steps 3, 4, 5, 7 and 8 (ignore the 6):
    git checkout -f 544d516563a0d449f7a8dabe142362ba6d6f4778

## 12. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 337e6452632827804f661e9695de7ecad6dcaeb3 544d516563a0d449f7a8dabe142362ba6d6f4778
    Receive the output: b5709fd6183bb283b7294b77a477528e03483d10  

## 13. Checkout to base commit hash and repeat steps 3, 4, 5, 7 and 8 (ignore the 6):
    git checkout -f b5709fd6183bb283b7294b77a477528e03483d10