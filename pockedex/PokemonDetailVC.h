//
//  PokemonDetailVC.h
//  pockedex
//
//  Created by CyrusREfahi on 2/23/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pockemon.h"
#import "Constraints.h"


@interface PokemonDetailVC : UIViewController

@property (weak , nonatomic) Pockemon* pokemon;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UILabel *disc;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *defenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokedexIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *widthLabel;
@property (weak, nonatomic) IBOutlet UILabel *bassAttacklabel;
@property (weak, nonatomic) IBOutlet UIImageView *currentPokemonImage;
@property (weak, nonatomic) IBOutlet UIImageView *nxtEvolutionImage;


- (IBAction)backBtnPressed:(id)sender;

@end
