This build contains a refactoring to work around the problem in line tagging caused by chained methods. Example:



```java
x
	.method(1)
	.method(2)
	.method(3); // source
	
```

Turns into:

````java
x
	.method(1)
	.method(2);
x.method(3); // source

````



