-   Add this lines bellow de methor `createRootApplicationContext(
    ServletContext)` in the 
    class **org.springframework.boot.context.web.SpringBootServletInitializer**.
    ```
    private void callRealisticRun() {
        SpringBootServletInitializer springBootServletInitializer = new SpringBootServletInitializer() {}
        springBootServletInitializer.createRootApplicationContext(null);
    }
    ```
