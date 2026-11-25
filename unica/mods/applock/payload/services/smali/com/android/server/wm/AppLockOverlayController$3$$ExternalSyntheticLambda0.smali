.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController$3;

.field public synthetic f$1:Ljava/lang/ref/WeakReference;

.field public synthetic f$2:Lcom/android/server/wm/DisplayContent;

.field public synthetic f$3:Lcom/android/server/wm/Task;

.field public synthetic f$4:I

.field public synthetic f$5:Ljava/lang/String;

.field public synthetic f$6:Lcom/android/server/wm/ActivityRecord;


# virtual methods
.method public final run()V
    .locals 9

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/wm/AppLockOverlayController$3;

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$1:Ljava/lang/ref/WeakReference;

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$2:Lcom/android/server/wm/DisplayContent;

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$3:Lcom/android/server/wm/Task;

    iget v4, p0, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$4:I

    iget-object v5, p0, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$6:Lcom/android/server/wm/ActivityRecord;

    iget-object v6, v0, Lcom/android/server/wm/AppLockOverlayController$3;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v6, v6, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v6, v6, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v6

    :try_start_0
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/ActivityRecord;

    if-eqz v1, :cond_0

    iget-object v7, v1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_0
    const/4 v7, 0x0

    :goto_0
    iget-object v2, v2, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;

    iget-object v8, v0, Lcom/android/server/wm/AppLockOverlayController$3;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {v8, v4, v1, v3}, Lcom/android/server/wm/AppLockOverlayController;->canRestoreSplitAppLockFocusLocked(ILcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)Z

    move-result v8

    if-eqz v8, :cond_2

    iget-object v8, v0, Lcom/android/server/wm/AppLockOverlayController$3;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v8, v8, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v8, v4, v5}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    if-eqz v2, :cond_1

    if-eq v2, p0, :cond_1

    iget-object p0, v2, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eq p0, v3, :cond_1

    goto :goto_1

    :cond_1
    iget-object p0, v0, Lcom/android/server/wm/AppLockOverlayController$3;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget v0, v7, Lcom/android/server/wm/Task;->mTaskId:I

    invoke-virtual {p0, v0, v1}, Lcom/android/server/wm/ActivityTaskManagerService;->setFocusedTask(ILcom/android/server/wm/ActivityRecord;)V

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :cond_2
    :goto_1
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :goto_2
    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw p0
.end method
