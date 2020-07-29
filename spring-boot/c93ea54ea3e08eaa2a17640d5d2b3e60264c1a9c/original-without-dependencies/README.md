 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f c93ea54ea3e08eaa2a17640d5d2b3e60264c1a9c

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Insert the annotation param in the class **CacheManagerCustomizers** in line 47 
```xml
   * @param <T> the type of cache manager
```

## 5. Open the pom file in **spring-boot/spring-boot-autoconfigure/pom.xml** and add the code:
```xml
    mvn clean compile package -Dmaven.compiler.failOnError=false -DskipTests jar:test-jar
```

## 6. Check the content folder: 
    spring-boot/spring-boot-autoconfigure/target