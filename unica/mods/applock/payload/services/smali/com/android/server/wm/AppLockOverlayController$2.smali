.class public final Lcom/android/server/wm/AppLockOverlayController$2;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Lcom/android/server/wm/WindowContainerListener;


# instance fields
.field public synthetic this$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic val$activity:Lcom/android/server/wm/ActivityRecord;


# virtual methods
.method public final onRemoved()V
    .locals 2

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$2;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockAuthentication:Landroid/util/ArraySet;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$2;->val$activity:Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v1, p0}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mPendingSplitAppLockFocus:Landroid/util/ArrayMap;

    invoke-virtual {v1, p0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, p0}, Lcom/android/server/wm/AppLockOverlayController;->unregisterPendingSplitAppLockActivityIfIdleLocked(Lcom/android/server/wm/ActivityRecord;)V

    return-void
.end method
