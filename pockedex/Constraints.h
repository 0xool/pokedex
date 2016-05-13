//
//  Constaints.h
//  pockedex
//
//  Created by CyrusREfahi on 2/23/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constraints : NSObject

extern NSString *const BASE_URL;
extern NSString *const POKEMON_URL;

@property (nonatomic, copy) void (^blockName)(void);
    
    
    


@end
