# Inconsistent KVO Behavior with Indirect Property Modification in Objective-C

This repository demonstrates a subtle bug related to Key-Value Observing (KVO) in Objective-C.  When modifying observed properties indirectly (e.g., using `setValue:forKey:`), the observer may behave inconsistently, either failing to trigger or firing multiple times unexpectedly. The provided code illustrates this issue and demonstrates a solution to ensure reliable KVO behavior.

## Bug Description
The bug arises when indirectly changing a property observed via KVO.  Direct modification works fine, but indirect changes (using methods that modify the property internally) can lead to missed or duplicate KVO notifications.