 ## 1. Clone the project 
    git clone https://github.com/unclebob/fitnesse.git

## 2. Checkout to merge the commit hash
    git checkout 4d9ba9d221d879507440feb084fa7521b95111ec

## 3. Edit the property tag at _build.xml_ file

```xml
<property name="maven.central.url" value="http://repo2.maven.org/maven2" />
``` 
Change to:
```xml
<property name="maven.central.url" value="https://repo1.maven.org/maven2"/>
``` 

## 5. Run the command:
    ant standalone-jar

## 6. Check the content folder: 
    fitnesse/dist/

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 4d9ba9d221d879507440feb084fa7521b95111ec
    Receive the output: d24741cd3b99b5ee48f0eac7bbf270daf1c4f15c 6c383370ed88bb77508c5158ee726ea607ad7ed1

## 8. Checkout to left commit hash and repeat the steps 3 to 6:
    git checkout d24741cd3b99b5ee48f0eac7bbf270daf1c4f15c

## 9. Checkout to right commit hash and repeat the steps 3 to 6:
    git checkout 6c383370ed88bb77508c5158ee726ea607ad7ed1

## 10. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base d24741cd3b99b5ee48f0eac7bbf270daf1c4f15c 6c383370ed88bb77508c5158ee726ea607ad7ed1
    Receive the output: 87a4b54f94f7dbe48bdfde0dae874e36d48f43df

## 11. Checkout to base commit hash and repeat the steps 3 to 6:
    git checkout 87a4b54f94f7dbe48bdfde0dae874e36d48f43df


