.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Ljava/lang/String;

.field public synthetic f$1:Z

.field public synthetic f$2:Lcom/android/server/wm/Task;

.field public synthetic f$3:I

.field public synthetic f$4:Ljava/util/ArrayList;


# virtual methods
.method public final run()V
    .locals 14

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$0:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$1:Z

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$2:Lcom/android/server/wm/Task;

    iget v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$3:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda16;->f$4:Ljava/util/ArrayList;

    const-class v4, Landroid/app/AppLockInternal;

    invoke-static {v4}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/AppLockInternal;

    sget-object v5, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    if-nez v4, :cond_1

    sget-object v7, Lcom/android/internal/protolog/common/LogLevel;->WTF:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v7}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v5, p0

    if-eqz p0, :cond_0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v8, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v13

    const-wide/16 v11, 0x0

    invoke-static {}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->getSingleInstance()Lcom/android/internal/protolog/common/IProtoLog;

    move-result-object v6

    const-wide v9, 0x40dc6811920f3082L    # 29088.274539754268

    invoke-interface/range {v6 .. v13}, Lcom/android/internal/protolog/common/IProtoLog;->log(Lcom/android/internal/protolog/common/LogLevel;Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    sget-object v6, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v6}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v6

    aget-boolean v5, v5, v6

    if-eqz v5, :cond_2

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v5, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v8, 0x0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v10

    const-wide v6, -0xa5a36c10cc5c991L    # -5.233908430504944E258

    invoke-static/range {v5 .. v10}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_2
    if-nez v1, :cond_3

    iget v0, v2, Lcom/android/server/wm/Task;->mTaskId:I

    const/4 v2, 0x0

    const-string v5, ""

    const-string/jumbo v6, "TASK_HIDDEN_DISPATCH"

    invoke-static {v0, v3, v6, v2, v5}, Lcom/android/server/wm/AppLockOverlayController;->logAppLockEvent(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    invoke-interface {v4, p0, v3, v1}, Landroid/app/AppLockInternal;->handleTaskVisibilityChanged(Ljava/util/List;IZ)V

    return-void
.end method
