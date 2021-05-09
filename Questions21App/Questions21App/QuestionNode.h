//
//  QuestionNode.h
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#ifndef QuestionNode_h
#define QuestionNode_h

@interface QuestionNode : NSObject

@property NSString * text;

//right is yes, left is no
@property QuestionNode * yes;

@property QuestionNode * no;

-(instancetype)init;

-(instancetype)initWithFull:(NSString *)textObj yesNode:(QuestionNode *)yesNode noNode:(QuestionNode *)noNode;

-(instancetype)initWithText:(NSString *)text;
@end

#endif /* QuestionNode_h */
