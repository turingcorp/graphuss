#import "vconfigcontact.h"

@implementation vconfigcontact

-(instancetype)init:(cconfigcontact*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    
    self.controllercontact = controller;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(2, 0, 20, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vconfigcontactcel class] forCellWithReuseIdentifier:celid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setFont:[UIFont fontWithName:fontname size:18]];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor blackColor]];
    [field setTintColor:[UIColor blackColor]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    [field setDelegate:self];
    self.field = field;
    
    UIView *fieldcontainer = [[UIView alloc] init];
    [fieldcontainer setClipsToBounds:YES];
    [fieldcontainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [fieldcontainer setAlpha:0];
    self.fieldcontainer = fieldcontainer;
    
    UIView *fieldbase = [[UIView alloc] init];
    [fieldbase setClipsToBounds:YES];
    [fieldbase setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [fieldbase setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldbase = fieldbase;
    
    vblur *blur = [vblur dark];
    
    UIButton *buttonsend = [[UIButton alloc] init];
    [buttonsend setBackgroundColor:colorsecond];
    [buttonsend setClipsToBounds:YES];
    [buttonsend setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonsend.layer setCornerRadius:4];
    [buttonsend setTitle:NSLocalizedString(@"config_contact_message_send", nil) forState:UIControlStateNormal];
    [buttonsend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonsend setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttonsend.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttonsend addTarget:self action:@selector(actionsend:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonsend = buttonsend;
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setBackgroundColor:colormain];
    [buttoncancel setClipsToBounds:YES];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel.layer setCornerRadius:4];
    [buttoncancel setTitle:NSLocalizedString(@"config_contact_message_cancel", nil) forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncancel.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttoncancel addTarget:self action:@selector(actioncancel:) forControlEvents:UIControlEventTouchUpInside];
    self.buttoncancel = buttoncancel;
    
    [fieldbase addSubview:buttoncancel];
    [fieldbase addSubview:buttonsend];
    [fieldbase addSubview:field];
    [fieldcontainer addSubview:blur];
    [fieldcontainer addSubview:fieldbase];
    
    [self addSubview:collection];
    [self addSubview:fieldcontainer];
    
    self.consfieldbottom = [NSLayoutConstraint constraintWithItem:fieldbase attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSDictionary *views = @{@"col":collection, @"field":field, @"fieldbase":fieldbase, @"blur":blur, @"send":buttonsend, @"cancel":buttoncancel, @"container":fieldcontainer};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[container]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[container]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[fieldbase]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[fieldbase(110)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[field]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[send(40)]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cancel(40)]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[cancel(100)]-20-[send(100)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.consfieldbottom];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedkeyboardchange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedkeyboardchange:(NSNotification*)notification
{
    CGRect keyrect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat origin = keyrect.origin.y;
    self.consfieldbottom.constant = - ([UIScreen mainScreen].bounds.size.height - origin);
    
    [UIView animateWithDuration:1.5 animations:
     ^
     {
         [self.fieldcontainer layoutIfNeeded];
     }];
}

#pragma mark actions

-(void)actioncancel:(UIButton*)button
{
    [[analytics singleton] trackevent:ga_event_config_contact_message action:ga_action_cancel label:nil];
    
    [self hidefield];
}

-(void)actionsend:(UIButton*)button
{
    [self hidefield];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *message = self.field.text;
                       
                       if(message.length > 1)
                       {
                           [[analytics singleton] trackevent:ga_event_config_contact_message action:ga_action_content label:message];
                           
                           [valert alert:NSLocalizedString(@"config_contact_message_sent", nil) inview:self];
                       }
                   });
}

#pragma mark functionality

-(void)hidefield
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [self.fieldcontainer setAlpha:0];
     } completion:
     ^(BOOL done)
     {
         [self.field setText:@""];
     }];
}

#pragma mark public

-(void)showfield
{
    [self.fieldcontainer setAlpha:1];
    [self.field becomeFirstResponder];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, 60);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return [self.controllercontact.model count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vconfigcontactcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.controllercontact.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [[self.controllercontact.model item:index.item] selected:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       [col reloadData];
                   });
}

#pragma mark field del

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    return YES;
}

@end