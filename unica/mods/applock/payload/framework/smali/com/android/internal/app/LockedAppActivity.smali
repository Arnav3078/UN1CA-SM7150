.class public Lcom/android/internal/app/LockedAppActivity;
.super Landroid/app/Activity;
.source "LockedAppActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/LockedAppActivity$Injector;,
        Lcom/android/internal/app/LockedAppActivity$InterceptActivity;,
        Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;,
        Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;,
        Lcom/android/internal/app/LockedAppActivity$ActivityMode;
    }
.end annotation

.annotation system Ldalvik/annotation/PermittedSubclasses;
    value = {
        Lcom/android/internal/app/LockedAppActivity$InterceptActivity;
    }
.end annotation


# static fields
.field static final blacklist ACTIVITY_MODE_CLEAR_STORAGE:I = 0x3

.field public static final blacklist ACTIVITY_MODE_INTERCEPT:I = 0x0

.field public static final blacklist ACTIVITY_MODE_LOCKED_TASK:I = 0x1

.field public static final blacklist ACTIVITY_MODE_LOCKED_TASK_INTERCEPT:I = 0x4

.field static final blacklist ACTIVITY_MODE_UNINSTALL:I = 0x2

.field private static final blacklist DARK_BACKGROUND_LUMINANCE_THRESHOLD:F = 0.5f

.field private static final blacklist DEBUG:Z

.field private static final blacklist DEFAULT_SETTINGS_PACKAGE:Ljava/lang/String; = "com.android.settings"

.field public static final blacklist DEFAULT_TARGET_APP_APPEARANCE:I = 0x0

.field public static final blacklist DEFAULT_TARGET_APP_BACKGROUND_COLOR:I = 0x0

.field public static final blacklist EXTRA_ACTIVITY_MODE:Ljava/lang/String; = "com.android.internal.app.extra.ACTIVITY_MODE"

.field public static final blacklist EXTRA_APP_LOCK_ORIGINAL_CALLING_PID:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_ORIGINAL_CALLING_PID"

.field public static final blacklist EXTRA_APP_LOCK_ORIGINAL_CALLING_UID:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_ORIGINAL_CALLING_UID"

.field public static final blacklist EXTRA_DISABLE_SPLASH_SCREEN:Ljava/lang/String; = "com.android.internal.app.extra.EXTRA_DISABLE_SPLASH_SCREEN"

.field public static final blacklist EXTRA_EXPECTS_RESULT:Ljava/lang/String; = "com.android.internal.app.extra.EXPECTS_RESULT"

.field public static final blacklist EXTRA_IN_TARGET_TASK:Ljava/lang/String; = "com.android.internal.app.extra.IN_TARGET_TASK"

.field public static final blacklist EXTRA_SEND_INTENT_IN_LOCKED_TASK_MODE:Ljava/lang/String; = "com.android.internal.app.extra.SEND_INTENT_IN_LOCKED_TASK_MODE"

.field public static final blacklist EXTRA_STATUS_RECEIVER:Ljava/lang/String; = "com.android.internal.app.extra.STATUS_RECEIVER"

.field public static final blacklist EXTRA_TARGET_APP_BACKGROUND_COLOR:Ljava/lang/String; = "com.android.internal.app.extra.TARGET_APP_BACKGROUND_COLOR"

.field public static final blacklist EXTRA_TARGET_APP_SYSTEM_BARS_APPEARANCE:Ljava/lang/String; = "com.android.internal.app.extra.TARGET_APP_SYSTEM_BARS_APPEARANCE"

.field public static final blacklist EXTRA_UNINSTALL_FLAGS:Ljava/lang/String; = "com.android.internal.app.extra.UNINSTALL_FLAGS"

.field public static final blacklist EXTRA_VERSIONED_PACKAGE:Ljava/lang/String; = "com.android.internal.app.extra.VERSIONED_PACKAGE"

.field private static final blacklist MAX_LOGO_DESCRIPTION_CHARACTER_NUMBER:I = 0x1e

.field private static final blacklist PLURALS_APP_1:Ljava/lang/String; = "app1"

.field private static final blacklist PLURALS_APP_2:Ljava/lang/String; = "app2"

.field private static final blacklist PLURALS_APP_3:Ljava/lang/String; = "app3"

.field private static final blacklist PLURALS_COUNT:Ljava/lang/String; = "count"

.field private static final blacklist SA_DIMENSION_PACKAGE_NAME:Ljava/lang/String; = "PackageName"

.field private static final blacklist SA_EVENT_LAUNCH_LOCKED_APP:Ljava/lang/String; = "ALK1020"

.field private static final blacklist SA_PAGE_HOME:Ljava/lang/String; = "ALK101"

.field private static final blacklist SYSTEM_PACKAGE_NAME:Ljava/lang/String; = "android"

.field private static final blacklist TAG:Ljava/lang/String; = "LockedAppActivity"

.field private static blacklist sInjector:Lcom/android/internal/app/LockedAppActivity$Injector;


# instance fields
.field private blacklist mActivityMode:I

.field private final blacklist mAppLaunchLogged:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private blacklist mAppLockManager:Landroid/security/applock/AppLockManager;

.field private final blacklist mAuthenticationCallback:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

.field private final blacklist mAuthenticationDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

.field private blacklist mAuthenticationDisplayManager:Landroid/hardware/display/DisplayManager;

.field private blacklist mCancellationSignal:Landroid/os/CancellationSignal;

.field private final blacklist mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

.field private blacklist mIsAuthFlowActive:Z

.field private blacklist mIsAuthenticationSucceededForSaLogging:Z

.field private blacklist mIsInterceptAuthenticationDeferred:Z

.field private blacklist mIsInterceptUnlockStateUpdated:Z

.field private blacklist mIsKeyguardDismissPending:Z

.field private blacklist mIsLockedTaskUnlockStateUpdated:Z

.field private blacklist mIsLockedTaskUnlockTargetDrawComplete:Z

.field private blacklist mIsPackageUnlocked:Z

.field private blacklist mIsPromptPending:Z

.field private blacklist mIsSplitAppLockAuthenticationReady:Z

.field private blacklist mIsWaitingForLockedTaskUnlockDraw:Z

.field private final blacklist mOnBackInvokedCallback:Landroid/window/OnBackInvokedCallback;

.field private blacklist mPackageLabel:Ljava/lang/CharSequence;

.field private blacklist mPackageLockedStateListener:Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;

.field private blacklist mPackageLogo:Landroid/graphics/Bitmap;

.field private blacklist mPackageName:Ljava/lang/String;

.field private blacklist mSettingsPackageName:Ljava/lang/String;

.field private blacklist mShowLockedTaskUiInEmptyTask:Z

.field private blacklist mTarget:Landroid/content/IntentSender;

.field private blacklist mTargetAppAppearance:I

.field private blacklist mTargetAppBackgroundColor:I

.field private final blacklist mTargetIntentSent:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private blacklist mUninstallFlags:I

.field private blacklist mUninstallStatusReceiver:Landroid/content/IntentSender;

.field private blacklist mUninstallVersionedPackage:Landroid/content/pm/VersionedPackage;

.field private blacklist mUserId:I


# direct methods
.method public static synthetic blacklist $r8$lambda$-ITXyO3cfiUJC7aYZ9CLi2cHf6o(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->lambda$new$0()V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$IhczJS5RkglmKFIhmx_Im2_e7L4(Lcom/android/internal/app/LockedAppActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->lambda$setupLockedTaskModeUi$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$JJGFxf6FtVCMT0hn1oHUHrYusvk(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->lambda$onPause$0()V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$uBBzlTSkJxu64ztNb8WUVdZxB6Y(Lcom/android/internal/app/LockedAppActivity;Landroid/os/CancellationSignal;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->lambda$onPause$1(Landroid/os/CancellationSignal;)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmAppLockManager(Lcom/android/internal/app/LockedAppActivity;)Landroid/security/applock/AppLockManager;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLockManager:Landroid/security/applock/AppLockManager;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmCancellationSignal(Lcom/android/internal/app/LockedAppActivity;)Landroid/os/CancellationSignal;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmInjector(Lcom/android/internal/app/LockedAppActivity;)Lcom/android/internal/app/LockedAppActivity$Injector;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmIsKeyguardDismissPending(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmIsWaitingForLockedTaskUnlockDraw(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmPackageName(Lcom/android/internal/app/LockedAppActivity;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmShowLockedTaskUiInEmptyTask(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/internal/app/LockedAppActivity;->mShowLockedTaskUiInEmptyTask:Z

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmUninstallFlags(Lcom/android/internal/app/LockedAppActivity;)I
    .locals 0

    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallFlags:I

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmUninstallStatusReceiver(Lcom/android/internal/app/LockedAppActivity;)Landroid/content/IntentSender;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallStatusReceiver:Landroid/content/IntentSender;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmUninstallVersionedPackage(Lcom/android/internal/app/LockedAppActivity;)Landroid/content/pm/VersionedPackage;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallVersionedPackage:Landroid/content/pm/VersionedPackage;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmUserId(Lcom/android/internal/app/LockedAppActivity;)I
    .locals 0

    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsAuthFlowActive(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsAuthenticationSucceededForSaLogging(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthenticationSucceededForSaLogging:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsInterceptUnlockStateUpdated(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsInterceptUnlockStateUpdated:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsKeyguardDismissPending(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsLockedTaskUnlockStateUpdated(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockStateUpdated:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsLockedTaskUnlockTargetDrawComplete(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockTargetDrawComplete:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsPackageUnlocked(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPackageUnlocked:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fputmIsWaitingForLockedTaskUnlockDraw(Lcom/android/internal/app/LockedAppActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mcompleteLockedTaskUnlockIfReady(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->completeLockedTaskUnlockIfReady()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mcompleteUnlockAfterDestroyed(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->completeUnlockAfterDestroyed()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mcompleteUnlockAndFinish(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->completeUnlockAndFinish()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$misClearStorageMode(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isClearStorageMode()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$misInterceptMode(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$misLockedTaskMode(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$misOneShotAuthMode(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isOneShotAuthMode()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$misUninstallMode(Lcom/android/internal/app/LockedAppActivity;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isUninstallMode()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$mlogAppLaunchIfNeeded(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->logAppLaunchIfNeeded()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mlogAppLockEvent(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->logAppLockEvent(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$monKeyguardDismissFailed(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->onKeyguardDismissFailed(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mresumePendingAuthenticationIfNeeded(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->resumePendingAuthenticationIfNeeded()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$msendUninstallFailure(Lcom/android/internal/app/LockedAppActivity;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/LockedAppActivity;->sendUninstallFailure(ILjava/lang/String;)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mshowBiometricPrompt(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showBiometricPrompt()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$sfgetDEBUG()Z
    .locals 1

    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    return v0
.end method

.method static constructor blacklist <clinit>()V
    .locals 2

    .line 170
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "LockedAppActivity"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    return-void
.end method

.method public constructor blacklist <init>()V
    .locals 2

    .line 147
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 161
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLaunchLogged:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    .line 251
    iput v0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    .line 256
    sget-object v1, Lcom/android/internal/app/LockedAppActivity;->sInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-direct {v1}, Lcom/android/internal/app/LockedAppActivity$Injector;-><init>()V

    :cond_0
    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    .line 259
    new-instance v1, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda3;-><init>(Lcom/android/internal/app/LockedAppActivity;)V

    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mOnBackInvokedCallback:Landroid/window/OnBackInvokedCallback;

    .line 273
    new-instance v1, Lcom/android/internal/app/LockedAppActivity$1;

    invoke-direct {v1, p0}, Lcom/android/internal/app/LockedAppActivity$1;-><init>(Lcom/android/internal/app/LockedAppActivity;)V

    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationCallback:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

    .line 401
    iput-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mShowLockedTaskUiInEmptyTask:Z

    .line 405
    new-instance v1, Lcom/android/internal/app/LockedAppActivity$2;

    invoke-direct {v1, p0}, Lcom/android/internal/app/LockedAppActivity$2;-><init>(Lcom/android/internal/app/LockedAppActivity;)V

    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    .line 457
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mTargetIntentSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private static blacklist activityModeToString(I)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_4

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    .line 247
    const-string/jumbo p0, "UNKNOWN"

    return-object p0

    .line 246
    :cond_0
    const-string/jumbo p0, "LOCKED_TASK_INTERCEPT"

    return-object p0

    .line 245
    :cond_1
    const-string p0, "CLEAR_STORAGE"

    return-object p0

    .line 244
    :cond_2
    const-string/jumbo p0, "UNINSTALL"

    return-object p0

    .line 243
    :cond_3
    const-string/jumbo p0, "LOCKED_TASK"

    return-object p0

    .line 242
    :cond_4
    const-string/jumbo p0, "INTERCEPT"

    return-object p0
.end method

.method private blacklist allowsPassiveUnlock()Z
    .locals 1

    .line 1045
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isOneShotAuthMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskInterceptMode()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist applyTheme()V
    .locals 2

    .line 809
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showsLockedTaskUi()Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x1030129

    goto :goto_0

    :cond_0
    const v1, 0x103013a

    :goto_0
    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTheme(Landroid/app/Activity;I)V

    return-void
.end method

.method private blacklist completeLockedTaskUnlockIfReady()V
    .locals 1

    .line 1857
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockTargetDrawComplete:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockStateUpdated:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1861
    iput-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    .line 1862
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1863
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->completeUnlockAndFinish()V

    :cond_1
    :goto_0
    return-void
.end method

.method private blacklist completeUnlockAfterDestroyed()V
    .locals 10

    .line 1885
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTargetIntentSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1886
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1890
    :cond_0
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    const-string/jumbo v1, "LockedAppActivity"

    if-eqz v0, :cond_1

    .line 1891
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Sending target intent from detached activity: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1893
    :cond_1
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v0

    const/4 v2, 0x3

    .line 1894
    invoke-virtual {v0, v2}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    move-result-object v0

    .line 1897
    :try_start_0
    iget-object v2, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    .line 1898
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v3, p0

    .line 1897
    invoke-virtual/range {v2 .. v9}, Landroid/content/IntentSender;->sendIntent(Landroid/content/Context;ILandroid/content/Intent;Ljava/lang/String;Landroid/os/Bundle;Ljava/util/concurrent/Executor;Landroid/content/IntentSender$OnFinished;)V

    .line 1901
    invoke-direct {v3}, Lcom/android/internal/app/LockedAppActivity;->logAppLaunchIfNeeded()V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 1904
    const-string/jumbo v0, "Unable to send target intent from detached activity"

    invoke-static {v1, v0, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_0
    return-void
.end method

.method private blacklist completeUnlockAndFinish()V
    .locals 3

    .line 1691
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    if-eqz v0, :cond_1

    .line 1695
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTargetIntentSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1696
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "com.android.internal.app.extra.EXPECTS_RESULT"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 1706
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->sendTargetIntent(Landroid/app/Activity;Landroid/content/IntentSender;)V

    .line 1707
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 1725
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mShowLockedTaskUiInEmptyTask:Z

    if-eqz v0, :cond_3

    .line 1737
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    if-nez v0, :cond_2

    .line 1738
    const-string/jumbo v0, "LockedAppActivity"

    const-string/jumbo v1, "completeUnlockAndFinish: no target IntentSender for the empty locked task"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1740
    :cond_2
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTargetIntentSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1742
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getTaskId()I

    move-result v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/app/LockedAppActivity$Injector;->sendTargetIntent(Landroid/app/Activity;Landroid/content/IntentSender;I)V

    .line 1745
    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mShowLockedTaskUiInEmptyTask:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockStateUpdated:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockTargetDrawComplete:Z

    if-eqz v0, :cond_4

    .line 1748
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1752
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->logAppLaunchIfNeeded()V

    .line 1755
    :cond_4
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void
.end method

.method public static blacklist convertDrawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 5

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1926
    :cond_0
    instance-of v0, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_1

    .line 1927
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    .line 1931
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    if-gtz v0, :cond_2

    goto :goto_0

    .line 1935
    :cond_2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    .line 1936
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 1935
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1

    .line 1932
    :cond_3
    :goto_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v1, 0x1

    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1939
    :goto_1
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1940
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1941
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-object v0
.end method

.method public static blacklist createClearStorageAuthIntent(Ljava/lang/String;I)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x0

    .line 601
    invoke-static {p0, p1, v0}, Lcom/android/internal/app/LockedAppActivity;->createLockedAppActivityIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.ACTIVITY_MODE"

    const/4 v0, 0x3

    .line 602
    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createLockedAppActivityIntent(Ljava/lang/String;IIILandroid/content/IntentSender;)Landroid/content/Intent;
    .locals 0

    .line 556
    invoke-static {p0, p1, p4}, Lcom/android/internal/app/LockedAppActivity;->createLockedAppActivityIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.TARGET_APP_BACKGROUND_COLOR"

    .line 557
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.TARGET_APP_SYSTEM_BARS_APPEARANCE"

    .line 558
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createLockedAppActivityIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;
    .locals 4

    .line 513
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    invoke-static {p2}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode(Landroid/content/IntentSender;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 518
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v2, "android"

    .line 519
    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->resolveActivityClassName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.PACKAGE_NAME"

    .line 520
    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo v1, "android.intent.extra.USER_ID"

    .line 521
    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "android.intent.extra.INTENT"

    .line 522
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.ACTIVITY_MODE"

    .line 523
    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const/high16 p1, 0x800000

    .line 524
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createLockedAppActivityUninstallIntent(Landroid/content/pm/VersionedPackage;IILandroid/content/IntentSender;)Landroid/content/Intent;
    .locals 2

    .line 577
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 578
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    invoke-virtual {p0}, Landroid/content/pm/VersionedPackage;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 580
    invoke-static {v0, p1, v1}, Lcom/android/internal/app/LockedAppActivity;->createLockedAppActivityIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object p1

    const-string/jumbo v0, "com.android.internal.app.extra.ACTIVITY_MODE"

    const/4 v1, 0x2

    .line 582
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const-string/jumbo v0, "com.android.internal.app.extra.VERSIONED_PACKAGE"

    .line 583
    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.UNINSTALL_FLAGS"

    .line 584
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.STATUS_RECEIVER"

    .line 585
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createLockedTaskInterceptIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;
    .locals 1

    .line 542
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    invoke-static {p0, p1, p2}, Lcom/android/internal/app/LockedAppActivity;->createLockedAppActivityIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object p0

    const/4 p1, 0x4

    .line 545
    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->resolveActivityClassName(I)Ljava/lang/String;

    move-result-object p2

    .line 544
    const-string/jumbo v0, "android"

    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p2, "com.android.internal.app.extra.ACTIVITY_MODE"

    .line 546
    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private blacklist finishIfUnlocked(Ljava/lang/String;I)Z
    .locals 2

    .line 1284
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    const/4 v1, 0x0

    if-nez v0, :cond_4

    .line 1286
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsInterceptUnlockStateUpdated:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPackageUnlocked:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 1291
    :cond_0
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPackageUnlocked:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLockManager:Landroid/security/applock/AppLockManager;

    invoke-virtual {v0, p1, p2}, Landroid/security/applock/AppLockManager;->isPackageLocked(Ljava/lang/String;I)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    return v1

    .line 1292
    :cond_2
    :goto_0
    sget-boolean p1, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz p1, :cond_3

    .line 1293
    const-string/jumbo p1, "LockedAppActivity"

    const-string/jumbo p2, "Package is unlocked, finishing"

    invoke-static {p1, p2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    const/4 p1, 0x1

    .line 1295
    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPackageUnlocked:Z

    .line 1296
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->completeUnlockAndFinish()V

    return p1

    :cond_4
    :goto_1
    return v1
.end method

.method private blacklist getBiometricPromptDescription(Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1541
    const-string p0, ""

    return-object p0
.end method

.method private blacklist getLaunchActivityLabel()Ljava/lang/CharSequence;
    .locals 4

    .line 1779
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getPackageManager(Landroid/app/Activity;)Landroid/content/pm/PackageManager;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1781
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLabel:Ljava/lang/CharSequence;

    return-object p0

    .line 1783
    :cond_0
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1785
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLabel:Ljava/lang/CharSequence;

    return-object p0

    :cond_1
    const-wide/16 v2, 0x0

    .line 1788
    invoke-static {v2, v3}, Landroid/content/pm/PackageManager$ResolveInfoFlags;->of(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    .line 1787
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->resolveActivityAsUser(Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 1789
    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    iget-object v3, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 1790
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 1793
    :cond_2
    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v1, v0}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1794
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_3

    return-object v0

    :cond_3
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLabel:Ljava/lang/CharSequence;

    return-object p0

    .line 1791
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLabel:Ljava/lang/CharSequence;

    return-object p0
.end method

.method private blacklist getPackageLabel(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 2

    .line 1594
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getPackageManager(Landroid/app/Activity;)Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 v0, 0x0

    .line 1595
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 1596
    invoke-virtual {v0, p0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 1598
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Package "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v0, "LockedAppActivity"

    invoke-static {v0, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private blacklist getPackageLogo(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1610
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getPackageManager(Landroid/app/Activity;)Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 1611
    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 1613
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Package "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v0, "LockedAppActivity"

    invoke-static {v0, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private blacklist getPackagesWithVisibleAppLockOverlayLabels()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1511
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1514
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLabel:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1516
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLockManager:Landroid/security/applock/AppLockManager;

    if-nez v1, :cond_0

    .line 1517
    const-string/jumbo p0, "LockedAppActivity"

    const-string/jumbo v1, "mAppLockManager is null when querying visible app lock overlays"

    invoke-static {p0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    .line 1520
    :cond_0
    iget v2, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    invoke-virtual {v1, v2}, Landroid/security/applock/AppLockManager;->getPackagesWithVisibleAppLockOverlay(I)Ljava/util/Set;

    move-result-object v1

    .line 1523
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1524
    iget-object v3, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1525
    invoke-direct {p0, v2}, Lcom/android/internal/app/LockedAppActivity;->getPackageLabel(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1526
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_2
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private blacklist getThemedContext(Landroid/content/res/Configuration;)Landroid/content/Context;
    .locals 2

    .line 932
    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->resolveTargetNightMode(Landroid/content/res/Configuration;)I

    move-result v0

    .line 933
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 934
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->uiMode:I

    goto :goto_0

    .line 936
    :cond_0
    iget v1, p1, Landroid/content/res/Configuration;->uiMode:I

    :goto_0
    and-int/lit8 v1, v1, 0x30

    if-eq v0, v1, :cond_1

    .line 938
    new-instance v1, Landroid/content/res/Configuration;

    invoke-direct {v1, p1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 939
    iget p1, v1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, -0x31

    or-int/2addr p1, v0

    iput p1, v1, Landroid/content/res/Configuration;->uiMode:I

    .line 940
    new-instance p1, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0, v1}, Lcom/android/internal/app/LockedAppActivity;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getThemeResId()I

    move-result p0

    invoke-direct {p1, v0, p0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    return-object p1

    :cond_1
    return-object p0
.end method

.method private blacklist initStateFromIntent()V
    .locals 6

    .line 742
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 743
    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    .line 744
    const-string/jumbo v1, "android.intent.extra.USER_ID"

    const/16 v2, -0x2710

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    .line 745
    const-string/jumbo v1, "com.android.internal.app.extra.TARGET_APP_BACKGROUND_COLOR"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/internal/app/LockedAppActivity;->mTargetAppBackgroundColor:I

    .line 747
    const-string/jumbo v1, "com.android.internal.app.extra.TARGET_APP_SYSTEM_BARS_APPEARANCE"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/internal/app/LockedAppActivity;->mTargetAppAppearance:I

    .line 751
    const-string/jumbo v1, "com.android.internal.app.extra.SEND_INTENT_IN_LOCKED_TASK_MODE"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mShowLockedTaskUiInEmptyTask:Z

    .line 756
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v1, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getIntentSender(Landroid/content/Intent;)Landroid/content/IntentSender;

    move-result-object v1

    .line 757
    invoke-static {v1}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode(Landroid/content/IntentSender;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    .line 759
    const-string/jumbo v4, "com.android.internal.app.extra.ACTIVITY_MODE"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 760
    iput v3, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    .line 762
    const-string/jumbo v4, "LockedAppActivity"

    if-ltz v3, :cond_6

    const/4 v5, 0x4

    if-le v3, v5, :cond_0

    goto :goto_0

    .line 769
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskInterceptMode()Z

    move-result v3

    if-nez v3, :cond_1

    .line 771
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/android/internal/app/LockedAppActivity;->mShowLockedTaskUiInEmptyTask:Z

    if-eqz v3, :cond_2

    .line 775
    :cond_1
    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    .line 778
    :cond_2
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isUninstallMode()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 779
    const-string/jumbo v1, "com.android.internal.app.extra.VERSIONED_PACKAGE"

    const-class v3, Landroid/content/pm/VersionedPackage;

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/VersionedPackage;

    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallVersionedPackage:Landroid/content/pm/VersionedPackage;

    .line 781
    const-string/jumbo v1, "com.android.internal.app.extra.UNINSTALL_FLAGS"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallFlags:I

    .line 782
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v1, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getUninstallStatusReceiver(Landroid/content/Intent;)Landroid/content/IntentSender;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallStatusReceiver:Landroid/content/IntentSender;

    .line 784
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallVersionedPackage:Landroid/content/pm/VersionedPackage;

    if-eqz v1, :cond_3

    if-nez v0, :cond_4

    .line 785
    :cond_3
    const-string/jumbo v0, "Missing extras for uninstall: EXTRA_VERSIONED_PACKAGE or EXTRA_STATUS_RECEIVER, finishing"

    invoke-static {v4, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 787
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 792
    :cond_4
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz v0, :cond_5

    .line 793
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "In "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->activityModeToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " mode"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    return-void

    .line 764
    :cond_6
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Invalid activity mode provided: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", finishing."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 765
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void
.end method

.method private blacklist isClearStorageMode()Z
    .locals 1

    .line 1021
    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist isInterceptMode()Z
    .locals 0

    .line 1005
    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static blacklist isInterceptMode(Landroid/content/IntentSender;)Z
    .locals 0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static blacklist isLockedAppActivityClassName(Ljava/lang/String;)Z
    .locals 1

    .line 627
    const-class v0, Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-class v0, Lcom/android/internal/app/LockedAppActivity$InterceptActivity;

    .line 628
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private blacklist isLockedTaskInterceptMode()Z
    .locals 1

    .line 1013
    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist isLockedTaskMode()Z
    .locals 1

    .line 1009
    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist isOneShotAuthMode()Z
    .locals 1

    .line 1025
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isUninstallMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isClearStorageMode()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private blacklist isUninstallMode()Z
    .locals 1

    .line 1017
    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private synthetic blacklist lambda$new$0()V
    .locals 2

    .line 260
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 261
    const-string/jumbo v0, "LockedAppActivity"

    const-string v1, "Back invoked in locked task mode, requesting to show biometric prompt if needed"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 267
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->moveTaskToBack(Landroid/app/Activity;Z)V

    return-void

    .line 271
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->requestShowBiometricPromptForLockedTask()V

    return-void
.end method

.method private synthetic blacklist lambda$onPause$0()V
    .locals 2

    .line 1113
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isResumed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1114
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTurnScreenOn(Landroid/app/Activity;Z)V

    :cond_0
    return-void
.end method

.method private synthetic blacklist lambda$onPause$1(Landroid/os/CancellationSignal;)V
    .locals 1

    .line 1127
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isResumed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-ne p0, p1, :cond_1

    .line 1129
    invoke-virtual {p1}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result p0

    if-nez p0, :cond_1

    .line 1130
    sget-boolean p0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz p0, :cond_0

    .line 1131
    const-string/jumbo p0, "LockedAppActivity"

    const-string/jumbo v0, "onPause: canceling biometric prompt"

    invoke-static {p0, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1133
    :cond_0
    invoke-virtual {p1}, Landroid/os/CancellationSignal;->cancel()V

    :cond_1
    return-void
.end method

.method private synthetic blacklist lambda$setupLockedTaskModeUi$0(Landroid/view/View;)V
    .locals 1

    .line 883
    sget-boolean p1, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz p1, :cond_0

    .line 884
    const-string/jumbo p1, "LockedAppActivity"

    const-string/jumbo v0, "Root view clicked in locked task mode, requesting to show biometric prompt if needed"

    invoke-static {p1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 887
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->requestShowBiometricPromptForLockedTask()V

    return-void
.end method

.method private blacklist logAppLaunchIfNeeded()V
    .locals 3

    .line 1761
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthenticationSucceededForSaLogging:Z

    if-eqz v0, :cond_2

    .line 1763
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1764
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 1765
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    if-ltz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLaunchLogged:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1767
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1770
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1771
    const-string/jumbo v1, "PackageName"

    iget-object v2, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1772
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const-string v1, "ALK101"

    const-string v2, "ALK1020"

    invoke-virtual {p0, v1, v2, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->logAppLaunch(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private blacklist logAppLockEvent(Ljava/lang/String;)V
    .locals 2

    .line 1869
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AppLockTrace "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " userId="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " activityRef="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1870
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1871
    const-string/jumbo p1, "ro.product_ship"

    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    .line 1872
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, " package="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p0, ""

    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1869
    const-string/jumbo p1, "LockedAppActivity"

    invoke-static {p1, p0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private blacklist maybeShowBiometricPromptForLockedTask()V
    .locals 3

    .line 1330
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    if-eqz v0, :cond_0

    goto :goto_2

    .line 1334
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->shouldWaitForSplitAppLockAuthentication()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 1338
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showsLockedTaskUi()Z

    move-result v0

    const-string/jumbo v2, "LockedAppActivity"

    if-nez v0, :cond_2

    .line 1339
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz v0, :cond_7

    .line 1340
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "maybeShowBiometricPromptForLockedTask: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    .line 1341
    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->activityModeToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " mode, returning"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1340
    invoke-static {v2, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1346
    :cond_2
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPromptPending:Z

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->hasWindowFocus(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 1354
    :cond_3
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPromptPending:Z

    .line 1355
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    if-eqz v0, :cond_4

    .line 1356
    sget-boolean p0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz p0, :cond_7

    .line 1357
    const-string/jumbo p0, "maybeShowBiometricPromptForLockedTask: auth flow is already active, returning"

    invoke-static {v2, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1363
    :cond_4
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz v0, :cond_5

    .line 1364
    const-string/jumbo v0, "maybeShowBiometricPromptForLockedTask: showing biometric prompt"

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1366
    :cond_5
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showBiometricPrompt()V

    return-void

    .line 1347
    :cond_6
    :goto_0
    sget-boolean p0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz p0, :cond_7

    .line 1348
    const-string/jumbo p0, "maybeShowBiometricPromptForLockedTask: not ready for prompt, returning"

    invoke-static {v2, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    :goto_1
    return-void

    .line 1331
    :cond_8
    :goto_2
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPromptPending:Z

    return-void
.end method

.method private blacklist onKeyguardDismissFailed(Ljava/lang/String;)V
    .locals 2

    .line 1564
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 1565
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Keyguard dismiss failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "LockedAppActivity"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x0

    .line 1567
    iput-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    .line 1568
    iput-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    .line 1569
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isUninstallMode()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x3

    .line 1570
    invoke-direct {p0, v0, p1}, Lcom/android/internal/app/LockedAppActivity;->sendUninstallFailure(ILjava/lang/String;)V

    .line 1571
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 1577
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1578
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string/jumbo v1, "com.android.internal.app.extra.IN_TARGET_TASK"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1579
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->moveTaskToBack(Landroid/app/Activity;Z)V

    .line 1581
    :cond_2
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 1582
    :cond_3
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isOneShotAuthMode()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1583
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    :cond_4
    return-void
.end method

.method private blacklist requestShowBiometricPromptForLockedTask()V
    .locals 1

    const/4 v0, 0x1

    .line 1314
    iput-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPromptPending:Z

    .line 1315
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->maybeShowBiometricPromptForLockedTask()V

    return-void
.end method

.method private static blacklist resolveActivityClassName(I)Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    .line 617
    const-class p0, Lcom/android/internal/app/LockedAppActivity$InterceptActivity;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 618
    :cond_0
    const-class p0, Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private blacklist resolveSettingsPackageName()Ljava/lang/String;
    .locals 4

    .line 1493
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.settings.SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1494
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v1, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getPackageManager(Landroid/app/Activity;)Landroid/content/pm/PackageManager;

    move-result-object v1

    if-eqz v1, :cond_0

    const-wide/32 v2, 0x10000

    .line 1497
    invoke-static {v2, v3}, Landroid/content/pm/PackageManager$ResolveInfoFlags;->of(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;

    move-result-object v2

    iget p0, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    .line 1496
    invoke-virtual {v1, v0, v2, p0}, Landroid/content/pm/PackageManager;->resolveActivityAsUser(Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;I)Landroid/content/pm/ResolveInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 1498
    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v0, :cond_0

    .line 1499
    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    return-object p0

    .line 1502
    :cond_0
    const-string/jumbo p0, "com.android.settings"

    return-object p0
.end method

.method private blacklist resolveTargetNightMode(Landroid/content/res/Configuration;)I
    .locals 0

    .line 960
    iget p0, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p0, p0, 0x30

    return p0
.end method

.method private blacklist resumePendingAuthenticationIfNeeded()V
    .locals 3

    .line 1804
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isRunningOnComputerControlDisplay(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1805
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isDisplaySleeping(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 1808
    invoke-direct {p0, v0}, Lcom/android/internal/app/LockedAppActivity;->setInterceptAuthenticationDeferred(Z)V

    goto :goto_0

    .line 1810
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTurnScreenOn(Landroid/app/Activity;Z)V

    .line 1811
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    if-eqz v0, :cond_1

    .line 1812
    invoke-direct {p0, v1}, Lcom/android/internal/app/LockedAppActivity;->setInterceptAuthenticationDeferred(Z)V

    .line 1816
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsInterceptAuthenticationDeferred:Z

    if-eqz v0, :cond_2

    .line 1817
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    if-nez v0, :cond_6

    .line 1818
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->hasWindowFocus(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    .line 1819
    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isDisplaySleeping(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 1820
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showBiometricPrompt()V

    return-void

    .line 1824
    :cond_2
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 1828
    :cond_3
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getKeyguardManager(Landroid/app/Activity;)Landroid/app/KeyguardManager;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 1829
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    .line 1833
    :cond_4
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz v0, :cond_5

    .line 1834
    const-string/jumbo v0, "LockedAppActivity"

    const-string/jumbo v2, "Keyguard already unlocked, resuming AppLock authentication"

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1836
    :cond_5
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    .line 1837
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    .line 1838
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showBiometricPrompt()V

    :cond_6
    :goto_1
    return-void
.end method

.method private blacklist sendUninstallFailure(ILjava/lang/String;)V
    .locals 7

    .line 1619
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallStatusReceiver:Landroid/content/IntentSender;

    if-nez v0, :cond_0

    return-void

    .line 1623
    :cond_0
    :try_start_0
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 1624
    const-string/jumbo v0, "android.content.pm.extra.STATUS"

    invoke-virtual {v4, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1625
    const-string/jumbo p1, "android.content.pm.extra.STATUS_MESSAGE"

    invoke-virtual {v4, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1626
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUninstallStatusReceiver:Landroid/content/IntentSender;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v2, p0

    invoke-virtual/range {v1 .. v6}, Landroid/content/IntentSender;->sendIntent(Landroid/content/Context;ILandroid/content/Intent;Landroid/content/IntentSender$OnFinished;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 1629
    const-string/jumbo p1, "LockedAppActivity"

    const-string/jumbo p2, "Unable to send uninstall failure status"

    invoke-static {p1, p2, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static blacklist setInjectorForTesting(Lcom/android/internal/app/LockedAppActivity$Injector;)V
    .locals 1

    .line 644
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    .line 647
    sput-object p0, Lcom/android/internal/app/LockedAppActivity;->sInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    return-void

    .line 645
    :cond_0
    new-instance p0, Ljava/lang/SecurityException;

    const-string/jumbo v0, "Injector should only be set in debuggable builds."

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private blacklist setInterceptAuthenticationDeferred(Z)V
    .locals 3

    .line 1842
    iput-boolean p1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsInterceptAuthenticationDeferred:Z

    .line 1849
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationDisplayManager:Landroid/hardware/display/DisplayManager;

    if-eqz p1, :cond_0

    if-nez v0, :cond_1

    .line 1844
    const-class p1, Landroid/hardware/display/DisplayManager;

    invoke-virtual {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/DisplayManager;

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationDisplayManager:Landroid/hardware/display/DisplayManager;

    if-eqz p1, :cond_1

    .line 1846
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    const-wide/16 v1, 0x10

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Ljava/util/concurrent/Executor;JLandroid/hardware/display/DisplayManager$DisplayListener;)V

    return-void

    :cond_0
    if-eqz v0, :cond_1

    .line 1850
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    invoke-virtual {v0, p1}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    const/4 p1, 0x0

    .line 1851
    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationDisplayManager:Landroid/hardware/display/DisplayManager;

    :cond_1
    return-void
.end method

.method private blacklist setupExternalDisplayMessage(Landroid/content/Context;)V
    .locals 4

    .line 987
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getDisplayId(Landroid/app/Activity;)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    if-eqz v0, :cond_0

    .line 991
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    .line 993
    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isRunningOnComputerControlDisplay(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 994
    :goto_0
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const v3, 0x1020446

    invoke-virtual {v1, p0, v3}, Lcom/android/internal/app/LockedAppActivity$Injector;->findViewById(Landroid/app/Activity;I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_2

    const v1, 0x106032f

    .line 998
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    move-result p1

    .line 997
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/16 v2, 0x8

    .line 999
    :goto_1
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method private blacklist setupLockedTaskModeUi(Landroid/content/res/Configuration;)Z
    .locals 2

    .line 868
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const v1, 0x10900d4

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->setContentView(Landroid/app/Activity;I)V

    .line 876
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const v1, 0x1020002

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->findViewById(Landroid/app/Activity;I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    .line 878
    const-string/jumbo p1, "LockedAppActivity"

    const-string/jumbo v0, "Root view not found in locked task mode, finishing"

    invoke-static {p1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 879
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    const/4 p0, 0x0

    return p0

    .line 882
    :cond_0
    new-instance v1, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/LockedAppActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 890
    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->getThemedContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    move-result-object p1

    .line 891
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const v1, 0x1020447

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->findViewById(Landroid/app/Activity;I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const v1, 0x1060311

    .line 894
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    move-result v1

    .line 893
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 898
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->updateWindowBackgroundAndSystemBars(Landroid/content/Context;)V

    .line 902
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const v1, 0x1020006

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->findViewById(Landroid/app/Activity;I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    const v1, 0x106033d

    .line 904
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 907
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->setupExternalDisplayMessage(Landroid/content/Context;)V

    const/4 p0, 0x1

    return p0
.end method

.method private blacklist setupUi()Z
    .locals 1

    .line 846
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/app/LockedAppActivity;->setupUi(Landroid/content/res/Configuration;)Z

    move-result p0

    return p0
.end method

.method private blacklist setupUi(Landroid/content/res/Configuration;)Z
    .locals 1

    .line 856
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showsLockedTaskUi()Z

    move-result v0

    if-nez v0, :cond_0

    .line 858
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTranslucent(Landroid/app/Activity;Z)V

    return v0

    .line 861
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->setupLockedTaskModeUi(Landroid/content/res/Configuration;)Z

    move-result p0

    return p0
.end method

.method private blacklist shouldCancelBiometricPrompt()Z
    .locals 2

    .line 1149
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1152
    :cond_0
    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 1155
    :cond_1
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 1160
    :cond_2
    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_COMPUTER_CONTROL:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    .line 1161
    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isRunningOnComputerControlDisplay(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_3

    return v1

    :cond_3
    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_0
    return v1
.end method

.method private blacklist shouldWaitForSplitAppLockAuthentication()Z
    .locals 1

    .line 483
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    .line 484
    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isInSplitScreenWindowingMode(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsSplitAppLockAuthenticationReady:Z

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist showBiometricPrompt()V
    .locals 7

    .line 1386
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 1389
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isRunningOnComputerControlDisplay(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1390
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isDisplaySleeping(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsInterceptAuthenticationDeferred:Z

    if-eqz v0, :cond_1

    .line 1392
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->hasWindowFocus(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1398
    :cond_1
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTurnScreenOn(Landroid/app/Activity;Z)V

    .line 1399
    invoke-direct {p0, v1}, Lcom/android/internal/app/LockedAppActivity;->setInterceptAuthenticationDeferred(Z)V

    goto :goto_1

    .line 1395
    :cond_2
    :goto_0
    invoke-direct {p0, v2}, Lcom/android/internal/app/LockedAppActivity;->setInterceptAuthenticationDeferred(Z)V

    return-void

    .line 1402
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->shouldWaitForSplitAppLockAuthentication()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1404
    iput-boolean v2, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPromptPending:Z

    return-void

    .line 1408
    :cond_4
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getKeyguardManager(Landroid/app/Activity;)Landroid/app/KeyguardManager;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 1409
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    .line 1410
    invoke-virtual {v3, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->isRunningOnComputerControlDisplay(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 1411
    iput-boolean v2, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    .line 1412
    iput-boolean v2, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    .line 1413
    new-instance v1, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;-><init>(Lcom/android/internal/app/LockedAppActivity;Lcom/android/internal/app/LockedAppActivity-IA;)V

    invoke-virtual {v0, p0, v1}, Landroid/app/KeyguardManager;->requestDismissKeyguard(Landroid/app/Activity;Landroid/app/KeyguardManager$KeyguardDismissCallback;)V

    return-void

    .line 1417
    :cond_5
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->getPackagesWithVisibleAppLockOverlayLabels()Ljava/util/List;

    move-result-object v0

    .line 1418
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 1420
    iget-object v3, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v3, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getBiometricPromptBuilder(Landroid/app/Activity;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v3

    const v4, 0x1040f95

    .line 1422
    invoke-virtual {p0, v4}, Lcom/android/internal/app/LockedAppActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v3

    .line 1428
    invoke-direct {p0, v0}, Lcom/android/internal/app/LockedAppActivity;->getBiometricPromptDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setDescription(Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v3

    const v4, 0x80ff

    .line 1429
    invoke-virtual {v3, v4}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setAllowedAuthenticators(I)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v3

    .line 1438
    invoke-virtual {v3, v1}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setConfirmationRequired(Z)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 1439
    iget-object v4, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v4, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getTelecomManager(Landroid/app/Activity;)Landroid/telecom/TelecomManager;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 1440
    iget-object v5, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    iget v6, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    .line 1441
    invoke-static {v6}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/telecom/TelecomManager;->getDefaultDialerPackage(Landroid/os/UserHandle;)Ljava/lang/String;

    move-result-object v4

    .line 1440
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1442
    invoke-virtual {v3, v2}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setShowEmergencyCallButton(Z)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 1444
    :cond_6
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->getLaunchActivityLabel()Ljava/lang/CharSequence;

    move-result-object v4

    .line 1446
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ne v5, v2, :cond_7

    .line 1447
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 1449
    :cond_7
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v2

    .line 1450
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 1452
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v4, v6}, [Ljava/lang/Object;

    move-result-object v4

    const v6, 0x1150013

    .line 1450
    invoke-virtual {v5, v6, v0, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1455
    :goto_2
    const-string/jumbo v4, "\\R"

    const-string v5, " "

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1456
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x1e

    if-le v4, v5, :cond_8

    .line 1457
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x1b

    invoke-virtual {v0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "..."

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1460
    :cond_8
    invoke-virtual {v3, v0}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setLogoDescription(Ljava/lang/String;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 1461
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLogo:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_9

    .line 1462
    invoke-virtual {v3, v0}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setLogoBitmap(Landroid/graphics/Bitmap;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 1484
    :cond_9
    invoke-virtual {v3}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->build()Landroid/hardware/biometrics/BiometricPrompt;

    move-result-object v0

    .line 1485
    new-instance v1, Landroid/os/CancellationSignal;

    invoke-direct {v1}, Landroid/os/CancellationSignal;-><init>()V

    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 1487
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/LockedAppActivity;->mAuthenticationCallback:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

    iget v5, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/hardware/biometrics/BiometricPrompt;->authenticateUser(Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;I)V

    .line 1489
    iput-boolean v2, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    :cond_a
    :goto_3
    return-void
.end method

.method private blacklist showsLockedTaskUi()Z
    .locals 1

    .line 1029
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskInterceptMode()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private blacklist updateWindowBackgroundAndSystemBars(Landroid/content/Context;)V
    .locals 2

    .line 913
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-nez p0, :cond_0

    goto :goto_0

    .line 917
    :cond_0
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, 0x1060311

    .line 918
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 917
    invoke-virtual {p0, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 919
    invoke-virtual {p0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object p0

    if-nez p0, :cond_1

    :goto_0
    return-void

    .line 923
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, 0x30

    const/16 v0, 0x20

    const/4 v1, 0x0

    if-ne p1, v0, :cond_2

    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    move p1, v1

    :goto_1
    const/16 v0, 0x18

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_3
    move v1, v0

    .line 927
    :goto_2
    invoke-interface {p0, v1, v0}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    return-void
.end method


# virtual methods
.method public whitelist onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 816
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 819
    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->setupUi(Landroid/content/res/Configuration;)Z

    .line 822
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->resumePendingAuthenticationIfNeeded()V

    return-void
.end method

.method public whitelist onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 653
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->initStateFromIntent()V

    .line 657
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->applyTheme()V

    .line 659
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 662
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->setupUi()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 667
    :cond_0
    invoke-static {}, Lcom/android/internal/hidden_from_bootclasspath/android/security/Flags;->appLockApis()Z

    move-result p1

    const-string/jumbo v0, "LockedAppActivity"

    if-eqz p1, :cond_9

    invoke-static {}, Lcom/android/internal/hidden_from_bootclasspath/android/security/Flags;->appLockCore()Z

    move-result p1

    if-nez p1, :cond_1

    goto/16 :goto_1

    .line 673
    :cond_1
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {p1, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getAppLockManager(Landroid/app/Activity;)Landroid/security/applock/AppLockManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLockManager:Landroid/security/applock/AppLockManager;

    if-nez p1, :cond_2

    .line 675
    const-string p1, "AppLockManager not available, finishing"

    invoke-static {v0, p1}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 681
    :cond_2
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    if-nez p1, :cond_3

    .line 682
    const-string/jumbo p1, "Package name is null, finishing"

    invoke-static {v0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 683
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 686
    :cond_3
    iget p1, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    const/16 v1, -0x2710

    if-ne p1, v1, :cond_4

    .line 687
    const-string/jumbo p1, "No userId, finishing"

    invoke-static {v0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 695
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "AUTH_CREATE taskId="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getTaskId()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->logAppLockEvent(Ljava/lang/String;)V

    .line 700
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->allowsPassiveUnlock()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    iget v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    invoke-direct {p0, p1, v1}, Lcom/android/internal/app/LockedAppActivity;->finishIfUnlocked(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_5

    :goto_0
    return-void

    .line 704
    :cond_5
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->getPackageLabel(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLabel:Ljava/lang/CharSequence;

    .line 710
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    if-nez p1, :cond_6

    .line 706
    new-instance p1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Package label for "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " is null, finishing"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 710
    :cond_6
    invoke-direct {p0, v1}, Lcom/android/internal/app/LockedAppActivity;->getPackageLogo(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->convertDrawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLogo:Landroid/graphics/Bitmap;

    .line 711
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->resolveSettingsPackageName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mSettingsPackageName:Ljava/lang/String;

    .line 713
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->allowsPassiveUnlock()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 717
    new-instance p1, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    iget v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    iget-object v2, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    invoke-direct {p1, p0, v0, v1, v2}, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;-><init>(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;ILandroid/content/IntentSender;)V

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLockedStateListener:Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;

    .line 719
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLockManager:Landroid/security/applock/AppLockManager;

    .line 720
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLockedStateListener:Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;

    .line 719
    invoke-virtual {p1, v0, v1}, Landroid/security/applock/AppLockManager;->registerPackageLockedStateListener(Ljava/util/concurrent/Executor;Landroid/security/applock/AppLockManager$PackageLockedStateListener;)V

    .line 723
    :cond_7
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showsLockedTaskUi()Z

    move-result p1

    if-nez p1, :cond_8

    .line 726
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showBiometricPrompt()V

    return-void

    .line 731
    :cond_8
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {p1, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getOnBackInvokedDispatcher(Landroid/app/Activity;)Landroid/window/OnBackInvokedDispatcher;

    move-result-object p1

    const/4 v0, 0x0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mOnBackInvokedCallback:Landroid/window/OnBackInvokedCallback;

    invoke-interface {p1, v0, p0}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    return-void

    .line 668
    :cond_9
    :goto_1
    const-string p1, "App Lock implementation is not enabled, finishing"

    invoke-static {v0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void
.end method

.method public whitelist onDestroy()V
    .locals 2

    .line 1238
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1241
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1242
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTurnScreenOn(Landroid/app/Activity;Z)V

    .line 1244
    :cond_0
    invoke-direct {p0, v1}, Lcom/android/internal/app/LockedAppActivity;->setInterceptAuthenticationDeferred(Z)V

    .line 1245
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPromptPending:Z

    .line 1246
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    .line 1247
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsAuthFlowActive:Z

    .line 1250
    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1256
    :cond_1
    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsInterceptUnlockStateUpdated:Z

    if-eqz v0, :cond_3

    .line 1259
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->completeUnlockAfterDestroyed()V

    goto :goto_1

    .line 1251
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    const/4 v1, 0x0

    .line 1252
    iput-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_3

    .line 1254
    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    .line 1265
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageLockedStateListener:Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;

    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity;->mAppLockManager:Landroid/security/applock/AppLockManager;

    if-eqz v1, :cond_4

    .line 1266
    invoke-virtual {v1, v0}, Landroid/security/applock/AppLockManager;->unregisterPackageLockedStateListener(Landroid/security/applock/AppLockManager$PackageLockedStateListener;)V

    .line 1269
    :cond_4
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showsLockedTaskUi()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1270
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getOnBackInvokedDispatcher(Landroid/app/Activity;)Landroid/window/OnBackInvokedDispatcher;

    move-result-object v0

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity;->mOnBackInvokedCallback:Landroid/window/OnBackInvokedCallback;

    invoke-interface {v0, p0}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    :cond_5
    return-void
.end method

.method public whitelist onEnterAnimationComplete()V
    .locals 1

    .line 475
    invoke-super {p0}, Landroid/app/Activity;->onEnterAnimationComplete()V

    const/4 v0, 0x1

    .line 477
    iput-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsSplitAppLockAuthenticationReady:Z

    .line 478
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->maybeShowBiometricPromptForLockedTask()V

    return-void
.end method

.method public blacklist onMovedToDisplay(ILandroid/content/res/Configuration;)V
    .locals 0

    .line 830
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onMovedToDisplay(ILandroid/content/res/Configuration;)V

    .line 831
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 833
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTurnScreenOn(Landroid/app/Activity;Z)V

    :cond_0
    return-void
.end method

.method protected whitelist onNewIntent(Landroid/content/Intent;)V
    .locals 3

    .line 1080
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 1081
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1082
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTargetIntentSent:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    .line 1083
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    const-string/jumbo v1, "android.intent.extra.USER_ID"

    const/16 v2, -0x2710

    .line 1084
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    if-ne v0, v1, :cond_1

    const-string/jumbo v0, "com.android.internal.app.extra.ACTIVITY_MODE"

    const/4 v1, 0x0

    .line 1085
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "com.android.internal.app.extra.SEND_INTENT_IN_LOCKED_TASK_MODE"

    .line 1087
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1088
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v2, "com.android.internal.app.extra.EXPECTS_RESULT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1089
    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1092
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p1}, Lcom/android/internal/app/LockedAppActivity$Injector;->getIntentSender(Landroid/content/Intent;)Landroid/content/IntentSender;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1094
    iput-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mTarget:Landroid/content/IntentSender;

    .line 1095
    invoke-virtual {p0, p1}, Lcom/android/internal/app/LockedAppActivity;->setIntent(Landroid/content/Intent;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public whitelist onPause()V
    .locals 3

    .line 1108
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 1109
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1112
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda1;-><init>(Lcom/android/internal/app/LockedAppActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    const/4 v0, 0x0

    .line 1119
    iput-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsSplitAppLockAuthenticationReady:Z

    .line 1121
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->shouldCancelBiometricPrompt()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1122
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 1123
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1126
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, v0}, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda2;-><init>(Lcom/android/internal/app/LockedAppActivity;Landroid/os/CancellationSignal;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    .line 1137
    :cond_1
    sget-boolean p0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz p0, :cond_2

    .line 1138
    const-string/jumbo p0, "LockedAppActivity"

    const-string/jumbo v1, "onPause: canceling biometric prompt"

    invoke-static {p0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1140
    :cond_2
    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    :cond_3
    return-void
.end method

.method public whitelist onResume()V
    .locals 4

    .line 1054
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1055
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    const-string/jumbo v1, "LockedAppActivity"

    if-eqz v0, :cond_0

    .line 1056
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "onResume: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/android/internal/app/LockedAppActivity;->mActivityMode:I

    invoke-static {v3}, Lcom/android/internal/app/LockedAppActivity;->activityModeToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " mode"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v2, 0x0

    .line 1061
    iput-boolean v2, p0, Lcom/android/internal/app/LockedAppActivity;->mIsSplitAppLockAuthenticationReady:Z

    .line 1064
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->resumePendingAuthenticationIfNeeded()V

    .line 1068
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->showsLockedTaskUi()Z

    move-result v2

    if-eqz v2, :cond_2

    if-eqz v0, :cond_1

    .line 1070
    const-string/jumbo v0, "onResume: requesting to show biometric prompt in locked task mode"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1072
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->requestShowBiometricPromptForLockedTask()V

    :cond_2
    return-void
.end method

.method public whitelist onStop()V
    .locals 3

    .line 1198
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 1200
    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1206
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedTaskMode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockTargetDrawComplete:Z

    if-nez v0, :cond_1

    .line 1208
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1214
    const-string/jumbo v0, "UNLOCK_DRAW_ABORTED"

    invoke-direct {p0, v0}, Lcom/android/internal/app/LockedAppActivity;->logAppLockEvent(Ljava/lang/String;)V

    .line 1215
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsWaitingForLockedTaskUnlockDraw:Z

    .line 1216
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsLockedTaskUnlockStateUpdated:Z

    .line 1217
    iput-boolean v1, p0, Lcom/android/internal/app/LockedAppActivity;->mIsPackageUnlocked:Z

    .line 1218
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->setTranslucent(Landroid/app/Activity;Z)V

    .line 1221
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->isInterceptMode()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/android/internal/app/LockedAppActivity;->mIsKeyguardDismissPending:Z

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_5

    .line 1222
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_5

    .line 1223
    sget-boolean v0, Lcom/android/internal/app/LockedAppActivity;->DEBUG:Z

    if-eqz v0, :cond_2

    .line 1224
    const-string/jumbo v0, "LockedAppActivity"

    const-string/jumbo v2, "onStop: finishing in intercept mode"

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1226
    :cond_2
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_3

    .line 1227
    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    .line 1229
    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v2, "com.android.internal.app.extra.IN_TARGET_TASK"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1230
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mInjector:Lcom/android/internal/app/LockedAppActivity$Injector;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/app/LockedAppActivity$Injector;->moveTaskToBack(Landroid/app/Activity;Z)V

    .line 1232
    :cond_4
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    :cond_5
    :goto_0
    return-void
.end method

.method public whitelist onWindowFocusChanged(Z)V
    .locals 2

    .line 1170
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 1176
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1177
    const-string/jumbo p1, "LockedAppActivity"

    const-string/jumbo v0, "Package name is null in onWindowFocusChanged, finishing"

    invoke-static {p1, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1178
    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 1182
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->allowsPassiveUnlock()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity;->mPackageName:Ljava/lang/String;

    iget v1, p0, Lcom/android/internal/app/LockedAppActivity;->mUserId:I

    invoke-direct {p0, v0, v1}, Lcom/android/internal/app/LockedAppActivity;->finishIfUnlocked(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    .line 1189
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->resumePendingAuthenticationIfNeeded()V

    .line 1192
    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity;->maybeShowBiometricPromptForLockedTask()V

    :cond_2
    :goto_0
    return-void
.end method
