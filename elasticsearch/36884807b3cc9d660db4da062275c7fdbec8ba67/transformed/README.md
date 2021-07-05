## 1. Clone the project:  
   `git clone https://github.com/elastic/elasticsearch`

## 2. Checkout to merge commit hash:  
   `git checkout 36884807b3cc9d660db4da062275c7fdbec8ba67`

## 3. Replace the plugin declaration with artifactID 'maven-assembly-plugin' and add new declarations in the **pom.xml**:

```
<plugin>
   <artifactId>maven-assembly-plugin</artifactId>
   <version>2.3</version>
   <configuration>
      <descriptor>src/main/assemblies/assembly.xml</descriptor>
   </configuration>
   <executions>
      <execution>
         <id>make-assembly</id>
         <phase>package</phase>
         <goals>
            <goal>single</goal>
         </goals>
         <configuration>
            <archive>
               <manifest>
                  <mainClass>com.sample.TestMain</mainClass>
               </manifest>
            </archive>
         </configuration>
      </execution>
   </executions>
</plugin>
```

## And remove the following plugin:
```
<plugin>
   <groupId>com.mycila</groupId>
   <artifactId>license-maven-plugin</artifactId>
   <version>2.5</version>
   <configuration>
       <header>dev-tools/elasticsearch_license_header.txt</header>
       <headerDefinitions>
           <headerDefinition>dev-tools/license_header_definition.xml</headerDefinition>
       </headerDefinitions>
       <includes>
           <include>src/main/java/org/elasticsearch/**/*.java</include>
           <include>src/test/java/org/elasticsearch/**/*.java</include>
       </includes>
       <excludes>
           <!-- Guice -->
           <exclude>src/main/java/org/elasticsearch/common/inject/**</exclude>
           <exclude>src/main/java/org/elasticsearch/common/geo/GeoHashUtils.java</exclude>
           <exclude>src/main/java/org/elasticsearch/common/lucene/search/XBooleanFilter.java</exclude>
           <exclude>src/main/java/org/elasticsearch/common/lucene/search/XFilteredQuery.java</exclude>
           <exclude>src/main/java/org/apache/lucene/queryparser/XSimpleQueryParser.java</exclude>
           <exclude>src/main/java/org/apache/lucene/**/X*.java</exclude>
           <!-- t-digest -->
           <exclude>src/main/java/org/elasticsearch/search/aggregations/metrics/percentiles/tdigest/TDigestState.java</exclude>
           <exclude>src/test/java/org/elasticsearch/search/aggregations/metrics/GroupTree.java</exclude>
           <!-- netty pipelining -->
           <exclude>src/main/java/org/elasticsearch/http/netty/pipelining/**</exclude>
       </excludes>
   </configuration>
   <executions>
       <execution>
           <phase>compile</phase>
           <goals>
               <goal>check</goal>
           </goals>
       </execution>
   </executions>
</plugin>
```

## 4. Add a new file on the folder **elasticsearch/src/main/assemblies** named assembly.xml, with the contents:
```
<assembly
    xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.3 http://maven.apache.org/xsd/assembly-1.1.3.xsd">
    <id>fat-tests</id>
    <formats>
        <format>jar</format>
    </formats>
    <includeBaseDirectory>false</includeBaseDirectory>
    <dependencySets>
        <dependencySet>
            <outputDirectory>/</outputDirectory>
            <useProjectArtifact>true</useProjectArtifact>
            <unpack>true</unpack>
            <scope>test</scope>
        </dependencySet>
    </dependencySets>
    <fileSets>
        <fileSet>
            <directory>${project.build.directory}/test-classes</directory>
            <outputDirectory>/</outputDirectory>
            <includes>
                <include>**/*.class</include>
            </includes>
            <useDefaultExcludes>true</useDefaultExcludes>
        </fileSet>
    </fileSets>
</assembly>
```

## 5. After applying the testability transformations, if required, removed the following constructor declaration on the target class:
```    
   public DummyQueryParser(){
    }

```

## 5. Inside the main folder, run the command:
   `mvn clean package -DskipTests`

## 6. Check the contents folder **elasticsearch/target** for the file **elasticsearch-2.0.0-SNAPSHOT-fat-tests.jar**.

## 7. Identify the left and right commit hashes: 
   Run: `git log --pretty=%P -n 1 36884807b3cc9d660db4da062275c7fdbec8ba67`.  
   Receive the output: `6046ecbab32a6a5ba27fd5ed3a60af17e278e754 11db3170cd373674e7ed6499e1ad4cfd1012687c`

## 8. Checkout to left commit hash and repeat steps 3-5:  
   `git checkout 6046ecbab32a6a5ba27fd5ed3a60af17e278e754`

## 9. Checkout to right commit hash and repeat steps 3-5:  
   `git checkout 11db3170cd373674e7ed6499e1ad4cfd1012687c`

## 10. Identify the base commit hash:
   Run: `git merge-base 6046ecbab32a6a5ba27fd5ed3a60af17e278e754 11db3170cd373674e7ed6499e1ad4cfd1012687c`.  
   Receive the output: `24ffcc28ac67dbd9ca6e27642121af17f7aaced7`

## 11. Checkout to base commit hash and repeat steps 3-5:  
    `git checkout 24ffcc28ac67dbd9ca6e27642121af17f7aaced7`
