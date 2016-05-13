//
//  Pockemon.h
//  pockedex
//
//  Created by CyrusREfahi on 2/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constraints.h"
#import "Delagates.h"
#import "JXHTTP.h"

@interface Pockemon : NSObject

@property (weak , nonatomic) NSString* _name;
@property int _pockedexID;
@property (weak , nonatomic) NSString* desc;
@property (weak , nonatomic) NSString* height;
@property (weak , nonatomic) NSString* weight;
@property (weak , nonatomic) NSString* defense;
@property (weak , nonatomic) NSString* baseAttack;
@property (weak , nonatomic) NSString* nxtEvolutionTxt;
@property (weak , nonatomic) NSString* nxtEvolutionLvl;
@property (weak , nonatomic) NSString* evolutionID;
@property (weak , nonatomic) NSString* types;
@property NSString* pokemonURL; 

-(id)initWithName : (NSString*)name withPokedexId : (int)pokedexId;
-(void)downloadPokemonDetails : (void (^)(void)) downloadCompleted;

@end
