//
//  ListNode.h
//  Assignment6
//
//  Created by Rosnel Leyva-Cortés on 4/29/21.
//

#ifndef ListNode_h
#define ListNode_h

@interface ListNode : NSObject

@property  int object;

@property ListNode *left;

@property ListNode *right;

- (instancetype)initWithObject:(int)object;

- (instancetype)init;



@end

#endif /* ListNode_h */
