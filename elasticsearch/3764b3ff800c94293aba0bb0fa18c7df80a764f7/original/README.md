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

## 6. On the main directory, run:
   `/opt/gradle/gradle-2.13/bin/gradle clean idea`

## 7. On the main directory elasticsearch/core, run:
   `/opt/gradle/gradle-2.13/bin/gradle clean fatJar`

## 8. The generated jar file will be on elasticsearch/core/build/libs

## 9. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 3764b3ff800c94293aba0bb0fa18c7df80a764f7
    Receive the output: 533c967a2d7e5d4fc610311e18ec81f0cb964384 51ac97000b0c433433d926f2179322043f965ec3

## 10. Checkout to left commit hash and repeat steps 5 to 8:
    git checkout -f 533c967a2d7e5d4fc610311e18ec81f0cb964384

## 11. Checkout to right commit hash and repeat steps 5 to 8:
    git checkout -f 51ac97000b0c433433d926f2179322043f965ec3

## 12. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 533c967a2d7e5d4fc610311e18ec81f0cb964384 51ac97000b0c433433d926f2179322043f965ec3
    Receive the output: e32da555aa56b20f914610282392f51c2d12b8ac  

## 13. Checkout to base commit hash and repeat steps 5 to 8:
    git checkout -f e32da555aa56b20f914610282392f51c2d12b8ac
