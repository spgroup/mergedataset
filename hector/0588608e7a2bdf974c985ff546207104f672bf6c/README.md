## 1. Clone the project 
    git clone https://github.com/hector-client/hector

## 2. Checkout to merge the commit hash
    git checkout 0588608e7a2bdf974c985ff546207104f672bf6c

# 3. Add maven-assembly-plugin in the build tag on the pom.xml at the root of the project:

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
    hector/core/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 0588608e7a2bdf974c985ff546207104f672bf6c
    Receive the output: 454646160a073e61cee1d3d0cb6f493b0825c875 beaab18b64cd4d4c05f5cb13b85f5ac47c2d8822

## 7. Checkout to left commit hash and repeat steps 3, 4, and 5:
    git checkout 454646160a073e61cee1d3d0cb6f493b0825c875

## 10. Checkout to right commit hash and repeat steps 3, 4, and 5:
    git checkout beaab18b64cd4d4c05f5cb13b85f5ac47c2d8822

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 454646160a073e61cee1d3d0cb6f493b0825c875 beaab18b64cd4d4c05f5cb13b85f5ac47c2d8822
    Receive the output: 4287af4cbd4922148ecc8262c4cef4b56db9d611

## 12. Checkout to base commit hash and repeat steps 3, 4, and 5:
    git checkout 4287af4cbd4922148ecc8262c4cef4b56db9d611