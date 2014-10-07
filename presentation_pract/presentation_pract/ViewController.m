//
//  ViewController.m
//  presentation_pract
//
//  Created by ljsaj on 10/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"
static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()
 
@property (copy, nonatomic) NSArray *computers;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.computers = @[@{@"Name" : @"MacBook Air", @"Color" : @"Silver", @"Third": @"SOmethign Else"},
                       @{@"Name" : @"MacBook Pro", @"Color" : @"Silver" , @"Third": @"ddd Else"},
                       @{@"Name" : @"iMac", @"Color" : @"Silver" , @"Third": @"asdfasdf Else"},
                       @{@"Name" : @"Mac Mini", @"Color" : @"Silver", @"Third": @"asdfe"},
                       @{@"Name" : @"Mac Pro", @"Color" : @"Black", @"Third": @"ewr Else"}];
    UITableView *tableView = (id)[self.view viewWithTag:1];
    [tableView registerClass:[NameAndColorCell class]
      forCellReuseIdentifier:CellTableIdentifier];
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NameAndColorCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                 CellTableIdentifier
                                                             forIndexPath:indexPath];
                                 NSDictionary *rowData = self.computers[indexPath.row];
                                 cell.name = rowData[@"Name"];
                                 cell.color = rowData[@"Color"];
                                cell.third = rowData[@"Third"];
                                 return cell;
                                 }

@end
