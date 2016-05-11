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

@interface  ViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , NSObject>


@property (weak , nonatomic) IBOutlet UICollectionView* collectionView;
@property (weak , nonatomic)   Pockemon* pokemon;


-(void)parsePokemonCSV;




@end

