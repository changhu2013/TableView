//
//  TableViewViewController.h
//  TableView
//
//  Created by changhu on 13-8-14.
//  Copyright (c) 2013年 com.demo. All rights reserved.
//

#import <UIKit/UIKit.h>

//第一步：实现两个协议 UITableViewDelegate, UITableViewDataSource
@interface TableViewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

    NSArray *listData;
    
    NSArray *listImage;
    
}

@property (nonatomic, retain) NSArray *listData;

@property (nonatomic, retain) NSArray *listImage;


@end
