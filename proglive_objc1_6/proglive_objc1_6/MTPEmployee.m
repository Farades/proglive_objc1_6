//
//  MTPEmployee.m
//  proglive_objc1_6
//
//  Created by admin on 20.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "MTPEmployee.h"

@implementation MTPEmployee

-(bool)isEvenSalary {
    bool res = NO;
    if (self.salary % 2 == 0) {
        res = YES;
    }
    return res;
}

-(id)initWithRandom {
    self = [super init];
    if (self) {
        NSArray *namesArray    = [[NSArray alloc] initWithObjects:@"John", @"Tim", @"Ted", @"Aaron", @"Steven", nil];
        NSArray *surnamesArray = [[NSArray alloc] initWithObjects:@"Smith", @"Dow", @"Isacson", @"Pennyworth", @"Jenkins", nil];
        int randomName    = arc4random_uniform(5);
        int randomSurname = arc4random_uniform(5);
        self.name     = [namesArray objectAtIndex:randomName];
        self.surname  = [surnamesArray objectAtIndex:randomSurname];
        self.salary   = arc4random_uniform(1000) + 1000;
    }
    return self;
}

+(id)employeeWithRandom {
    return [[MTPEmployee alloc] initWithRandom];
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.salary forKey:@"salary"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.surname forKey:@"surname"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.salary = (int)[aDecoder decodeIntegerForKey:@"salary"];
        self.name   = [aDecoder decodeObjectForKey:@"name"];
        self.surname   = [aDecoder decodeObjectForKey:@"surname"];
    }
    return self;
}

@end
