//
//  main.m
//  DuplicateLinesRemove
//
//  Created by Eliran Hadar on 11/26/13.
//  Copyright (c) 2013 Eliran Hadar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Get the files and saved them in an array[].
        // *******************************************************************************

        NSString *input1 = @"PATH-FOR-INPUT-FILE-1";
        
        NSString *input2 = @"PATH-FOR-INPUT-FILE-2";
        
        NSString *output = @"PATH-FOR-OUTPUT-FILE";
        
        
        NSString *input1Data = [NSString stringWithContentsOfFile:input1
                                                       encoding:NSUTF8StringEncoding
                                                          error:NULL];
        
        NSString *input2Data = [NSString stringWithContentsOfFile:input2
                                                              encoding:NSUTF8StringEncoding
                                                                 error:NULL];
        
        NSArray *input1Array = [input1Data componentsSeparatedByString:@"\n"];
        
        NSArray *input2Array = [input2Data componentsSeparatedByString:@"\n"];
        
        NSLog(@"Input1 Count: %lu",(unsigned long)[input1Array count]);
        NSLog(@"Input2 Count: %lu",(unsigned long)[input2Array count]);
        
        
        // Sort arrays and remove the duplicates
        // *******************************************************************************
        
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:input2Array];
        
        for (int i = 0; i < (unsigned long)[input1Array count]; i++) {
            NSString *string1 = [input1Array objectAtIndex:i];
            
            for (int x = 0; x < (unsigned long)[input2Array count]; x++) {
                NSString *string2 = [input2Array objectAtIndex:x];
                
                if ([string1 isEqualToString:string2]) {
                    [newArray removeObject:string2];
                }
            }
        }

        
        // Save the results to new file
        // *******************************************************************************
        
        NSLog(@"Output Count: %lu",(unsigned long)[newArray count]);
        
        NSString* fullString = [newArray componentsJoinedByString:@"\n"];
        [fullString writeToFile:output
                     atomically:YES
                       encoding:NSUTF8StringEncoding
                          error:NULL];
        
        // *******************************************************************************
        
    }
    return 0;
}
