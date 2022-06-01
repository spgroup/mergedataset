-   Add this lines bellow de methor `toXContent(XContentBuilder, Params)` in the class **org.elasticsearch.action.
    DocWriteResponse**.
    ```
    private void callRealisticRun() throws IOException {
        DocWriteResponse docWriteResponse = new DocWriteResponse() {};
        docWriteResponse.toXContent(XContentFactory.jsonBuilder(), ToXContent.EMPTY_PARAMS);
    }
    ```
