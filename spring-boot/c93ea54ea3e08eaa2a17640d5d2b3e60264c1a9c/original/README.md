 ## 1. Clone the project 
    git clone https://github.com/spring-projects/spring-boot.git

## 2. Checkout to merge the commit hash
    git checkout -f c93ea54ea3e08eaa2a17640d5d2b3e60264c1a9c

## 3. Open the parent directory (spring-boot/spring-boot-parent/pom.xml) and change all the urls:
```xml
    http://repo.spring.io change to https://repo.spring.io
```

## 4. Open the pom file in **spring-boot/spring-boot-autoconfigure/pom.xml** and add the code:
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

## 5. Insert the annotation param in the class **CacheManagerCustomizers** in line 47 
```xml
   * @param <T> the type of cache manager
```

## 6. Inside the folder  **spring-boot-autoconfigure** run the command:
    mvn clean compile package -Dmaven.compiler.failOnError=false -DskipTests assembly:single

## 7. Check the content folder: 
    spring-boot/spring-boot-autoconfigure/target

## 8. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 c93ea54ea3e08eaa2a17640d5d2b3e60264c1a9c 
    Receive the output: 8b587a87ef76d3a72ddeab14841b1d981fa6565e 4fd778fed8ffba9015803d395a85f9a2ac4615e9 

## 9. Checkout to left commit hash and repeat steps 3 to 7, skip the step 5:
    git checkout -f 8b587a87ef76d3a72ddeab14841b1d981fa6565e

## 10. Checkout to right commit hash and repeat steps 3 to 7, before execute the step 11:
    git checkout -f 4fd778fed8ffba9015803d395a85f9a2ac4615e9

##11. Comment the dependences:
```xml
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot</artifactId>
        <type>test-jar</type>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>ch.qos.logback</groupId>
        <artifactId>logback-classic</artifactId>
        <scope>test</scope>
    </dependency>
```

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 8b587a87ef76d3a72ddeab14841b1d981fa6565e 4fd778fed8ffba9015803d395a85f9a2ac4615e9 
    Receive the output: 7ba16e37e812e714425593ea11c66fab3899df92  

## 12. Checkout to base commit hash and repeat steps 3 to 7:
    git checkout -f 7ba16e37e812e714425593ea11c66fab3899df92