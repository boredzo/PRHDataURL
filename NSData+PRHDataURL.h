//
//  NSData+PRHDataURL.h
//  QLDataURL
//
//  Created by Peter Hosey on 2012-09-29.
//  Copyright (c) 2012 Peter Hosey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (PRHDataURL)

- (NSURL *) dataURLWithMimeType_PRH:(NSString *)mimeType;

@end
