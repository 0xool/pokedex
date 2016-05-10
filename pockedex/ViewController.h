//
//  ViewController.h
//  pockedex
//
//  Created by CyrusREfahi on 2/19/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>


@property (weak , nonatomic) IBOutlet UICollectionView* collectionView;



@end

