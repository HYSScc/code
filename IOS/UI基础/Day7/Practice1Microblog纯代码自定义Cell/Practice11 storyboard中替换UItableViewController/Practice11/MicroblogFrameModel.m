//
//  MicroblogFrameModel.m
//  Practice11
//
//  Created by tom-pc on 15/11/3.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "MicroblogFrameModel.h"
#import "MicroblogStatusModel.h"

#define kNameFont [UIFont systemFontOfSize:14]
#define kTextFont [UIFont systemFontOfSize:16]

@implementation MicroblogFrameModel

- (void)setMicroblogStatusModel:(MicroblogStatusModel *)microblogStatusModel
{
    _microblogStatusModel = microblogStatusModel;
    
    // 定义间距
    CGFloat padding = 10;
    
    // 1.头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    self.iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2.姓名
    NSDictionary *nameDict = @{NSFontAttributeName : kNameFont};
    
    CGRect nameFrame = [self.microblogStatusModel.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = CGRectGetMaxX(self.iconF) + padding;
    nameFrame.origin.y = padding +(self.iconF.size.height - nameFrame.size.height) * 0.5;
    self.nameF = nameFrame;
    //
    // 3.vip
    CGFloat vipX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipY = self.nameF.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 4.正文
    NSDictionary *textDict = @{NSFontAttributeName : kTextFont};
    CGRect textFrame = [self.microblogStatusModel.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconF) + padding;
    self.textF = textFrame;
    
    // 5.配图
    if (self.microblogStatusModel.picture.length > 0) {
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        self.pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        self.cellHeight = CGRectGetMaxY(self.pictureF) + padding;
    } else{
        self.cellHeight = CGRectGetMaxY(self.textF) + padding;
    }

}

+ (NSArray *)microblogFrameModel
{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray * arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        MicroblogFrameModel *frameModel = [[MicroblogFrameModel alloc] init];
        
        MicroblogStatusModel *statusModel = [MicroblogStatusModel microblogModelWithDict:dict];
        
        frameModel.microblogStatusModel = statusModel;
        
        [arrayM addObject:frameModel];
    }
    return arrayM;

}

@end
