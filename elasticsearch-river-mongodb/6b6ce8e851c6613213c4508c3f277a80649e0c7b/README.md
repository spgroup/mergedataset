## 1. Clone the project 
    git clone https://github.com/richardwilly98/elasticsearch-river-mongodb

## 2. Checkout to merge the commit hash
    git checkout 6b6ce8e851c6613213c4508c3f277a80649e0c7b

# 3. Replace the plugin with artifactId maven-assembly-plugin in the build tag on the pom.xml at the root of the project for:

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
    elasticsearch-river-mongodb/target

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 6b6ce8e851c6613213c4508c3f277a80649e0c7b
    Receive the output: 5d7c50df2bc6dedee4ae05c612572fe5e267a617 0fb6b4001f03b4732d4d65e78d9f262af3007ad4

## 7. Checkout to left commit hash and repeat steps 3, 4, and 5:
    git checkout 5d7c50df2bc6dedee4ae05c612572fe5e267a617

## 8. Checkout to right commit hash and repeat steps 3, 4, and 5:
    git checkout 0fb6b4001f03b4732d4d65e78d9f262af3007ad4

## 9. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 5d7c50df2bc6dedee4ae05c612572fe5e267a617 0fb6b4001f03b4732d4d65e78d9f262af3007ad4
    Receive the output: 9e1c3852df3e69505d5aeb30d3699019de4db104

## 10. Checkout to base commit hash and repeat steps 3, 4, and 5:
    git checkout 9e1c3852df3e69505d5aeb30d3699019de4db104