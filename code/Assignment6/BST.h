//
//  BST.h
//  Assignment6
//
//  Created by Rosnel Leyva-Cortés on 4/29/21.
//

#ifndef BST_h
#define BST_h
#import "ListNode.h"
@interface BST:NSObject

@property ListNode * root;

-(instancetype)initWithRoot: (int)rootObj;

-(bool)contains: (int)key;

-(void)Delete: (int)Key;

-(int)height; //returns the height of BST (for debugging)

-(bool)isEmpty;

-(int)max; //returns max value in the tree

-(int)min; //returns min value in tree

-(void)levelorder; //traverse (prints out) the keys as levels, left to right.

-(void)postorder; // traverses (prints out) the keys in postorder order.

-(void)preorder; // traverses (prints out) the keys in preorder order

-(void)inorder; // traverse (prints out) the keys in inorder order.

-(void)put:(int)Key;

-(int)size;



@end

#endif /* BST_h */
