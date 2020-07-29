 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f 3444ebbc05b99a164474c14d6a6784f749514428

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Inside the folder  **spring-boot** run the command:
```xml
    mvn clean compile package -Dmaven.compiler.failOnError=false -DskipTests jar:test-jar
```

## 5. Check the content folder: 
    spring-boot/spring-boot/target
