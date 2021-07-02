## 1. Clone the project 
    git clone https://github.com/libgdx/libgdx

## 2. Checkout to merge the commit hash
    git checkout da27e2dae56be0a159e82231e5c3a5b83b099063

## 3. Edit the build tag adding the plugin on the files: _backends/gdx-backend-lwjgl3/pom.xml_, _pom.xml_, 

```xml
<plugin>
	<artifactId>maven-assembly-plugin</artifactId> 
    <configuration> 
    <archive> 
    <manifest> 
        <mainClass>fully.qualified.MainClass</mainClass> 
    </manifest> 
    </archive> 
    <descriptorRefs> 
        <descriptorRef>jar-with-dependencies</descriptorRef> 
    </descriptorRefs> 
    </configuration> 
</plugin> 
``` 

## 3.1 On the file _gdx/jni/maven/pom.xml_, update the version value on the parent tag:
_<version>1.9.3-SNAPSHOT</version>_ -> <version>1.9.3</version>

## 3.2 On the file _extensions/gdx-tools/pom.xml_, update the version value of dependency of artefactID 'gdx-platform':
_<version>{project.version}</version>_ -> <version>1.9.3</version>

## 3.3 On the file _backends/gdx-backend-lwjgl3/pom.xml_, update the version value of the parent tag:
_<version>1.9.3-SNAPSHOT</version>_ -> <version>1.9.3</version>

## 3.4 On the file _gdx/jni/maven/pom.xml_, update the version value of the parent tag:
_<version>1.9.3-SNAPSHOT</version>_ -> <version>1.9.3</version>

## 3.4 On the file _pom.xml_, update the tag modules for:
_<modules>
    <module>extensions/gdx-jnigen</module>
    <module>gdx</module>
    <module>gdx/jni/maven</module>
    <module>backends/gdx-backend-lwjgl3</module>
  </modules>_

## for the right and base commits, adds the methods in the file _libgdx/backends/gdx-backend-lwjgl3/src/com/badlogic/gdx/backends/lwjgl3/Lwjgl3Graphics.java_
_/** 
 * The window must be recreated via {@link #setWindowedMode(int, int)} in order 
 * for the changes to take effect.  
 */ 
@Override   
public void setUndecorated(boolean undecorated) {   
    Lwjgl3ApplicationConfiguration config = getWindow().getConfig();    
    config.setDecorated(!undecorated);  
}   
/** 
 * The window must be recreated via {@link #setWindowedMode(int, int)} in order 
 * for the changes to take effect.  
 */ 
@Override   
public void setResizable(boolean resizable) {   
    Lwjgl3ApplicationConfiguration config = getWindow().getConfig();    
    config.setResizable(resizable); 
}_


## 4. run the command:
    mvn clean compile assembly:single

## 5. check the target folder _backends/gdx-backend-lwjgl3/target_: 

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 da27e2dae56be0a159e82231e5c3a5b83b099063
    Receive the output: 86e61a315f482c36d1e0380c094d1f35401d4b12 119a96edc5ac590d30e517ddcf3618a1bb3895e2

## 7. Checkout to left commit hash and repeat steps 3 and 4:
    git checkout 86e61a315f482c36d1e0380c094d1f35401d4b12

## 10. Checkout to right commit hash and repeat steps 3 and 4:
    git checkout 119a96edc5ac590d30e517ddcf3618a1bb3895e2

## 11. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 86e61a315f482c36d1e0380c094d1f35401d4b12 119a96edc5ac590d30e517ddcf3618a1bb3895e2
    Receive the output: 055b9f762e90303d3d5367b2e974bbaf595a7c64

## 12. Checkout to base commit hash and repeat steps 3 and 4:
    git checkout 055b9f762e90303d3d5367b2e974bbaf595a7c64
