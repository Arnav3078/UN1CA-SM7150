.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Landroid/content/Intent;

.field public synthetic f$2:I

.field public synthetic f$3:I

.field public synthetic f$4:I

.field public synthetic f$5:Ljava/util/function/Consumer;

.field public synthetic f$6:Ljava/util/function/Consumer;


# virtual methods
.method public final run()V
    .locals 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v2, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$1:Landroid/content/Intent;

    iget v3, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$2:I

    iget v4, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$3:I

    iget v5, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$4:I

    iget-object v6, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$5:Ljava/util/function/Consumer;

    iget-object v0, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda0;->f$6:Ljava/util/function/Consumer;

    const-string/jumbo v7, "requestRef="

    const-string/jumbo v8, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-class v9, Landroid/app/AppLockInternal;

    invoke-static {v9}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/AppLockInternal;

    const/4 v10, 0x0

    if-eqz v8, :cond_0

    if-eqz v9, :cond_0

    invoke-interface {v9, v8, v3}, Landroid/app/AppLockInternal;->isPackageLocked(Ljava/lang/String;I)Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    goto :goto_0

    :cond_0
    move-object v9, v10

    :goto_0
    const-string/jumbo v11, "OVERLAY_RUN"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "requestRef="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, " locked="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v4, v3, v11, v8, v12}, Lcom/android/server/wm/AppLockOverlayController;->logAppLockEvent(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v11, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v9

    iget-object v11, v1, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    const/4 v12, 0x0

    const/4 v13, 0x2

    if-eqz v9, :cond_2

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v11

    :try_start_0
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v1, v4, v3, v8}, Lcom/android/server/wm/AppLockOverlayController;->removePendingAppLockActivityOverlayTargetsLocked(IILjava/lang/String;)V

    invoke-virtual {v1}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v0

    invoke-virtual {v0, v4, v13, v10, v12}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/android/server/wm/TaskFragment;->mResumedActivity:Lcom/android/server/wm/ActivityRecord;

    if-nez v0, :cond_1

    invoke-virtual {v1}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/wm/RootWindowContainer;->resumeFocusedTasksTopActivities()V

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :cond_1
    :goto_1
    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :goto_2
    :try_start_1
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw v0

    :cond_2
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v11

    :try_start_2
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v1, v4, v3, v8}, Lcom/android/server/wm/AppLockOverlayController;->abortPendingAppLockOverlayLaunchIfNeededLocked(IILjava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :catchall_1
    move-exception v0

    goto/16 :goto_c

    :cond_3
    :try_start_3
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    sget-boolean v8, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz v8, :cond_6

    iget-object v8, v1, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v8, v8, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v8

    :try_start_4
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v1}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v9

    invoke-virtual {v9, v4, v13, v10, v12}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v9

    const-string/jumbo v11, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v2, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v9, :cond_5

    if-eqz v11, :cond_5

    iget-object v14, v1, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v14, v14, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz v14, :cond_4

    invoke-virtual {v14, v9, v11, v3}, Lcom/android/server/wm/AppLockController;->isAppLockFolderBypassedForTaskLocked(Lcom/android/server/wm/Task;Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_4

    goto :goto_3

    :catchall_2
    move-exception v0

    goto :goto_4

    :cond_4
    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    goto :goto_5

    :cond_5
    :goto_3
    :try_start_5
    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :goto_4
    :try_start_6
    monitor-exit v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw v0

    :cond_6
    :goto_5
    iget-object v8, v1, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v8, v8, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v8

    :try_start_7
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v1}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v9

    invoke-virtual {v9, v4, v13, v10, v12}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v9

    if-eqz v9, :cond_7

    new-instance v11, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda20;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v9, v11}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    :cond_7
    invoke-virtual {v1}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v9

    invoke-virtual {v9, v4, v13, v10, v12}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v9

    if-eqz v9, :cond_8

    invoke-virtual {v9}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v11

    goto :goto_6

    :catchall_3
    move-exception v0

    goto/16 :goto_b

    :cond_8
    move-object v11, v10

    :goto_6
    if-eqz v9, :cond_9

    invoke-virtual {v9}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v9

    if-eqz v9, :cond_9

    if-eqz v11, :cond_9

    iget-object v9, v11, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;

    goto :goto_7

    :cond_9
    move-object v9, v10

    :goto_7
    monitor-exit v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    invoke-virtual {v1, v4, v3, v2}, Lcom/android/server/wm/AppLockOverlayController;->startLockedAppActivityAsUserUncheckedAsync(IILandroid/content/Intent;)I

    move-result v8

    iget-object v11, v1, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v11, v11, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v11

    :try_start_8
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v1}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v14

    invoke-virtual {v14, v4, v13, v10, v12}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v13

    invoke-static {v8}, Landroid/app/ActivityManager;->isStartResultSuccessful(I)Z

    move-result v14

    if-nez v14, :cond_a

    const-string/jumbo v14, "OVERLAY_FAILED"

    const-string/jumbo v15, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v2, v15}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " result="

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v3, v14, v2, v5}, Lcom/android/server/wm/AppLockOverlayController;->logAppLockEvent(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    :catchall_4
    move-exception v0

    goto/16 :goto_a

    :cond_a
    :goto_8
    if-nez v13, :cond_d

    sget-object v0, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    sget-object v1, Lcom/android/internal/protolog/common/LogLevel;->WARN:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v1}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v1

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_b

    int-to-long v0, v4

    sget-object v12, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v17

    const-wide v13, 0x557119e87dff3158L    # 3.830233129385525E103

    const-wide/16 v15, 0x1

    invoke-static/range {v12 .. v17}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->w(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_b
    if-eqz v6, :cond_c

    invoke-interface {v6, v10}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    :cond_c
    monitor-exit v11
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :cond_d
    :try_start_9
    invoke-static {v8}, Landroid/app/ActivityManager;->isStartResultSuccessful(I)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_f

    if-eqz v0, :cond_e

    invoke-interface {v0, v13}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    :cond_e
    invoke-virtual {v13}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {v13}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {v13, v3, v3}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-static {v0}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-virtual {v1, v0, v9, v13}, Lcom/android/server/wm/AppLockOverlayController;->requestFocusForVisibleSplitAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V

    goto :goto_9

    :cond_f
    if-eqz v6, :cond_10

    invoke-interface {v6, v13}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_9

    :cond_10
    sget-object v0, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    sget-object v2, Lcom/android/internal/protolog/common/LogLevel;->ERROR:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v2

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_11

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, -0x71194158c5a2c814L

    const-wide/16 v7, 0x0

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->e(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_11
    iget-object v0, v1, Lcom/android/server/wm/AppLockOverlayController;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

    if-nez v0, :cond_12

    iget-object v0, v1, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

    iput-object v0, v1, Lcom/android/server/wm/AppLockOverlayController;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

    :cond_12
    const-string v1, "Could not add App Lock task overlay"

    invoke-virtual {v0, v13, v12, v3, v1}, Lcom/android/server/wm/ActivityTaskSupervisor;->removeTask(Lcom/android/server/wm/Task;ZZLjava/lang/String;)V

    :cond_13
    :goto_9
    monitor-exit v11
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :goto_a
    :try_start_a
    monitor-exit v11
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw v0

    :goto_b
    :try_start_b
    monitor-exit v8
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw v0

    :goto_c
    :try_start_c
    monitor-exit v11
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw v0
.end method
