 ## 1. Clone the project 
    git clone https://github.com/apache/storm

## 2. Checkout to merge the commit hash
    git checkout ad2be678831b3b060229fd936e3908110162b7ac

## 3. Edit the _pom.xml_ at the root of the project
```xml
    <version>2.0.0</version>
``` 

## 4. At the repositories tag on the same _pom.xml_
```xml
    <url>https://repo1.maven.org/maven2/</url>
```

## 5. Edit the storm\external\storm-kafka-client\pom.xml and the storm\storm-core\pom.xml 
```xml
<version>2.0.0</version>
``` 
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
## 6. run the command:
    mvn clean compile assembly:single

## 7. check the content folder: 
    storm\external\storm-kafka-client and storm\storm-core\target

## 8. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 ad2be678831b3b060229fd936e3908110162b7ac 
    Receive the output: 0aa0e8579723a76f53fe7e0ae71dfd1722465c0e  251cb8876b0dbab1211a69e35c460aeeb07a20e2 

## 9. Checkout to left commit hash and repeat steps 6 and 7:
    git checkout 0aa0e8579723a76f53fe7e0ae71dfd1722465c0e

## 10. Checkout to right commit hash and repeat steps 6 and 7:
    git checkout 251cb8876b0dbab1211a69e35c460aeeb07a20e2

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 0aa0e8579723a76f53fe7e0ae71dfd1722465c0e 251cb8876b0dbab1211a69e35c460aeeb07a20e2
    Receive the output: e3b2f96931317d98bff0e2be567a0bf80e835f43 

## 12. Checkout to base commit hash and repeat steps 6 and 7:
    git checkout e3b2f96931317d98bff0e2be567a0bf80e835f43 