.class public final Lcom/android/server/wm/AppLockOverlayController;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# static fields
.field static final ACTION_LAUNCH_EMERGENCY:Ljava/lang/String; = "com.android.systemui.action.LAUNCH_EMERGENCY"

.field public static final PERMITTED_EMERGENCY_INTENT_ACTIONS:Ljava/util/Set;

.field public static final PERMITTED_SECURE_INTENT_ACTIONS:Ljava/util/Set;


# instance fields
.field private final mActivityListeners:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/android/server/wm/ActivityRecord;",
            "Lcom/android/server/wm/WindowContainerListener;",
            ">;"
        }
    .end annotation
.end field

.field public mAppLockInternal:Landroid/app/AppLockInternal;

.field public final mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

.field final mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArraySet<",
            "Lcom/android/server/wm/ActivityRecord;",
            ">;"
        }
    .end annotation
.end field

.field final mOverlayToTargetMap:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/android/server/wm/ActivityRecord;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/server/wm/ActivityRecord;",
            ">;>;"
        }
    .end annotation
.end field

.field public final mPendingActivityOverlayTargets:Landroid/util/ArraySet;

.field public final mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

.field public final mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

.field public mRootWindowContainer:Lcom/android/server/wm/RootWindowContainer;

.field public mSplitAppLockCheckPosted:Z

.field public final mSplitAppLockPendingListeners:Landroid/util/ArrayMap;

.field public mSplitAppLockTransitionValidatorPending:Z

.field public final mTargetToOverlayMap:Landroid/util/ArrayMap;

.field final mTaskListeners:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/android/server/wm/Task;",
            "Lcom/android/server/wm/WindowContainerListener;",
            ">;"
        }
    .end annotation
.end field

.field public mTaskSnapshotController:Lcom/android/server/wm/TaskSnapshotController;

.field public mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

.field public final mWaitOverlayTargetConditions:Landroid/util/ArrayMap;

.field public final mWmService:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string/jumbo v0, "android.media.action.IMAGE_CAPTURE_SECURE"

    const-string/jumbo v1, "android.provider.action.MOTION_PHOTO_CAPTURE_SECURE"

    const-string/jumbo v2, "android.provider.action.REVIEW_SECURE"

    const-string/jumbo v3, "android.media.action.STILL_IMAGE_CAMERA_SECURE"

    invoke-static {v2, v3, v0, v1}, Ljava/util/Set;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/android/server/wm/AppLockOverlayController;->PERMITTED_SECURE_INTENT_ACTIONS:Ljava/util/Set;

    const-string/jumbo v0, "android.telephony.action.EMERGENCY_ASSISTANCE"

    const-string/jumbo v1, "com.android.systemui.action.LAUNCH_EMERGENCY"

    const-string/jumbo v2, "android.intent.action.DIAL_EMERGENCY"

    const-string/jumbo v3, "android.intent.action.CALL_EMERGENCY"

    invoke-static {v2, v3, v0, v1}, Ljava/util/Set;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/android/server/wm/AppLockOverlayController;->PERMITTED_EMERGENCY_INTENT_ACTIONS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcom/android/server/wm/WindowManagerService;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskListeners:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mTargetToOverlayMap:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mWaitOverlayTargetConditions:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockPendingListeners:Landroid/util/ArrayMap;

    iput-object p1, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object p1, p1, Lcom/android/server/wm/WindowManagerService;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iput-object p1, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    return-void
.end method

.method public static finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/server/wm/ActivityRecord;->finishIfPossible(Ljava/lang/String;Z)I

    :cond_0
    return-void
.end method

.method public static isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 1

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mTaskOverlay:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockPrompt(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isActivityAppLockOverlayForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p1, Lcom/android/server/wm/ActivityRecord;->mTaskOverlay:Z

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockPromptForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isActivityAppLockOverlayForVisibility(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z
    .locals 2

    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForVisibility(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p1, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo p2, "android.intent.extra.USER_ID"

    const/16 v0, -0x2710

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isActivityAppLockOverlayForVisibility(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 1

    .line 38
    invoke-static {p0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v0, :cond_0

    .line 39
    invoke-static {p0}, Lcom/android/server/wm/AppLockOverlayController;->isAppLockInterceptActivity(Lcom/android/server/wm/ActivityRecord;)Z

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

.method public static isActivityAppLockPrompt(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 1

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/ActivityRecord;->mActivityComponent:Landroid/content/ComponentName;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    if-eqz p0, :cond_0

    invoke-static {v0}, Lcom/android/server/wm/AppLockOverlayController;->isComponentAppLockOverlayActivity(Landroid/content/ComponentName;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isActivityAppLockPromptForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockPrompt(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/android/server/wm/AppLockOverlayController;->isAppLockPromptTarget(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isAppLockInterceptActivity(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    iget-object v1, p0, Lcom/android/server/wm/ActivityRecord;->mActivityComponent:Landroid/content/ComponentName;

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    if-eqz v2, :cond_1

    invoke-static {v1}, Lcom/android/server/wm/AppLockOverlayController;->isComponentAppLockOverlayActivity(Landroid/content/ComponentName;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v2, "com.android.internal.app.extra.ACTIVITY_MODE"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1

    :goto_0
    iget-object v1, p0, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.INTENT"

    const-class v3, Landroid/content/IntentSender;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object p0, p0, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v1, "com.android.internal.app.extra.SEND_INTENT_IN_LOCKED_TASK_MODE"

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method public static isAppLockPromptTarget(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z
    .locals 2

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p1, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo p2, "android.intent.extra.USER_ID"

    const/16 v0, -0x2710

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isComponentAppLockOverlayActivity(Landroid/content/ComponentName;)Z
    .locals 2

    const-string/jumbo v0, "android"

    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-class v0, Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Lcom/android/internal/app/LockedAppActivity$InterceptActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isIntentActionPermittedToBypassAppLock(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    sget-object v0, Lcom/android/server/wm/AppLockOverlayController;->PERMITTED_SECURE_INTENT_ACTIONS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p0, :cond_1

    sget-object v0, Lcom/android/server/wm/AppLockOverlayController;->PERMITTED_EMERGENCY_INTENT_ACTIONS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    :goto_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isLockedTaskAppLockOverlayForPackageLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    iget-object p0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    invoke-static {p0}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayIntent(Landroid/content/Intent;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isLockedTaskAppLockOverlayIntent(Landroid/content/Intent;)Z
    .locals 3

    const-string/jumbo v0, "com.android.internal.app.extra.ACTIVITY_MODE"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v1, :cond_0

    const-string/jumbo v0, "android.intent.extra.INTENT"

    const-class v2, Landroid/content/IntentSender;

    invoke-virtual {p0, v0, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    return v1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isLockedTaskAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 1

    invoke-static {p0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    invoke-static {p0}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayIntent(Landroid/content/Intent;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static logAppLockEvent(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const-string v0, " taskId="

    const-string v1, " userId="

    const-string v2, "AppLockTrace "

    invoke-static {p0, v2, p2, v0, v1}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo p1, "ro.product_ship"

    const/4 p2, 0x1

    invoke-static {p1, p2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    const-string p1, " package="

    invoke-virtual {p1, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    const-string p2, "AppLockOverlayController"

    invoke-static {p0, p1, p2}, Lcom/android/server/HeapdumpWatcher$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final abortPendingAppLockOverlayLaunchIfNeededLocked(IILjava/lang/String;)Z
    .locals 4

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {v0}, Lcom/android/server/wm/TaskFragment;->getDisplayId()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/server/wm/AppLockOverlayController;->isKeyguardLocked(I)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/server/wm/AppLockOverlayController;->removePendingAppLockActivityOverlayTargetsLocked(IILjava/lang/String;)V

    new-instance p1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;

    invoke-direct {p1, v1}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;-><init>(B)V

    iput-object p0, p1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput p2, p1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iput-object p3, p1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, p1}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    return v1

    :cond_0
    if-eqz v0, :cond_1

    if-eqz p3, :cond_1

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;

    invoke-direct {v2, v3}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;-><init>(B)V

    iput-object p0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object p3, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$1:Ljava/lang/String;

    iput p2, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$2:I

    iput-object v0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$3:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v2}, Lcom/android/server/wm/WindowContainer;->getActivity(Ljava/util/function/Predicate;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/server/wm/AppLockOverlayController;->removePendingAppLockActivityOverlayTargetsLocked(IILjava/lang/String;)V

    return v1

    :cond_1
    if-eqz v0, :cond_2

    if-eqz p3, :cond_2

    invoke-virtual {v0}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/server/wm/AppLockOverlayController;->removePendingAppLockActivityOverlayTargetsLocked(IILjava/lang/String;)V

    return v1

    :cond_2
    return v3
.end method

.method public final addLockedByAppLockActivityOverlay(Lcom/android/server/wm/ActivityRecord;)V
    .locals 13

    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v1

    sget-object v2, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v1, v2, v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, 0xc54dfad30003080L

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    iget-boolean v1, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_b

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x1b600eec7772cdffL    # -5.056098911848018E176

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v0

    aget-boolean v0, v2, v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v4, 0x0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v6

    const-wide v2, 0x131f2ec07291368fL    # 1.41336973982396E-216

    invoke-static/range {v1 .. v6}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->trackKeyguardScopedBypassedActivity(Lcom/android/server/wm/ActivityRecord;)V

    return-void

    :cond_3
    iget-object v8, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-nez v8, :cond_5

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->WARN:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_4

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x532afea8e6bf3161L    # 4.3991445542394754E92

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->w(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_4
    const-string/jumbo p0, "could-not-find-task"

    invoke-static {p1, p0}, Lcom/android/server/wm/AppLockOverlayController;->finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V

    return-void

    :cond_5
    invoke-virtual {v8}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_b

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0xe648546a09fcfb7L    # -1.7893845332056044E239

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_6
    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-nez v1, :cond_7

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->WARN:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_b

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x575cdaaaa952c871L    # -6.219649488658398E-113

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->w(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_7
    iget v10, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    const/4 v3, 0x1

    invoke-virtual {v8, v3, v3}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v3

    if-eqz v3, :cond_8

    invoke-static {v10, v3, v1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockPromptForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_b

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x4c302195e9e4cf55L    # -3.9664013635285125E-59

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_8
    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v3, p1}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_b

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x54941149e235ce3bL    # -1.596322843714693E-99

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_9
    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mTargetToOverlayMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_c

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_c

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/ActivityRecord;

    iget-boolean v4, v3, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-eqz v4, :cond_a

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_b

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x5eba2e3673783b01L    # 2.0922622778345787E148

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_a
    invoke-virtual {p0, v3, p1}, Lcom/android/server/wm/AppLockOverlayController;->isAppLockOverlayValidForTarget(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;)Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_b

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x56260a893e28c2dcL    # -4.421268497548017E-107

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_b
    return-void

    :cond_c
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->taskDescription:Landroid/app/ActivityManager$TaskDescription;

    const/4 v2, 0x0

    if-eqz v0, :cond_d

    goto :goto_0

    :cond_d
    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v0, :cond_e

    iget-object v0, v0, Lcom/android/server/wm/Task;->mTaskDescription:Landroid/app/ActivityManager$TaskDescription;

    goto :goto_0

    :cond_e
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/app/ActivityManager$TaskDescription;->getBackgroundColor()I

    move-result v3

    invoke-virtual {v0}, Landroid/app/ActivityManager$TaskDescription;->getSystemBarsAppearance()I

    move-result v0

    goto :goto_1

    :cond_f
    const/4 v3, 0x0

    move v0, v3

    :goto_1
    invoke-static {v1, v10, v3, v0, v2}, Lcom/android/internal/app/LockedAppActivity;->createLockedAppActivityIntent(Ljava/lang/String;IIILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object v9

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "unique:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/content/Intent;->setIdentifier(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p1, Lcom/android/server/wm/WindowContainer;->mTransitionController:Lcom/android/server/wm/TransitionController;

    invoke-virtual {v1}, Lcom/android/server/wm/TransitionController;->isCollecting()Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mWaitOverlayTargetConditions:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Lcom/android/server/wm/Transition$ReadyCondition;

    const-string/jumbo v2, "waitOverlayTarget"

    invoke-direct {v1, v2}, Lcom/android/server/wm/Transition$ReadyCondition;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mWaitOverlayTargetConditions:Landroid/util/ArrayMap;

    invoke-virtual {v2, p1, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p1, Lcom/android/server/wm/WindowContainer;->mTransitionController:Lcom/android/server/wm/TransitionController;

    invoke-virtual {v2, v1}, Lcom/android/server/wm/TransitionController;->waitFor(Lcom/android/server/wm/Transition$ReadyCondition;)V

    :cond_10
    new-instance v11, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda4;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    iput-object p0, v11, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda4;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object v0, v11, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda4;->f$1:Ljava/lang/String;

    iput-object p1, v11, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda4;->f$2:Lcom/android/server/wm/ActivityRecord;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    new-instance v12, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;

    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    iput-object p0, v12, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object p1, v12, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;->f$1:Lcom/android/server/wm/ActivityRecord;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    move-object v7, p0

    invoke-virtual/range {v7 .. v12}, Lcom/android/server/wm/AppLockOverlayController;->startLockedAppActivityAsync(Lcom/android/server/wm/Task;Landroid/content/Intent;ILcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda4;Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;)V

    return-void
.end method

.method public addLockedByAppLockTaskOverlay(Lcom/android/server/wm/Task;Ljava/lang/String;I)V
    .locals 9

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/wm/AppLockController;->isAppLockFolderBypassedForTaskLocked(Lcom/android/server/wm/Task;Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v0

    sget-object v1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    if-eqz v0, :cond_1

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v1, p0

    if-eqz p0, :cond_5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x7fc2381ea4593fabL    # 2.5587939319906295E307

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_1
    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v2

    aget-boolean v2, v1, v2

    if-eqz v2, :cond_2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {v2, p2}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, 0x7aec08d5fb653937L    # 1.3027436870062096E284

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_2
    const/4 v2, 0x1

    invoke-virtual {p1, v2, v2}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v2

    if-nez v2, :cond_3

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v1, p0

    if-eqz p0, :cond_5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x1578fca9dde3bebL

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_3
    invoke-virtual {v2}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/android/server/wm/AppLockOverlayController;->isKeyguardLocked(I)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0, v2}, Lcom/android/server/wm/AppLockOverlayController;->trackKeyguardScopedBypassedActivity(Lcom/android/server/wm/ActivityRecord;)V

    return-void

    :cond_4
    invoke-static {p3, v2, p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockPromptForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v1, p0

    if-eqz p0, :cond_5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x780084781ba83154L

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_5
    :goto_0
    return-void

    :cond_6
    iget-object v0, p1, Lcom/android/server/wm/Task;->mTaskDescription:Landroid/app/ActivityManager$TaskDescription;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/app/ActivityManager$TaskDescription;->getBackgroundColor()I

    move-result v1

    invoke-virtual {v0}, Landroid/app/ActivityManager$TaskDescription;->getSystemBarsAppearance()I

    move-result v0

    goto :goto_1

    :cond_7
    const/4 v1, 0x0

    move v0, v1

    :goto_1
    const/4 v2, 0x0

    invoke-static {p2, p3, v1, v0, v2}, Lcom/android/internal/app/LockedAppActivity;->createLockedAppActivityIntent(Ljava/lang/String;IIILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object v5

    const/high16 p2, 0x4020000

    invoke-virtual {v5, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, p1

    move v6, p3

    invoke-virtual/range {v3 .. v8}, Lcom/android/server/wm/AppLockOverlayController;->startLockedAppActivityAsync(Lcom/android/server/wm/Task;Landroid/content/Intent;ILcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda4;Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;)V

    return-void
.end method

.method public final canRestoreSplitAppLockFocusLocked(ILcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)Z
    .locals 2

    if-eqz p2, :cond_0

    iget-object v0, p2, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    if-eq v0, p3, :cond_1

    iget-boolean v1, p2, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v1, :cond_1

    iget v1, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v1, p1, :cond_1

    invoke-virtual {v0}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v0}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v0}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object p1

    invoke-virtual {p3}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v1

    if-ne p1, v1, :cond_1

    invoke-virtual {v0}, Lcom/android/server/wm/TaskFragment;->getRootTask()Lcom/android/server/wm/Task;

    move-result-object p1

    invoke-virtual {p3}, Lcom/android/server/wm/TaskFragment;->getRootTask()Lcom/android/server/wm/Task;

    move-result-object p3

    if-ne p1, p3, :cond_1

    const/4 p1, 0x1

    invoke-virtual {v0, p1, p1}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object p3

    if-ne p3, p2, :cond_1

    invoke-static {p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p3

    if-nez p3, :cond_1

    invoke-virtual {p0, p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityLockedByAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    if-nez p0, :cond_1

    return p1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public final checkPendingSplitAppLockAuthenticationLocked()V
    .locals 10

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ltz v0, :cond_3

    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v4, v0}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v5

    iget-boolean v6, v4, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v6, :cond_1

    invoke-virtual {v4}, Lcom/android/server/wm/WindowContainer;->isAttached()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_1

    :cond_0
    if-eqz v5, :cond_2

    invoke-virtual {p0, v5}, Lcom/android/server/wm/AppLockOverlayController;->isSplitAppLockInteractionBusyLocked(Lcom/android/server/wm/DisplayContent;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v3, v0}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0, v4}, Lcom/android/server/wm/AppLockOverlayController;->unregisterPendingSplitAppLockActivityIfIdleLocked(Lcom/android/server/wm/ActivityRecord;)V

    move v3, v1

    goto :goto_2

    :cond_1
    :goto_1
    iget-object v5, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v5, v0}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    invoke-virtual {p0, v4}, Lcom/android/server/wm/AppLockOverlayController;->unregisterPendingSplitAppLockActivityIfIdleLocked(Lcom/android/server/wm/ActivityRecord;)V

    :cond_2
    :goto_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->schedulePendingSplitAppLockAuthenticationLocked()V

    return-void

    :cond_4
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->size()I

    move-result v0

    sub-int/2addr v0, v1

    :goto_3
    if-ltz v0, :cond_9

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    invoke-virtual {v3, v0}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v4

    iget-object v5, v3, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    iget-object v6, v3, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v7, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v3, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v8, "android.intent.extra.USER_ID"

    const/16 v9, -0x2710

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    iget-boolean v8, v3, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v8, :cond_7

    invoke-virtual {v3}, Lcom/android/server/wm/WindowContainer;->isAttached()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-virtual {v3}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v8

    if-eqz v8, :cond_7

    sget-object v8, Lcom/android/server/wm/ActivityRecord$State;->RESUMED:Lcom/android/server/wm/ActivityRecord$State;

    invoke-virtual {v3, v8}, Lcom/android/server/wm/ActivityRecord;->isState(Lcom/android/server/wm/ActivityRecord$State;)Z

    move-result v8

    if-eqz v8, :cond_7

    if-eqz v4, :cond_7

    iget-boolean v8, v4, Lcom/android/server/wm/DisplayContent;->mSleeping:Z

    if-nez v8, :cond_7

    if-eqz v5, :cond_7

    invoke-virtual {v5, v1, v1}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v5

    if-ne v5, v3, :cond_7

    invoke-virtual {v3}, Lcom/android/server/wm/ActivityRecord;->showToCurrentUser()Z

    move-result v5

    if-eqz v5, :cond_7

    if-eqz v6, :cond_7

    if-eq v7, v9, :cond_7

    iget-object v5, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v5, v7, v6}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {v3}, Lcom/android/server/wm/ActivityRecord;->attachedToProcess()Z

    move-result v5

    if-nez v5, :cond_5

    goto :goto_4

    :cond_5
    invoke-virtual {p0, v4}, Lcom/android/server/wm/AppLockOverlayController;->isSplitAppLockInteractionBusyLocked(Lcom/android/server/wm/DisplayContent;)Z

    move-result v4

    if-eqz v4, :cond_6

    goto :goto_5

    :cond_6
    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    invoke-virtual {v4, v0}, Landroid/util/ArraySet;->removeAt(I)Ljava/lang/Object;

    invoke-virtual {p0, v3}, Lcom/android/server/wm/AppLockOverlayController;->unregisterPendingSplitAppLockActivityIfIdleLocked(Lcom/android/server/wm/ActivityRecord;)V

    iput-boolean v2, v3, Lcom/android/server/wm/ActivityRecord;->mEnteringAnimation:Z

    :try_start_0
    iget-object v4, v3, Lcom/android/server/wm/ActivityRecord;->app:Lcom/android/server/wm/WindowProcessController;

    iget-object v4, v4, Lcom/android/server/wm/WindowProcessController;->mThread:Landroid/app/IApplicationThread;

    iget-object v5, v3, Lcom/android/server/wm/WindowToken;->token:Landroid/os/IBinder;

    invoke-interface {v4, v5}, Landroid/app/IApplicationThread;->scheduleEnterAnimationComplete(Landroid/os/IBinder;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    sget-object v4, Lcom/android/internal/protolog/common/LogLevel;->WARN:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v4}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v4

    sget-object v5, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v4, v5, v4

    if-eqz v4, :cond_8

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, -0x4a63475bfbcc7d6L

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->w(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    goto :goto_5

    :cond_7
    :goto_4
    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    invoke-virtual {v4, v0}, Landroid/util/ArraySet;->removeAt(I)Ljava/lang/Object;

    invoke-virtual {p0, v3}, Lcom/android/server/wm/AppLockOverlayController;->unregisterPendingSplitAppLockActivityIfIdleLocked(Lcom/android/server/wm/ActivityRecord;)V

    :cond_8
    :goto_5
    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_3

    :cond_9
    return-void
.end method

.method public final deferSplitAppLockEnterAnimationCompleteLocked(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 4

    iget-boolean v0, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->mActivityComponent:Landroid/content/ComponentName;

    if-eqz v0, :cond_2

    iget-object v2, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    if-eqz v2, :cond_2

    invoke-static {v0}, Lcom/android/server/wm/AppLockOverlayController;->isComponentAppLockOverlayActivity(Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayIntent(Landroid/content/Intent;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v3, "com.android.internal.app.extra.SEND_INTENT_IN_LOCKED_TASK_MODE"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v3, "com.android.internal.app.extra.ACTIVITY_MODE"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v2, :cond_2

    :cond_0
    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->registerPendingSplitAppLockActivityLocked(Lcom/android/server/wm/ActivityRecord;)V

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->schedulePendingSplitAppLockAuthenticationLocked()V

    return v2

    :cond_2
    :goto_0
    return v1
.end method

.method public final evaluateTaskFragmentLockVisibility(Lcom/android/server/wm/TaskFragment;Ljava/lang/String;Ljava/lang/String;I)Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;
    .locals 9

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    const/4 v0, 0x1

    invoke-virtual {p1, v0, v0}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v1

    sget-object v2, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->OVERLAY:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    if-eqz v1, :cond_1

    invoke-static {p4, v1, p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForVisibility(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v3

    sget-object v4, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    if-eqz v3, :cond_0

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v4, p0

    if-eqz p0, :cond_2

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {p0, p2}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, 0x41e71a79731e3203L    # 3.100887960943605E9

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-object v2

    :cond_0
    invoke-static {p4, v1, p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockPromptForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v4, p0

    if-eqz p0, :cond_2

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {p0, p2}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, -0x54036114ad8ec9a1L    # -8.374576293083136E-97

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-object v2

    :cond_1
    new-instance v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOpaqueActivity:Z

    iput-boolean v3, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundVisibleTarget:Z

    iput-boolean v3, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOccludedTarget:Z

    iput-boolean v3, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mVisibleTargetRequiresAppLock:Z

    iput-boolean v3, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundTargetOverlay:Z

    new-instance v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object p0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object p2, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$1:Ljava/lang/String;

    iput p4, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$2:I

    iput-object v1, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$3:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;

    iput-boolean p3, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$4:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v3, v0}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Predicate;Z)Z

    iget-boolean p0, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundTargetOverlay:Z

    if-eqz p0, :cond_3

    :cond_2
    return-object v2

    :cond_3
    iget-boolean p0, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundVisibleTarget:Z

    if-eqz p0, :cond_5

    iget-boolean p0, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mVisibleTargetRequiresAppLock:Z

    if-eqz p0, :cond_4

    sget-object p0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->VISIBLE_SENSITIVE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    return-object p0

    :cond_4
    sget-object p0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->VISIBLE_EXEMPT:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    return-object p0

    :cond_5
    iget-boolean p0, v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOccludedTarget:Z

    if-eqz p0, :cond_6

    sget-object p0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->OCCLUDED:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    return-object p0

    :cond_6
    sget-object p0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->NONE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    return-object p0
.end method

.method public final finishActivityOverlayIfOrphan(Lcom/android/server/wm/ActivityRecord;)V
    .locals 8

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    const-string/jumbo v1, "orphaned-app-lock-overlay"

    sget-object v2, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    if-nez v0, :cond_1

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v2, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v5, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v7

    const-wide v3, 0x35f1fa51704731b5L    # 7.688070908973969E-49

    invoke-static/range {v2 .. v7}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    invoke-static {p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/ActivityRecord;

    if-nez v0, :cond_3

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v2, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v5, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v7

    const-wide v3, 0x4c919db35b2e3ca8L    # 7.076962381363816E60

    invoke-static/range {v2 .. v7}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_2
    invoke-static {p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual {p0, p1, v0}, Lcom/android/server/wm/AppLockOverlayController;->isAppLockOverlayValidForTarget(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    if-nez p0, :cond_5

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_4

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v5, 0x0

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v7

    const-wide v3, 0x76ab792991103b06L    # 4.3255058309572805E263

    invoke-static/range {v2 .. v7}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_4
    invoke-static {p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V

    return-void

    :cond_5
    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_6

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x69f5898969e33ac7L    # 2.6377122338753584E202

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_6
    return-void
.end method

.method public final finishLockedTaskAppLockOverlaysLocked(Lcom/android/server/wm/Task;Ljava/lang/String;ILjava/lang/String;)V
    .locals 4

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_2

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v2, v0}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/ActivityRecord;

    if-eqz p1, :cond_0

    iget-object v3, v2, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-ne v3, p1, :cond_1

    :cond_0
    iget v3, v2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v3, p3, :cond_1

    iget-object v2, v2, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v2, v0}, Landroid/util/ArraySet;->removeAt(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda10;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda10;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object p2, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda10;->f$1:Ljava/lang/String;

    iput p3, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda10;->f$2:I

    iput-object v0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda10;->f$3:Ljava/util/ArrayList;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    if-eqz p1, :cond_3

    invoke-virtual {p1, v2, v1}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;Z)V

    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object p0

    new-instance p1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;

    const/4 p2, 0x2

    invoke-direct {p1, p2}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;-><init>(B)V

    iput-object v2, p1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;->f$0:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, p1, v1}, Lcom/android/server/wm/WindowContainer;->forAllLeafTasks(Ljava/util/function/Consumer;Z)V

    :goto_1
    const/4 p0, 0x0

    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p0, p1, :cond_4

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    invoke-static {p1, p4}, Lcom/android/server/wm/AppLockOverlayController;->finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_2

    :cond_4
    return-void
.end method

.method public final getAppLockTaskVisibilityState(ILjava/lang/String;)I
    .locals 8

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v4, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v5, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v6

    new-instance v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object p0, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object v5, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput p1, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$2:I

    iput-object p2, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    iput-object v0, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$4:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object v2, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$5:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object v4, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$6:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v6, v7}, Lcom/android/server/wm/WindowContainer;->forAllLeafTasks(Ljava/util/function/Predicate;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x4

    return p0

    :cond_0
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x5

    return p0

    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-nez p0, :cond_2

    return v1

    :cond_2
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x2

    return p0

    :cond_3
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 p0, 0x3

    return p0

    :cond_4
    return v3
.end method

.method public final getPackagesWithVisibleAppLockOverlay(I)Ljava/util/Set;
    .locals 7

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v1, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mRootWindowContainer:Lcom/android/server/wm/RootWindowContainer;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/android/server/wm/RootWindowContainer;->getTopVisibleActivities(I)Ljava/util/List;

    move-result-object v1

    new-instance v2, Landroid/util/ArraySet;

    invoke-direct {v2}, Landroid/util/ArraySet;-><init>()V

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

    if-nez v3, :cond_0

    iget-object v3, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

    iput-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

    :cond_0
    invoke-virtual {v3}, Lcom/android/server/wm/ActivityTaskSupervisor;->getVirtualDeviceManagerInternal()Lcom/android/server/companion/virtual/VirtualDeviceManagerInternal;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    move-object v3, v1

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_4

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/ActivityRecord;

    if-eqz v3, :cond_3

    invoke-static {v3}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForVisibility(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, v3, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v5, "android.intent.extra.USER_ID"

    const/16 v6, -0x2710

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    if-eq v4, p1, :cond_1

    goto :goto_1

    :cond_1
    if-eqz p0, :cond_2

    invoke-virtual {v3}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/android/server/companion/virtual/VirtualDeviceManagerInternal;->isComputerControlDisplay(I)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_1

    :cond_2
    iget-object v3, v3, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v2, v3}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-object v2
.end method

.method public final getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mRootWindowContainer:Lcom/android/server/wm/RootWindowContainer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mRootWindowContainer:Lcom/android/server/wm/RootWindowContainer;

    iput-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mRootWindowContainer:Lcom/android/server/wm/RootWindowContainer;

    :cond_0
    return-object v0
.end method

.method public final isActivityLockedByAppLock(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 9

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    iget v1, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v3, v1, v0}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v4, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    iget-object v5, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    const/4 v6, 0x1

    if-eqz v4, :cond_2

    if-nez v5, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v4, v6, v6}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v4

    iget v7, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-eqz v4, :cond_2

    invoke-static {v7, v4, v5}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayForPackageLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v4, v2}, Lcom/android/server/wm/ActivityRecord;->occludesParent(Z)Z

    move-result v4

    if-nez v4, :cond_2

    return v2

    :cond_2
    :goto_0
    iget-object v4, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_1

    :cond_3
    iget-boolean v4, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    sget-object v5, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    if-eqz v4, :cond_4

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v5, p0

    if-eqz p0, :cond_8

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, -0x71593254734c485L    # -2.859068459249328E274

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return v2

    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v4

    if-eqz v4, :cond_6

    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v0

    aget-boolean v0, v5, v0

    if-eqz v0, :cond_5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, 0x3354187c927f387dL    # 1.953992845035437E-61

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_5
    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->trackKeyguardScopedBypassedActivity(Lcom/android/server/wm/ActivityRecord;)V

    return v2

    :cond_6
    sget-boolean p0, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz p0, :cond_7

    iget-object p0, v3, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_7

    iget-object p1, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/server/wm/AppLockController;->isAppLockFolderBypassedForTaskLocked(Lcom/android/server/wm/Task;Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_7

    goto :goto_1

    :cond_7
    return v6

    :cond_8
    :goto_1
    return v2
.end method

.method public isActivityPermittedToBypassAppLock(Landroid/content/Intent;Landroid/content/pm/ActivityInfo;Ljava/lang/String;IILandroid/os/IBinder;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 9

    move-object/from16 v1, p7

    if-eqz p1, :cond_e

    if-eqz p2, :cond_e

    iget-object v2, p2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    if-eqz v2, :cond_e

    iget-object v2, p2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    if-nez v2, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLockByMetadataLocked(Landroid/content/pm/ActivityInfo;)Z

    move-result v2

    const/4 v7, 0x1

    if-eqz v2, :cond_1

    goto/16 :goto_2

    :cond_1
    iget-object v2, p2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/pm/ActivityInfo;->getComponentName()Landroid/content/ComponentName;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController;->mAppLockInternal:Landroid/app/AppLockInternal;

    if-nez v4, :cond_2

    const-class v4, Landroid/app/AppLockInternal;

    invoke-static {v4}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/AppLockInternal;

    iput-object v4, p0, Lcom/android/server/wm/AppLockOverlayController;->mAppLockInternal:Landroid/app/AppLockInternal;

    :cond_2
    if-eqz v3, :cond_7

    if-eqz v4, :cond_7

    if-eqz p6, :cond_3

    invoke-interface {v4, v2, p4, v3, p6}, Landroid/app/AppLockInternal;->checkAndAcceptIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;Landroid/os/IBinder;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto/16 :goto_2

    :cond_3
    const-string/jumbo v0, "android.intent.action.MAIN"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string/jumbo v0, "android.intent.category.LAUNCHER"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string/jumbo v0, "android.intent.category.INFO"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/high16 v5, 0x100000

    and-int/2addr v0, v5

    if-eqz v0, :cond_6

    :cond_5
    :goto_0
    if-eqz v1, :cond_7

    iget-object v0, v1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget v0, v1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne p4, v0, :cond_7

    invoke-virtual {p0, v1}, Lcom/android/server/wm/AppLockOverlayController;->isAnsweredIncomingCall(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    invoke-interface {v4, v2, p4, v3}, Landroid/app/AppLockInternal;->matchesAnsweredIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto/16 :goto_2

    :cond_7
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/android/server/wm/AppLockOverlayController;->isIntentActionPermittedToBypassAppLock(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_3

    :cond_8
    if-eqz v8, :cond_9

    sget-object v0, Lcom/android/server/wm/AppLockOverlayController;->PERMITTED_SECURE_INTENT_ACTIONS:Ljava/util/Set;

    invoke-interface {v0, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0, p5}, Lcom/android/server/wm/AppLockOverlayController;->isKeyguardLocked(I)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_3

    :cond_9
    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    invoke-virtual {p0}, Lcom/android/server/wm/ActivityTaskManagerService;->getPackageManagerInternalLocked()Landroid/content/pm/PackageManagerInternal;

    move-result-object v0

    if-nez v0, :cond_a

    goto/16 :goto_3

    :cond_a
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-virtual {v1, p0}, Landroid/content/Intent;->setSelector(Landroid/content/Intent;)V

    iget-object p0, p2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-wide/16 v3, 0x0

    const/16 v5, 0x3e8

    move-object v2, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Landroid/content/pm/PackageManagerInternal;->queryIntentActivities(Landroid/content/Intent;Ljava/lang/String;JII)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_e

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_3

    :cond_b
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v7

    :goto_1
    if-ltz p1, :cond_e

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/content/pm/ResolveInfo;

    if-eqz p3, :cond_d

    iget-object p3, p3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz p3, :cond_d

    iget-object v0, p2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    iget-object p3, p3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_d

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    sget-object p1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean p0, p1, p0

    if-eqz p0, :cond_c

    iget-object p0, p2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v0, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const-wide v2, -0x3e7674cfc698c8b6L    # -5.3569031175398424E7

    move-object/from16 p7, p0

    move-wide p5, v0

    move-wide p3, v2

    invoke-static/range {p2 .. p7}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_c
    :goto_2
    return v7

    :cond_d
    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :cond_e
    :goto_3
    const/4 p0, 0x0

    return p0
.end method

.method public isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 1

    const/4 v0, 0x1

    .line 292
    invoke-virtual {p0, p1, v0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;Z)Z

    move-result p0

    return p0
.end method

.method public final isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;Z)Z
    .locals 9

    const/4 v0, 0x0

    if-nez p1, :cond_0

    goto :goto_1

    .line 281
    :cond_0
    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->info:Landroid/content/pm/ActivityInfo;

    invoke-virtual {p0, v1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLockByMetadataLocked(Landroid/content/pm/ActivityInfo;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 282
    invoke-virtual {p1}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/server/wm/AppLockOverlayController;->isKeyguardLocked(I)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 283
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->isAnsweredIncomingCall(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 284
    iget-object p2, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {p2, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3

    .line 285
    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->registerActivity(Lcom/android/server/wm/ActivityRecord;)V

    :cond_3
    :goto_0
    return v2

    :cond_4
    if-nez p2, :cond_6

    .line 286
    iget-object p2, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    if-eqz p2, :cond_5

    .line 287
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_5

    .line 288
    sget-object v1, Lcom/android/server/wm/AppLockOverlayController;->PERMITTED_EMERGENCY_INTENT_ACTIONS:Ljava/util/Set;

    invoke-interface {v1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    goto :goto_2

    :cond_5
    :goto_1
    return v0

    .line 289
    :cond_6
    :goto_2
    iget-object v2, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    iget-object v3, p1, Lcom/android/server/wm/ActivityRecord;->info:Landroid/content/pm/ActivityInfo;

    iget-object v4, p1, Lcom/android/server/wm/ActivityRecord;->resolvedType:Ljava/lang/String;

    iget v5, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    .line 290
    invoke-virtual {p1}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    .line 291
    invoke-virtual/range {v1 .. v8}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Landroid/content/Intent;Landroid/content/pm/ActivityInfo;Ljava/lang/String;IILandroid/os/IBinder;Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    return p0
.end method

.method public isActivityPermittedToBypassAppLockByMetadataLocked(Landroid/content/pm/ActivityInfo;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-object v1, p1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v1, :cond_1

    iget-object v1, p1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    if-eqz v1, :cond_1

    const-string/jumbo v2, "com.samsung.android.applock.bypass"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    invoke-virtual {p0}, Lcom/android/server/wm/ActivityTaskManagerService;->getPackageManagerInternalLocked()Landroid/content/pm/PackageManagerInternal;

    move-result-object p0

    if-eqz p0, :cond_1

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManagerInternal;->isPlatformSigned(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    return v0
.end method

.method public final isAnsweredIncomingCall(Lcom/android/server/wm/ActivityRecord;)Z
    .locals 3

    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->mActivityComponent:Landroid/content/ComponentName;

    if-eqz v1, :cond_2

    iget p1, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mAppLockInternal:Landroid/app/AppLockInternal;

    if-nez v2, :cond_1

    const-class v2, Landroid/app/AppLockInternal;

    invoke-static {v2}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AppLockInternal;

    iput-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mAppLockInternal:Landroid/app/AppLockInternal;

    :cond_1
    if-eqz v2, :cond_2

    invoke-interface {v2, v0, p1, v1}, Landroid/app/AppLockInternal;->matchesAnsweredIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public isAppLockOverlayValidForTarget(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 10

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v1

    sget-object v2, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v1, v2, v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, -0x267877378c17c62bL    # -1.944686901910793E123

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    iget-boolean v1, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    const/4 v3, 0x0

    if-nez v1, :cond_b

    iget-boolean v1, p2, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-eqz v1, :cond_1

    goto/16 :goto_3

    :cond_1
    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mTargetToOverlayMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    invoke-virtual {v4, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_a

    if-nez v4, :cond_2

    goto/16 :goto_2

    :cond_2
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_9

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p2, :cond_3

    goto/16 :goto_1

    :cond_3
    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    iget-object v4, p2, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v4, :cond_8

    if-eq v1, v4, :cond_4

    goto :goto_0

    :cond_4
    iget-object v1, p2, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    iget v4, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    invoke-static {v4, p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_c

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide v5, -0x59dd46cae0caca81L    # -5.531947803355021E-125

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return v3

    :cond_5
    iget-object p1, p2, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    iget p2, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {p0, p2, p1}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_c

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide v5, -0x4c78b1890a03cec6L    # -1.8129590296146732E-60

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return v3

    :cond_6
    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_7

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    const-wide v1, 0x745f741e99d3d59L

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_7
    const/4 p0, 0x1

    return p0

    :cond_8
    :goto_0
    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_c

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide v5, 0xded2c3ca84d3e8dL

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return v3

    :cond_9
    :goto_1
    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_c

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide v5, -0xdcd46f38fe1c075L

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return v3

    :cond_a
    :goto_2
    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_c

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide v5, -0x1d3b5d1c7c31c9fdL    # -6.084418811436825E167

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return v3

    :cond_b
    :goto_3
    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_c

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide v5, -0x404c2292e4fccbf3L    # -0.0775974455784338

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_c
    return v3
.end method

.method public final isKeyguardLocked(I)Z
    .locals 0

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object p0, p0, Lcom/android/server/wm/ActivityTaskManagerService;->mKeyguardController:Lcom/android/server/wm/KeyguardController;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/server/wm/KeyguardController;->isKeyguardLocked(I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final isSplitAppLockInteractionBusyLocked(Lcom/android/server/wm/DisplayContent;)Z
    .locals 4

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowOrganizerController:Lcom/android/server/wm/WindowOrganizerController;

    iget-object v0, v0, Lcom/android/server/wm/WindowOrganizerController;->mTransitionController:Lcom/android/server/wm/TransitionController;

    invoke-virtual {v0}, Lcom/android/server/wm/TransitionController;->inTransition()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockTransitionValidatorPending:Z

    if-nez v1, :cond_0

    iput-boolean v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockTransitionValidatorPending:Z

    iget-object v1, v0, Lcom/android/server/wm/TransitionController;->mStateValidators:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;

    invoke-direct {v3, v2}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;-><init>(B)V

    iput-object p0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {v0}, Lcom/android/server/wm/TransitionController;->inTransition()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mDragDropController:Lcom/android/server/wm/DragDropController;

    iget-object p0, p0, Lcom/android/server/wm/DragDropController;->mDragState:Lcom/android/server/wm/DragState;

    if-eqz p0, :cond_1

    iget-object v0, p0, Lcom/android/server/wm/DragState;->mCurrentDisplayContent:Lcom/android/server/wm/DisplayContent;

    if-eq v0, p1, :cond_2

    iget-object p0, p0, Lcom/android/server/wm/DragState;->mStartDragDisplayContent:Lcom/android/server/wm/DisplayContent;

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0

    :cond_2
    :goto_0
    return v2
.end method

.method public final isTaskLevelAppLockOverlayForPipRestoreLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p1, p2, p3}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayForPackageLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p2, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/content/Intent;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    invoke-virtual {p0, p2}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final lambda$lockActivitiesTasksForAppLock$1(Ljava/lang/String;ILjava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicReference;Lcom/android/server/wm/ActivityRecord;)V
    .locals 1

    iget-boolean v0, p5, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p5, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p5, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne p1, p2, :cond_3

    iget-object p1, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {p1, p5}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0, p5}, Lcom/android/server/wm/AppLockOverlayController;->registerActivity(Lcom/android/server/wm/ActivityRecord;)V

    :cond_1
    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_3

    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_3

    invoke-virtual {p0, p5}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p4, p5}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0, p5}, Lcom/android/server/wm/AppLockOverlayController;->trackKeyguardScopedBypassedActivity(Lcom/android/server/wm/ActivityRecord;)V

    :cond_3
    :goto_0
    const/4 p0, 0x0

    invoke-virtual {p5, p0}, Lcom/android/server/wm/ActivityRecord;->occludesParent(Z)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 p0, 0x1

    invoke-virtual {p3, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_4
    :goto_1
    return-void
.end method

.method public final lockActivitiesTasksForAppLock(ILjava/lang/String;)V
    .locals 8

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v0

    sget-object v1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v0, v1, v0

    if-eqz v0, :cond_0

    int-to-long v0, p1

    sget-object v2, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    filled-new-array {p2, v0}, [Ljava/lang/Object;

    move-result-object v7

    const-wide v3, -0x4a812105b97cc0f8L

    const-wide/16 v5, 0x4

    invoke-static/range {v2 .. v7}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v0

    new-instance v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput p1, v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iput-object p2, v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const/4 p0, 0x1

    invoke-virtual {v0, v1, p0}, Lcom/android/server/wm/WindowContainer;->forAllLeafTasks(Ljava/util/function/Consumer;Z)V

    return-void
.end method

.method public final onActivityRemoved(Lcom/android/server/wm/ActivityRecord;)V
    .locals 10

    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v1

    sget-object v2, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v1, v2, v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, -0x793c08fc08f1c63eL

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mTargetToOverlayMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/ActivityRecord;

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    move-object v3, p1

    goto :goto_1

    :cond_3
    move-object v3, v1

    :goto_1
    if-eqz v3, :cond_5

    iget-boolean v4, v3, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v4, :cond_5

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v0

    aget-boolean v0, v2, v0

    if-eqz v0, :cond_4

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v7, 0x0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, 0x3854dd35a31d385cL    # 2.452563131844953E-37

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_4
    const-string/jumbo v0, "cleaning-up-app-lock-pair"

    invoke-static {v3, v0}, Lcom/android/server/wm/AppLockOverlayController;->finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V

    :cond_5
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowContainerListener;

    invoke-virtual {p1, v0}, Lcom/android/server/wm/WindowContainer;->unregisterWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    if-eqz v1, :cond_7

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowContainerListener;

    invoke-virtual {v1, v0}, Lcom/android/server/wm/WindowContainer;->unregisterWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mTargetToOverlayMap:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    if-eqz v1, :cond_8

    iget-object p1, p0, Lcom/android/server/wm/AppLockOverlayController;->mOverlayToTargetMap:Landroid/util/ArrayMap;

    invoke-virtual {p1, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/android/server/wm/AppLockOverlayController;->mTargetToOverlayMap:Landroid/util/ArrayMap;

    invoke-virtual {p1, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-virtual {p0, v1}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    :cond_8
    return-void
.end method

.method public onKeyguardDismissed(I)V
    .locals 13

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    :cond_0
    new-instance v0, Landroid/util/ArraySet;

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-direct {v0, v1}, Landroid/util/ArraySet;-><init>(Landroid/util/ArraySet;)V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/util/ArraySet;->size()I

    move-result v2

    if-ge v1, v2, :cond_c

    invoke-virtual {v0, v1}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/ActivityRecord;

    if-eqz v2, :cond_b

    invoke-virtual {v2}, Lcom/android/server/wm/WindowContainer;->isAttached()Z

    move-result v3

    if-eqz v3, :cond_b

    iget-boolean v3, v2, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-eqz v3, :cond_1

    goto/16 :goto_3

    :cond_1
    iget-object v3, v2, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    iget v4, v2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-eqz v3, :cond_a

    iget-object v5, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v5, v4, v3}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v5

    if-eq v5, p1, :cond_3

    goto :goto_4

    :cond_3
    iget-object v5, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-virtual {v5, v2}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0, v2}, Lcom/android/server/wm/AppLockOverlayController;->isAnsweredIncomingCall(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_4

    :cond_4
    iget-object v5, v2, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-nez v5, :cond_5

    goto :goto_4

    :cond_5
    invoke-virtual {v5}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v6

    if-nez v6, :cond_6

    goto :goto_4

    :cond_6
    sget-object v6, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v6}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v6

    sget-object v7, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v6, v7, v6

    if-eqz v6, :cond_7

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v10, 0x0

    filled-new-array {v6, v3}, [Ljava/lang/Object;

    move-result-object v12

    const-wide v8, 0x5eb0ed6ef3ee31c7L    # 1.3527889464257359E148

    invoke-static/range {v7 .. v12}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_7
    iget-object v6, v5, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v6, :cond_8

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_8
    const/4 v6, 0x0

    :goto_1
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    const/4 v6, 0x1

    invoke-virtual {v5, v6, v6}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v6

    if-ne v6, v2, :cond_9

    invoke-virtual {p0, v5, v3, v4}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockTaskOverlay(Lcom/android/server/wm/Task;Ljava/lang/String;I)V

    goto :goto_4

    :cond_9
    invoke-virtual {p0, v2}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/ActivityRecord;)V

    goto :goto_4

    :cond_a
    :goto_2
    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-virtual {v3, v2}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_b
    :goto_3
    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-virtual {v3, v2}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_c
    :goto_5
    return-void
.end method

.method public final onTaskVisibleRequestedChanged(Lcom/android/server/wm/Task;Z)V
    .locals 11

    iget v0, p1, Lcom/android/server/wm/Task;->mUserId:I

    const-class v1, Landroid/app/AppLockInternal;

    invoke-static {v1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AppLockInternal;

    if-eqz v1, :cond_e

    invoke-interface {v1, v0}, Landroid/app/AppLockInternal;->getAppLockEnabledPackagesForUser(I)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_4

    :cond_0
    sget-object v1, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v1}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v2

    sget-object v3, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v2, v3, v2

    if-eqz v2, :cond_1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v2, v5}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, 0x52c83d5329463619L    # 6.172104473305208E90

    const-wide/16 v7, 0xc

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_1
    const/4 v2, 0x1

    invoke-virtual {p1, v2, v2}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz p2, :cond_6

    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v3, p0

    if-eqz p0, :cond_e

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x5c0f5baaef09c9eaL

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v6

    if-eqz v6, :cond_6

    if-eqz v4, :cond_6

    invoke-static {v4}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-virtual {p1}, Lcom/android/server/wm/Task;->isStageRootTask()Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {p1}, Lcom/android/server/wm/Task;->isFullscreenRootForStageTask()Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->getTaskDisplayArea()Lcom/android/server/wm/TaskDisplayArea;

    move-result-object v6

    if-nez v6, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->getTaskDisplayArea()Lcom/android/server/wm/TaskDisplayArea;

    move-result-object v6

    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->getStageType()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/android/server/wm/TaskDisplayArea;->getTopRootTaskInStageType(I)Lcom/android/server/wm/Task;

    move-result-object v6

    if-eqz v6, :cond_6

    invoke-virtual {v6, v2, v2}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v6

    if-eq v6, v4, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v6

    if-eqz v6, :cond_5

    iget-object v6, v6, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;

    goto :goto_0

    :cond_5
    move-object v6, v5

    :goto_0
    invoke-virtual {p0, v4, v6, p1}, Lcom/android/server/wm/AppLockOverlayController;->requestFocusForVisibleSplitAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V

    :cond_6
    :goto_1
    if-eqz v4, :cond_d

    invoke-static {v4}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v6

    if-nez v6, :cond_d

    iget-object v6, p1, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-nez v6, :cond_7

    goto/16 :goto_3

    :cond_7
    invoke-virtual {p0, v4}, Lcom/android/server/wm/AppLockOverlayController;->isAnsweredIncomingCall(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v6

    if-eqz v6, :cond_8

    iget-object v6, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v6, v4}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8

    invoke-virtual {p0, v4}, Lcom/android/server/wm/AppLockOverlayController;->registerActivity(Lcom/android/server/wm/ActivityRecord;)V

    :cond_8
    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    if-nez p2, :cond_b

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v8

    iget-object v9, v7, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowOrganizerController:Lcom/android/server/wm/WindowOrganizerController;

    iget-object v9, v9, Lcom/android/server/wm/WindowOrganizerController;->mTransitionController:Lcom/android/server/wm/TransitionController;

    if-eqz v8, :cond_b

    iget-boolean v10, v8, Lcom/android/server/wm/DisplayContent;->mSleeping:Z

    if-nez v10, :cond_b

    invoke-virtual {v8}, Lcom/android/server/wm/DisplayContent;->isKeyguardLocked()Z

    move-result v8

    if-nez v8, :cond_b

    invoke-virtual {v9}, Lcom/android/server/wm/TransitionController;->inTransition()Z

    move-result v8

    if-eqz v8, :cond_b

    invoke-virtual {p1, v5}, Lcom/android/server/wm/TaskFragment;->shouldBeVisible(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v5

    if-eqz v5, :cond_b

    new-instance v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda23;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, v5}, Lcom/android/server/wm/WindowContainer;->getActivity(Ljava/util/function/Predicate;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v5

    if-nez v5, :cond_9

    goto :goto_2

    :cond_9
    invoke-virtual {v1}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p2

    aget-boolean p2, v3, p2

    if-eqz p2, :cond_a

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x37b19143423b34c7L    # 2.0166423540211388E-40

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_a
    iget-object p2, v9, Lcom/android/server/wm/TransitionController;->mStateValidators:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;

    invoke-direct {v0, v6}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;-><init>(B)V

    iput-object p0, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$0:Ljava/lang/Object;

    iput-object p1, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$1:Lcom/android/server/wm/WindowContainer;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_b
    :goto_2
    if-eqz p2, :cond_c

    iget-boolean v1, v4, Lcom/android/server/wm/ActivityRecord;->mDeferAppLockIntercept:Z

    if-eqz v1, :cond_c

    iput-boolean v6, v4, Lcom/android/server/wm/ActivityRecord;->mDeferAppLockIntercept:Z

    invoke-virtual {p0, v4}, Lcom/android/server/wm/AppLockOverlayController;->isActivityLockedByAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-virtual {p0, v4}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/ActivityRecord;)V

    :cond_c
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p1, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;

    invoke-direct {v1, v2}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;->f$0:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v1}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    invoke-virtual {p1}, Lcom/android/server/wm/Task;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v7, Lcom/android/server/wm/ActivityTaskManagerService;->mH:Lcom/android/server/wm/ActivityTaskManagerService$H;

    new-instance v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v1, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$0:Ljava/lang/String;

    iput-boolean p2, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$1:Z

    iput-object p1, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$2:Lcom/android/server/wm/Task;

    iput v0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$3:I

    iput-object p0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$4:Ljava/util/ArrayList;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_d
    :goto_3
    invoke-virtual {v1}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v3, p0

    if-eqz p0, :cond_e

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x4489913c76abc670L    # -2.968939305998383E-22

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_e
    :goto_4
    return-void
.end method

.method public registerActivity(Lcom/android/server/wm/ActivityRecord;)V
    .locals 9

    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v1

    sget-object v2, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v1, v2, v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v6, 0x0

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v8

    const-wide v4, -0x4cba540caf8ecbaeL    # -1.053618786240328E-61

    invoke-static/range {v3 .. v8}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v1

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v3, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v2, p0

    if-eqz p0, :cond_1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x2ad4061fbd3b38f3L    # 2.23506739679378E-102

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_1
    return-void

    :cond_2
    new-instance v0, Lcom/android/server/wm/AppLockOverlayController$4;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Lcom/android/server/wm/AppLockOverlayController$4;->val$activity:Lcom/android/server/wm/ActivityRecord;

    iput-boolean v1, v0, Lcom/android/server/wm/AppLockOverlayController$4;->val$isOverlay:Z

    iput-object p0, v0, Lcom/android/server/wm/AppLockOverlayController$4;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Lcom/android/server/wm/WindowContainer;->registerWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {p0, p1, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final registerPendingSplitAppLockActivityLocked(Lcom/android/server/wm/ActivityRecord;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockPendingListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/android/server/wm/AppLockOverlayController$2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Lcom/android/server/wm/AppLockOverlayController$2;->val$activity:Lcom/android/server/wm/ActivityRecord;

    iput-object p0, v0, Lcom/android/server/wm/AppLockOverlayController$2;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockPendingListeners:Landroid/util/ArrayMap;

    invoke-virtual {p0, p1, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/android/server/wm/WindowContainer;->registerWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    return-void
.end method

.method public final removePendingAppLockActivityOverlayTargetsLocked(IILjava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v1, v0}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/ActivityRecord;

    iget-object v2, v1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v2, :cond_0

    iget v2, v2, Lcom/android/server/wm/Task;->mTaskId:I

    if-ne v2, p1, :cond_0

    iget v2, v1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v2, p2, :cond_0

    iget-object v2, v1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v2, v0}, Landroid/util/ArraySet;->removeAt(I)Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mWaitOverlayTargetConditions:Landroid/util/ArrayMap;

    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/Transition$ReadyCondition;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/android/server/wm/Transition$ReadyCondition;->meet()V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final removeTaskSnapshot(Lcom/android/server/wm/Task;Ljava/lang/String;I)V
    .locals 10

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v0

    sget-object v1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v0, v1, v0

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/android/server/wm/Task;->mTaskId:I

    int-to-long v0, v0

    int-to-long v2, p3

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {p2, v0, v1}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, -0x658fa7ac2ceec5a6L    # -2.461888139223686E-181

    const-wide/16 v7, 0x14

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    iget-object p2, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskSnapshotController:Lcom/android/server/wm/TaskSnapshotController;

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object p2, p2, Lcom/android/server/wm/WindowManagerService;->mTaskSnapshotController:Lcom/android/server/wm/TaskSnapshotController;

    iput-object p2, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskSnapshotController:Lcom/android/server/wm/TaskSnapshotController;

    :cond_1
    iget p0, p1, Lcom/android/server/wm/Task;->mTaskId:I

    invoke-virtual {p2, p0, p3}, Lcom/android/server/wm/TaskSnapshotController;->removeAndDeleteSnapshot(II)V

    invoke-virtual {p1}, Lcom/android/server/wm/Task;->onSnapshotReleased()V

    return-void
.end method

.method public final requestFocusForVisibleSplitAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V
    .locals 4

    iget p3, p3, Lcom/android/server/wm/Task;->mTaskId:I

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v1

    const/16 v2, -0x2710

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.extra.USER_ID"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    if-eqz v0, :cond_3

    if-eq v1, v2, :cond_3

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v2, v1, v0}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v2, v2, Lcom/android/server/wm/ActivityTaskManagerService;->mH:Lcom/android/server/wm/ActivityTaskManagerService$H;

    new-instance v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object p0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput p3, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$1:I

    iput-object p1, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$2:Lcom/android/server/wm/ActivityRecord;

    iput-object v0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$3:Ljava/lang/String;

    iput v1, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$4:I

    iput-object p2, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$5:Lcom/android/server/wm/ActivityRecord;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3
    :goto_2
    return-void
.end method

.method public final schedulePendingSplitAppLockAuthenticationLocked()V
    .locals 3

    iget-boolean v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockCheckPosted:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockCheckPosted:Z

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mH:Lcom/android/server/wm/ActivityTaskManagerService$H;

    new-instance v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public final startLockedAppActivityAsUserUncheckedAsync(IILandroid/content/Intent;)I
    .locals 22

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-static/range {p3 .. p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/ActivityOptions;->setLaunchTaskId(I)V

    iget-object v3, v0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v0}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v4

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v1, v5, v6, v7}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v1

    const/4 v4, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v1}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v1

    if-eqz v1, :cond_0

    move v7, v4

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    invoke-virtual {v2, v4, v7}, Landroid/app/ActivityOptions;->setTaskOverlay(ZZ)V

    iget-object v8, v0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v1, v8, Lcom/android/server/wm/ActivityTaskManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getIApplicationThread()Landroid/app/IApplicationThread;

    move-result-object v9

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v1, v1, Lcom/android/server/wm/ActivityTaskManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getBasePackageName()Ljava/lang/String;

    move-result-object v10

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v1, v1, Lcom/android/server/wm/ActivityTaskManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAttributionTag()Ljava/lang/String;

    move-result-object v11

    iget-object v0, v0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object/from16 v12, p3

    invoke-virtual {v12, v0}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v19

    const/16 v21, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/high16 v17, 0x10000000

    const/16 v18, 0x0

    move/from16 v20, p2

    invoke-virtual/range {v8 .. v21}, Lcom/android/server/wm/ActivityTaskManagerService;->startActivityAsUser(Landroid/app/IApplicationThread;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILandroid/app/ProfilerInfo;Landroid/os/Bundle;IZ)I

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return v0

    :goto_1
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    sget-object v2, Lcom/android/internal/protolog/common/LogLevel;->ERROR:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v2

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v4, 0x0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v6

    const-wide v2, -0x2aa6a0f937afc8b3L    # -1.4206251406571798E103

    invoke-static/range {v1 .. v6}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->e(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_1
    const/16 v0, -0x60

    return v0
.end method

.method public final startLockedAppActivityAsync(Lcom/android/server/wm/Task;Landroid/content/Intent;ILcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda4;Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;)V
    .locals 4

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget p1, p1, Lcom/android/server/wm/Task;->mTaskId:I

    invoke-static {p2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "requestRef="

    invoke-static {v0, v2}, Landroid/frameworks/vibrator/VibrationParam$1$$ExternalSyntheticOutline0;->m(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "OVERLAY_QUEUE"

    invoke-static {p1, p3, v3, v1, v2}, Lcom/android/server/wm/AppLockOverlayController;->logAppLockEvent(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v1, v1, Lcom/android/server/wm/ActivityTaskManagerService;->mH:Lcom/android/server/wm/ActivityTaskManagerService$H;

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object p2, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$1:Landroid/content/Intent;

    iput p3, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$2:I

    iput p1, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$3:I

    iput v0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$4:I

    iput-object p5, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$5:Ljava/util/function/Consumer;

    iput-object p4, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$6:Ljava/util/function/Consumer;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public trackKeyguardScopedBypassedActivity(Lcom/android/server/wm/ActivityRecord;)V
    .locals 3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->info:Landroid/content/pm/ActivityInfo;

    invoke-virtual {p0, v0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLockByMetadataLocked(Landroid/content/pm/ActivityInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v0, :cond_3

    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->isAnsweredIncomingCall(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-object v1, Lcom/android/server/wm/AppLockOverlayController;->PERMITTED_EMERGENCY_INTENT_ACTIONS:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/wm/AppLockOverlayController;->isKeyguardLocked(I)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    iget v1, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v2, v1, v0}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mKeyguardScopedBypassedActivities:Landroid/util/ArraySet;

    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mActivityListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->registerActivity(Lcom/android/server/wm/ActivityRecord;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public final unregisterPendingSplitAppLockActivityIfIdleLocked(Lcom/android/server/wm/ActivityRecord;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockPendingListeners:Landroid/util/ArrayMap;

    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/wm/WindowContainerListener;

    if-eqz p0, :cond_0

    invoke-virtual {p1, p0}, Lcom/android/server/wm/WindowContainer;->unregisterWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    :cond_0
    return-void
.end method
