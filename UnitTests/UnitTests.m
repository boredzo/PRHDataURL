//
//  UnitTests.m
//  UnitTests
//
//  Created by Mike on 27/02/2013.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "PRHDataURL.h"

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
    
    NSURL *redDotDataURL = [PRHDataURL dataURLWithMIMEType:@"image/png" data:redDotData];
    STAssertEqualObjects(redDotDataURL.absoluteString,
                         @"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA"
                         @"AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO"
                         @"9TXL0Y4OHwAAAABJRU5ErkJggg==",
                         nil);
}

- (void)testEmptyData;
{
    NSURL *url = [PRHDataURL dataURLWithMIMEType:@"application/octet-stream" data:[NSData data]];
    STAssertEqualObjects(url.absoluteString, @"data:application/octet-stream;base64,", nil);
}

- (void)testPlainText;
{
    NSURL *url = [PRHDataURL dataURLWithMIMEType:@"text/plain" string:@"A brief note"];
    STAssertEqualObjects(url.absoluteString, @"data:text/plain,A%20brief%20note", nil);
}

- (void)testPlainTextWithoutMIMEType;
{
    // Example from http://tools.ietf.org/html/rfc2397
    NSURL *url = [PRHDataURL dataURLWithMIMEType:nil string:@"A brief note"];
    STAssertEqualObjects(url.absoluteString, @"data:,A%20brief%20note", nil);
}

@end
