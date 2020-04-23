 ## 1. Clone the project 
    git clone https://github.com/Netflix/SimianArmy.git

## 2. Checkout to merge the commit hash
    git checkout 345ad9513aafff397050d613fa87ad06ddffe99d

## 3. Removed the test suits at _build.gradle_ if exists
```
test {
    useTestNG()
}
```

## 4. Edit the property tag at _build.gradle_ file, identified the main class, this case was LocalDbRecorder.class

```
apply plugin: 'java'

//create a single Jar with all dependencies
task fatJar(type: Jar) {
    manifest {
        attributes 'Implementation-Title': 'Gradle Jar File Example',  
            'Implementation-Version': version,
            'Main-Class': 'src.main.java.com.netflix.simianarmy.basic.LocalDbRecorder'
    }
    baseName = project.name + '-all'
    from { configurations.compile.collect { it.isDirectory() ? it : zipTree(it) } }
    with jar
}
``` 

## 5. Run the command:
    ./gradlew fatJar

## 6. Check the content folder: 
    SimianArmy/build/libs

## 7. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 345ad9513aafff397050d613fa87ad06ddffe99d
    Receive the output: 82773f09968724c7d724e1f567c7107ae75fe627 1f0f59500cfed90218c03e420853c2e75924443e

## 8. Checkout to left commit hash and repeat the steps 3 to 5:
    git checkout 82773f09968724c7d724e1f567c7107ae75fe627

## 9. Checkout to right commit hash and repeat the steps 3 to 5:
    git checkout 1f0f59500cfed90218c03e420853c2e75924443e

## 10. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 82773f09968724c7d724e1f567c7107ae75fe627 1f0f59500cfed90218c03e420853c2e75924443e
    Receive the output: 1ebd3e6d3c64f3041b3ea209fd803805d0832271

## 11. Checkout to base commit hash and repeat the steps 3 to 5:
    git checkout 1ebd3e6d3c64f3041b3ea209fd803805d0832271


