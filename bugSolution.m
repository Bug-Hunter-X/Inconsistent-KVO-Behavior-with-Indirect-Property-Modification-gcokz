To fix this, ensure that any methods that modify `myValue` explicitly call `willChangeValueForKey:` and `didChangeValueForKey:` before and after the modification.  This ensures that KVO notifications are properly triggered.  Here's how the modified `MyObject` class would look:

```objectivec
@interface MyObject : NSObject
@property (nonatomic, strong) NSString *myValue;
@end

@implementation MyObject
- (void)setMyValue:(NSString *)newValue {
    [self willChangeValueForKey:@"myValue"];
    _myValue = newValue;
    [self didChangeValueForKey:@"myValue"];
}

- (void)indirectlySetMyValue:(NSString *)newValue {
    [self willChangeValueForKey:@"myValue"];
    _myValue = newValue; // Or any other method of indirect modification
    [self didChangeValueForKey:@"myValue"];
}
@end
```
By explicitly calling these methods, KVO will reliably trigger the observers whenever the value of `myValue` changes, regardless of how the change is initiated.