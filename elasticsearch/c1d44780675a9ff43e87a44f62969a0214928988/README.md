1. Clone the project:  
   `git clone https://github.com/elastic/elasticsearch`
2. Checkout to merge commit hash:  
   `git checkout c1d44780675a9ff43e87a44f62969a0214928988`
3. Install Java 8 locally
4. Execute the following steps to install gradle version 2.13:
   * Download the "complete" option for the release 2.13 in the [Gradle Releases Page](https://gradle.org/releases/)
   * Create a directory for the gradle installation
      `mkdir /opt/gradle`
   * Unzip the downloaded file on the installation directory
      `unzip -d /opt/gradle gradle-2.13-all.zip`
   * Configure your path so that you can execute the gradle command
      `export PATH=$PATH:/opt/gradle/gradle-2.13/bin`
5. With gradle on version 2.8, execute:
   `gradle assemble testClasses`