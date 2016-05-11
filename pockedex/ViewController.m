//
//  ViewController.m
//  pockedex
//
//  Created by CyrusREfahi on 2/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import "ViewController.h"
#import "PokeCellCollectionViewCell.h"
#import "Pockemon.h"

@interface  ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self parsePokemonCSV];
    
}
//================================================================================
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PokeCellCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PokeCellCollectionViewCell" forIndexPath:indexPath];
    Pockemon* pokemon = [[Pockemon alloc]initWithName:@"Test" withPokedexId:(int)(indexPath.row + 1)];

    [cell configureCell:pokemon];
    
    return cell;
}

-(void)parsePokemonCSV{
    
    NSBundle* path = [[NSBundle mainBundle] pathForResource:@"pokemon" ofType:@"csv"];
    
    //NSArray *arrayOfArrays = [CSVParser parseCSVIntoArrayOfArraysFromFile:path
      //                                       withSeparatedCharacterString:@","
        //quoteCharacterString:nil];
;
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"USPresident Wikipedia" ofType:@"csv"];
    NSArray* array = [CSVParser parseCSVIntoArrayOfDictionariesFromFile:path
                          withSeparatedCharacterString:@","
                                  quoteCharacterString:nil
                                             ];
    
    NSLog(@"%@",array);
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    
    return 718;

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    return 1;

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return CGSizeMake(105, 105);
}


@end
