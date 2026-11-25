.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Lcom/android/server/wm/Task;

.field public synthetic f$2:I


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 2

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;->f$1:Lcom/android/server/wm/Task;

    iget p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda30;->f$2:I

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v0, p0, p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->canRestoreSplitAppLockFocusLocked(ILcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)Z

    move-result p0

    return p0
.end method
