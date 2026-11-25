.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Ljava/lang/Object;

.field public synthetic f$1:Lcom/android/server/wm/WindowContainer;


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-byte v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->$r8$classId:B

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/wm/AppLockOverlayController$4;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$1:Lcom/android/server/wm/WindowContainer;

    check-cast p0, Lcom/android/server/wm/ActivityRecord;

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController$4;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, v1, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    invoke-virtual {p0}, Lcom/android/server/wm/WindowContainer;->isAttached()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, v0, Lcom/android/server/wm/AppLockOverlayController$4;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {v0, p0}, Lcom/android/server/wm/AppLockOverlayController;->finishActivityOverlayIfOrphan(Lcom/android/server/wm/ActivityRecord;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    return-void

    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw p0

    :pswitch_0
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/wm/AppLockOverlayController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$1:Lcom/android/server/wm/WindowContainer;

    check-cast p0, Lcom/android/server/wm/Task;

    invoke-virtual {p0}, Lcom/android/server/wm/TaskFragment;->isAttached()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/android/server/wm/AppLockOverlayController;->onTaskVisibleRequestedChanged(Lcom/android/server/wm/Task;Z)V

    :cond_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
