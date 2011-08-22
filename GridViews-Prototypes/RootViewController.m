//
//  RootViewController.m
//  GridViews
//
//  Created by Nicolas Verinaud on 22/08/11.
//  Copyright 2011 Chlorophyll Vision. All rights reserved.
//

#import "RootViewController.h"
#import "ViewControllerWithAQGridView.h"

@interface RootViewController ()
@end


@implementation RootViewController

@synthesize gridVCs=_gridVCs;

#pragma mark - Memory Management

- (void)dealloc
{
	[_gridVCs release];
    [super dealloc];
}


#pragma mark - View LifeCycle

- (void)viewDidUnload
{
    [super viewDidUnload];
}


- (void)viewDidLoad
{
	self.title = @"Grid Views Proto";
	
	[super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


#pragma mark - Population

- (NSMutableArray *)gridVCs
{
	if (!_gridVCs) 
	{
		_gridVCs = [[NSMutableArray alloc] init];
		
		[_gridVCs addObject:@"AQGridView"];
	}
	return _gridVCs;
}


#pragma mark - UITableView DataSource & Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.gridVCs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	NSString *gridName = [self.gridVCs objectAtIndex:indexPath.row];
	cell.textLabel.text = gridName;

	// Configure the cell.
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *gridName = [self.gridVCs objectAtIndex:indexPath.row];
	
	if ([gridName isEqualToString:@"AQGridView"])
	{
		ViewControllerWithAQGridView *aqViewController = [[ViewControllerWithAQGridView alloc] init];
		[self.navigationController pushViewController:aqViewController animated:YES];
		[aqViewController release];
	}
}


@end
