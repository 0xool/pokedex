//
//  PokemonDetailVC.m
//  pockedex
//
//  Created by CyrusREfahi on 2/23/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import "PokemonDetailVC.h"

@interface PokemonDetailVC ()

@end

@implementation PokemonDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.Name.text = self.pokemon._name;
    [self.mainImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i" , self.pokemon._pockedexID]]];
    [self.currentPokemonImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i" , self.pokemon._pockedexID]]];
    
    [self.pokemon downloadPokemonDetails:^{

        [self updateUI];
        
    }];

}

-(void)updateUI{
    
    self.disc.text = self.pokemon.desc;
    self.typeLabel.text = self.pokemon.types;
    self.bassAttacklabel.text = self.pokemon.baseAttack;
    self.defenceLabel.text = self.pokemon.defense;
    self.heightLabel.text = self.pokemon.height;
    self.widthLabel.text = self.pokemon.weight;
    self.pokedexIdLabel.text = [NSString stringWithFormat:@"@%" , self.pokemon._pockedexID];
    if([self.pokemon.evolutionID  isEqual: @""]){
        
        self.nxtEvolutionImage.hidden = false;
        
    }else{
    
        self.nxtEvolutionImage.hidden = false;
        NSLog(@"*****************************************%@" , self.pokemon.evolutionID);
        [self.nxtEvolutionImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@" , self.pokemon.evolutionID]]];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backBtnPressed:(id)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}
@end
