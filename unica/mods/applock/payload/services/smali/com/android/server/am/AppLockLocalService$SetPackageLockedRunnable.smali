.class public final Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public mPackageName:Ljava/lang/String;

.field public mService:Lcom/android/server/am/AppLockLocalService;

.field public mState:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

.field public mUserId:I


# virtual methods
.method public final run()V
    .locals 13

    const-string/jumbo v0, "jobRef="

    sget-boolean v1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v2, "AppLockLocalService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "SetPackageLockedRunnable for "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " and user: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-static {v3, v4, v2}, Lcom/android/server/HeapdumpWatcher$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    :cond_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v2, v2, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mState:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v7, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-virtual {v3, v7, v6}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v3

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mState:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    if-eq v3, v6, :cond_3

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget v7, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-virtual {v3, v6, v7}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mState:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    if-ne v1, p0, :cond_1

    iput-object v5, v0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_5

    :cond_1
    :goto_0
    monitor-exit v2

    return-void

    :cond_2
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    :cond_3
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v7, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-virtual {v3, v7, v6}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v3

    if-nez v3, :cond_5

    if-eqz v1, :cond_4

    const-string p0, "AppLockLocalService"

    const-string/jumbo v0, "SetPackageLockedRunnable: package has App Lock disabled, returning"

    invoke-static {p0, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    monitor-exit v2

    return-void

    :cond_5
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v7, v3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {v6, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    if-eqz v1, :cond_6

    const-string p0, "AppLockLocalService"

    const-string/jumbo v0, "SetPackageLockedRunnable: already sent a locked update, updating state and returning"

    invoke-static {p0, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    iput-object v5, v3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    monitor-exit v2

    return-void

    :cond_7
    iget-object v3, v3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    if-eq v3, p0, :cond_8

    const-string p0, "AppLockLocalService"

    const-string/jumbo v0, "SetPackageLockedRunnable: job was canceled or replaced, returning"

    invoke-static {p0, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2

    return-void

    :cond_8
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-virtual {v2, v3, v6, v4}, Lcom/android/server/am/AppLockLocalService;->isPackageLocked(Ljava/lang/String;IZ)Z

    move-result v2

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v3, v3, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_1
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v4, v4, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    iget v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-virtual {v4, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/ArrayMap;

    if-eqz v4, :cond_9

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    invoke-virtual {v4, v6}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object p0, v0

    goto/16 :goto_4

    :cond_9
    move-object v4, v5

    :goto_1
    if-eqz v4, :cond_12

    iget-object v4, v4, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    if-eq v4, p0, :cond_a

    goto/16 :goto_3

    :cond_a
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v7, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-virtual {v4, v7, v6}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v4

    if-nez v4, :cond_b

    monitor-exit v3

    return-void

    :cond_b
    if-nez v2, :cond_d

    if-eqz v1, :cond_c

    const-string p0, "AppLockLocalService"

    const-string/jumbo v0, "SetPackageLockedRunnable: package is no longer locked, updating state and returning"

    invoke-static {p0, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_c
    iput-object v5, v4, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    monitor-exit v3

    return-void

    :cond_d
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    const/4 v7, 0x1

    invoke-virtual {v2, v4, v6, v7}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v2

    if-nez v2, :cond_e

    monitor-exit v3

    return-void

    :cond_e
    const-string v2, "LOCK_JOB_COMMIT"

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v2, v4, v0}, Lcom/android/server/am/AppLockLocalService;->logAppLockEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v7

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mState:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v4, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    invoke-virtual {v0, v4, v2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v5

    invoke-virtual {v0, v5, v4}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_f
    move-object v8, v5

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    if-eqz v8, :cond_10

    iget-object v9, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mState:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    iget v10, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    const/4 v11, 0x1

    invoke-virtual/range {v6 .. v11}, Lcom/android/server/am/AppLockLocalService;->dispatchAppLockGroupLockedStateChanged(Ljava/util/ArrayList;Ljava/util/List;Lcom/android/server/am/AppLockLocalService$AppLockLockedState;IZ)V

    goto :goto_2

    :cond_10
    iget-object v8, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iget v9, p0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v10, 0x1

    invoke-virtual/range {v6 .. v12}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    :goto_2
    if-eqz v1, :cond_11

    const-string p0, "AppLockLocalService"

    const-string/jumbo v0, "SetPackageLockedRunnable: completed"

    invoke-static {p0, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_11
    return-void

    :cond_12
    :goto_3
    :try_start_2
    monitor-exit v3

    return-void

    :goto_4
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0

    :goto_5
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p0
.end method
