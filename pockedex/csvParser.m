//
//  csvParser.m
//  pockedex
//
//  Created by CyrusREfahi on 2/22/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import "csvParser.h"


@interface CSVParser()
+ (NSArray *)trimComponents:(NSArray *)array withCharacters:(NSString *)characters;
@end

@implementation CSVParser

+ (NSArray *)trimComponents:(NSArray *)array withCharacters:(NSString *)characters
{
    NSMutableArray *marray = [[NSMutableArray alloc] initWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [marray addObject:[obj stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:characters]]];
    }];
    return marray;
}

+ (void)parseCSVIntoArrayOfDictionariesFromFile:(NSString *)path
                   withSeparatedCharacterString:(NSString *)character
                           quoteCharacterString:(NSString *)quote
                                      withBlock:(void (^)(NSArray *array, NSError *error))block
{
    dispatch_queue_t callerQueue = dispatch_get_current_queue();
    dispatch_queue_t queue = dispatch_queue_create("parseQueue", NULL);
    dispatch_async(queue, ^{
        NSError *err = nil;
        NSMutableArray *mutArray = [[NSMutableArray alloc] init];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
        if (!content) return;
        NSArray *rows = [content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\r"]];
        NSString *trimStr = (quote != nil) ? [quote stringByAppendingString:@"\n\r "] : @"\n\r ";
        NSArray *keys = [CSVParser trimComponents:[[rows objectAtIndex:0] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:character]]
                                   withCharacters:trimStr];
        for (int i = 1; i < rows.count; i++) {
            NSArray *objects = [CSVParser trimComponents:[[rows objectAtIndex:i] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:character]]
                                          withCharacters:trimStr];
            [mutArray addObject:[NSDictionary dictionaryWithObjects:objects forKeys:keys]];
        }
        if (block) {
            dispatch_async(callerQueue, ^{
                block(mutArray, err);
            });
        }

    });

}

+ (void)parseCSVIntoArrayOfArraysFromFile:(NSString *)path
             withSeparatedCharacterString:(NSString *)character
                     quoteCharacterString:(NSString *)quote
                                withBlock:(void (^)(NSArray *array, NSError *error))block
{
    dispatch_queue_t callerQueue = dispatch_get_current_queue();
    dispatch_queue_t queue = dispatch_queue_create("parseQueue", NULL);
    
    dispatch_async(queue, ^{
        NSError *err = nil;
        NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
        if (!content) return;
        NSArray *rows = [content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\r"]];
        NSString *trimStr = (quote != nil) ? [quote stringByAppendingString:@"\n\r "] : @"\n\r ";
        [rows enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [mutableArray addObject:[CSVParser trimComponents:[obj componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:character]]
                                               withCharacters:trimStr]];
        }];
        if (block) {
            dispatch_async(callerQueue, ^{
                block(mutableArray, err);
            });
        }
     
    });

}

+ (NSArray *)parseCSVIntoArrayOfDictionariesFromFile:(NSString *)path
                        withSeparatedCharacterString:(NSString *)character
                                quoteCharacterString:(NSString *)quote
{
    NSError *error = nil;
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (!content) return nil;
    NSArray *rows = [content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n\r"]];
    NSString *trimStr = (quote != nil) ? [quote stringByAppendingString:@"\n\r "] : @"\n\r ";
    NSArray *keys = [CSVParser trimComponents:[[rows objectAtIndex:0] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:character]]
                               withCharacters:trimStr];

    for (int i = 1; i < rows.count - 1; i++) {
        NSArray *objects = [CSVParser trimComponents:[[rows objectAtIndex:i] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:character]]
                                      withCharacters:trimStr];

        [mutableArray addObject:[NSDictionary dictionaryWithObjects:objects forKeys:keys]];
        
    }
    return mutableArray;
}


+ (NSArray *)parseCSVIntoArrayOfArraysFromFile:(NSString *)path
                  withSeparatedCharacterString:(NSString *)character
                          quoteCharacterString:(NSString *)quote
{
    NSError *error = nil;
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (!content) return nil;
    NSArray *rows = [content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n\r"]];
    NSString *trimStr = (quote != nil) ? [quote stringByAppendingString:@"\n\r "] : @"\n\r ";
    [rows enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mutableArray addObject:[CSVParser trimComponents:[obj componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:character]]
                                           withCharacters:trimStr]];
    }];
    return mutableArray;
}

@end