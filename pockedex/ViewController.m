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
{
    AVAudioPlayer *audioPlayer;
    bool isInSearchMode  ;
    NSMutableArray* searchArrayForPockemon;
}
    



- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.searchBar.delegate = self;
    [self parsePokemonCSV];
    [self initAudio];
    isInSearchMode = false;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)initAudio{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]error:nil];
    
    audioPlayer.delegate = self;
    [audioPlayer play];
    NSLog(@"done");
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PokeCellCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PokeCellCollectionViewCell" forIndexPath:indexPath];
    Pockemon* pokemon;
    
    if (isInSearchMode) {
        
        pokemon = [[Pockemon alloc]initWithName:[[searchArrayForPockemon objectAtIndex:(int)indexPath.row ] _name] withPokedexId: [[searchArrayForPockemon objectAtIndex:indexPath.row ] _pockedexID] ];
        
    }else{
        
        pokemon = [[Pockemon alloc]initWithName:[[self.pokemons objectAtIndex:(int)indexPath.row ] _name] withPokedexId: [[self.pokemons objectAtIndex:indexPath.row ] _pockedexID] ];
    }
            [cell configureCell:pokemon];
            return cell;
    
}



- (IBAction)musicButtonPressed:(id)sender {
    
    if(audioPlayer.playing){
        [audioPlayer stop];
        [sender setAlpha:0.2];
    }else{
        [audioPlayer play];
        [sender setAlpha:1];
    }
    
    
    
}



-(void)parsePokemonCSV{
    
    NSBundle* path = [[NSBundle mainBundle] pathForResource:@"pokemon" ofType:@"csv"];
    self.pokemons = [[NSMutableArray alloc] init];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"USPresident Wikipedia" ofType:@"csv"];
    NSMutableArray* array = [CSVParser parseCSVIntoArrayOfDictionariesFromFile:path
                          withSeparatedCharacterString:@","
                                  quoteCharacterString:nil
                                             ];
    for (int i = 0 ; i < array.count; i++) {

        NSDictionary* tempDic = [array objectAtIndex:i];
        
        NSInteger pokeID = [[tempDic objectForKey:@"id"] integerValue] ;
        NSString* pokeName = [tempDic objectForKey:@"identifier"] ;

       Pockemon* tempPockemon = [[Pockemon alloc] initWithName:pokeName withPokedexId:pokeID];

       [self.pokemons addObject:tempPockemon];
    }
    


    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}




-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    if (isInSearchMode) {
        return searchArrayForPockemon.count;
    }else{
        return self.pokemons.count;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    return 1;

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return CGSizeMake(105, 105);
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    searchArrayForPockemon = [[NSMutableArray alloc] init];

    
    if(self.searchBar.text == NULL || [self.searchBar.text  isEqual: @""] ){
        
        isInSearchMode = false;

        
    }else{
        
        isInSearchMode = true;
        NSString* lower = [searchBar.text lowercaseString];
//        searchArrayForPockemon =  [self.pokemons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:(nonnull NSString *), ...]];
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"_name contains [cd] %@", lower ];
        searchArrayForPockemon = [self.pokemons filteredArrayUsingPredicate:resultPredicate];
        
        
        

    }
    
                NSLog(@"%i" , searchArrayForPockemon.count)a;
                [self.collectionView reloadData];
    
    
}


@end
