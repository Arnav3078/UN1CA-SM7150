.class public final Lcom/android/server/wm/AppLockOverlayController$4;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Lcom/android/server/wm/WindowContainerListener;


# instance fields
.field public synthetic this$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic val$activity:Lcom/android/server/wm/ActivityRecord;

.field public synthetic val$isOverlay:Z


# virtual methods
.method public final onRemoved()V
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$4;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$4;->val$activity:Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v0, p0}, Lcom/android/server/wm/AppLockOverlayController;->onActivityRemoved(Lcom/android/server/wm/ActivityRecord;)V

    return-void
.end method

.method public final onVisibleRequestedChanged(Z)V
    .locals 11

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$4;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController$4;->val$activity:Lcom/android/server/wm/ActivityRecord;

    sget-object v2, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v3

    sget-object v4, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v3, v4, v3

    if-eqz v3, :cond_0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    sget-object v5, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    filled-new-array {v3, v6}, [Ljava/lang/Object;

    move-result-object v10

    const-wide v6, -0x7a869ee1be64c615L    # -2.730768456436219E-282

    const-wide/16 v8, 0xc

    invoke-static/range {v5 .. v10}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    iget-boolean p1, p0, Lcom/android/server/wm/AppLockOverlayController$4;->val$isOverlay:Z

    if-eqz p1, :cond_3

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p1

    aget-boolean p1, v4, p1

    if-eqz p1, :cond_2

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v5, 0x0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v7

    const-wide v3, 0x523831a9c8a33207L    # 1.2032236862016531E88

    invoke-static/range {v2 .. v7}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_2
    iget-object p1, v0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object p1, p1, Lcom/android/server/wm/ActivityTaskManagerService;->mH:Lcom/android/server/wm/ActivityTaskManagerService$H;

    new-instance v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;-><init>(B)V

    iput-object p0, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$0:Ljava/lang/Object;

    iput-object v1, v0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda24;->f$1:Lcom/android/server/wm/WindowContainer;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_3
    invoke-virtual {v0, v1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityLockedByAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    if-eqz p0, :cond_5

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v4, p0

    if-eqz p0, :cond_4

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v2, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v5, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v7

    const-wide v3, 0x5e1627d216ed31b1L    # 1.7291013603793758E145

    invoke-static/range {v2 .. v7}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_4
    invoke-virtual {v0, v1}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/ActivityRecord;)V

    :cond_5
    :goto_0
    return-void
.end method
