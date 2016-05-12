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
    self.LabelPokemon.text = self.pokemon._name;
    printf("%c" , self.pokemon._name);
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

@end
