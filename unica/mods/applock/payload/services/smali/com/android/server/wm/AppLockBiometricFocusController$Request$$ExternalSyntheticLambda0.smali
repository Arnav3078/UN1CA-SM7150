.class public final synthetic Lcom/android/server/wm/AppLockBiometricFocusController$Request$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockBiometricFocusController$Request;


# virtual methods
.method public final run()V
    .locals 3

    iget-object p0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    iget-object v0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->this$0:Lcom/android/server/wm/AppLockBiometricFocusController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockBiometricFocusController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    iget-object v1, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->this$0:Lcom/android/server/wm/AppLockBiometricFocusController;

    iget-object v2, v1, Lcom/android/server/wm/AppLockBiometricFocusController;->mRequest:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    if-eq v2, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mQueued:Z

    invoke-virtual {v1, p0}, Lcom/android/server/wm/AppLockBiometricFocusController;->updateRequestStateLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lcom/android/server/wm/AppLockBiometricFocusController;->isPromptReadyLocked(Lcom/android/server/wm/AppLockBiometricFocusController$Request;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    iget-object p0, p0, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mPromptDisplay:Lcom/android/server/wm/DisplayContent;

    iget p0, p0, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    invoke-virtual {v1}, Lcom/android/server/wm/AppLockBiometricFocusController;->clearRequestLocked()V

    iget-object v1, v1, Lcom/android/server/wm/AppLockBiometricFocusController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v1, p0}, Lcom/android/server/wm/WindowManagerService;->moveDisplayToTopInternal(I)Z

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw p0
.end method
