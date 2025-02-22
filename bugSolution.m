To fix the memory leak, you must explicitly release the object in the `@catch` block, or better yet, wrap the allocation within an `@autoreleasepool`:

```objectivec
@try {
    @autoreleasepool {
        SomeObject *obj = [[SomeObject alloc] init];
        // ... some operation that might throw an exception ...
    }
} @catch (NSException *exception) {
    // Exception handled; memory automatically released
}

//Alternatively, explicit release in the catch block:
@try {
    SomeObject *obj = [[SomeObject alloc] init];
    // ... some operation that might throw an exception ...
} @catch (NSException *exception) {
    [obj release]; //Manual release
}
```

Using `@autoreleasepool` is generally preferred because it's cleaner and less prone to errors.  It ensures that any objects allocated within the block are automatically released, even if an exception occurs.