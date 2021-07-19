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
    from { configurations.testRuntime.collect { it.isDirectory() ? it : zipTree(it) } } {
    exclude 'META-INF/*.RSA', 'META-INF/*.SF', 'META-INF/*.DSA'
    }
    from sourceSets.test.output
    with jar
   }
4. Disable the following verification by commenting it out in the file **elasticsearch/test/framework/src/main/java/org/elasticsearch/bootstrap/BootstrapForTesting.java**
   ```try {
    JarHell.checkJarHell();
   } catch (Exception e) {
    throw new RuntimeException("found jar hell in test classpath", e);
   } ```
5. Fix transformations
   After applying the transformations, some classes will have compilation errors. To fix then, follow the instructions below:
    - **org.elasticsearch.action.support.replication.ReplicationOperation**:
        - Remove repeated "public" fields appearances.
        - Remove empty constructors.
    - **org.elasticsearch.common.settings.IndexScopedSettings.java**:
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
        - Remove empty constructors.
    - **org.elasticsearch.index.IndexSettings.java**:
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
    - **org.elasticsearch.action.DocWriteResponse.java**:
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
    - **org.elasticsearch.cluster.metadata.MetaDataCreateIndexService.java**
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
    - **org.elasticsearch.action.support.replication.TransportReplicationAction.java**
        - Remove repeated "public" fields appearances.
        - Remove empty constructors.
    - **org.elasticsearch.action.admin.indices.flush.TransportShardFlushAction.java**
        - Apply transformations.
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
        - Remove empty constructors.
    - **org\elasticsearch\action\admin\indices\refresh\TransportShardRefreshAction.java**
        - Apply transformations.
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
        - Remove empty constructors.
    - **org.elasticsearch.action.support.replication.TransportWriteAction.java**
        - Apply transformations.
        - Remove empty constructors.
    - **org.elasticsearch.index.engine.InternalEngine.java**
        - Remove empty constructors.
    - **org.elasticsearch.index.seqno.GlobalCheckpointSyncAction**
        - Apply transformations.
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
        - Remove empty constructors.
    - **org.elasticsearch.action.support.replication.ReplicationOperationTests.java**
        - Remove empty constructors.
    - **org.elasticsearch.action.support.replication.TransportReplicationActionTests**
        - Apply transformations.
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
        - Remove empty constructors.
    - **org.elasticsearch.action.support.replication.TransportWriteActionTests**
        - Apply transformations.
    - **org.elasticsearch.index.engine.InternalEngineTests**
        - Change the getters and setters for static fields. Where you find "this" replace it with the class name.
    - **org.elasticsearch.action.bulk.TransportShardBulkAction**
        - Manually change the protected and private methods and fields to public.               
6. Inside the folder **core** run the command:
   `gradle clean fatjar`
7. check the contents folder **elasticsearch/core/build/distributions**.
8. Identify the left and right commit hash. (**git log --pretty=%P -n 1 <merge_commit_hash>**)  
   Run: `git log --pretty=%P -n 1 d896886973660785aac45275ddb110c1a6babc57`.  
   Receive the output: `90ef933404ae1d8aeaab97d9c0ab6925ee22add1 be168f528bbffcbc026fe427869c8e458d275156`
9. Checkout to left commit hash and repeat steps 3-6:  
   `git checkout 90ef933404ae1d8aeaab97d9c0ab6925ee22add1`
10. Checkout to right commit hash and repeat steps 3-6:  
   `git checkout be168f528bbffcbc026fe427869c8e458d275156`
11. Identify the base commit hash. (**git merge-base <left_commit_hash> <right_commit_hash>**)  
   Run: `git merge-base 90ef933404ae1d8aeaab97d9c0ab6925ee22add1 be168f528bbffcbc026fe427869c8e458d275156`.  
   Receive the output: `0a8afa2e7269ddbec3755b8f10033e93f55149c2`
12. Checkout to base commit hash and repeat steps 3-7:  
    `git checkout 0a8afa2e7269ddbec3755b8f10033e93f55149c2`
