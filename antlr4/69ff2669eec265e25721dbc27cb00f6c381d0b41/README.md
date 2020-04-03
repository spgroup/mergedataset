 ## 1. Clone the project 
    git clone https://github.com/antlr/antlr4.git

## 2. Checkout to merge the commit hash
    git checkout 69ff2669eec265e25721dbc27cb00f6c381d0b41

## 3. Edit the modules tag on the __pom.xml__ at the root of the project

```xml
<modules>
    <module>runtime/Java</module>
    <module>tool</module>
    <module>antlr4-maven-plugin</module>
</modules>
``` 
## 4. Edit the build tag on the __pom.xml__ at the root of the project add the plugin

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
## 5. Edit the __.travis.yml__ 
```yml
script:
  - mvn install
  - mvn clean compile assembly:single
```
## 6. run the command:
    mvn clean compile assembly:single

## 7. check the content folder: 
    antlr4/tool/target

## 8. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 69ff2669eec265e25721dbc27cb00f6c381d0b41
    Receive the output: 196c4d59132170a3e849e445da54cefc6ea2db45 99b2d6616ff03d3b0e4751880ff652dd6641c586

## 9. Checkout to left commit hash and repeat steps 6 and 7:
    git checkout 196c4d59132170a3e849e445da54cefc6ea2db45

## 10. Checkout to right commit hash and repeat steps 6 and 7:
    git checkout 99b2d6616ff03d3b0e4751880ff652dd6641c586

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 196c4d59132170a3e849e445da54cefc6ea2db45 99b2d6616ff03d3b0e4751880ff652dd6641c586
    Receive the output: d0fb48c2b89128158950f4b32a61d50d52d981ea

## 12. Checkout to base commit hash and repeat steps 6 and 7:
    git checkout d0fb48c2b89128158950f4b32a61d50d52d981ea


