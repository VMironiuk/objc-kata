//
//  AreThereDuplicates.m
//  ObjcKataTests
//
//  Created by Volodymyr Myroniuk on 21.03.2024.
//

#import <XCTest/XCTest.h>

/*
 * Implement a function called, `areThereDuplicates` which accepts a variable number of arguments, and checks
 * whether there are any duplicates among the arguments passed in. You can solve this using the frequency counter
 * pattern OR the multiple pointers pattern.
 * Examples:
 *   areThereDuplicates(1, 2, 3) // false
 *   areThereDuplicates(1, 2, 2) // true
 *   areThereDuplicates('a', 'b', 'c', 'a') // true
 *
 * Restrictions:
 *   Time - O(n)
 *   Space - O(n)
 * Bonus:
 *   Time - O(n log n)
 *   Space - O(1)
 */

@interface AreThereDuplicates : XCTestCase

@end

@implementation AreThereDuplicates

- (void)testReturnsFalseForEmptyArray {
    XCTAssertFalse([self areThereDuplicatesInArray:@[]]);
}

- (void)testReturnsFalseForOneElementArray {
    XCTAssertFalse([self areThereDuplicatesInArray:@[@1]]);
}

- (void)testReturnsFalseFor_1_2_3 {
    NSArray* array = @[@1, @2, @3];
    XCTAssertFalse([self areThereDuplicatesInArray:array]);
}

- (void)testReturnsTrueFor_1_2_2 {
    NSArray* array = @[@1, @2, @2];
    XCTAssertTrue([self areThereDuplicatesInArray:array]);
}

- (void)testReturnsTrueFor_1_2_3_1 {
    NSArray* array = @[@1, @2, @3, @1];
    XCTAssertTrue([self areThereDuplicatesInArray:array]);
}

- (void)testReturnsTrueFor_1_1 {
    NSArray* array = @[@1, @1];
    XCTAssertTrue([self areThereDuplicatesInArray:array]);
}

// MARK: - Solution

-  (BOOL)areThereDuplicatesInArray:(NSArray*)array {
    return [self areThereDuplicatesInArrayMultiplePointersImplementation:array];
}

- (BOOL)areThereDuplicatesInArrayFrequencyCounterImplementation:(NSArray*)array {
    if (array.count == 0 || array.count == 1) { return NO; }
    
    NSMutableDictionary* frequencyCounter = [NSMutableDictionary dictionary];
    
    for (NSNumber* number in array) {
        frequencyCounter[number] = @([frequencyCounter[number] intValue] + 1);
    }
    
    for (NSNumber* key in frequencyCounter.allKeys) {
        if ([frequencyCounter[key] intValue] > 1) { return YES; }
    }
    
    return NO;
}

- (BOOL)areThereDuplicatesInArrayMultiplePointersImplementation:(NSArray*)array {
    if (array.count == 0 || array.count == 1) { return NO; }
    
    NSArray* sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber* n1 = obj1;
        NSNumber* n2 = obj2;
        return n1.intValue < n2.intValue;
    }];
    
    for (size_t begin = 0, end = 1; end < sortedArray.count; begin++, end++) {
        if (sortedArray[begin] == sortedArray[end]) { return YES; }
    }
    
    return NO;
}

- (BOOL)areThereDuplicatesInArrayOneLinerImplementation:(NSArray*)array {
    return [NSSet setWithArray:array].count != array.count;
}

@end
