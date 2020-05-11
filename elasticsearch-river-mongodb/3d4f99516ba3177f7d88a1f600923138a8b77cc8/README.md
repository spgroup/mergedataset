## 1. Clone the project 
    git clone https://github.com/richardwilly98/elasticsearch-river-mongodb

## 2. Checkout to merge the commit hash
    git checkout 3d4f99516ba3177f7d88a1f600923138a8b77cc8

## 3. Replace the plugin with artifactId maven-assembly-plugin in the build tag on the _pom.xml_ at the root of the project for:

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
    elasticsearch-river-mongodb/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 3d4f99516ba3177f7d88a1f600923138a8b77cc8
    Receive the output: 02dc4e1419bb6247442bb88fb3a3e20291de7ae4 cbcc29537b740381934fb877ca51b713fdc6beb9

## 7. Checkout to left commit hash and repeat steps 3 and 4:
    git checkout 02dc4e1419bb6247442bb88fb3a3e20291de7ae4

## 8. Checkout to right commit hash and repeat steps 3 and 4:
    git checkout cbcc29537b740381934fb877ca51b713fdc6beb9

## 9. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 02dc4e1419bb6247442bb88fb3a3e20291de7ae4 cbcc29537b740381934fb877ca51b713fdc6beb9
    Receive the output: 3d3667e5f36ef35f02c49853551499e7e2ab5e19

## 10. Checkout to base commit hash and repeat steps 3 and 4:
    git checkout 3d3667e5f36ef35f02c49853551499e7e2ab5e19


