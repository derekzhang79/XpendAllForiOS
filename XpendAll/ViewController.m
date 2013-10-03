//
//  ViewController.m
//  XpendAll
//
//  Created by BirdChiu on 13/9/30.
//  Copyright (c) 2013年 BirdChiu. All rights reserved.
//

#import "MFSideMenu.h"
#import "ViewController.h"
#import "collectionCell.h"
#import "shopLeftSideViewController.h"
#import "productViewController.h"
#import "suspendViewController.h"
#import "aboutUsViewController.h"
#import "GetJsonURLString.h"
#import "shopViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize funtionsList = _funtionsList;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    _funtionsList=[[NSArray alloc]initWithObjects:@"Find Shop",@"Find Product",@"Help Someone",@"About Us", nil];
    _imgList=[[NSArray alloc]initWithObjects:@"btn_map",@"btn_food",@"btn_help",@"btn_about", nil];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - setup CollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //return [self.array_Collection count];
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Setup cell identifier
    static NSString *cellIdentifier = @"CVcell";
    //抓陣列的值
    collectionCell *cell = (collectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
   
    
    cell.titleLabel.text=[NSString stringWithFormat:@"%@",[_funtionsList objectAtIndex:indexPath.row]];
    cell.imageView.image=[UIImage imageNamed:[_imgList objectAtIndex:indexPath.row]];
    //cell.titleLabel.text=[NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark - select collectionView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *view=nil;
    switch (indexPath.row) {
        case 0:
            view = (UINavigationController*)[[shopViewController alloc]initWithNibName:@"shopViewController" bundle:nil url:GetGovermentHQ];
            break;
        case 1:
            view = (UINavigationController*)[[productViewController alloc]initWithNibName:@"productViewController" bundle:nil];
            break;
        case 2:
            view = (UINavigationController*)[[suspendViewController alloc]initWithNibName:@"suspendViewController" bundle:nil];
            break;
        case 3:
            view = (UINavigationController*)[[aboutUsViewController alloc]initWithNibName:@"aboutUsViewController" bundle:nil];
            break;
        default:
            break;
    }
    view.title=[_funtionsList objectAtIndex:indexPath.row];
//    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];

    
    if (indexPath.row==0) {
//        UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"gamebaby"] style:UIBarButtonItemStylePlain target:self.navigationItem action:nil];
//        //設定navigationBar背景
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"name"]  forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController.navigationBar setFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
//        [self.navigationItem setBackBarButtonItem:item];

//        shopLeftSideViewController *leftSideView=[[shopLeftSideViewController alloc]initWithNibName:@"shopLeftSideViewController" bundle:nil];
//        MFSideMenuContainerViewController *container=[MFSideMenuContainerViewController containerWithCenterViewController:view leftMenuViewController:leftSideView rightMenuViewController:nil];
        //[self.navigationController pushViewController:container animated:TRUE];
        [self.navigationController pushViewController:view animated:TRUE];
    }else{
        [self.navigationController pushViewController:view animated:TRUE];
    }
   
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
