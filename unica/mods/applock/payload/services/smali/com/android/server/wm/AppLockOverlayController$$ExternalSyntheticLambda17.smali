.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:I

.field public synthetic f$2:Lcom/android/server/wm/ActivityRecord;

.field public synthetic f$3:Ljava/lang/String;

.field public synthetic f$4:I

.field public synthetic f$5:Lcom/android/server/wm/ActivityRecord;


# virtual methods
.method public final run()V
    .locals 12

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$1:I

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$2:Lcom/android/server/wm/ActivityRecord;

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$3:Ljava/lang/String;

    iget v4, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$4:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda17;->f$5:Lcom/android/server/wm/ActivityRecord;

    iget-object v5, v0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v5

    :try_start_0
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v0}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v6

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v6, v1, v7, v9, v8}, Lcom/android/server/wm/RootWindowContainer;->anyTaskForId(IILandroid/app/ActivityOptions;Z)Lcom/android/server/wm/Task;

    move-result-object v6

    if-eqz v6, :cond_e

    invoke-virtual {v6}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v7

    if-eqz v7, :cond_e

    invoke-virtual {v6}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v7

    if-nez v7, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 v7, 0x1

    invoke-virtual {v6, v7, v7}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v7

    if-ne v7, v2, :cond_d

    invoke-static {v4, v7, v3}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayForPackageLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d

    iget-object v8, v0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v8, v4, v3}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    goto/16 :goto_2

    :cond_1
    invoke-virtual {v6}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v8

    if-nez v8, :cond_2

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :catchall_0
    move-exception p0

    goto/16 :goto_4

    :cond_2
    :try_start_1
    invoke-virtual {v8}, Lcom/android/server/wm/DisplayContent;->getFocusedRootTask()Lcom/android/server/wm/Task;

    move-result-object v10

    if-eqz v10, :cond_3

    invoke-virtual {v6}, Lcom/android/server/wm/TaskFragment;->getRootTask()Lcom/android/server/wm/Task;

    move-result-object v11

    if-eq v10, v11, :cond_3

    invoke-virtual {v10}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeHomeOrRecents()Z

    move-result v10

    if-nez v10, :cond_3

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :cond_3
    :try_start_2
    invoke-virtual {v0, v8}, Lcom/android/server/wm/AppLockOverlayController;->isSplitAppLockInteractionBusyLocked(Lcom/android/server/wm/DisplayContent;)Z

    move-result v10

    if-eqz v10, :cond_5

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v1, v2}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v0, v2}, Lcom/android/server/wm/AppLockOverlayController;->registerPendingSplitAppLockActivityLocked(Lcom/android/server/wm/ActivityRecord;)V

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    new-instance v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda29;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda29;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object v6, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda29;->f$1:Lcom/android/server/wm/Task;

    iput-object v2, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda29;->f$2:Lcom/android/server/wm/ActivityRecord;

    iput-object p0, v3, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda29;->f$3:Lcom/android/server/wm/ActivityRecord;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v2, v3}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :cond_5
    if-eqz p0, :cond_6

    :try_start_3
    iget-object v2, p0, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    goto :goto_0

    :cond_6
    move-object v2, v9

    :goto_0
    if-eqz v2, :cond_b

    iget-boolean v10, p0, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v10, :cond_b

    invoke-virtual {v2}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v10

    if-nez v10, :cond_7

    goto :goto_1

    :cond_7
    if-ne v2, v6, :cond_8

    goto :goto_1

    :cond_8
    invoke-virtual {v0, v4, p0, v6}, Lcom/android/server/wm/AppLockOverlayController;->canRestoreSplitAppLockFocusLocked(ILcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)Z

    move-result v2

    if-nez v2, :cond_9

    iget-object p0, v8, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;

    :cond_9
    invoke-virtual {v0, v4, p0, v6}, Lcom/android/server/wm/AppLockOverlayController;->canRestoreSplitAppLockFocusLocked(ILcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)Z

    move-result v2

    if-nez v2, :cond_a

    invoke-virtual {v6}, Lcom/android/server/wm/TaskFragment;->getRootTask()Lcom/android/server/wm/Task;

    move-result-object p0

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object v6, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;->f$1:Lcom/android/server/wm/Task;

    iput v4, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;->f$2:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, v2}, Lcom/android/server/wm/WindowContainer;->getActivity(Ljava/util/function/Predicate;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v9

    goto :goto_1

    :cond_a
    move-object v9, p0

    :cond_b
    :goto_1
    if-eqz v9, :cond_c

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v9}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$3;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v7, v2, Lcom/android/server/wm/AppLockOverlayController$3;->val$currentTop:Lcom/android/server/wm/ActivityRecord;

    iput-object p0, v2, Lcom/android/server/wm/AppLockOverlayController$3;->val$restoreFocusRef:Ljava/lang/ref/WeakReference;

    iput-object v8, v2, Lcom/android/server/wm/AppLockOverlayController$3;->val$display:Lcom/android/server/wm/DisplayContent;

    iput-object v6, v2, Lcom/android/server/wm/AppLockOverlayController$3;->val$currentTask:Lcom/android/server/wm/Task;

    iput v4, v2, Lcom/android/server/wm/AppLockOverlayController$3;->val$userId:I

    iput-object v3, v2, Lcom/android/server/wm/AppLockOverlayController$3;->val$packageName:Ljava/lang/String;

    iput-object v0, v2, Lcom/android/server/wm/AppLockOverlayController$3;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v7, v2}, Lcom/android/server/wm/WindowContainer;->registerWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    :cond_c
    iget-object p0, v0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    invoke-virtual {p0, v1, v7}, Lcom/android/server/wm/ActivityTaskManagerService;->setFocusedTask(ILcom/android/server/wm/ActivityRecord;)V

    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :cond_d
    :goto_2
    :try_start_4
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :cond_e
    :goto_3
    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :goto_4
    :try_start_6
    monitor-exit v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw p0
.end method
