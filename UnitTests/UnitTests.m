//
//  UnitTests.m
//  UnitTests
//
//  Created by Mike on 27/02/2013.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSData+PRHDataURL.h"

@interface UnitTests : SenTestCase

@end

@implementation UnitTests

- (void)testEmptyData;
{
    NSURL *url = [[NSData data] dataURLWithMimeType_PRH:@"application/octet-stream"];
    STAssertEqualObjects(url.absoluteString, @"data:application/octet-stream;base64,", nil);
}

@end
