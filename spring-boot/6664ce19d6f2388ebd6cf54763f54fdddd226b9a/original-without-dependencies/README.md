 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f 6664ce19d6f2388ebd6cf54763f54fdddd226b9a

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Comment the spring-boot-test-support dependency:
```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-test-support</artifactId>
            <scope>test</scope>
        </dependency>
```

## 5. Search the files: MustacheViewResolver.java, in paths: spring-boot/src/main/java/org/springframework/boot/web/reactive/result/view and /spring-boot/src/main/java/org/springframework/boot/web/servlet/view. Comment the import: import org.springframework.web.servlet.view.AbstractUrlBasedView;. Comment all the method AbstractUrlBasedView buildView in both classes

## 6. Inside the folder spring-boot run the command:
```xml
    mvn clean compile package -Dmaven.compiler.failOnError=false -DskipTests jar:test-jar
```

## 7. Check the content folder: 
    spring-boot/spring-boot/target
