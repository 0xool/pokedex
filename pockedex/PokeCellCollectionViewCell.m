//
//  PokeCellCollectionViewCell.m
//  pockedex
//
//  Created by CyrusREfahi on 2/20/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import "PokeCellCollectionViewCell.h"


@implementation PokeCellCollectionViewCell




-(void)configureCell : (Pockemon*)pockemon{
    
    self.pockemon = pockemon;
    self.nameLabel.text = [pockemon _name];
    self.thumbImage = [UIImage imageNamed:[NSString  stringWithFormat:@"%i" , self.pockemon._pockedexID]];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        printf("FUCK YOU SHIT HEAD ");
        self.layer.cornerRadius = 100.0;
    }
    return self;
}


@end
