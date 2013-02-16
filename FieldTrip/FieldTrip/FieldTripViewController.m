//
//  FieldTripViewController.m
//  FieldTrip
//
//  Created by Tim Breitkreutz on 12-06-07.
//  Copyright (c) 2012 Software Brewmasters Inc. All rights reserved.
//

#import "FieldTripViewController.h"
#import "CreateFieldTripViewController.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"

@interface FieldTripViewController ()
@property (weak, nonatomic) IBOutlet UITableView *schoolTable;
@property (nonatomic, strong) NSArray *schoolList;
@property (strong, nonatomic) NSNumber *selectedRow;
@end

@implementation FieldTripViewController

@synthesize schoolList = _schoolList;
@synthesize schoolTable = _schoolTable;
@synthesize delegate = _delegate;
@synthesize selectedRow = _selectedRow;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://boiling-spire-7767.herokuapp.com/schools"];
    AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:url];
    [client setAuthorizationHeaderWithUsername:@"course" password:@"password"];
    NSMutableURLRequest *request = [client requestWithMethod:@"GET" path:@"/api/schools/list.json" parameters:Nil];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"School List: %@", JSON);
        self.schoolList = JSON;
        [self.schoolTable reloadData];
    } failure:nil];
    [operation start];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.schoolList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"school";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSLog(@"School name %@", [[self.schoolList objectAtIndex:indexPath.row] objectForKey:@"name"]);
    cell.textLabel.text = [[self.schoolList objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"School name");
//
   NSLog(@"Selecting School name %@", [[self.schoolList objectAtIndex:indexPath.row] objectForKey:@"name"]);
//

    [self.delegate didPickSchool:[[self.schoolList objectAtIndex:indexPath.row]objectForKey:@"name"] ];
//    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    self.selectedRow = [NSNumber numberWithInt: indexPath.row];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"createFieldTrip"]) {
        NSLog(@"preparing for segue");
        [segue.destinationViewController didPickSchool:[[self.schoolList objectAtIndex:[self.selectedRow intValue ]] objectForKey:@"name"]];
    }
}

@end
