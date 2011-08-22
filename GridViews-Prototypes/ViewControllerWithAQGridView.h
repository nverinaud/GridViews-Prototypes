//
//  ViewControllerWithAQGridView.h
//  GridViews
//
//  Created by Nicolas Verinaud on 22/08/11.
//  Copyright 2011 Chlorophyll Vision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQGridView.h"

@interface ViewControllerWithAQGridView : UIViewController <AQGridViewDataSource, AQGridViewDelegate>
{	
    IBOutlet AQGridView *gridView;
	IBOutlet UILabel *contentSizeLabel;
}

@property (nonatomic, retain) AQGridView *gridView;
@property (nonatomic, retain) UILabel *contentSizeLabel;

- (IBAction)rightUp:(id)sender;
- (IBAction)rightDown:(id)sender;

@end
