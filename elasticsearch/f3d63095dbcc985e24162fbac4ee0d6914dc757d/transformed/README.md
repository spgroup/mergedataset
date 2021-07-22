1. Clone the project:  
   `git clone https://github.com/elastic/elasticsearch`
2. Checkout to merge commit hash:  
   `git checkout f3d63095dbcc985e24162fbac4ee0d6914dc757d`
3. Copy the content of **elasticsearch/plugins/analysis-kuromoji/src** and paste in **elasticsearch/core/src**
4. Add the new dependency declaration in the **pom.xml** on the directory **elasticsearch/core**:

```
    <dependency>
        <groupId>org.apache.lucene</groupId>
        <artifactId>lucene-analyzers-kuromoji</artifactId>
    </dependency>
```
5. Add the new plugin declaration in the **pom.xml** on the directory **elasticsearch/core**:

```
   <plugin>
      <artifactId>maven-assembly-plugin</artifactId>
      <version>2.3</version>
      <configuration>
          <descriptor>src/main/assembly/assembly.xml</descriptor>
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

6. Create an **assembly.xml** file on the directory **elasticsearch/core/src/main/assembly** with the following content

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
7. Fix transformations
   After applying the transformations, some classes will have compilation errors. To fix then, follow the instructions below:
   - **org.elasticsearch.index.analysis.synonyms.SynonymsAnalysisTest** and **org.elasticsearch.index.analysis.commongrams.CommonGramsTokenFilterFactoryTests**
    - Adding the follow header in de beginning of each class:
    ```
    /*
        * Licensed to Elasticsearch under one or more contributor
        * license agreements. See the NOTICE file distributed with
        * this work for additional information regarding copyright
        * ownership. Elasticsearch licenses this file to you under
        * the Apache License, Version 2.0 (the "License"); you may
        * not use this file except in compliance with the License.
        * You may obtain a copy of the License at
        *
        *    http://www.apache.org/licenses/LICENSE-2.0
        *
        * Unless required by applicable law or agreed to in writing,
        * software distributed under the License is distributed on an
        * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
        * KIND, either express or implied.  See the License for the
        * specific language governing permissions and limitations
        * under the License.
    */
    ``` 
   - **org.elasticsearch.index.analysis.KuromojiAnalysisTests**
    - Manually change the protected and private methods and fields to public.
8. Inside the folder **core** run the command:
   `mvn clean compile test-compile assembly:single`
9. check the contents folder **elasticsearch/core/target**.
10. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 f3d63095dbcc985e24162fbac4ee0d6914dc757d`.  
   Receive the output: `be638fb6ef894f26464cd9b1702084d00a96eec7 4010e7e9a7148d66d5fb3699c5a042053efea1f4`
11. Checkout to left commit hash and repeat steps 3-8:  
   `git checkout be638fb6ef894f26464cd9b1702084d00a96eec7`
12. Checkout to right commit hash and repeat steps 3-8:  
   `git checkout 4010e7e9a7148d66d5fb3699c5a042053efea1f4`
13. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base be638fb6ef894f26464cd9b1702084d00a96eec7 4010e7e9a7148d66d5fb3699c5a042053efea1f4`.  
   Receive the output: `dcf3f4679f5ca7cac6913ef247b7c6323af6997c`
14. Checkout to base commit hash and repeat steps 3-9:  
    `git checkout dcf3f4679f5ca7cac6913ef247b7c6323af6997c`