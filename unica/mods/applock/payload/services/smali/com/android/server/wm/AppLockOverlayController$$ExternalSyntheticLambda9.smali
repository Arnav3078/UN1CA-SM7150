.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:I

.field public synthetic f$2:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 7

    iget-byte v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->$r8$classId:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    check-cast p0, Landroid/util/ArraySet;

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v2, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v2, :cond_0

    iget-object v2, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v0, v0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v0, v1, v2}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lcom/android/server/wm/Task;

    iget v4, p1, Lcom/android/server/wm/Task;->mUserId:I

    if-eq v4, v3, :cond_1

    goto/16 :goto_1

    :cond_1
    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v4

    sget-object v5, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    if-eqz v4, :cond_2

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v5, p0

    if-eqz p0, :cond_6

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x19717d7222bb3168L    # 4.019694656378775E-186

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p1, v2, v2}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v4

    iget-object v6, p1, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v6, :cond_5

    if-nez v4, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v0, v4}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {v0, p1, p0, v3}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockTaskOverlay(Lcom/android/server/wm/Task;Ljava/lang/String;I)V

    invoke-virtual {v0, p1, p0, v3}, Lcom/android/server/wm/AppLockOverlayController;->removeTaskSnapshot(Lcom/android/server/wm/Task;Ljava/lang/String;I)V

    goto :goto_1

    :cond_4
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v4, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    new-instance v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v0, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object p0, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$1:Ljava/lang/String;

    iput v3, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$2:I

    iput-object v4, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$3:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object v1, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$4:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v5, v2}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;Z)V

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/ActivityRecord;

    if-eqz v1, :cond_6

    invoke-virtual {v0, v1}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/ActivityRecord;)V

    invoke-virtual {v0, p1, p0, v3}, Lcom/android/server/wm/AppLockOverlayController;->removeTaskSnapshot(Lcom/android/server/wm/Task;Ljava/lang/String;I)V

    goto :goto_1

    :cond_5
    :goto_0
    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v5, p0

    if-eqz p0, :cond_6

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, -0x5793a1b97e8ccc1bL    # -5.759760188790009E-114

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_6
    :goto_1
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lcom/android/server/wm/Task;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v4, p1, Lcom/android/server/wm/Task;->mUserId:I

    if-eq v4, v3, :cond_7

    goto :goto_5

    :cond_7
    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->getTopMostActivity()Lcom/android/server/wm/ActivityRecord;

    move-result-object v4

    iget-object v5, p1, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v5, :cond_8

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    move v5, v2

    goto :goto_2

    :cond_8
    move v5, v1

    :goto_2
    if-eqz v4, :cond_9

    invoke-static {v3, v4, p0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    move v4, v2

    goto :goto_3

    :cond_9
    move v4, v1

    :goto_3
    if-nez v5, :cond_a

    if-nez v4, :cond_a

    goto :goto_5

    :cond_a
    iget-object v4, v0, Lcom/android/server/wm/AppLockOverlayController;->mTaskSnapshotController:Lcom/android/server/wm/TaskSnapshotController;

    if-nez v4, :cond_b

    iget-object v4, v0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/wm/WindowManagerService;->mTaskSnapshotController:Lcom/android/server/wm/TaskSnapshotController;

    iput-object v4, v0, Lcom/android/server/wm/AppLockOverlayController;->mTaskSnapshotController:Lcom/android/server/wm/TaskSnapshotController;

    :cond_b
    iget v5, p1, Lcom/android/server/wm/Task;->mTaskId:I

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v6, v1}, Lcom/android/server/wm/TaskSnapshotController;->getSnapshot(III)Landroid/window/TaskSnapshot;

    move-result-object v4

    if-nez v4, :cond_c

    move v5, v2

    goto :goto_4

    :cond_c
    move v5, v1

    :goto_4
    if-nez v5, :cond_f

    invoke-virtual {v4}, Landroid/window/TaskSnapshot;->getTopActivityComponent()Landroid/content/ComponentName;

    move-result-object v4

    if-eqz v4, :cond_d

    invoke-static {v4}, Lcom/android/server/wm/AppLockOverlayController;->isComponentAppLockOverlayActivity(Landroid/content/ComponentName;)Z

    move-result v4

    if-eqz v4, :cond_e

    :cond_d
    move v1, v2

    :cond_e
    move v5, v1

    :cond_f
    if-eqz v5, :cond_10

    invoke-virtual {v0, p1, p0, v3}, Lcom/android/server/wm/AppLockOverlayController;->removeTaskSnapshot(Lcom/android/server/wm/Task;Ljava/lang/String;I)V

    :cond_10
    :goto_5
    return-void

    :pswitch_2
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    iget v2, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v2, v1, :cond_11

    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-virtual {v0, p1}, Lcom/android/server/wm/AppLockOverlayController;->trackKeyguardScopedBypassedActivity(Lcom/android/server/wm/ActivityRecord;)V

    :cond_11
    return-void

    :pswitch_3
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v2, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v2, :cond_12

    iget v2, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v1, v2, :cond_12

    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    invoke-virtual {v0, p1}, Lcom/android/server/wm/AppLockOverlayController;->registerActivity(Lcom/android/server/wm/ActivityRecord;)V

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result p0

    if-eqz p0, :cond_12

    invoke-virtual {v0, p1}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/ActivityRecord;)V

    :cond_12
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
