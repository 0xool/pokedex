//
//  Pockemon.m
//  pockedex
//
//  Created by CyrusREfahi on 2/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import "Pockemon.h"

@implementation Pockemon


- (id)initWithName : (NSString*)name withPokedexId : (int)pokedexId
{
    self = [super init];
    if (self) {
        
        self._name = name;
        self._pockedexID = pokedexId;
        
        
        
        self.pokemonURL =  [BASE_URL stringByAppendingString:[POKEMON_URL stringByAppendingString:[NSString stringWithFormat:@"%i" , self._pockedexID]]];
    }
    return self;
}

-(void)downloadPokemonDetails:(void (^)(void))downloadCompleted{
    
    JXHTTPOperation *op = [JXHTTPOperation withURLString:self.pokemonURL];
    op.didFinishLoadingBlock = ^(JXHTTPOperation *op) {

        self.weight = [op.responseJSONToDict valueForKey:@"weight"];
        self.defense = [NSString stringWithFormat:@"%@" , [op.responseJSONToDict valueForKey:@"defense"]];
        self.height = [op.responseJSONToDict valueForKey:@"height"];
        self.baseAttack = [NSString stringWithFormat:@"%@" , [op.responseJSONToDict valueForKey:@"attack"] ];
        NSMutableArray* types = [op.responseJSONToDict valueForKey:@"types"];
        if(types.count > 0){
            self.types = [types[0] valueForKey:@"name"];
        }

        NSMutableArray* desc = [op.responseJSONToDict valueForKey:@"descriptions"];
        NSString* descriptionURL = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"%@" ,[desc[0] valueForKey:@"resource_uri"]]];
        
        NSMutableArray* Evoloution = [op.responseJSONToDict valueForKey:@"evolutions"];
        if(Evoloution != NULL && Evoloution.count > 0){
            
            NSString* to = [Evoloution[0] valueForKey:@"to"];
            
            if(![to containsString:@"mega"]){
                
                NSString* uri = [Evoloution[0] valueForKey:@"resource_uri"];
                NSString* newStr = [uri stringByReplacingOccurrencesOfString:@"/api/v1/pokemon/" withString:@"" ];
                NSString* Nmb = [newStr stringByReplacingOccurrencesOfString:@"/" withString:@"" ];
                
                self.evolutionID = Nmb;
                NSLog(@"#@#####################################%@" , self.evolutionID);
                self.nxtEvolutionTxt = to;
                NSString* lvl = [NSString  stringWithFormat:@"&@" , [Evoloution[0] valueForKey:@"level"] ];
                self.nxtEvolutionLvl = lvl;

        NSLog(@"%@" , descriptionURL);
        if( descriptionURL != NULL){
            
            JXHTTPOperation* p = [JXHTTPOperation withURLString:descriptionURL];
            p.didFinishLoadingBlock = ^(JXHTTPOperation *p) {
                

                NSString *tempString = [p.responseJSONToDict valueForKey:@"description"];
                NSLog(@"%@" , tempString);
                self.desc = [NSString stringWithFormat:tempString];

            };
            
            [[JXHTTPOperationQueue sharedQueue] addOperation:p];
        }
        

       

                downloadCompleted();


                
                
            }else{
                
                NSLog(@"Cant have names with mega do not have resources");
                
            }
            
        }
    
    };
    
    [[JXHTTPOperationQueue sharedQueue] addOperation:op];
    

    
}



@end
