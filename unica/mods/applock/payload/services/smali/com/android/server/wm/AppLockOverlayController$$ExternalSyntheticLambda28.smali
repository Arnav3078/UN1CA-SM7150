.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:I

.field public synthetic f$3:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public synthetic f$4:Ljava/util/concurrent/atomic/AtomicReference;


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 6

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$1:Ljava/lang/String;

    iget v2, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$2:I

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$3:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda28;->f$4:Ljava/util/concurrent/atomic/AtomicReference;

    move-object v5, p1

    check-cast v5, Lcom/android/server/wm/ActivityRecord;

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/wm/AppLockOverlayController;->lambda$lockActivitiesTasksForAppLock$1(Ljava/lang/String;ILjava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicReference;Lcom/android/server/wm/ActivityRecord;)V

    return-void
.end method
