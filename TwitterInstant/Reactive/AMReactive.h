//
//  AMReactive.h
//  TwitterInstant
//
//  Created by Amir Ghoreshi on 19/11/14.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMReactive : NSObject
+ (void)observeField:(UITextField *)field;
+ (void)observeFieldWithSubscriber:(UITextField *)field;
+ (void)observeFieldWithMarco:(UITextField *)field;
@end
