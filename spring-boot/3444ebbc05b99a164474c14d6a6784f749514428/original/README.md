 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f 3444ebbc05b99a164474c14d6a6784f749514428

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Open the pom file in **spring-boot/pom.xml** and add the code into tag **<plugins>**:
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

## 10. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 93700d00de8135ba1c5d2d95d91e69e21f3f8ed9 11d59df3fd71a656a7869ace4303a8d72e6f777c
    Receive the output: 86d5c1925916043ca69da3e3443baf5b1ae4f8ad

## 11. Checkout to base commit hash and repeat steps 3 to 6:
    git checkout -f 86d5c1925916043ca69da3e3443baf5b1ae4f8ad