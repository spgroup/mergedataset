## 1. Clone the project 
    git clone https://github.com/thinkaurelius/titan

## 2. Checkout to merge the commit hash
    git checkout 387c16ea05ef9fa312f37139228d2bbf61455ff4

## 3. Add the build tag on the _pom.xml_ at the titan/titan-core directory

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
    titan/titan-core/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 387c16ea05ef9fa312f37139228d2bbf61455ff4
    Receive the output: a3a3aca7421dffa8de5d0ed747ec45ca238d183a 43eef3b1eef467bc0aa9828319687b12854a5869

## 7. Checkout to left commit hash and repeat steps 3 and 4:
    git checkout a3a3aca7421dffa8de5d0ed747ec45ca238d183a

## 10. Checkout to right commit hash and repeat steps 3 and 4:
    git checkout 43eef3b1eef467bc0aa9828319687b12854a5869

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base a3a3aca7421dffa8de5d0ed747ec45ca238d183a 43eef3b1eef467bc0aa9828319687b12854a5869
    Receive the output: 67bf106dcc7470e2d6b7ef94734f200885bf35ee

## 12. Checkout to base commit hash and repeat steps 3 and 4:
    git checkout 67bf106dcc7470e2d6b7ef94734f200885bf35ee


