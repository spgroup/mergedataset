 ## 1. Clone the project 
    git clone https://github.com/CloudSlang/cloud-slang.git

## 2. Checkout to merge the commit hash
    git checkout 20bac30d9bd76569aa6a4fa1e8261c1a9b5e6f76
## 3. Install the project without running tests
    mvn install -DskipTests
## 4. Generate tests jar
    mvn install jar:test-jar