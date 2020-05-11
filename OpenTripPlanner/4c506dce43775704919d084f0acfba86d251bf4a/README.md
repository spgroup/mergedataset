## 1. Clone the project 
    git clone https://github.com/opentripplanner/OpenTripPlanner

## 2. Checkout to merge the commit hash
    git checkout 4c506dce43775704919d084f0acfba86d251bf4a

## 3. Edit the build tag on the _pom.xml_ at the root of the project add the plugin

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
    OpenTripPlanner/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 4c506dce43775704919d084f0acfba86d251bf4a
    Receive the output: 4585d3ae1d67b9fc56831751c5f8362239287fec aa201f789f1e9927a7972a9dd8b985ca6c36bec2

## 7. Checkout to left commit hash and repeat steps 3 and 4:
    git checkout 4585d3ae1d67b9fc56831751c5f8362239287fec

## 10. Checkout to right commit hash and repeat steps 3 and 4:
    git checkout aa201f789f1e9927a7972a9dd8b985ca6c36bec2

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 4585d3ae1d67b9fc56831751c5f8362239287fec aa201f789f1e9927a7972a9dd8b985ca6c36bec2
    Receive the output: d0fb48c2b89128158950f4b32a61d50d52d981ea

## 12. Checkout to base commit hash and repeat steps 3 and 4:
    git checkout 787e2cb7704de4f070a1c7556d86e0f30c35b866


