.class public final Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;
.super Landroid/app/Activity;
.source "SamsungAppLockSettingsPromotionActivity.java"


# static fields
.field private static final blacklist PROMOTION_BACKGROUND_BLUR_RADIUS_DP:I = 0x2d

.field private static final blacklist PROMOTION_BOTTOM_OFFSET_DP:I = 0x58

.field private static final blacklist PROMOTION_ELEVATION_DP:I = 0x6

.field private static final blacklist PROMOTION_HORIZONTAL_MARGIN_DP:I = 0x1d

.field private static final blacklist PROMOTION_MAX_WIDTH_DP:I = 0x190

.field private static final blacklist PROMOTION_MIN_WIDTH_DP:I = 0xc8

.field private static final blacklist PROMOTION_TIMEOUT_MILLIS:J = 0x1388L

.field private static final blacklist TAG:Ljava/lang/String; = "SamsungAppLockSettingsPromotion"


# instance fields
.field private final blacklist mHandler:Landroid/os/Handler;

.field private blacklist mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

.field private final blacklist mTimeoutRunnable:Ljava/lang/Runnable;


# direct methods
.method public static synthetic blacklist $r8$lambda$Rwxh6FQxt8l2RbThD3AJo6-FrSc(Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->lambda$onCreate$0(Landroid/view/View;)V

    return-void
.end method

.method public constructor blacklist <init>()V
    .locals 2

    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mHandler:Landroid/os/Handler;

    .line 46
    new-instance v0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity$$ExternalSyntheticLambda1;-><init>(Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;)V

    iput-object v0, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mTimeoutRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private blacklist configureWindow()V
    .locals 5

    .line 93
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    .line 94
    invoke-virtual {v0, v1}, Landroid/view/Window;->addSystemFlags(I)V

    const/4 v1, 0x2

    .line 95
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    const v1, 0x40020

    .line 96
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/16 v1, 0x51

    .line 98
    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    const/4 v1, 0x0

    .line 99
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 100
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    const/16 v1, 0x2d

    .line 101
    invoke-direct {p0, v1}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->dpToPx(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundBlurRadius(I)V

    .line 103
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 104
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    const/16 v3, 0xc8

    .line 105
    invoke-direct {p0, v3}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->dpToPx(I)I

    move-result v3

    const/16 v4, 0x3a

    .line 106
    invoke-direct {p0, v4}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->dpToPx(I)I

    move-result v4

    sub-int/2addr v2, v4

    const/16 v4, 0x190

    .line 107
    invoke-direct {p0, v4}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->dpToPx(I)I

    move-result v4

    .line 106
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 105
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v2, -0x2

    .line 108
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    const/16 v2, 0x58

    .line 109
    invoke-direct {p0, v2}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->dpToPx(I)I

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    const/4 v2, 0x0

    .line 110
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 111
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 112
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->dpToPx(I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    return-void
.end method

.method static blacklist createIntent(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/content/Intent;
    .locals 2

    .line 50
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo p0, "android.intent.extra.TITLE"

    .line 51
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p0

    const/high16 p1, 0x800000

    .line 52
    invoke-virtual {p0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private blacklist dpToPx(I)I
    .locals 1

    int-to-float p1, p1

    .line 117
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x1

    .line 116
    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private synthetic blacklist lambda$onCreate$0(Landroid/view/View;)V
    .locals 1

    .line 71
    const-string p1, "ALK105"

    const-string v0, "ALK1011"

    invoke-static {p0, p1, v0}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->openAppLockSettings()V

    return-void
.end method

.method private blacklist openAppLockSettings()V
    .locals 4

    .line 122
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.settings.APP_LOCK_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    .line 123
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->startActivity(Landroid/content/Intent;)V

    .line 124
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "app_lock_settings_discovered"

    .line 127
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    const/4 v3, -0x1

    .line 124
    invoke-static {v0, v1, v3, v2}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 129
    const-string/jumbo v1, "SamsungAppLockSettingsPromotion"

    const-string/jumbo v2, "Unable to open App Lock settings"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    :goto_0
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->finish()V

    return-void
.end method


# virtual methods
.method public whitelist finish()V
    .locals 0

    .line 145
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 146
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    if-eqz p0, :cond_0

    .line 147
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->onActivityFinished()V

    :cond_0
    return-void
.end method

.method public whitelist onBackPressed()V
    .locals 0

    .line 153
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->finish()V

    return-void
.end method

.method public whitelist onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 158
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 159
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->configureWindow()V

    return-void
.end method

.method protected whitelist onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 57
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 59
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string/jumbo v0, "android.intent.extra.TITLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 60
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->finish()V

    return-void

    :cond_0
    const v0, 0x1090175

    .line 65
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->setContentView(I)V

    .line 66
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->configureWindow()V

    const v0, 0x10205df

    .line 67
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x1040f8a

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 68
    invoke-virtual {p0, v1, p1}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 67
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x10205de

    .line 69
    invoke-virtual {p0, p1}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    const-class p1, Landroid/view/accessibility/AccessibilityManager;

    .line 77
    invoke-virtual {p0, p1}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    const/16 v0, 0x1388

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x6

    .line 80
    invoke-virtual {p1, v0, v1}, Landroid/view/accessibility/AccessibilityManager;->getRecommendedTimeoutMillis(II)I

    move-result v0

    .line 84
    :goto_0
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mTimeoutRunnable:Ljava/lang/Runnable;

    int-to-long v2, v0

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 88
    new-instance p1, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity$$ExternalSyntheticLambda1;-><init>(Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;)V

    invoke-static {p0, p1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->attach(Landroid/app/Activity;Ljava/lang/Runnable;)Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    return-void
.end method

.method protected whitelist onDestroy()V
    .locals 2

    .line 164
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mTimeoutRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 165
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->release()V

    const/4 v0, 0x0

    .line 167
    iput-object v0, p0, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    .line 169
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public whitelist onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 136
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 137
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->finish()V

    const/4 p0, 0x1

    return p0

    .line 140
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
