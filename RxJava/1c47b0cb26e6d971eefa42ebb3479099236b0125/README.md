 ## 1. Clone the project 
    git clone https://github.com/ReactiveX/RxJava

## 2. Checkout to merge the commit hash
    git checkout 1c47b0cb26e6d971eefa42ebb3479099236b0125

## 3. Update the gradle/wrapper/gradle-wrapper.properties to use the https url:
```
distributionUrl=https\://services.gradle.org/distributions/gradle-1.6-bin.zip
``` 
## 4. Update build.gradle to use https on the repositories:
```
buildscript {
    repositories {
        mavenLocal()
        maven { url 'https://jcenter.bintray.com' }
    }
    apply from: file('gradle/buildscript.gradle'), to: buildscript 
}

allprojects {
    repositories { 
        mavenLocal()
        maven { url 'https://jcenter.bintray.com' }
    }
}
```
## 5. Execute the build for only the needed class
./gradlew :rxjava-core:build

