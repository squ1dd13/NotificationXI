@interface NCNotificationShortLookView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook NCNotificationShortLookView

-(void)layoutSubviews {
    %orig;
    UIView *_headerOverlayView = MSHookIvar<UIView *>(self, "_headerOverlayView");
    UIView *_mainOverlayView = MSHookIvar<UIView *>(self, "_mainOverlayView");
    _headerOverlayView.hidden = YES;
    _mainOverlayView.hidden = YES;
}

%end
