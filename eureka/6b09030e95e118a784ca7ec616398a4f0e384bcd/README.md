 ## 1. Clone the project 
    git clone https://github.com/Netflix/eureka

## 2. Checkout to merge the commit hash
    git checkout 6b09030e95e118a784ca7ec616398a4f0e384bcd

## 3. Edit the local.properties add the location sdk. Example:
    sdk.dir=/home/vinicius-santos/Android/Sdk

## 4. run the command:
    ./gradlew clean build

## 5. check the content folder: 
    eureka/eureka-client/build/libs
    eureka/eureka-server/build/libs

## 6. Identify the left and right commit hash. (git log --pretty=%P -n 1 <merge_commit_hash>)
    Run: git log --pretty=%P -n 1 6b09030e95e118a784ca7ec616398a4f0e384bcd
    Receive the output: 578f4c0417fd9fd2052350286ce2997c543d48a4 0a539722f42cc5ccefb794c0619b2057678cf6b8

## 7. Checkout to left commit hash and repeat steps 6 and 7:
    git checkout 578f4c0417fd9fd2052350286ce2997c543d48a4

## 8. Checkout to right commit hash and repeat steps 6 and 7:
    git checkout 0a539722f42cc5ccefb794c0619b2057678cf6b8

## 9. Identify the base commit hash. (git merge-base <left_commit_hash> <right_commit_hash>)
    Run: git merge-base 578f4c0417fd9fd2052350286ce2997c543d48a4 0a539722f42cc5ccefb794c0619b2057678cf6b8
    Receive the output: 20a425e53987ff6bfe231ed2149afdc9fa4c9da6

## 10. Checkout to base commit hash and repeat steps 6 and 7:
    git checkout 20a425e53987ff6bfe231ed2149afdc9fa4c9da6


