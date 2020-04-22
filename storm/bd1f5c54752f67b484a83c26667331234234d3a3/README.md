 ## 1. Clone the project 
    git clone https://github.com/apache/storm

## 2. Checkout to merge the commit hash
    git checkout bd1f5c54752f67b484a83c26667331234234d3a3

## 3. Remove the plugin at root pom project ```<artifactId>maven-assembly-plugin</artifactId>```

## 4. Edit the version tag the _pom.xml_ at _all the project_, searching for pom.xml at root project and remove _-SNAPSHOT_ version

```xml
<version>2.3.0-SNAPSHOT</version>
``` 
Change to:
```xml
<version>2.3.0</version>
``` 
## 5. Insert the s at url ```<url>http://repo1.maven.org/maven2/</url>```, change to ```<url>https://repo1.maven.org/maven2/</url>```

## PS.: The build should be run at each module separately, but first edit the root build file
## PS.: Start with the storm-core directory module and then go to the external directory and run separately each module

## 6. Edit the build tag (```<build> <plugins> ```  HERE ... ```</plugins> </build>```) on the _pom.xml_ at the root of the project e at all the modules add the plugin. PS.: If the _pom.xml_ file of any module does not have build tag, insert it


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

## 7. Run the command:
    mvn clean compile assembly:single

## 8. Check the content folder: 
    storm/.../module/target

## 9. Repeat the steps above with the other necessary modules, the step 5 is not necessary

## 10. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 bd1f5c54752f67b484a83c26667331234234d3a3
    Receive the output: 11fcaff0e3f807419db2609bab07e0efb47f8df2 a912cf3fa90338d8a6f7d5ac386272c5de93c448

## 11. Checkout to left commit hash and repeat steps 3 to 8:
    git checkout 11fcaff0e3f807419db2609bab07e0efb47f8df2

## 13. Checkout to right commit hash and repeat steps 3 to 8:
    git checkout a912cf3fa90338d8a6f7d5ac386272c5de93c448

## 15. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 95e310c5cf635bb1947796c0f98eaba46d102504 41d97a409bf462d8104e18d256ab6b88690d8830
    Receive the output: 43bdc03066c850202970ce48d16f354be14c1a50

## 16. Checkout to base commit hash and repeat steps 3 to 8:
    git checkout 43bdc03066c850202970ce48d16f354be14c1a50
