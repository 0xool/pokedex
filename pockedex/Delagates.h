//
//  Delagates.h
//  pockedex
//
//  Created by CyrusREfahi on 2/23/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol protocolDelegate <NSObject>
@optional

-(void)downloadCompleted;

@end

@interface Delagates : NSObject

@property (weak , nonatomic) id <protocolDelegate> delegate;

-(void)startDownloadingProcess;

@end
