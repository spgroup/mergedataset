 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout af20dc6cc45c032573413c401f9f73aa75371744

## 3. Edit the _pom.xml_ at the root of the project add the plugin
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
    - mvn clean compile assembly:single
```

## 5. Edit the **spring-boot\spring-boot-dependencies\pom.xml** add the plugin
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

## 6. Add the next plugin on spring-boot/spring-boot-tools/spring-boot-loader:

```
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-jar-plugin</artifactId>
        <version>3.2.0</version>
        <executions>
          <execution>
            <goals>
              <goal>test-jar</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
```

## 7. Run the command mvn clean compile package, and check the folder spring-boot\spring-boot-tools\spring-boot-loader\target for the jar with test classes

## 8. run the command:
    mvn clean compile assembly:single

## 9. check the content folder: 
    spring-boot\spring-boot-tools\spring-boot-loader\target

## 10. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 af20dc6cc45c032573413c401f9f73aa75371744 
    Receive the output: fc78a8de90f3d0745b292c9707addc5faa9ceeec   159ef8f1890c403232ea4776bfcd9ad6def60950 

## 11. Checkout to left commit hash and repeat steps 6-9:
    git checkout fc78a8de90f3d0745b292c9707addc5faa9ceeec 

## 12. Checkout to right commit hash and repeat steps 6-9:
    git checkout 159ef8f1890c403232ea4776bfcd9ad6def60950

## 13. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base fc78a8de90f3d0745b292c9707addc5faa9ceeec  159ef8f1890c403232ea4776bfcd9ad6def60950
    Receive the output: c808de0021578b4b9ba0881a33c9ed20db2465a5  

## 14. Checkout to base commit hash and repeat steps 6-9:
    git checkout c808de0021578b4b9ba0881a33c9ed20db2465a5  