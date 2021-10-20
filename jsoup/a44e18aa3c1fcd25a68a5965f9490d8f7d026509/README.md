## 1. Clone the project 
    git clone https://github.com/jhy/jsoup

## 2. Checkout to merge the commit hash
    git checkout a44e18aa3c1fcd25a68a5965f9490d8f7d026509

## 3. Edit the _pom.xml_ at the root of the project
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
    jsoup/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 a44e18aa3c1fcd25a68a5965f9490d8f7d026509
    Receive the output: 38e20f43502027b897135e94e9119ae9341254ac e064bc4842d1412a0421435332f55908fddcc866

## 7. Checkout to left commit hash and repeat steps 3-5:
    git checkout 38e20f43502027b897135e94e9119ae9341254ac 

## 8. Checkout to right commit hash and repeat steps 3-5:
    git checkout e064bc4842d1412a0421435332f55908fddcc866

## 9. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 38e20f43502027b897135e94e9119ae9341254ac e064bc4842d1412a0421435332f55908fddcc866
    Receive the output: f9f37e19876202a1db257a9e59452b0f10035fbf

## 10. Checkout to base commit hash and repeat steps 3-5:
    git checkout f9f37e19876202a1db257a9e59452b0f10035fbf
