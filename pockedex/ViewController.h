//
//  ViewController.h
//  pockedex
//
//  Created by CyrusREfahi on 2/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pockemon.h"
#import "csvParser.h"
#import <AVFoundation/AVFoundation.h>


@interface  ViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , UISearchBarDelegate>


@property (weak , nonatomic) IBOutlet UICollectionView* collectionView;
@property (weak , nonatomic)   Pockemon* pokemon;
@property  NSMutableArray* pokemons;
@property (weak , nonatomic) AVAudioPlayer* MusicPlayer;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


- (IBAction)musicButtonPressed:(id)sender;
-(void)parsePokemonCSV;
-(void)initAudio;




@end

