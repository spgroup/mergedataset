# OA

- Add this lines bellow de methor `toXContent(XContentBuilder, Params)` in the class **org.elasticsearch.action.
  DocWriteResponse**.
  ```
  private void callRealisticRun() throws IOException {
      DocWriteResponse docWriteResponse = new DocWriteResponse() {};
      docWriteResponse.toXContent(XContentFactory.jsonBuilder(), ToXContent.EMPTY_PARAMS);
  }
  ```
- Add these imports

```
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.common.xcontent.ToXContent;
```

# DF

At line 160 replace `.field("forced_refresh", forcedRefresh);` with `builder.field("forced_refresh", forcedRefresh);`

This build contains a refactoring to work around the problem in line tagging caused by chained methods. Example:

```java
x
	.method(1)
	.method(2)
	.method(3); // source

```

Turns into:

```java
x
	.method(1)
	.method(2);
x.method(3); // source

```
