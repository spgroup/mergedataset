 ## 1. Clone the project 
    git clone https://github.com/Atmosphere/atmosphere.git

## 2. Checkout to merge the commit hash
    git checkout ffc0c6e274094c6423e29d1c45bab1593b8fac7d

## 3. Edit the build tag (```<build> <plugins> ```  HERE ... ```</plugins> </build>```) on the _pom.xml_ at the directory **atmosphere/modules/cpr**:


```xml
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

## 4. Create an **assembly.xml** file on the directory **atmosphere/modules/cpr/src/main/assembly** with the following content

```xml
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

## 5. Run the command:
    mvn clean compile test-compile assembly:single

## 6. Check the content folder: 
    atmosphere/modules/cpr/target

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 ffc0c6e274094c6423e29d1c45bab1593b8fac7d
    Receive the output: 95e310c5cf635bb1947796c0f98eaba46d102504 41d97a409bf462d8104e18d256ab6b88690d8830

## 8. Checkout to left commit hash and repeat the steps 3 to 6:
    git checkout 95e310c5cf635bb1947796c0f98eaba46d102504

## 9. Checkout to right commit hash and repeat the steps 3 to 6:
    git checkout 41d97a409bf462d8104e18d256ab6b88690d8830

## 10. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 95e310c5cf635bb1947796c0f98eaba46d102504 41d97a409bf462d8104e18d256ab6b88690d8830
    Receive the output: d072d5d4b3ce20c715bad64b9303189d4726fecc

## 11. Checkout to base commit hash and repeat the steps 3 to 6:
    git checkout d072d5d4b3ce20c715bad64b9303189d4726fecc


