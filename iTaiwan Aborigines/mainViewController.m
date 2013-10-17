//
//  mainViewController.m
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/15.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import "mainViewController.h"
#import "iTaiwan_AboriginesAppDelegate.h"
#import "iTaiwan_AboriginesViewController.h"
#import "wantToPlayViewController.h"
#import "rewardPopupViewController.h"
#import "UIViewController+CWPopup.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetsGroup.h>

@interface mainViewController (){
    NSArray *_tableObject;

}
@property iTaiwan_AboriginesViewController *iTaiwanViewController;
@property (weak, nonatomic) IBOutlet UIButton *mapImageOutlet;
@property (weak, nonatomic) IBOutlet UIButton *cameraImageOutlet;

- (IBAction)cameraImageButton:(id)sender;

@end

@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

//    UIBarButtonItem *fbLogoutButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(fbLogout:)];
//    UIBarButtonItem *rewardButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(reward:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登 出" style:UIBarButtonItemStylePlain target:self action:@selector(fbLogout:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"獎 勵" style:UIBarButtonItemStylePlain target:self action:@selector(reward:)];

    [self setTitle:@"步 落 客"];
    if (!_tableObject) {
        _tableObject = [[NSArray alloc] initWithObjects:@"現在最接近  XX族", @"       想玩", @"       想吃", @"       想當小文青", nil];
    }

//    self.tableView.backgroundColor = [UIColor orangeColor];
//    self.tableView.sectionIndexBackgroundColor = [UIColor blueColor];
    
    
    [_mapImage setImage:[UIImage imageNamed:@"mapImage.png"]];
    [_cameraImage setImage:[UIImage imageNamed:@"cameraImage.png"]];
    [_mapImageOutlet setTitle:@"換部族" forState:UIControlStateNormal];
    [_cameraImageOutlet setTitle:@"拍照/錄影" forState:UIControlStateNormal];
    
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    [self.tableView reloadInputViews];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableObject count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text = [_tableObject
                           objectAtIndex: [indexPath row]];
    
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    switch ([indexPath row]) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"1.png"];
            break;
            
        case 1:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"路線、民宿 ..."];
            break;

        case 2:
            cell.detailTextLabel.text = @"餐廳、美食 ...";
            break;

        case 3:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"特色工作坊 ..."];
            break;

        default:
            break;
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return @"小小步落客";
    return @"小小步落客";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    wantToPlayViewController * viewController;
    switch ([indexPath row]) {
        case 0:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"nearestAboriginesViewController"];
            break;
        case 1:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wantToPlayViewController"];
            break;
        case 2:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wantToEatViewController"];
            break;
        case 3:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wantToBeHipsterViewController"];
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    return;
    
//    if ([indexPath row] == 0)
//    {
//        wantToPlayViewController * toPlayViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wantToPlayViewController"];
//        [self.navigationController pushViewController:toPlayViewController animated:YES];
//    }

}

- (void)fbLogout:(id)sender
{
    NSLog(@"in fbLogout");
    iTaiwan_AboriginesAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (appDelegate.session.isOpen)
    {
        //logout
        [appDelegate.session closeAndClearTokenInformation];
    }

    self.iTaiwanViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"iTaiwan_AboriginesViewController"];
    [self presentViewController:self.iTaiwanViewController animated:YES completion:^{
        NSLog(@"return to first (Facebook Login) View Controller");
    }];

}


-(void)reward:(id)sender
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopup:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
//   tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    self.useBlurForPopup = YES;

    
    [self presentPopupViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"rewardPopupViewController"] animated:YES completion:^{
        NSLog(@"present rewardPopupViewController");
    }];
}

- (void)dismissPopup:(UIGestureRecognizer *)gestureRecognizer {
    if (self.popupViewController != nil) {
        [self.view removeGestureRecognizer:gestureRecognizer];
        
        
//        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:[self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController1"] action:@selector(dismissPopup)];
//        [self.view removeGestureRecognizer:tapGestureRecognizer];
        
        [self dismissPopupViewControllerAnimated:YES completion:^{
            NSLog(@"dismissed rewardPopupViewController");
        }];
    }
}



#pragma mark - gesture recognizer delegate functions

// so that tapping popup view doesnt dismiss it
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return touch.view != self.popupViewController.view;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraImageButton:(id)sender {
    
    //check is there have camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        //identify photo comes from camera
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    // create custom album
//    NSString *albumName=@"跟著步落客咔ㄘ咔";
//    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
//    [library addAssetsGroupAlbumWithName:albumName
//                             resultBlock:^(ALAssetsGroup *group) {
//                                 NSLog(@"added album:%@", albumName);
//                             }
//                            failureBlock:^(NSError *error) {
//                                NSLog(@"error adding album");
//                            }];
//    // find custom album
//    __block ALAssetsGroup* groupToAddTo;
//    [library enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
//        if ([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:albumName])
//        {
//            NSLog(@"found album %@", albumName);
//            groupToAddTo = group;
//        }
//    } failureBlock:^(NSError *error) {
//        NSLog(@"failed to enumerate albums:\nError: %@", [error localizedDescription]);
//    }];
    
    //save the image to asset library
    
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
//    CGImageRef img = [image CGImage];
//    [library writeImageDataToSavedPhotosAlbum:(__bridge NSData *)(img) metadata:[info objectForKey:UIImagePickerControllerMediaMetadata]
//                              completionBlock:^(NSURL *assetURL, NSError *error) {
//                                  if (error.code == 0)
//                                  {
//                                      NSLog(@"saved imaged completed:\nurl: %@", assetURL);
//                                      
//                                      //get the asset
//                                      [library assetForURL:assetURL resultBlock:^(ALAsset *asset) {
//                                          //assign the photo to the album
//                                          [groupToAddTo addAsset:asset];
////                                          NSLog(@"Added %@ to %@", [[asset defaultRepresentation] filename], albumName);
//                                      } failureBlock:^(NSError *error) {
//                                          NSLog(@"failed to retrieve image asset:\nError: %@ ", [error localizedDescription]);
//
//                                      }];
//                                  }
//                                  else
//                                  {
//                                      NSLog(@"saved image failed.\nerror code %i\n%@", error.code, [error localizedDescription]);
//                                  }
//    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
