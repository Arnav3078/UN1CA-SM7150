.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;

.field public synthetic f$1:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

.field public synthetic f$2:Ljava/lang/String;

.field public synthetic f$3:I

.field public synthetic f$4:Z


# virtual methods
.method public final run()V
    .locals 7

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$1:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iget v3, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$3:I

    iget-boolean p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$4:Z

    sget-boolean v4, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    const-string/jumbo v4, "dispatchPackageLockedStateChanged: "

    if-eqz v1, :cond_2

    iget-object v5, v0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v5

    :try_start_0
    invoke-virtual {v0, v3, v2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v6

    if-eq v6, v1, :cond_1

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockLocalService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " (user "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ") left its group before locked="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, " was delivered, skipping"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v5

    return-void

    :cond_1
    monitor-exit v5

    goto :goto_2

    :goto_1
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_2
    :goto_2
    invoke-virtual {v0, v3, v2, p0}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChangedForRemoteListeners(ILjava/lang/String;Z)V

    return-void
.end method
