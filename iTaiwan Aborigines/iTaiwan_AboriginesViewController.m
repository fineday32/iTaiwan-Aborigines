//
//  iTaiwan_AboriginesViewController.m
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/15.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import "iTaiwan_AboriginesViewController.h"
#import "iTaiwan_AboriginesAppDelegate.h"
#import "mainViewController.h"

@interface iTaiwan_AboriginesViewController ()
- (IBAction)fbLogin:(id)sender;
@property (strong, nonatomic) mainViewController *mainViewController;

@end

@implementation iTaiwan_AboriginesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    iTaiwan_AboriginesAppDelegate *appDelegagte = [[UIApplication sharedApplication]delegate];
    if (!appDelegagte.session.isOpen)
    {
        appDelegagte.session = [[FBSession alloc] init];
        if (appDelegagte.session.state == FBSessionStateCreatedTokenLoaded)
            //find FB cache access token
        {
            [appDelegagte.session openWithCompletionHandler:^(FBSession *session, FBSessionState status, NSError *error)
            {
                [self updateView];
            }];
        }
    }


//    _introView.bounds = CGRectMake(0,0,10,10);
    [_introView setImage:[UIImage imageNamed:@"introViewTest.png"]];
    [self.view addSubview:_introView];
    
    [self.fbLoginOutlet setTitle:@"Log in" forState:UIControlStateNormal];
    
}

- (IBAction)fbLogin:(id)sender
{
    iTaiwan_AboriginesAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    if (appDelegate.session.isOpen)
    {
        //logout
        [appDelegate.session closeAndClearTokenInformation];
    }
    else
    {
        //login
        if (appDelegate.session.state != FBSessionStateCreated)
        {
            appDelegate.session = [[FBSession alloc] init];
        }
        
        [appDelegate.session openWithCompletionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            [self updateView];
        }];
    }
}

- (void)updateView
{
    iTaiwan_AboriginesAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    if (appDelegate.session.isOpen)
    {
    //change to mainViewController
        if(self.mainViewController == nil)
        {
            NSLog(@"initialize failed");
        }

        self.mainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController"];
        [self presentViewController:self.mainViewController animated:NO completion:^{
            NSLog(@"change to mainViewController");
        }];
    }
    else
    {
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
