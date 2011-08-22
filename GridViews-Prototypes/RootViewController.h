//
//  RootViewController.h
//  GridViews
//
//  Created by Nicolas Verinaud on 22/08/11.
//  Copyright 2011 Chlorophyll Vision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController 
{
	NSMutableArray *_gridVCs;
}

@property (nonatomic, retain) NSMutableArray *gridVCs;


@end
