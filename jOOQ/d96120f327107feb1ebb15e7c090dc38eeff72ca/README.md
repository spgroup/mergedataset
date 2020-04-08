## 1. Clone the project 
    git clone https://github.com/jOOQ/jOOQ.git

## 2. Checkout to merge the commit hash
    git checkout d96120f327107feb1ebb15e7c090dc38eeff72ca

## 3. Edit the _pom.xml_ at the root of the project
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

## 4. Edit the _.travis.yml_ add the line
```yml
script: 
    - mvn clean compile assembly:single
```

## 5. __Only__ in the __MERGE__ version is it necessary add the import
```java
import org.jooq.conf.Settings;
```

## 6. run the command:
    mvn clean compile assembly:single

## 7. check the content folder: 
    jOOQ/jOOQ/target

## 8. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 d96120f327107feb1ebb15e7c090dc38eeff72ca 
    Receive the output: 3b842b6876b74657fde92040382cc2d57cbe5246  6ae884b877b8d9145b29498120c0377447a82a00 

## 9. Checkout to left commit hash and repeat steps 6 and 7:
    git checkout 3b842b6876b74657fde92040382cc2d57cbe5246

## 10. Checkout to right commit hash and repeat steps 6 and 7:
    git checkout 6ae884b877b8d9145b29498120c0377447a82a00

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 3b842b6876b74657fde92040382cc2d57cbe5246 6ae884b877b8d9145b29498120c0377447a82a00
    Receive the output: c5b5a73051bf2a9a525eb719d49d7f24aa5df9fb 

## 12. Checkout to base commit hash and repeat steps 6 and 7:
    git checkout c5b5a73051bf2a9a525eb719d49d7f24aa5df9fb 