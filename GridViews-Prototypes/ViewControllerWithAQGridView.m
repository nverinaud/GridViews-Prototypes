//
//  ViewControllerWithAQGridView.m
//  GridViews
//
//  Created by Nicolas Verinaud on 22/08/11.
//  Copyright 2011 Chlorophyll Vision. All rights reserved.
//

#import "ViewControllerWithAQGridView.h"


@interface ViewControllerWithAQGridView ()
- (void)_configure;
- (void)_updateContentSizeLabel;
@end


NSString* PrintSize(CGSize size)
{
	return [NSString stringWithFormat:@"({%.0f,%.0f})", size.width, size.height];
}


@implementation ViewControllerWithAQGridView

@synthesize gridView, contentSizeLabel;

#pragma mark - Memory Management

- (void)dealloc
{
	[gridView release];
	
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
	self.gridView = nil;
}


#pragma mark - Populate

- (void)_configure
{
	self.gridView.separatorStyle = AQGridViewCellSeparatorStyleNone;
	self.gridView.contentSizeGrowsToFillBounds = NO;
	[self.gridView reloadData];	
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
	self.title = @"AQGridView";
	
	[self.gridView addObserver:self forKeyPath:@"contentSize" options:0 context:nil];
	
	[self _configure];
    [super viewDidLoad];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	[self _updateContentSizeLabel];
}


- (void)_updateContentSizeLabel
{
	self.contentSizeLabel.text = PrintSize(self.gridView.contentSize);
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Actions

- (IBAction)rightUp:(id)sender
{
	self.gridView.leftContentInset += 20;
	//[self.gridView reloadData];				// Uncomment this line to see live changes, it also causes the gridView contentSize to grow up !
	[self _updateContentSizeLabel];
}


- (IBAction)rightDown:(id)sender
{
	self.gridView.leftContentInset -= 20;
	//[self.gridView reloadData];				// Uncomment this line to see live changes, it also causes the gridView contentSize to grow down !
	[self _updateContentSizeLabel];
}


#pragma mark - AQGridView Delegate & DataSource

- (NSUInteger) numberOfItemsInGridView: (AQGridView *) gridView
{
	return 30;
}


- (AQGridViewCell *) gridView: (AQGridView *) gridView cellForItemAtIndex: (NSUInteger) index
{
	static NSString * cellID = @"CellID";
	
	AQGridViewCell *cell = [self.gridView dequeueReusableCellWithIdentifier:cellID];
	if (!cell)
	{
		cell = [[[AQGridViewCell alloc] initWithFrame:CGRectMake(0, 0, 50, 50) reuseIdentifier:cellID] autorelease];
	}
	
	return cell;
}


- (void) gridView: (AQGridView *) gridView didSelectItemAtIndex: (NSUInteger) index
{
	
}

@end
