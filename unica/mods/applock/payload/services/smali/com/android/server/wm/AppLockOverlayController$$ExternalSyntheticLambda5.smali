.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Lcom/android/server/wm/ActivityRecord;


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 7

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda5;->f$1:Lcom/android/server/wm/ActivityRecord;

    check-cast p1, Lcom/android/server/wm/Task;

    sget-object p1, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p1}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p1

    sget-object v1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean p1, v1, p1

    if-eqz p1, :cond_0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v4, 0x0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v6

    const-wide v2, -0x604f896aa558cc50L

    invoke-static/range {v1 .. v6}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    iget-boolean p1, p0, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez p1, :cond_1

    const-string/jumbo p1, "app-lock-overlay-failed"

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/android/server/wm/ActivityRecord;->finishIfPossible(Ljava/lang/String;Z)I

    :cond_1
    iget-object p1, v0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {p1, p0}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    iget-object p1, v0, Lcom/android/server/wm/AppLockOverlayController;->mWaitOverlayTargetConditions:Landroid/util/ArrayMap;

    invoke-virtual {p1, p0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/wm/Transition$ReadyCondition;

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lcom/android/server/wm/Transition$ReadyCondition;->meet()V

    :cond_2
    return-void
.end method
