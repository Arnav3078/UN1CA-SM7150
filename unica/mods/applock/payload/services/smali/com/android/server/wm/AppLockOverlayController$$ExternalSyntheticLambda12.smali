.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Z

.field public synthetic f$2:Ljava/lang/String;

.field public synthetic f$3:Ljava/lang/String;

.field public synthetic f$4:I

.field public synthetic f$5:Lcom/android/server/wm/Task;

.field public synthetic f$6:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public synthetic f$7:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public synthetic f$8:Ljava/util/concurrent/atomic/AtomicBoolean;


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-boolean v2, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$1:Z

    iget-object v3, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$2:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$3:Ljava/lang/String;

    iget v5, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$4:I

    iget-object v6, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$5:Lcom/android/server/wm/Task;

    iget-object v7, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$6:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v8, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$7:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v0, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$8:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v9, p1

    check-cast v9, Lcom/android/server/wm/TaskFragment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v10

    const/4 v11, 0x0

    if-nez v10, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v10, 0x1

    invoke-virtual {v9, v10, v10}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v12

    if-nez v12, :cond_1

    goto/16 :goto_2

    :cond_1
    if-nez v2, :cond_3

    invoke-static {v12}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, v1, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v2, v12}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    move v2, v11

    goto :goto_1

    :cond_3
    :goto_0
    move v2, v10

    :goto_1
    invoke-virtual {v1, v9, v3, v4, v5}, Lcom/android/server/wm/AppLockOverlayController;->evaluateTaskFragmentLockVisibility(Lcom/android/server/wm/TaskFragment;Ljava/lang/String;Ljava/lang/String;I)Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    move-result-object v1

    sget-object v4, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->NONE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    if-eq v1, v4, :cond_4

    sget-object v4, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v4}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v4

    sget-object v5, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v4, v5, v4

    if-eqz v4, :cond_4

    iget v4, v6, Lcom/android/server/wm/Task;->mTaskId:I

    int-to-long v4, v4

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    sget-object v12, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v4, v6, v3, v9, v5}, [Ljava/lang/Object;

    move-result-object v17

    const-wide v13, -0x453b87ef0d39c4b9L    # -1.322778678225447E-25

    const-wide/16 v15, 0x301

    invoke-static/range {v12 .. v17}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_4
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eq v3, v10, :cond_8

    const/4 v4, 0x2

    if-eq v3, v4, :cond_8

    const/4 v1, 0x3

    if-eq v3, v1, :cond_6

    const/4 v0, 0x4

    if-eq v3, v0, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return v11

    :cond_6
    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-nez v2, :cond_7

    invoke-virtual {v8, v11}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_7
    invoke-virtual {v0, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return v11

    :cond_8
    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz v2, :cond_9

    goto :goto_2

    :cond_9
    invoke-virtual {v8, v11}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object v0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->VISIBLE_SENSITIVE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    if-ne v1, v0, :cond_a

    return v10

    :cond_a
    :goto_2
    return v11
.end method
