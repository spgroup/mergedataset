1. Clone the project:  
   `git clone https://github.com/PhilJay/MPAndroidChart.git`
2. Checkout to merge commit hash:  
   `git checkout af114d180da6ec5633d32c701ff5467f7629fcf3`
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
   Run: `git log --pretty=%P -n 1 af114d180da6ec5633d32c701ff5467f7629fcf3`.  
   Receive the output: `f01b90668be552ec5139264cda72c0924a5451e3 0f3f4b75b0e8bb386dd1618b50e7240a572e6eda`
7. Checkout to left commit hash and repeat steps 4 and 5:  
   `git checkout f01b90668be552ec5139264cda72c0924a5451e3`
8. Checkout to right commit hash and repeat steps 4 and 5:  
   `git checkout 0f3f4b75b0e8bb386dd1618b50e7240a572e6eda`
9. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base f01b90668be552ec5139264cda72c0924a5451e3 0f3f4b75b0e8bb386dd1618b50e7240a572e6eda`.  
   Receive the output: `cb0226b2312dcd69c16d4dc0825f02c72471a8d8`
10. Checkout to base commit hash and repeat steps 4 and 5:  
    `git checkout cb0226b2312dcd69c16d4dc0825f02c72471a8d8`
