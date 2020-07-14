1. Clone the project:  
   `git clone https://github.com/voldemort/voldemort/`
2. Checkout to merge commit hash:  
   `git checkout b30fdfebe30c9b6e37b9fbc3fec0ff74cd19f997`
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