1. Clone the project:  
   `git clone https://github.com/elastic/elasticsearch`
2. Checkout to merge commit hash:  
   `git checkout 36884807b3cc9d660db4da062275c7fdbec8ba67`
3. Replace the plugin declaration with artifactID 'maven-assembly-plugin' and add new declarations in the **pom.xml**:

```
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

4. Inside the folder **core** run the command:
   `mvn clean compile assembly:single`

5. check the contents folder **elasticsearch/target**.
6. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 36884807b3cc9d660db4da062275c7fdbec8ba67`.  
   Receive the output: `6046ecbab32a6a5ba27fd5ed3a60af17e278e754 11db3170cd373674e7ed6499e1ad4cfd1012687c`
7. Checkout to left commit hash and repeat steps 3-5:  
   `git checkout 6046ecbab32a6a5ba27fd5ed3a60af17e278e754`
8. Checkout to right commit hash and repeat steps 3-5:  
   `git checkout 11db3170cd373674e7ed6499e1ad4cfd1012687c`
9. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base 6046ecbab32a6a5ba27fd5ed3a60af17e278e754 11db3170cd373674e7ed6499e1ad4cfd1012687c`.  
   Receive the output: `24ffcc28ac67dbd9ca6e27642121af17f7aaced7`
10. Checkout to base commit hash and repeat steps 3-5:  
    `git checkout 24ffcc28ac67dbd9ca6e27642121af17f7aaced7`
