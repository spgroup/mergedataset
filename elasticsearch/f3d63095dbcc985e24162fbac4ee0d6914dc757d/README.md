1. Clone the project:  
   `git clone https://github.com/elastic/elasticsearch`
2. Checkout to merge commit hash:  
   `git checkout f3d63095dbcc985e24162fbac4ee0d6914dc757d`
3. Add the new plugin declaration in the **pom.xml** on the directory **elasticsearch/core**:

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

5. check the contents folder **elasticsearch/core/target**.
6. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 f3d63095dbcc985e24162fbac4ee0d6914dc757d`.  
   Receive the output: `be638fb6ef894f26464cd9b1702084d00a96eec7 4010e7e9a7148d66d5fb3699c5a042053efea1f4`
7. Checkout to left commit hash and repeat steps 3-5:  
   `git checkout be638fb6ef894f26464cd9b1702084d00a96eec7`
8. Checkout to right commit hash and repeat steps 3-5:  
   `git checkout 4010e7e9a7148d66d5fb3699c5a042053efea1f4`
9. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base be638fb6ef894f26464cd9b1702084d00a96eec7 4010e7e9a7148d66d5fb3699c5a042053efea1f4`.  
   Receive the output: `dcf3f4679f5ca7cac6913ef247b7c6323af6997c`
10. Checkout to base commit hash and repeat steps 3-5:  
    `git checkout dcf3f4679f5ca7cac6913ef247b7c6323af6997c`
