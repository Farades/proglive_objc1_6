//
//  main.m
//  proglive_objc1_6
//
//  Created by admin on 19.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import "MTPEmployee.h"

#define FILE_NAME @"testSave"

// С памятью не успел все по красоте сделать. Свободного времени было крайне мало, но интересует где косяки с ней?)

void saveArrayToFile(NSArray *arrayToSave);
NSMutableArray* loadFromFile();
NSMutableArray* createEmployees();
NSString* arrayToString(NSMutableArray *array);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *employees = createEmployees();
        NSMutableArray *newEmployees = [[NSMutableArray alloc] init];
        
        NSLog(@"Первоначальный вид:");
        NSLog(@"%@", arrayToString(employees));
        
        for (MTPEmployee *employee in employees)
        {
            if ([employee isEvenSalary]) {
                [newEmployees addObject:employee];
            }
        }
        [employees removeObjectsInArray:newEmployees];
        
        
        NSLog(@"Нечетные зарплаты:");
        NSLog(@"%@", arrayToString(employees));
        
        NSLog(@"Четные зарплаты:");
        NSLog(@"%@", arrayToString(newEmployees));
        
        saveArrayToFile(newEmployees);
        [newEmployees release];
        newEmployees = nil;
        newEmployees = loadFromFile();
        
        NSLog(@"После загрузки из файла:");
        NSLog(@"%@", arrayToString(newEmployees));
    }
    return 0;
}

NSMutableArray* createEmployees() {
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        MTPEmployee *employee = [[MTPEmployee employeeWithRandom] autorelease];
        [employees addObject:employee];
    }
    
    return employees;
}

void saveArrayToFile(NSArray *arrayToSave) {
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:arrayToSave];
    [saveData writeToFile:FILE_NAME atomically:NO];
}

NSMutableArray* loadFromFile() {
    NSData *loadData = [NSData dataWithContentsOfFile:FILE_NAME];
    NSMutableArray *res = [NSKeyedUnarchiver unarchiveObjectWithData:loadData];
    
    return res;
}

NSString* arrayToString(NSMutableArray *array) {
    NSString* res = [[NSString alloc] init];
    res = @"\n";
    int count = 0;
    for (MTPEmployee *employee in array) {
        NSString* append = [[NSString alloc] init];
        append = [NSString stringWithFormat:@"[%i] %@ %@ Зарплата: %i\n", count, employee.name, employee.surname, employee.salary];
        res = [res stringByAppendingString: append];
        count++;
    }
    return res;
}
