.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Ljava/lang/String;

.field public synthetic f$1:Z

.field public synthetic f$2:Ljava/util/ArrayList;

.field public synthetic f$3:I


# virtual methods
.method public final run()V
    .locals 10

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$0:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$1:Z

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$2:Ljava/util/ArrayList;

    iget p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$3:I

    const-class v3, Landroid/app/AppLockInternal;

    invoke-static {v3}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/AppLockInternal;

    if-nez v3, :cond_0

    return-void

    :cond_0
    sget-object v4, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v4}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v4

    sget-object v5, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean v4, v5, v4

    if-eqz v4, :cond_1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v0, v5}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, 0x23cf59ba613e33dcL

    const-wide/16 v7, 0xc

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_1
    invoke-interface {v3, v2, p0, v1}, Landroid/app/AppLockInternal;->handleTaskPinnedStateChanged(Ljava/util/List;IZ)V

    return-void
.end method
