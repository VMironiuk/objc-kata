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
    if (firstArray.count == 0 ) { return YES; }
    
    NSMutableDictionary* firstFrequencyCounter = [NSMutableDictionary dictionary];
    NSMutableDictionary* secondFrequencyCounter = [NSMutableDictionary dictionary];
    
    for (NSNumber* number in firstArray) {
        firstFrequencyCounter[number] = @([firstFrequencyCounter[number] intValue] + 1);
    }
    
    for (NSNumber* number in secondArray) {
        secondFrequencyCounter[number] = @([secondFrequencyCounter[number] intValue] + 1);
    }
    
    for (NSNumber* key in firstArray) {
        NSNumber* squaredKey = @([key intValue] * [key intValue]);
        if (!secondFrequencyCounter[squaredKey] || [firstFrequencyCounter[key] intValue] != [secondFrequencyCounter[squaredKey] intValue]) {
            return NO;
        }
    }

    return YES;
}

@end
