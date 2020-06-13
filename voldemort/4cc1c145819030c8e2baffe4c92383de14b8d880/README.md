1. Clone the project:  
   `git clone https://github.com/voldemort/voldemort/`
2. Checkout to merge commit hash:  
   `git checkout 4cc1c145819030c8e2baffe4c92383de14b8d880`
3. Substitute the buildscript at the build.gradle to:
```
buildscript {
  repositories { jcenter { url "https://jcenter.bintray.com/"}}
  dependencies {
    classpath 'com.github.jengelman.gradle.plugins:shadow:1.2.1'
  }
}
```
4. Substitute the repositories at the build.gradle to:
```
repositories {
    maven {
        url "https://repo1.maven.org/maven2"
    }
    maven {
        // For Hadoop dependencies
        url "https://repository.cloudera.com/artifactory/cloudera-repos/"
    }
    flatDir { dirs privateLibDir }
    flatDir { dirs contribRootDir }
}
```
5. Execute `./gradlew assemble testClasses`

