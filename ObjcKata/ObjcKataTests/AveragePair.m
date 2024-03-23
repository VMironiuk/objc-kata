//
//  AveragePair.m
//  ObjcKataTests
//
//  Created by Volodymyr Myroniuk on 23.03.2024.
//

// Write a function called averagePair.
// Given a sorted array of integers and a target average,
// determine if there is a pair of values in the array where
// the average of the pair equals the target average.
// There may be more than one pair that matches the average target.

// Constraints:
// Time: O(N)
// Space: O(1)

// Sample Input:
//     averagePair([1,2,3],2.5) // true
//     averagePair([1,3,3,5,6,7,10,12,19],8) // true
//     averagePair([-1,0,3,4,5,6], 4.1) // false
//     averagePair([],4) // false

#import <XCTest/XCTest.h>

@interface AveragePair : XCTestCase

@end

@implementation AveragePair

- (void)test_returnsFalseForEmptyArray {
    XCTAssertFalse([self hasAveragePairInSortedArray:@[] equalToNumber:@4]);
}

- (void)test_returnsFalseForNumbers_m1_0_3_4_5_6_whenAverageIs_4dot1 {
    NSArray* numbers = @[@-1, @0, @3, @4, @5, @6];
    XCTAssertFalse([self hasAveragePairInSortedArray:numbers equalToNumber:@4.1]);
}

- (void)test_returnsTrueForNumbers_1_2_3_whenAverageIs_2dot5 {
    NSArray* numbers = @[@1, @2, @3];
    XCTAssertTrue([self hasAveragePairInSortedArray:numbers equalToNumber:@2.5]);
}

- (void)test_returnsTrueForNumbers_1_3_3_5_6_7_10_12_19_whenAverageIs_8 {
    NSArray* numbers = @[@1, @3, @3, @5, @6, @7, @10, @12, @19];
    XCTAssertTrue([self hasAveragePairInSortedArray:numbers equalToNumber:@8]);
}

- (BOOL)hasAveragePairInSortedArray:(NSArray*)array equalToNumber:(NSNumber*)number {
    if (array.count == 0) { return NO; }
    
    size_t begin = 0;
    size_t end = array.count - 1;
    double expectedAverage = [number doubleValue];
    
    while (begin < end) {
        double n1 = [array[begin] doubleValue];
        double n2 = [array[end] doubleValue];
        double gotAverage = (n1 + n2) / 2.0;
        if (gotAverage == expectedAverage) {
            return YES;
        } else if (gotAverage < expectedAverage) {
            begin++;
        } else {
            end--;
        }
    }
    
    return NO;
}

@end
