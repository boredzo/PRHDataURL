//
//  PRHDataURL.m
//  QLDataURL
//
//  Created by Peter Hosey on 2012-09-29.
//  Copyright (c) 2012 Peter Hosey. All rights reserved.
//

#import "PRHDataURL.h"

#import <Security/Security.h>

@implementation PRHDataURL

+ (NSData *) base64Data_PRH:(NSData *)data {
	NSData *encodedData;

	CFErrorRef error = NULL;
	SecTransformRef base64 = SecEncodeTransformCreate(kSecBase64Encoding, &error);
	if (base64) {
		SecTransformSetAttribute(base64, kSecTransformInputAttributeName, (__bridge CFDataRef)data, &error);
		encodedData = (__bridge_transfer NSData *)SecTransformExecute(base64, &error);

		CFRelease(base64);
	}

	if (!encodedData) {
		NSLog(@"%s: Base64 encoding failed: %@", __func__, error);
	}

	return encodedData;
}

+ (NSURL *) dataURLWithMIMEType:(NSString *)mimeType data:(NSData *)data {
	NSString *base64String = [[NSString alloc] initWithData:[self base64Data_PRH:data] encoding:NSUTF8StringEncoding];
	NSString *URLString = [NSString stringWithFormat:@"data:%@;base64,%@", mimeType, base64String];
	return [NSURL URLWithString:URLString];
}

+ (NSURL *) dataURLWithMIMEType:(NSString *)mimeType string:(NSString *)string {
    if (!mimeType) mimeType = @"";
    NSString *URLString = [NSString stringWithFormat:@"data:%@,%@", mimeType, [string stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	return [NSURL URLWithString:URLString];
}

@end
