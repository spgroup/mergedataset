## 1. Clone the project 
    git clone https://github.com/hector-client/hector

## 2. Checkout to merge the commit hash
    git checkout a33a46506656a39d1b0f7780973905665d3b6145

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
    Run: git log --pretty=%P -n 1 a33a46506656a39d1b0f7780973905665d3b6145
    Receive the output: 651a11421dbdcb31f758184cd768989ef88da3c1 2bf74f9177c2489e69397695e304dc08430db166

## 7. Checkout to left commit hash and repeat steps 3, 4, and 5:
    git checkout 651a11421dbdcb31f758184cd768989ef88da3c1

## 8. Checkout to right commit hash and repeat steps 3, 4, and 5:
    git checkout 2bf74f9177c2489e69397695e304dc08430db166

## 9. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 651a11421dbdcb31f758184cd768989ef88da3c1 2bf74f9177c2489e69397695e304dc08430db166
    Receive the output: f764d6f3a1aab3245e2d657265c6d319dd036f80

## 10. Checkout to base commit hash and repeat steps 3, 4, and 5:
    git checkout f764d6f3a1aab3245e2d657265c6d319dd036f80