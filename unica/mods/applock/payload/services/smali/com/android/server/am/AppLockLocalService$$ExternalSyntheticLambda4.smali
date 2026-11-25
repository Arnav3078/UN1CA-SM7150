.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:I

.field public synthetic f$3:Z

.field public synthetic f$4:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

.field public synthetic f$5:Ljava/util/ArrayList;


# virtual methods
.method public final run()V
    .locals 11

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$1:Ljava/lang/String;

    iget v1, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$2:I

    iget-boolean v5, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$3:Z

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$4:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$5:Ljava/util/ArrayList;

    const-string/jumbo p0, "dispatchPackageLockedStateChanged: "

    sget-boolean v6, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v6, :cond_0

    const-string v7, "AppLockLocalService"

    const-string/jumbo v8, "dispatchPackageLockedStateChanged\'s runnable: Notifying listener onPackageLockedStateChanged for "

    const-string v9, " (user "

    const-string v10, ") locked="

    invoke-static {v1, v8, v3, v9, v10}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v7, v8, v5}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    :cond_0
    if-eqz v2, :cond_3

    iget-object v7, v0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v7

    :try_start_0
    invoke-virtual {v0, v1, v3}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v8

    if-eq v8, v2, :cond_2

    if-eqz v6, :cond_1

    const-string v0, "AppLockLocalService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " (user "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ") left its group before locked="

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, " was delivered, skipping"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_1
    :goto_0
    monitor-exit v7

    return-void

    :cond_2
    monitor-exit v7

    goto :goto_2

    :goto_1
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    if-eqz v5, :cond_4

    invoke-virtual {v0, v1, v3, v5}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChangedForRemoteListeners(ILjava/lang/String;Z)V

    :cond_4
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->notifyLocalListenersIfLockedStateIsUpToDate(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)V

    if-nez v5, :cond_5

    invoke-virtual {v0, v1, v3, v5}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChangedForRemoteListeners(ILjava/lang/String;Z)V

    :cond_5
    return-void
.end method
