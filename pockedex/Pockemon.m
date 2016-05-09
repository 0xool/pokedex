//
//  Pockemon.m
//  pockedex
//
//  Created by CyrusREfahi on 2/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import "Pockemon.h"

@implementation Pockemon


- (instancetype)initWithName : (NSString*)name withPokedexId : (int)pokedexId
{
    self = [super init];
    if (self) {
        
        self._name = name;
        self._pockedexID = pokedexId;
        
    }
    return self;
}



@end
