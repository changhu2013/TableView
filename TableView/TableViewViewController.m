//
//  TableViewViewController.m
//  TableView
//
//  Created by changhu on 13-8-14.
//  Copyright (c) 2013年 com.demo. All rights reserved.
//

#import "TableViewViewController.h"

@interface TableViewViewController ()

@end

@implementation TableViewViewController

@synthesize listData;
@synthesize listImage;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *array = [[NSArray alloc] initWithObjects:@"A1-南非",@"A2-墨西哥",
					  @"B1-阿根廷",@"B2-尼日利亚",@"C1-英格兰",@"C2-美国",
					  @"D1-德国",@"D2-澳大利亚",@"E1-荷兰",@"E2-丹麦",
					  @"G1-巴西",@"G2-朝鲜",@"H1-西班牙",@"H2-瑞士",nil];
	
	NSArray *images = [[NSArray alloc] initWithObjects:@"SouthAfrica.png",@"Mexico.png",
					   @"Argentina.png",@"Nigeria.png",@"England.png",@"USA.png",
					   @"Germany.png",@"Australia.png",@"Holland.png",@"Denmark.png",
					   @"Brazil.png",@"NorthKorea.png",@"Spain.png",@"Switzerland.png",nil];
	
	self.listData = array;
	self.listImage = images;
	[array release];
	[images release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma 委托 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSUInteger row = [indexPath row];
    NSString *value = [listData objectAtIndex:row];
    NSString *msg = [[NSString alloc]initWithFormat:@"你选择了 %@", value];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    [alert release];
    [msg release];
    
    //设置反选单元格侯的效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [listData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //创建单元格.首先从表格视图中获取以及创建好的可用单元格。
    static NSString *cellIdentifier = @"Cell";//可随便命名，就是一个的简单字符串。
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    //设置单元格的值
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [listData objectAtIndex:row];
    
    //设置单元格图片
    UIImage *image = [UIImage imageNamed:[listImage objectAtIndex:row]];
    cell.imageView.image = image;
    
    return cell;
}


-(void)dealloc{
    [listData release];
    [listImage release];
    [super dealloc];
}


@end
