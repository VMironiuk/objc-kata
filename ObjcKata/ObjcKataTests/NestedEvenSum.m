//
//  NestedEvenSum.m
//  ObjcKataTests
//
//  Created by Volodymyr Myroniuk on 16.04.2024.
//

// Write a recursive function called "nestedEvenSum".
// Return the sum of all even numbers in an object which may contain nested objects.

#import <XCTest/XCTest.h>

@interface NestedEvenSum : XCTestCase

@end

@implementation NestedEvenSum

- (void)testSimple {
    id obj = @{
        @"outer": @2,
        @"obj": @{
            @"inner": @2,
            @"otherObj": @{
                @"superInner": @2,
                @"notANumber": @YES,
                @"alsoNotANumber": @"yup"
            }
        }
    };
    NSInteger got = [self nestedEvenSumFrom:obj];
    NSInteger exp = 6;
    XCTAssertEqual(got, exp);
}

- (void)testComplex {
    id obj = @{
        @"a": @2,
        @"b": @{
            @"b": @2,
            @"bb": @{
                @"b": @3,
                @"bb": @{
                    @"b": @2
                }
            }
        },
        @"c": @{
            @"c": @{
                @"c": @2
            },
            @"cc": @"ball",
            @"ccc": @5
        },
        @"d": @1,
        @"e": @{
            @"e": @{
                @"e": @2
            },
            @"ee": @"car"
        }
    };
    NSInteger got = [self nestedEvenSumFrom:obj];
    NSInteger exp = 10;
    XCTAssertEqual(got, exp);
}

#pragma mark - Solution

- (NSInteger)nestedEvenSumFrom:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        NSNumber* number = (NSNumber*)object;
        NSInteger value = [number integerValue];
        if (value % 2 == 0) {
            return value;
        }
    }
    
    NSInteger sum = 0;
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSDictionary* dict = (NSDictionary*)object;
        for (id value in [dict allValues]) {
            sum += [self nestedEvenSumFrom:value];
        }
    }
    return sum;
}

@end
