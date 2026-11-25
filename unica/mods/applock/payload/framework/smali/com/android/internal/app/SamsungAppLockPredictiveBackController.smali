.class final Lcom/android/internal/app/SamsungAppLockPredictiveBackController;
.super Ljava/lang/Object;
.source "SamsungAppLockPredictiveBackController.java"


# instance fields
.field private blacklist mActiveView:Landroid/view/View;

.field private final blacklist mActivity:Landroid/app/Activity;

.field private final blacklist mBackCallback:Landroid/window/OnBackInvokedCallback;

.field private final blacklist mMaxTranslationY:F

.field private final blacklist mOnBackInvoked:Ljava/lang/Runnable;

.field private blacklist mReleased:Z


# direct methods
.method static bridge synthetic blacklist -$$Nest$fgetmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActiveView:Landroid/view/View;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmActivity(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmMaxTranslationY(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)F
    .locals 0

    iget p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mMaxTranslationY:F

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmOnBackInvoked(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mOnBackInvoked:Ljava/lang/Runnable;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmReleased(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mReleased:Z

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$fputmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActiveView:Landroid/view/View;

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mgetTargetView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->getTargetView()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private constructor blacklist <init>(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    .line 55
    iput-object p2, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mOnBackInvoked:Ljava/lang/Runnable;

    .line 56
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x10504c0

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mMaxTranslationY:F

    .line 58
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->createBackCallback()Landroid/window/OnBackInvokedCallback;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mBackCallback:Landroid/window/OnBackInvokedCallback;

    return-void
.end method

.method static blacklist attach(Landroid/app/Activity;Ljava/lang/Runnable;)Lcom/android/internal/app/SamsungAppLockPredictiveBackController;
    .locals 3

    .line 70
    new-instance v0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 72
    invoke-virtual {p0}, Landroid/app/Activity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object p1

    iget-object v1, v0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mBackCallback:Landroid/window/OnBackInvokedCallback;

    const/4 v2, 0x0

    invoke-interface {p1, v2, v1}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    .line 74
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-nez p1, :cond_0

    const p1, 0x10a0145

    .line 76
    invoke-virtual {p0, p1, v2}, Landroid/app/Activity;->semOverridePendingTransition(II)V

    :cond_0
    return-object v0
.end method

.method private blacklist createBackCallback()Landroid/window/OnBackInvokedCallback;
    .locals 1

    .line 106
    new-instance v0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;

    invoke-direct {v0, p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;-><init>(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)V

    return-object v0
.end method

.method private blacklist getTargetView()Landroid/view/View;
    .locals 2

    .line 160
    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mReleased:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 163
    :cond_0
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 164
    invoke-virtual {p0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object p0

    goto :goto_0

    :cond_1
    move-object p0, v1

    :goto_0
    if-eqz p0, :cond_2

    .line 165
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object p0

    :cond_2
    :goto_1
    return-object v1
.end method


# virtual methods
.method blacklist onActivityFinished()V
    .locals 2

    .line 83
    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mReleased:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    const/4 v0, 0x0

    const v1, 0x10a00e8

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->semOverridePendingTransition(II)V

    :cond_1
    :goto_0
    return-void
.end method

.method blacklist release()V
    .locals 2

    .line 92
    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mReleased:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 95
    iput-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mReleased:Z

    .line 96
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mBackCallback:Landroid/window/OnBackInvokedCallback;

    invoke-interface {v0, v1}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    .line 98
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActiveView:Landroid/view/View;

    const/4 v1, 0x0

    .line 99
    iput-object v1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->mActiveView:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 101
    invoke-static {v0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->reset(Landroid/view/View;)V

    :cond_1
    :goto_0
    return-void
.end method
