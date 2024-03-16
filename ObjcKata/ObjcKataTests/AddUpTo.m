//
//  AddUpTo.m
//  ObjcKataTests
//
//  Created by Volodymyr Myroniuk on 16.03.2024.
//

#import <XCTest/XCTest.h>

@interface AddUpTo : XCTestCase

@end

@implementation AddUpTo

- (void)test {
    XCTAssertEqual([self addUpToNumber:0], 0);
    XCTAssertEqual([self addUpToNumber:1], 1);
    XCTAssertEqual([self addUpToNumber:2], 3);
    XCTAssertEqual([self addUpToNumber:6], 21);
    XCTAssertEqual([self addUpToNumber:10], 55);
    XCTAssertEqual([self addUpToNumber:100], 5050);
}

// MARK: - Solution

- (unsigned int)addUpToNumber:(unsigned int)number {
    return [self addUpToNumberFormulaImplementation:number];
}

- (unsigned int)addUpToNumberLoopImplementation:(unsigned int)number {
    unsigned int result = 0;
    for (size_t i = 0; i <= number; i++) {
        result += i;
    }
    return result;
}

- (unsigned int)addUpToNumberFormulaImplementation:(unsigned int)number {
    return number * (number + 1) / 2;
}

@end
