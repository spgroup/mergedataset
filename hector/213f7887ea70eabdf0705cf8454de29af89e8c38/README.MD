1. Clone the project:  
   `git clone https://github.com/hector-client/hector`
2. Checkout to merge commit hash:  
   `git checkout 213f7887ea70eabdf0705cf8454de29af89e8c38`
3. Replace the plugin declaration with artifactID 'maven-assembly-plugin' and add new declarations in the **pom.xml**:
```
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
4. Inside the folder **core** run the command:
   `mvn clean compile assembly:single`
5. check the contents folder **core/target**.
6. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 213f7887ea70eabdf0705cf8454de29af89e8c38`.  
   Receive the output: `25c2810ab1f656783fa38a4bef994c7511be8ac8 5cfd9c79bf00de3456479bf9ed5dd1c8436537b9`
7. Checkout to left commit hash and repeat steps 3-5:  
   `git checkout 25c2810ab1f656783fa38a4bef994c7511be8ac8`
8. Checkout to right commit hash:  
   `git checkout 5cfd9c79bf00de3456479bf9ed5dd1c8436537b9`
9. Repeat step 3.
10. In the pom file, change the follow dependencies:
```
    <dependency>
      <groupId>org.apache.cassandra</groupId>
      <artifactId>apache-cassandra</artifactId>
      <version>0.8.0-20110415</version>
    </dependency>
    <dependency>
      <groupId>org.apache.cassandra</groupId>
      <artifactId>apache-cassandra-thrift</artifactId>
      <version>0.8.0-20110415</version>
    </dependency>
    <dependency>
      <groupId>org.apache.cassandra.deps</groupId>
      <artifactId>libthrift</artifactId>
      <version>0.6.0</version>
    </dependency>
```
For these:
```
    <dependency>
      <groupId>org.apache.cassandra</groupId>
      <artifactId>cassandra-all</artifactId>
      <version>0.8.0-beta1</version>
    </dependency>
    <dependency>
      <groupId>org.apache.cassandra</groupId>
      <artifactId>cassandra-thrift</artifactId>
      <version>0.8.0-beta1</version>
    </dependency>
    <dependency>
      <groupId>org.apache.thrift</groupId>
      <artifactId>libthrift</artifactId>
      <version>0.6.1</version>
    </dependency>
```
11. In the file **core\src\main\java\me\prettyprint\cassandra\model\HColumnImpl.java** change the line 36-37 to:
```
    this.column = new Column(nameSerializer.toByteBuffer(name));
    this.column.setValue(valueSerializer.toByteBuffer(value));
    this.column.setTimestamp(clock);
```
12. In the file **core\src\main\java\me\prettyprint\cassandra\service\KeyspaceServiceImpl.java** change the line 428 to:
```
    Column column = new Column(ByteBuffer.wrap(columnPath.getColumn()));
    column.setValue(value);
    column.setTimestamp(connectionManager.createClock());
```
and the line 439 to:
```
    Column column = new Column(ByteBuffer.wrap(columnPath.getColumn()));
    column.setValue(value);
    column.setTimestamp(timestamp);
```
14. Repeat steps 4 and 5.
15. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base 25c2810ab1f656783fa38a4bef994c7511be8ac8 5cfd9c79bf00de3456479bf9ed5dd1c8436537b9`.  
   Receive the output: `14319170f6bf183b2533908beb1f1356fe0f26de`
16. Checkout to base commit hash and repeat steps 9-14:  
    `git checkout 14319170f6bf183b2533908beb1f1356fe0f26de`
