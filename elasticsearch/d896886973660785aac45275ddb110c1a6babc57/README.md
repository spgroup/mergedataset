1. Clone the project:  
   `git clone https://github.com/elastic/elasticsearch`
2. Checkout to merge commit hash:  
   `git checkout d896886973660785aac45275ddb110c1a6babc57`
3. Replace the **build.gradle** at the **core** folder of the project:
   ```gradle 
   task fatJar(type: Jar) {
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
4. Inside the folder **core** run the command:
   `gradle clean fatjar`
5. check the contents folder **elasticsearch/core/build/distributions**.
6. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 d896886973660785aac45275ddb110c1a6babc57`.  
   Receive the output: `90ef933404ae1d8aeaab97d9c0ab6925ee22add1 be168f528bbffcbc026fe427869c8e458d275156`
7. Checkout to left commit hash and repeat steps 3-5:  
   `git checkout 90ef933404ae1d8aeaab97d9c0ab6925ee22add1`
8. Checkout to right commit hash and repeat steps 3-5:  
   `git checkout be168f528bbffcbc026fe427869c8e458d275156`
9. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base 90ef933404ae1d8aeaab97d9c0ab6925ee22add1 be168f528bbffcbc026fe427869c8e458d275156`.  
   Receive the output: `0a8afa2e7269ddbec3755b8f10033e93f55149c2`
10. Checkout to base commit hash and repeat steps 3-5:  
    `git checkout 0a8afa2e7269ddbec3755b8f10033e93f55149c2`
