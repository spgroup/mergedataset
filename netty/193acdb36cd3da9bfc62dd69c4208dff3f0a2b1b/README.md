 ## 1. Clone the project 
    git clone https://github.com/netty/netty

## 2. Checkout to merge the commit hash
    git checkout 193acdb36cd3da9bfc62dd69c4208dff3f0a2b1b

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

## 4. run the command:
    mvn clean compile assembly:single

## 5. check the content folder: 
    netty/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 193acdb36cd3da9bfc62dd69c4208dff3f0a2b1b 
    Receive the output: b3b096834cafc7f348583786d71567e9fa001b55 c2417c253c48bac942decfe923743d2b09d63a5f

## 7. Checkout to left commit hash and repeat steps 3-5:
    git checkout b3b096834cafc7f348583786d71567e9fa001b55

## 8. Checkout to right commit hash and repeat steps 3-5:
    git checkout c2417c253c48bac942decfe923743d2b09d63a5f

## 9. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base b3b096834cafc7f348583786d71567e9fa001b55 c2417c253c48bac942decfe923743d2b09d63a5f
    Receive the output: 2fc18a00f6ac61a365b73dd498dd2e38f1efa823

## 10. Checkout to base commit hash and repeat steps 3-5:
    git checkout 2fc18a00f6ac61a365b73dd498dd2e38f1efa823
