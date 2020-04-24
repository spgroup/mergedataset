1. Clone the project:  
   `git clone https://github.com/PhilJay/MPAndroidChart.git`
2. Checkout to merge commit hash:  
   `git checkout 9531ba69895cd64fce48038ffd8df2543eeea1d2`
3. Edit the **build.gradle** at the root of the project:

   ```groovy
   apply plugin: 'gradle-one-jar'

   task awesomeFunJar(type: OneJar) {
        mainClass = 'com.xxmassdeveloper.mpchartexample.fragments.SimpleFragment.java'
        archiveName = '9531ba69895cd64fce48038ffd8df2543eeea1d2.jar'
   }
   task wrapper(type: Wrapper) {
        gradleVersion = '2.9'
   }

   buildscript {
        repositories {
            jcenter()
            mavenCentral()
        }

        dependencies {
            //classpath "io.realm:realm-gradle-plugin:1.0.0"
            classpath 'com.android.tools.build:gradle:2.1.2'
            classpath 'com.github.dcendents:android-maven-gradle-plugin:1.3'
            classpath 'com.github.rholder:gradle-one-jar:1.0.4'
        }
   }
   allprojects {
        repositories {
            jcenter()
            maven {url 'https://maven.google.com'}
        }
   }

   artifacts {
        archives awesomeFunJar
   }
   ```

4. run the command:
   `./gradlew build`

5. check the contents folder **MPAndroidChart/MPChartLib/build/libs**.
6. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 9531ba69895cd64fce48038ffd8df2543eeea1d2`.  
   Receive the output: `1b351934e282827afbdf87e11022d852b07163a0 aa7cbce0330de983dac26bf0cda3a23b46b4df1d`
7. Checkout to left commit hash and repeat steps 4 and 5:  
   `git checkout 1b351934e282827afbdf87e11022d852b07163a0`
8. Checkout to right commit hash and repeat steps 4 and 5:  
   `git checkout aa7cbce0330de983dac26bf0cda3a23b46b4df1d`
9. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base 1b351934e282827afbdf87e11022d852b07163a0 aa7cbce0330de983dac26bf0cda3a23b46b4df1d`.  
   Receive the output: `a0347bb782810992ad015e0dc1b90e1b71658ea2`
10. Checkout to base commit hash and repeat steps 4 and 5:  
    `git checkout a0347bb782810992ad015e0dc1b90e1b71658ea2`
