 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Open the project and do checkout to merge the commit hash
    git checkout -f fdd3f12ee0f92ac18844c08bf71df39feebb6673

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Open the pom file in spring-boot/spring-boot-autoconfigure/pom.xml and add the code before the tag project:
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

## 5. Comment the any lines (516, 517 and 518) in java class: spring-boot/spring-boot-autoconfigure/src/main/java/org/springframework/boot/autoconfigure/web/ServerProperties.java
```xml
    if (getUriEncoding() != null) {
        factory.setUriEncoding(getUriEncoding());
    }
```

## 6. Open the dependencies directory (spring-boot/spring-boot-dependencies/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 7. In the file (spring-boot/spring-boot-dependencies/pom.xml).

## 7.1 Update the following dependency version for 1.2.4.RELEASE:
```xml
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot</artifactId>
        <version>1.2.4.BUILD-SNAPSHOT</version>
	</dependency>
```

## 7.2 Update the following dependency version for 1.2.4.RELEASE:
```xml
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-configuration-processor</artifactId>
        <version>1.2.4.BUILD-SNAPSHOT</version>
    </dependency>
```

## 8. Inside the folder spring-boot-autoconfigure run the command:
    mvn clean compile -DskipTests assembly:single

## 9. Check the content folder: 
    spring-boot/spring-boot-autoconfigure/target

## 10. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 fdd3f12ee0f92ac18844c08bf71df39feebb6673 
    Receive the output: 734f5c39f7d55d6b55c92e1dc35ff1bd50b3cae5 4f988d2aeca5433bbba7fef3b20d9977691fc4c0 

## 11. Checkout to left commit hash and repeat steps 3 to 9:
    git checkout -f 734f5c39f7d55d6b55c92e1dc35ff1bd50b3cae5

## 12. Checkout to right commit hash and repeat steps 3 to 9:
    git checkout -f 4f988d2aeca5433bbba7fef3b20d9977691fc4c0

## 13. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 734f5c39f7d55d6b55c92e1dc35ff1bd50b3cae5 4f988d2aeca5433bbba7fef3b20d9977691fc4c0 
    Receive the output: 2d7c0c2f006244c5196d3ff24cfa11a421bf8b48  

## 14. Checkout to base commit hash and repeat steps 3 to 9:
    git checkout -f 2d7c0c2f006244c5196d3ff24cfa11a421bf8b48