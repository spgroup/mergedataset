## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Open the project and do checkout to merge the commit hash
    git checkout -f 074771ec125dd407af0282b92960e9e9e3377e84

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Open the dependencies directory (spring-boot/spring-boot-dependencies/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 5. In the file (spring-boot/spring-boot-dependencies/pom.xml), change the versions: spring.version and spring-integration.version from 4.2.0.BUILD-SNAPSHOT to 4.2.10.BUILD-SNAPSHOT
```xml
<spring.version>4.2.10.BUILD-SNAPSHOT</spring.version>
<spring-integration.version>4.2.10.BUILD-SNAPSHOT</spring-integration.version>
```

## 6. Open the pom file in spring-boot/spring-boot/pom.xml and add the code into the tag plugins:
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

## 7. In the file (spring-boot/spring-boot/pom.xml), if the version of spring-boot-parent is 1.2.5.BUILD-SNAPSHOT change to 1.2.5.RELEASE

## 8. Inside the folder spring-boot/spring-boot run the command:
    mvn clean compile -DskipTests assembly:single

## 9. Check the content folder: 
    spring-boot/spring-boot/target

## 10. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 074771ec125dd407af0282b92960e9e9e3377e84
    Receive the output: d30dd1fa98f2ab84926ac1c40f6a4a44c39e2f55 cd62596e8282b7a91490a7efe527f6deed7e3baa

## 11. Checkout to left commit hash and repeat steps 3 to 9:
    git checkout -f d30dd1fa98f2ab84926ac1c40f6a4a44c39e2f55

## 12. Checkout to right commit hash and repeat steps 3 to 9:
    git checkout -f cd62596e8282b7a91490a7efe527f6deed7e3baa

## 13. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base d30dd1fa98f2ab84926ac1c40f6a4a44c39e2f55 cd62596e8282b7a91490a7efe527f6deed7e3baa
    Receive the output: 01ba0f75718c0342276cfd7b3c269f9effe5ef56

## 14. Checkout to base commit hash and repeat steps 3 to 9:
    git checkout -f 01ba0f75718c0342276cfd7b3c269f9effe5ef56