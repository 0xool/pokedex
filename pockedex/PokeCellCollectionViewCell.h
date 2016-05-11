//
//  PokeCellCollectionViewCell.h
//  pockedex
//
//  Created by CyrusREfahi on 2/20/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pockemon.h"

@interface PokeCellCollectionViewCell : UICollectionViewCell

@property IBOutlet UIImageView* thumbImage;
@property IBOutlet UILabel* nameLabel;
@property (weak , nonatomic) Pockemon* pockemon;

-(void)configureCell : (Pockemon*)pockemon;

@end
