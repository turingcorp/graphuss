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
    self.field = field;
    
    UIView *fieldbase = [[UIView alloc] init];
    [fieldbase setClipsToBounds:YES];
    [fieldbase setBackgroundColor:[UIColor clearColor]];
    [fieldbase setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    vblur *blur = [vblur light:NO];
    
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
    
    [fieldbase addSubview:blur];
    [fieldbase addSubview:buttoncancel];
    [fieldbase addSubview:buttonsend];
    [fieldbase addSubview:field];
    
    [self addSubview:collection];
    [self addSubview:fieldbase];
    
    NSDictionary *views = @{@"col":collection, @"field":field, @"fieldbase":fieldbase, @"blur":blur, @"send":buttonsend, @"cancel":buttoncancel};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioncancel:(UIButton*)button
{
    
}

-(void)actionsend:(UIButton*)button
{
    
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

@end