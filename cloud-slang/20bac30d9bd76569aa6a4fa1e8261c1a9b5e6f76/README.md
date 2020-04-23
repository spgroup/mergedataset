 ## 1. Clone the project 
    git clone https://github.com/CloudSlang/cloud-slang.git

## 2. Checkout to merge the commit hash
    git checkout 20bac30d9bd76569aa6a4fa1e8261c1a9b5e6f76

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
    cloud-slang/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 20bac30d9bd76569aa6a4fa1e8261c1a9b5e6f76
    Receive the output: bfd35a172d9a56fcb4aedd50624f6f227f0af22a 444c02648bd274a6adfbc6c1460d95ab76e95726

## 7. Checkout to left commit hash and repeat the steps 3 to 5:
    git checkout bfd35a172d9a56fcb4aedd50624f6f227f0af22a

## 9. Checkout to right commit hash and repeat the steps 3 to 5:
    git checkout 444c02648bd274a6adfbc6c1460d95ab76e95726

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base bfd35a172d9a56fcb4aedd50624f6f227f0af22a 444c02648bd274a6adfbc6c1460d95ab76e95726
    Receive the output: 3235e70f27c192ae7fd3376ee1cf4eea2db30df9

## 12. Checkout to base commit hash and repeat the steps 3 to 5:
    git checkout 3235e70f27c192ae7fd3376ee1cf4eea2db30df9


