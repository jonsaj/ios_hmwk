//
//  ViewController.m
//  SECONDTRY
//
//  Created by ljsaj on 10/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "CarMakeAndModel.h"
static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSArray *cars;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.cars = @[@{@"Make" : @"Ford", @"Model" : @"T",@"Year" : @"1908"},
                  @{@"Make" : @"Pontiac", @"Model" : @"Chief", @"Year" : @"1931"},
                  @{@"Make" : @"Volkswagen", @"Model" : @"Beetle", @"Year" : @"1931"},
                  @{@"Make" : @"Chevrolet", @"Model" : @"Bel Air", @"Year" : @"1953"},
                  @{@"Make" : @"Ford", @"Model" : @"Mustang" , @"Year" : @"1965"},
                  @{@"Make" : @"Pontiac",@"Model" : @"Firebird",@"Year": @"1967"}];
    UITableView *tableView = (id)[self.view viewWithTag:1];
    [tableView registerClass:[ CarMakeAndModel class]
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
    return [self.cars count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarMakeAndModel *cell = [tableView dequeueReusableCellWithIdentifier:
                             CellTableIdentifier
                                                            forIndexPath:indexPath];
    NSDictionary *rowData = self.cars[indexPath.row];
    cell.make = rowData[@"Make"];
    cell.model = rowData[@"Model"];
    cell.year = rowData[@"Year"];
    return cell;
}


@end
