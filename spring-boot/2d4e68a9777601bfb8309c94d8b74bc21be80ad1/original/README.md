 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f 2d4e68a9777601bfb8309c94d8b74bc21be80ad1

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

## 5. Inside the folder  **spring-boot** run the command:
    mvn clean compile -DskipTests assembly:single

## 6. Check the content folder: 
    spring-boot/spring-boot/target

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 2d4e68a9777601bfb8309c94d8b74bc21be80ad1
    Receive the output: a9c2eb3919a0ae8c46193c4e96e4cf04554cd8ff adc8cdf16a875b3cf750960b86aa11cdf7631188

## 8. Checkout to left commit hash and repeat steps 3 to 6:
    git checkout -f a9c2eb3919a0ae8c46193c4e96e4cf04554cd8ff

## 9. Checkout to right commit hash and repeat steps 3 to 6:
    git checkout -f adc8cdf16a875b3cf750960b86aa11cdf7631188

## 10. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base a9c2eb3919a0ae8c46193c4e96e4cf04554cd8ff adc8cdf16a875b3cf750960b86aa11cdf7631188
    Receive the output: d0a85dd4779285689dd70ae567c6053c563c2ad5

## 11. Checkout to base commit hash and repeat steps 3 to 6:
    git checkout -f d0a85dd4779285689dd70ae567c6053c563c2ad5