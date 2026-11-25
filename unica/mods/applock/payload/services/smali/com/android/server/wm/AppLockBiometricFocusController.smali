.class public final Lcom/android/server/wm/AppLockBiometricFocusController;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final mHandler:Landroid/os/Handler;

.field public mRequest:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

.field public final mWmService:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/wm/WindowManagerService;Landroid/os/Handler;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iput-object p2, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static isPromptReadyLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Z
    .locals 3

    iget-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mWindow:Lcom/android/server/wm/WindowState;

    iget-object v1, v0, Lcom/android/server/wm/WindowState;->mInputChannelToken:Landroid/os/IBinder;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/android/server/wm/WindowState;->mWinAnimator:Lcom/android/server/wm/WindowStateAnimator;

    iget-object v1, v1, Lcom/android/server/wm/WindowStateAnimator;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/android/server/wm/WindowState;->isDrawn()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/android/server/wm/WindowState;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v2}, Lcom/android/server/wm/WindowState;->canReceiveKeys(Z)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPromptDisplay:Lcom/android/server/wm/DisplayContent;

    invoke-virtual {p0}, Lcom/android/server/wm/DisplayContent;->findFocusedWindow()Lcom/android/server/wm/WindowState;

    move-result-object p0

    if-ne p0, v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    return v2
.end method

.method public static isPromptWindowLocked(Lcom/android/server/wm/WindowState;)Z
    .locals 2

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v1, 0x7e1

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mOwnerCanAddInternalSystemWindow:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget v0, v0, Lcom/android/server/wm/Session;->mUid:I

    invoke-static {v0}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v0

    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget-object v0, v0, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    const-string/jumbo v1, "com.samsung.android.biometrics.app.setting"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {p0}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object p0

    const-string v0, "BiometricPromptRoot"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static updateSourceInputStateLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;
    .locals 5

    iget-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mDisplay:Lcom/android/server/wm/DisplayContent;

    iget-object v1, v0, Lcom/android/server/wm/DisplayContent;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    iget-object v0, v0, Lcom/android/server/wm/DisplayContent;->mInputMonitor:Lcom/android/server/wm/InputMonitor;

    iget-object v0, v0, Lcom/android/server/wm/InputMonitor;->mInputFocus:Landroid/os/IBinder;

    sget-object v2, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->PENDING:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/android/server/wm/WindowState;->mActivityRecord:Lcom/android/server/wm/ActivityRecord;

    iget-object v4, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mActivity:Lcom/android/server/wm/ActivityRecord;

    if-eq v3, v4, :cond_1

    iget-object v4, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mSourceInputToken:Landroid/os/IBinder;

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mInitialSourceFocus:Lcom/android/server/wm/WindowState;

    if-ne v1, v4, :cond_4

    if-nez v3, :cond_4

    iget-object v3, v1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v4, 0x7f6

    if-ne v3, v4, :cond_4

    if-eqz v0, :cond_0

    iget-object v3, v1, Lcom/android/server/wm/WindowState;->mInputChannelToken:Landroid/os/IBinder;

    if-eq v0, v3, :cond_0

    iget-object v3, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPendingSourceInputToken:Landroid/os/IBinder;

    if-ne v0, v3, :cond_4

    :cond_0
    if-eqz v0, :cond_5

    iget-object v1, v1, Lcom/android/server/wm/WindowState;->mInputChannelToken:Landroid/os/IBinder;

    if-ne v0, v1, :cond_5

    iput-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPendingSourceInputToken:Landroid/os/IBinder;

    return-object v2

    :cond_1
    iget-object v1, v1, Lcom/android/server/wm/WindowState;->mInputChannelToken:Landroid/os/IBinder;

    if-eqz v1, :cond_2

    if-ne v0, v1, :cond_2

    iput-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mSourceInputToken:Landroid/os/IBinder;

    sget-object p0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->READY:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    return-object p0

    :cond_2
    iget-object v1, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mSourceInputToken:Landroid/os/IBinder;

    if-eqz v1, :cond_3

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPendingSourceInputToken:Landroid/os/IBinder;

    :goto_0
    if-eqz v1, :cond_5

    if-eqz v0, :cond_5

    if-eq v0, v1, :cond_5

    :cond_4
    sget-object p0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->LOST:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    return-object p0

    :cond_5
    return-object v2
.end method


# virtual methods
.method public final clearRequestLocked()V
    .locals 2

    iget-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mRequest:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mHandler:Landroid/os/Handler;

    iget-object v0, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mTransferFocus:Lcom/android/server/wm/AppLockBiometricFocusController$Request$$ExternalSyntheticLambda0;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mRequest:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    :cond_0
    return-void
.end method

.method public final isSourceActivityEligibleLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/DisplayContent;)Z
    .locals 1

    iget-boolean v0, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/server/wm/ActivityRecord$State;->RESUMED:Lcom/android/server/wm/ActivityRecord$State;

    invoke-virtual {p1, v0}, Lcom/android/server/wm/ActivityRecord;->isState(Lcom/android/server/wm/ActivityRecord$State;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p2, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;

    if-ne v0, p1, :cond_0

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v0

    if-ne v0, p2, :cond_0

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    if-eqz p0, :cond_0

    iget-boolean p0, p2, Lcom/android/server/wm/DisplayContent;->mRemoving:Z

    if-nez p0, :cond_0

    iget-object p0, p2, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    invoke-virtual {p0}, Landroid/view/Display;->isTrusted()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {p2}, Lcom/android/server/wm/DisplayContent;->isRemovedOrInvalid()Z

    move-result p0

    if-nez p0, :cond_0

    invoke-virtual {p1}, Lcom/android/server/wm/ActivityRecord;->showToCurrentUser()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final onFocusUpdatedLocked()V
    .locals 2

    iget-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mRequest:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lcom/android/server/wm/AppLockBiometricFocusController;->updateRequestStateLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v1, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mQueued:Z

    if-nez v1, :cond_1

    invoke-static {v0}, Lcom/android/server/wm/AppLockBiometricFocusController;->isPromptReadyLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mQueued:Z

    iget-object p0, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mHandler:Landroid/os/Handler;

    iget-object v0, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mTransferFocus:Lcom/android/server/wm/AppLockBiometricFocusController$Request$$ExternalSyntheticLambda0;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public final onWindowAddedLocked(Lcom/android/server/wm/WindowState;)V
    .locals 7

    invoke-static {p1}, Lcom/android/server/wm/AppLockBiometricFocusController;->isPromptWindowLocked(Lcom/android/server/wm/WindowState;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/wm/AppLockBiometricFocusController;->clearRequestLocked()V

    iget-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v0, Lcom/android/server/wm/WindowManagerService;->mRoot:Lcom/android/server/wm/RootWindowContainer;

    invoke-virtual {v1}, Lcom/android/server/wm/RootWindowContainer;->getTopFocusedDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v2

    if-eqz v1, :cond_6

    if-eqz v2, :cond_6

    if-eq v2, v1, :cond_6

    iget-object v3, v1, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;

    if-nez v3, :cond_1

    goto/16 :goto_1

    :cond_1
    iget-object v4, v3, Lcom/android/server/wm/ActivityRecord;->mActivityComponent:Landroid/content/ComponentName;

    if-eqz v4, :cond_6

    const-string/jumbo v4, "android"

    iget-object v5, v3, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v4, v3, Lcom/android/server/wm/ActivityRecord;->info:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v4}, Landroid/content/pm/ActivityInfo;->getUid()I

    move-result v4

    invoke-static {v4}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v4

    const/16 v5, 0x3e8

    if-ne v4, v5, :cond_6

    iget-object v4, v3, Lcom/android/server/wm/ActivityRecord;->mActivityComponent:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/app/LockedAppActivity;->isLockedAppActivityClassName(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {p0, v3, v1}, Lcom/android/server/wm/AppLockBiometricFocusController;->isSourceActivityEligibleLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/DisplayContent;)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    iget-object v4, v3, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const/16 v5, -0x2710

    if-eqz v4, :cond_3

    const-string/jumbo v6, "android.intent.extra.USER_ID"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    goto :goto_0

    :cond_3
    move v4, v5

    :goto_0
    if-eq v4, v5, :cond_6

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mUmInternal:Lcom/android/server/pm/UserManagerInternal;

    invoke-virtual {v0, v4}, Lcom/android/server/pm/UserManagerInternal;->isUserVisible(I)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_1

    :cond_4
    new-instance v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->this$0:Lcom/android/server/wm/AppLockBiometricFocusController;

    new-instance v5, Lcom/android/server/wm/AppLockBiometricFocusController$Request$$ExternalSyntheticLambda0;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v0, v5, Lcom/android/server/wm/AppLockBiometricFocusController$Request$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v5, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mTransferFocus:Lcom/android/server/wm/AppLockBiometricFocusController$Request$$ExternalSyntheticLambda0;

    iput-object v3, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mActivity:Lcom/android/server/wm/ActivityRecord;

    iput-object v1, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mDisplay:Lcom/android/server/wm/DisplayContent;

    iput-object p1, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mWindow:Lcom/android/server/wm/WindowState;

    iput-object v2, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPromptDisplay:Lcom/android/server/wm/DisplayContent;

    iput v4, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mUserId:I

    iget-object p1, v1, Lcom/android/server/wm/DisplayContent;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    iput-object p1, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mInitialSourceFocus:Lcom/android/server/wm/WindowState;

    iget-object v1, v1, Lcom/android/server/wm/DisplayContent;->mInputMonitor:Lcom/android/server/wm/InputMonitor;

    iget-object v1, v1, Lcom/android/server/wm/InputMonitor;->mInputFocus:Landroid/os/IBinder;

    iput-object v1, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPendingSourceInputToken:Landroid/os/IBinder;

    if-nez v1, :cond_5

    if-eqz p1, :cond_5

    iget-object p1, p1, Lcom/android/server/wm/WindowState;->mInputChannelToken:Landroid/os/IBinder;

    iput-object p1, v0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPendingSourceInputToken:Landroid/os/IBinder;

    :cond_5
    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mRequest:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    invoke-static {v0}, Lcom/android/server/wm/AppLockBiometricFocusController;->updateSourceInputStateLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    move-result-object p1

    sget-object v0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->LOST:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    if-ne p1, v0, :cond_6

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockBiometricFocusController;->clearRequestLocked()V

    :cond_6
    :goto_1
    return-void
.end method

.method public final updateRequestStateLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Z
    .locals 8

    iget-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v0, Lcom/android/server/wm/WindowManagerService;->mRoot:Lcom/android/server/wm/RootWindowContainer;

    invoke-virtual {v1}, Lcom/android/server/wm/RootWindowContainer;->getTopFocusedDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v1

    iget-object v2, p1, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mDisplay:Lcom/android/server/wm/DisplayContent;

    iget-object v3, p1, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mWindow:Lcom/android/server/wm/WindowState;

    iget-object v4, p1, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mActivity:Lcom/android/server/wm/ActivityRecord;

    const/4 v5, 0x0

    if-ne v1, v2, :cond_4

    invoke-virtual {p0, v4, v2}, Lcom/android/server/wm/AppLockBiometricFocusController;->isSourceActivityEligibleLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/DisplayContent;)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-static {p1}, Lcom/android/server/wm/AppLockBiometricFocusController;->updateSourceInputStateLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    move-result-object v1

    sget-object v2, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->LOST:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    if-eq v1, v2, :cond_3

    iget-object v2, p1, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPromptDisplay:Lcom/android/server/wm/DisplayContent;

    iget-boolean v6, v3, Lcom/android/server/wm/WindowState;->mRemoved:Z

    if-nez v6, :cond_3

    invoke-virtual {v3}, Lcom/android/server/wm/WindowContainer;->isRemovalRequested()Z

    move-result v6

    if-nez v6, :cond_3

    iget v6, v3, Lcom/android/server/wm/WindowState;->mViewVisibility:I

    if-nez v6, :cond_3

    invoke-static {v3}, Lcom/android/server/wm/AppLockBiometricFocusController;->isPromptWindowLocked(Lcom/android/server/wm/WindowState;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v3}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v6

    if-ne v6, v2, :cond_3

    iget-boolean v6, v2, Lcom/android/server/wm/DisplayContent;->mRemoving:Z

    if-nez v6, :cond_3

    iget-object v6, v2, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    invoke-virtual {v6}, Landroid/view/Display;->isTrusted()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v2}, Lcom/android/server/wm/DisplayContent;->isRemovedOrInvalid()Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v2}, Lcom/android/server/wm/DisplayContent;->canStealTopFocus()Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v4, v4, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const/16 v6, -0x2710

    if-eqz v4, :cond_1

    const-string/jumbo v7, "android.intent.extra.USER_ID"

    invoke-virtual {v4, v7, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    :cond_1
    iget v4, p1, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mUserId:I

    if-ne v6, v4, :cond_3

    iget-object v6, v0, Lcom/android/server/wm/WindowManagerService;->mUmInternal:Lcom/android/server/pm/UserManagerInternal;

    invoke-virtual {v6, v4}, Lcom/android/server/pm/UserManagerInternal;->isUserVisible(I)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->showToCurrentUser()Z

    move-result v3

    if-eqz v3, :cond_3

    iget v2, v2, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    iget-object v3, v0, Lcom/android/server/wm/WindowManagerService;->mUmInternal:Lcom/android/server/pm/UserManagerInternal;

    invoke-virtual {v3, v2}, Lcom/android/server/pm/UserManagerInternal;->getUserAssignedToDisplay(I)I

    move-result v2

    iget-object p1, p1, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mDisplay:Lcom/android/server/wm/DisplayContent;

    iget p1, p1, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mUmInternal:Lcom/android/server/pm/UserManagerInternal;

    invoke-virtual {v0, p1}, Lcom/android/server/pm/UserManagerInternal;->getUserAssignedToDisplay(I)I

    move-result p1

    if-ne v2, p1, :cond_3

    sget-object p0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->READY:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    if-ne v1, p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v5

    :cond_3
    invoke-virtual {p0}, Lcom/android/server/wm/AppLockBiometricFocusController;->clearRequestLocked()V

    return v5

    :cond_4
    :goto_0
    invoke-virtual {p0}, Lcom/android/server/wm/AppLockBiometricFocusController;->clearRequestLocked()V

    return v5
.end method
