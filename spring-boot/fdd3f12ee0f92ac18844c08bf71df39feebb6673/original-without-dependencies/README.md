 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f fdd3f12ee0f92ac18844c08bf71df39feebb6673

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Comment the any lines (517, 517 and 518) in java class: spring-boot/spring-boot-autoconfigure/src/main/java/org/springframework/boot/autoconfigure/web/ServerProperties.java
```xml
    if (getUriEncoding() != null) {
        factory.setUriEncoding(getUriEncoding());
    }
```

## 5. Open the pom file in **spring-boot/spring-boot-autoconfigure/pom.xml** and add the code:
```xml
    mvn install -DskipTests jar:test-jar
```

## 6. Check the content folder: 
    spring-boot/spring-boot-autoconfigure/target