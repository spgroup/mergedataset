 ## 1. Clone the project 
    git clone https://github.com/kongchen/swagger-maven-plugin

## 2. Checkout to merge the commit hash
    git checkout e825a7fdc6ef688f1253b93d2cb236e710acfc56

## 3. Edit the build (```xml <build> <plugins> ```  HERE ... ```xml </plugins> </build>```) tag on the _pom.xml_ at the root and add the plugin

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

## 4. run the command:
    mvn clean compile assembly:single

## 5. check the content folder: 
    swagger-maven-plugin/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 e825a7fdc6ef688f1253b93d2cb236e710acfc56
    Receive the output: 39a512a79124eba3589eed6c90318717615bcbc7 e19c57742dc052b771e634d804a41ca957176054

## 7. Checkout to left commit hash and repeat steps 6 and 7:
    git checkout 39a512a79124eba3589eed6c90318717615bcbc7

## 8. Repeat the steps 3 to 5

## 9. Checkout to right commit hash and repeat steps 6 and 7:
    git checkout e19c57742dc052b771e634d804a41ca957176054

## 10. Repeat the steps 3 to 5

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 39a512a79124eba3589eed6c90318717615bcbc7 e19c57742dc052b771e634d804a41ca957176054
    Receive the output: b060894dcff216094743904f8a71228b21a093ed

## 12. Checkout to base commit hash and repeat steps 6 and 7:
    git checkout b060894dcff216094743904f8a71228b21a093ed

## 13. Repeat the steps 3 to 5

