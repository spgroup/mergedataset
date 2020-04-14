 ## 1. Clone the project 
    git clone https://github.com/Atmosphere/atmosphere

## 2. Checkout to merge the commit hash
    git checkout ffc0c6e274094c6423e29d1c45bab1593b8fac7d

## 3. Edit the version tag the _pom.xml_ at _all the project_, searching for pom.xml at root project and remove _-SNAPSHOT_ version

```xml
<version>2.3.0-SNAPSHOT</version>
``` 
Change to:
```xml
<version>2.3.0</version>
``` 

## PS.: The build should be run at each module separately, but first edit the root build file

## 4. Edit the build tag (_<build> <plugins>_)  HERE ... _</plugins> </build>_) on the _pom.xml_ at the root of the project e at all the modules add the plugin. PS.: If the _pom.xml_ file of any module does not have build tag, insert it

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

## 5. run the command:
    mvn clean compile assembly:single

## 6. check the content folder: 
    atmosphere/.../module/target

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 ffc0c6e274094c6423e29d1c45bab1593b8fac7d
    Receive the output: 95e310c5cf635bb1947796c0f98eaba46d102504 41d97a409bf462d8104e18d256ab6b88690d8830

## 8. Checkout to left commit hash and repeat steps 6 and 7:
    git checkout 95e310c5cf635bb1947796c0f98eaba46d102504

## 9. Repeat the steps 3 to 6

## 10. Checkout to right commit hash and repeat steps 6 and 7:
    git checkout 41d97a409bf462d8104e18d256ab6b88690d8830

## 11. Repeat the steps 3 to 6

## 12. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 95e310c5cf635bb1947796c0f98eaba46d102504 41d97a409bf462d8104e18d256ab6b88690d8830
    Receive the output: d072d5d4b3ce20c715bad64b9303189d4726fecc

## 13. Checkout to base commit hash and repeat steps 6 and 7:
    git checkout d072d5d4b3ce20c715bad64b9303189d4726fecc

## 14. Repeat the steps 3 to 6

