//
//  MTPEmployee.h
//  proglive_objc1_6
//
//  Created by admin on 20.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTPEmployee : NSObject <NSCoding> {
    int _salary;
    NSString *_name;
    NSString *_surname;
}
@property int salary;
@property(retain) NSString *name;
@property(retain) NSString *surname;

-(id)initWithRandom;
+(id)employeeWithRandom;
-(bool)isEvenSalary;

@end
