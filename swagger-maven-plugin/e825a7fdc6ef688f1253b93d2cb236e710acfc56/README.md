 ## 1. Clone the project 
    git clone https://github.com/kongchen/swagger-maven-plugin.git

## 2. Checkout to merge the commit hash
    git checkout e825a7fdc6ef688f1253b93d2cb236e710acfc56

## 3. Edit the build (```<build> <plugins> ```  HERE ... ```</plugins> </build>```) tag on the _pom.xml_ at the root and add the plugin

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

## 4. Run the command:
    mvn clean compile assembly:single

## 5. Check the content folder: 
    swagger-maven-plugin/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 e825a7fdc6ef688f1253b93d2cb236e710acfc56
    Receive the output: 39a512a79124eba3589eed6c90318717615bcbc7 e19c57742dc052b771e634d804a41ca957176054

## 7. Checkout to left commit hash and repeat the steps 3 to 5:
    git checkout 39a512a79124eba3589eed6c90318717615bcbc7

## 9. Checkout to right commit hash and repeat the steps 3 to 5:
    git checkout e19c57742dc052b771e634d804a41ca957176054

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 39a512a79124eba3589eed6c90318717615bcbc7 e19c57742dc052b771e634d804a41ca957176054
    Receive the output: b060894dcff216094743904f8a71228b21a093ed

## 12. Checkout to base commit hash and repeat the steps 3 to 5:
    git checkout b060894dcff216094743904f8a71228b21a093ed


