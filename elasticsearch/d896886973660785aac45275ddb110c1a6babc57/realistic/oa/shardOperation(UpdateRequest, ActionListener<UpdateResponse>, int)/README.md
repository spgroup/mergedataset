-   Add this lines bellow de methor `shardOperation(UpdateRequest, ActionListener<UpdateResponse>, int)` in the 
    class **org.elasticsearch.action.
    update.TransportUpdateAction**.
    ```
    private void callRealisticRun() {
        shardOperation(new UpdateRequest(),  new ActionListener<UpdateResponse>() {
            @Override
            public void onResponse(UpdateResponse response) {
            }

            @Override
            public void onFailure(Throwable e) {}
        });
    }
    ```
