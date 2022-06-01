-   Add this lines bellow de methor `writeTo(StreamOutput out)` in the class **org.elasticsearch.action.
    DocWriteResponse**.
    ```
    private void callRealisticRun() throws IOException {
        DocWriteResponse docWriteResponse = new DocWriteResponse() {};
        docWriteResponse.writeTo(new BytesStreamOutput());
    }
    ```
