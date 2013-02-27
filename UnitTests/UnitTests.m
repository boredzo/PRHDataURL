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

- (void)testBase64Encoding;
{
    // First example from http://en.wikipedia.org/wiki/Data_URI_scheme
    NSURL *redDotURL = [[NSBundle bundleForClass:[UnitTests class]] URLForImageResource:@"Red-dot-5px.png"];
    STAssertNotNil(redDotURL, nil);
    
    NSData *redDotData = [NSData dataWithContentsOfURL:redDotURL];
    STAssertNotNil(redDotData, nil);
    
    NSURL *redDotDataURL = [redDotData dataURLWithMimeType_PRH:@"image/png"];
    STAssertEqualObjects(redDotDataURL.absoluteString,
                         @"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA"
                         @"AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO"
                         @"9TXL0Y4OHwAAAABJRU5ErkJggg==",
                         nil);
}

- (void)testEmptyData;
{
    NSURL *url = [[NSData data] dataURLWithMimeType_PRH:@"application/octet-stream"];
    STAssertEqualObjects(url.absoluteString, @"data:application/octet-stream;base64,", nil);
}

@end
