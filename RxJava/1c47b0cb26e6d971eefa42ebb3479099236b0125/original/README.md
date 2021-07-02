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

## 5. Add a new task on rxjava-core/build.gradle
```
//create a single Jar with all dependencies
task fatJar(type: Jar) {
    manifest {
        attributes 'Implementation-Title': 'Gradle Jar File Example',  
            'Implementation-Version': version,
            'Main-Class': 'mainClass'
    }
    baseName = project.name + '-all'
    from { configurations.compile.collect { it.isDirectory() ? it : zipTree(it) } }
    with jar
}
```

## 6. Execute the build for only the needed class
./gradlew clean :rxjava-core:fatJar

## 7. Check the folder rxjava-core/build/libs and the generated jar is expected to be there

## 8. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 1c47b0cb26e6d971eefa42ebb3479099236b0125
    Receive the output: a2f04b0a495f9b8c5ad4ddf2ecbc85d90865992a 2519ef8164d6e3405c40c3f187b5477188d142aa

## 9. Checkout to left commit hash and repeat steps 3 to 7:
    git checkout -f a2f04b0a495f9b8c5ad4ddf2ecbc85d90865992a

## 10. Checkout to right commit hash and repeat steps 3 to 7:
    git checkout -f 2519ef8164d6e3405c40c3f187b5477188d142aa

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base a2f04b0a495f9b8c5ad4ddf2ecbc85d90865992a 2519ef8164d6e3405c40c3f187b5477188d142aa
    Receive the output: bafd440040db4097205b7105a777c2ab4f5af16f

## 12. Checkout to base commit hash and repeat steps 3 to 7:
    git checkout -f bafd440040db4097205b7105a777c2ab4f5af16f