 ## 1. Clone the project 
    git clone https://github.com/resty-gwt/resty-gwt

## 2. Checkout to merge the commit hash
    git checkout 867b917c43c32acbdcac55767e7f04334006c866

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

## 4. Edit the _.travis.yml_ 
```yml
    script: 
        - mvn install -Dgwt.version=$GWT_VERSION
        - mvn clean compile assembly:single
```

## 6. run the command:
    mvn clean compile assembly:single

## 7. check the content folder: 
    resty-gwt/restygwt/target

## 8. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 867b917c43c32acbdcac55767e7f04334006c866 
    Receive the output: 05733cb0d13bbfd97adc6a9eda47b4ea3dcf04e6  9d45c90a98203c46b16910b1470fead4b3ae09e4 

## 9. Checkout to left commit hash and repeat steps 6 and 7:
    git checkout 05733cb0d13bbfd97adc6a9eda47b4ea3dcf04e6

## 10. Checkout to right commit hash and repeat steps 6 and 7:
    git checkout 9d45c90a98203c46b16910b1470fead4b3ae09e4

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 05733cb0d13bbfd97adc6a9eda47b4ea3dcf04e6 9d45c90a98203c46b16910b1470fead4b3ae09e4
    Receive the output: 3f31a3f9f78c642fa0035c932ccdf1ff4c5e5583 

## 12. Checkout to base commit hash and repeat steps 6 and 7:
    git checkout 3f31a3f9f78c642fa0035c932ccdf1ff4c5e5583 