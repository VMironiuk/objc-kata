//
//  Same.m
//  ObjcKataTests
//
//  Created by Volodymyr Myroniuk on 19.03.2024.
//

#import <XCTest/XCTest.h>

@interface Same : XCTestCase

@end

@implementation Same
- (void)testReturnsTrue {
    XCTAssertTrue([self isFirstArray:@[] theSameAsSecondArray:@[]]);
    
    id first = @[@1, @2, @3];
    id second = @[@4, @1, @9];
    XCTAssertTrue([self isFirstArray:first theSameAsSecondArray:second]);
    
    first = @[@1, @2, @3, @2];
    second = @[@4, @1, @9, @4];
    XCTAssertTrue([self isFirstArray:first theSameAsSecondArray:second]);
}

- (void)testReturnsFalse {
    XCTAssertFalse([self isFirstArray:@[@1] theSameAsSecondArray:@[]]);
    XCTAssertFalse([self isFirstArray:@[@1] theSameAsSecondArray:@[@2]]);
    
    id first = @[@1, @2, @3];
    id second = @[@4, @9, @4];
    XCTAssertFalse([self isFirstArray:first theSameAsSecondArray:second]);
}

// MARK: - Solution

- (BOOL)isFirstArray:(NSArray*)firstArray theSameAsSecondArray:(NSArray*)secondArray {
    if (firstArray.count != secondArray.count) { return NO; }
    if (firstArray.count == 0 && secondArray.count == 0) { return YES; }
    
    NSMutableDictionary* firstFrequencyCounter = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* secondFrequencyCounter = [[NSMutableDictionary alloc] init];
    
    for (NSNumber* number in firstArray) {
        if (firstFrequencyCounter[number] == nil) {
            firstFrequencyCounter[number] = @1;
        } else {
            NSNumber* oldValue = firstFrequencyCounter[number];
            NSNumber* newValue = [[NSNumber alloc] initWithInt:oldValue.intValue + 1];
            firstFrequencyCounter[number] = newValue;
        }
    }
    
    for (NSNumber* number in secondArray) {
        if (secondFrequencyCounter[number] == nil) {
            secondFrequencyCounter[number] = @1;
        } else {
            NSNumber* oldValue = secondFrequencyCounter[number];
            NSNumber* newValue = [[NSNumber alloc] initWithInt:oldValue.intValue + 1];
            secondFrequencyCounter[number] = newValue;
        }
    }
    
    for (NSNumber* key in firstFrequencyCounter.allKeys) {
        if (secondFrequencyCounter[[[NSNumber alloc] initWithInt:key.intValue * key.intValue]] == nil) { return NO; }
        if (firstFrequencyCounter[key] != secondFrequencyCounter[[[NSNumber alloc] initWithInt:key.intValue * key.intValue]]) { return NO; }
    }

    return YES;
}

@end
