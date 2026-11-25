.class public final Lcom/android/server/wm/AppLockOverlayController$1;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Lcom/android/server/wm/WindowContainerListener;


# instance fields
.field public synthetic this$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic val$task:Lcom/android/server/wm/Task;


# virtual methods
.method public final onRemoved()V
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$1;->val$task:Lcom/android/server/wm/Task;

    invoke-virtual {v0, p0}, Lcom/android/server/wm/WindowContainer;->unregisterWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$1;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskListeners:Landroid/util/ArrayMap;

    invoke-virtual {p0, v0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final onVisibleRequestedChanged(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$1;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$1;->val$task:Lcom/android/server/wm/Task;

    invoke-virtual {v0, p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->onTaskVisibleRequestedChanged(Lcom/android/server/wm/Task;Z)V

    return-void
.end method
