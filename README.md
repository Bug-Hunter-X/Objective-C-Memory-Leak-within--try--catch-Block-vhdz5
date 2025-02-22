# Objective-C Memory Leak in Exception Handling

This repository demonstrates a subtle memory leak in Objective-C that can occur when exceptions are not handled properly in conjunction with memory management.

## The Problem

In Objective-C, if an exception is thrown after an object is allocated but before it is released (using `release` or `autorelease`), the object will leak. The `@catch` block does not automatically handle this. The `bug.m` file showcases this issue.

## The Solution

The solution involves ensuring proper memory management within the `@catch` block to prevent memory leaks.  This can be done by explicitly releasing the object or by using `@autoreleasepool` blocks. The `bugSolution.m` file provides a corrected version.

## How to Run

1. Clone this repository.
2. Open the project in Xcode.
3. Build and run the code to observe the differences between the buggy and fixed versions.