1. Clone the project:  
   `git clone https://github.com/webbit/webbit/`
2. Checkout to merge commit hash:  
   `git checkout 74d2d2b87704d003acacb34e4ca8fb5f897b938f`
3. Add the plugin maven-assembly-plugin in the **pom.xml**:

```maven
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

4. Inside the main folder run the command:
   `mvn clean compile assembly:single`

5. check the contents folder **webbit/target**.
6. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 74d2d2b87704d003acacb34e4ca8fb5f897b938f`.  
   Receive the output: `0d57793d92a4fd8799845c7adb356644c1128a6f 92c8b2896b3e09afe996278b9ce6f952b02c8c99`
7. Checkout to left commit hash and repeat steps 3-5:  
   `git checkout 0d57793d92a4fd8799845c7adb356644c1128a6f`
8. Checkout to right commit hash and repeat steps 3-5:  
   `git checkout 92c8b2896b3e09afe996278b9ce6f952b02c8c99`
9. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base 0d57793d92a4fd8799845c7adb356644c1128a6f 92c8b2896b3e09afe996278b9ce6f952b02c8c99`.  
   Receive the output: `2ba2b9b0403b9973d26fbc7c2be95fb993d318a2`
10. Checkout to base commit hash and repeat steps 3-5:  
    `git checkout 2ba2b9b0403b9973d26fbc7c2be95fb993d318a2`
