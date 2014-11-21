//
//  AMReactive.m
//  TwitterInstant
//
//  Created by Amir Ghoreshi on 19/11/14.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "AMReactive.h"
#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>

@implementation AMReactive


+ (BOOL)validate:(NSString *)field {
    return field.length > 2;
}


//Return value of map, can be used via subscribeNext param
+ (void)observeField:(UITextField *)field {
    [[field.rac_textSignal
      map:^id(NSString *text) {
        return [self validate:text] ? [UIColor whiteColor] : [UIColor yellowColor];
    }]
     subscribeNext:^(UIColor *color) {
        field.backgroundColor = color;
    }];
}
+ (void)observeFieldWithSubscriber:(UITextField *)field {

    RACSignal *colorSignal = [field.rac_textSignal
      map:^id(NSString *text) {
          return [self validate:text] ? [UIColor whiteColor] : [UIColor yellowColor];
      }];
    [colorSignal
     subscribeNext:^(UIColor *color) {
         field.backgroundColor = color;
     }];
}
+ (void)observeFieldWithMarco:(UITextField *)field {



    RACSignal *colorSignal = [field.rac_textSignal
                              map:^id(NSString *text) {
                                  return @([self validate:text]);
                              }];

    RAC(field, backgroundColor) = [colorSignal
                                   map:^id(NSNumber *text) {
                                       return [text boolValue] ? [UIColor whiteColor] : [UIColor redColor];
                                   }];


}

@end
