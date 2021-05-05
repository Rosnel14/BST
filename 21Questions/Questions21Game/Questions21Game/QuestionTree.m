//
//  QuestionTree.m
//  Questions21Game
//
//  Created by hackIntosh on 5/5/21.
//

#import <Foundation/Foundation.h>
#import "QuestionTree.h"

@implementation QuestionTree

-(instancetype)initWithRoot: (NSString *)rootObj{
    if(self){
        self = [super init];
        self.root = [[QuestionNode alloc] initWithText:rootObj];
    }
    return self;
}


//levels of the BST
-(int)height{
    return [self heightHelper:self.root];
}

-(int)heightHelper: (QuestionNode *)current{
    if (self.root == nil){
        return 0;
    }
    else {
        int left_height= [self heightHelper:current.yes];
        int right_height = [self heightHelper:current.no];
        
        if(left_height > right_height) {
            return left_height+1;
        } else {
            return right_height+1;
        }
    }
}



//not a size difference now, how to determine yes or no?
-(void)put:(NSString *)text{
    
}

//same thing with delete, how to determine yes or no?
-(void)Delete:(NSString *)text{
    
}

//inorder traversal
-(void)inorder{
    [self inorderHelper:self.root];
}

-(void)inorderHelper:(QuestionNode *)node{
    if(node != nil){
        [self inorderHelper:node.yes];
        NSLog(@"%@",node.text);
        [self inorderHelper:node.no];
    }
}

-(int)size{
    int count = 0;
    return [self sizeHelper:self.root count:count];
}

-(int)sizeHelper:(QuestionNode *)node count:(int)count{
    
    if(node == nil){
        return count;
    }
    else {
        count++;
        return [self sizeHelper:node.yes count:count] + [self sizeHelper:node.no count:count];
    }
    
}

@end
