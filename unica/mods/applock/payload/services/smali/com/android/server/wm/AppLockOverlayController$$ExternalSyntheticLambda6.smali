.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-byte v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;->$r8$classId:B

    const/4 v1, 0x0

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    packed-switch v0, :pswitch_data_0

    iput-boolean v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockTransitionValidatorPending:Z

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->schedulePendingSplitAppLockAuthenticationLocked()V

    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    iput-boolean v1, p0, Lcom/android/server/wm/AppLockOverlayController;->mSplitAppLockCheckPosted:Z

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->checkPendingSplitAppLockAuthenticationLocked()V

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

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
