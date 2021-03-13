 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Open the project and do checkout to merge the commit hash
    git checkout -f 074771ec125dd407af0282b92960e9e9e3377e84

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Open the pom file in spring-boot/spring-boot/pom.xml and add the code before the tag <plugins>:
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

## 5. Inside the folder spring-boot/spring-boot run the command:
    mvn clean compile -DskipTests assembly:single

## 6. Check the content folder: 
    spring-boot/spring-boot/target

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 074771ec125dd407af0282b92960e9e9e3377e84
    Receive the output: d30dd1fa98f2ab84926ac1c40f6a4a44c39e2f55 cd62596e8282b7a91490a7efe527f6deed7e3baa

## 8. Checkout to left commit hash and repeat steps 3 to 6:
    git checkout -f d30dd1fa98f2ab84926ac1c40f6a4a44c39e2f55

## 9. Checkout to right commit hash and repeat steps 3 to 6, chance the step 5 for 10:
    git checkout -f cd62596e8282b7a91490a7efe527f6deed7e3baa

## 10. Inside the folder  spring-boot run the command:
    mvn clean compile package -Dmaven.compiler.failOnError=false assembly:single

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base d30dd1fa98f2ab84926ac1c40f6a4a44c39e2f55 cd62596e8282b7a91490a7efe527f6deed7e3baa
    Receive the output: 01ba0f75718c0342276cfd7b3c269f9effe5ef56

## 12. Checkout to base commit hash and repeat steps 3 to 6, chance the step 5 for 10:
    git checkout -f 01ba0f75718c0342276cfd7b3c269f9effe5ef56