 ## 1. Clone the project 
    git clone https://github.com/unclebob/fitnesse.git

## 2. Checkout to merge the commit hash
    git checkout 4d9ba9d221d879507440feb084fa7521b95111ec

## 3. Edit the property tag at _build.xml_ file

```xml
<property name="maven.central.url" value="http://repo2.maven.org/maven2" />
``` 
Change to:
```xml
<property name="maven.central.url" value="https://repo1.maven.org/maven2"/>
``` 

## 5. Run the command:
    ant jar
 
## 6. Run the command:
    ant test-compile

## 7. Package the test classes in a jar
    jar cvf fitnesse-tests.jar -C ./test-classes .

