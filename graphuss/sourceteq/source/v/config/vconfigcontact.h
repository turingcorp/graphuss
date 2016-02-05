#import "appdel.h"
#import "viewbase.h"

@class cconfigcontact;

@interface vconfigcontact:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate>

@property(weak, nonatomic)cconfigcontact *controllercontact;
@property(weak, nonatomic)NSLayoutConstraint *consfieldbottom;
@property(weak, nonatomic)UIView *fieldbase;
@property(weak, nonatomic)UIButton *buttoncancel;
@property(weak, nonatomic)UIButton *buttonsend;
@property(weak, nonatomic)UITextField *field;

@end