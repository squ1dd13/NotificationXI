@interface NCNotificationShortLookView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook NCNotificationShortLookView
//Hide the header and background views to get the iOS 11 effect
-(void)layoutSubviews {
    %orig;
    UIView *_headerOverlayView = MSHookIvar<UIView *>(self, "_headerOverlayView");
    UIView *_mainOverlayView = MSHookIvar<UIView *>(self, "_mainOverlayView");
    _headerOverlayView.hidden = YES;
    _mainOverlayView.hidden = YES;
}
//Shrink the banners down to XI size
-(void)setFrame:(CGRect)frame{
    CGRect smallFrame = frame;
    smallFrame.size.height = 81;
    %orig(smallFrame);
}

%end


%hook NCNotificationContentView
//Stop the text from overflowing from the banner
-(BOOL)showAdditionalMessageLines {
    return NO;
}


-(void)setShowAdditionalMessageLines:(BOOL)arg1 {
    arg1 = NO;
}

-(unsigned long long)messageNumberOfLines {
    return 3;
}

%end

%hook NCNotificationListCellActionButtonsView
//Shrink the 'Clear' button down to XI size
-(void)setFrame:(CGRect)frame{
    CGRect clearButtonFrame = frame;
    clearButtonFrame.size.height = 81;
    %orig(clearButtonFrame);
}

%end
