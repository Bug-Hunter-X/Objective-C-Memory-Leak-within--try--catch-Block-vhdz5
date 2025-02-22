In Objective-C, a rare but impactful error stems from misunderstanding how memory management interacts with exception handling.  Consider this scenario:

```objectivec
@try {
    SomeObject *obj = [[SomeObject alloc] init];
    // ... some operation that might throw an exception ...
} @catch (NSException *exception) {
    // Handle the exception
}
```

If an exception is thrown *after* `obj` is allocated but *before* any `release` or `autorelease` call, the object will leak.  The `@catch` block doesn't automatically release the object, even if the allocation was within the `@try` block. You must manually handle memory management in the exception handler or use techniques like `@autoreleasepool` to ensure proper cleanup.