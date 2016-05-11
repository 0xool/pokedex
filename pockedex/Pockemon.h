//
//  Pockemon.h
//  pockedex
//
//  Created by CyrusREfahi on 2/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pockemon : NSObject

@property (weak , nonatomic) NSString* _name;
@property int _pockedexID;

- (id)initWithName : (NSString*)name withPokedexId : (int)pokedexId;

@end
