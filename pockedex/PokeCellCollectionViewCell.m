//
//  PokeCellCollectionViewCell.m
//  pockedex
//
//  Created by CyrusREfahi on 2/20/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import "PokeCellCollectionViewCell.h"


@implementation PokeCellCollectionViewCell

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.cornerRadius = 5.0;
    }
    return self;
}

-(void)configureCell : (Pockemon*)pockemon{
    
    self.pockemon = pockemon;
    self.nameLabel.text = [pockemon _name];
    NSString *temp = [NSString  stringWithFormat:@"%i" , pockemon._pockedexID];
   // NSLog(temp);
    [self.thumbImage setImage: [UIImage imageNamed:[NSString  stringWithFormat:@"%i" , pockemon._pockedexID]]];
    
}




@end
