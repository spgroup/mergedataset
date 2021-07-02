## 1. Clone the project:  
   `git clone https://github.com/elastic/elasticsearch`

## 2. Install Java 8 locally

## 3. Execute the following steps to install gradle version 2.13:
   * Download the "complete" option for the release 2.13 in the [Gradle Releases Page](https://gradle.org/releases/)
   * Create a directory for the gradle installation
      `mkdir /opt/gradle`
   * Unzip the downloaded file on the installation directory
      `unzip -d /opt/gradle gradle-2.13-all.zip`
   * Configure your path so that you can execute the gradle command
      `export PATH=$PATH:/opt/gradle/gradle-2.13/bin`

## 4. Checkout to merge commit hash:  
   `git checkout 3764b3ff800c94293aba0bb0fa18c7df80a764f7`

## 5. Add the following task on the elasticsearch/core/build.gradle
   ```task fatJar(type: Jar) {
       manifest {
           attributes 'Implementation-Title': 'Gradle Jar File Example',  
              'Implementation-Version': version,
              'Main-Class': 'com.mkyong.DateUtils'
       }
       baseName = project.name + '-all'
       from { (configurations.runtime).collect { it.isDirectory() ? it : zipTree(it) } } {
       exclude 'META-INF/*.RSA', 'META-INF/*.SF', 'META-INF/*.DSA'
       }
       with jar
   }

   tasks.withType(JavaCompile) {
    options.warnings = false
   }
   ```

## 6. As the target classes involved in this scenario extend other, some errors were caused by applying the testability transformtions. Follow the instruction bellow for each file:
   - RestIndicesAction: apply all testability transformations
   - RestShardsAction: all testability transformations, but manually remove the empty constructor
   - RestNodesAction: all testability transformations, but manually remove the empty constructor

## 7. On the main directory, run:
   `/opt/gradle/gradle-2.13/bin/gradle clean idea`

## 8. On the main directory elasticsearch/core, run:
   `/opt/gradle/gradle-2.13/bin/gradle clean fatJar`

## 9. The generated jar file will be on elasticsearch/core/build/libs

## 10. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 3764b3ff800c94293aba0bb0fa18c7df80a764f7
    Receive the output: 533c967a2d7e5d4fc610311e18ec81f0cb964384 51ac97000b0c433433d926f2179322043f965ec3

## 11. Checkout to left commit hash and repeat steps 5 to 9:
    git checkout -f 533c967a2d7e5d4fc610311e18ec81f0cb964384

## 12. Checkout to right commit hash and repeat steps 5 to 9:
    git checkout -f 51ac97000b0c433433d926f2179322043f965ec3

## 13. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 533c967a2d7e5d4fc610311e18ec81f0cb964384 51ac97000b0c433433d926f2179322043f965ec3
    Receive the output: b5709fd6183bb283b7294b77a477528e03483d10  

## 14. Checkout to base commit hash and repeat steps 5 to 9:
    git checkout -f e32da555aa56b20f914610282392f51c2d12b8ac
