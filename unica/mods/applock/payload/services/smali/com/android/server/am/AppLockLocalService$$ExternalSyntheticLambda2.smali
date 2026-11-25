.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Ljava/lang/Object;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    iget-byte v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->$r8$classId:B

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iget v4, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$2:I

    sget-boolean p0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz p0, :cond_0

    const-string p0, "AppLockLocalService"

    const-string/jumbo v1, "updateMapAndListenersPackageNoLongerAppLockEnabled\'s runnable for "

    invoke-static {v1, v3, p0}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, v4, v3}, Lcom/android/server/am/AppLockLocalService;->clearAllCallStatesForPackageLocked(ILjava/lang/String;)V

    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    if-eqz p0, :cond_4

    invoke-virtual {p0, v3}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    const/4 v6, 0x1

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/android/server/am/AppLockLocalService;->detachAppLockGroupMemberLocked(Ljava/lang/String;ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Z)Z

    move-result v2

    iget-object v5, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v5, v4, v3}, Lcom/android/server/am/AppLockLocalService;->removeAppLockRecentsDeferralsLocked(ILjava/lang/String;)V

    invoke-virtual {p0, v3}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_2

    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, v4}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_3

    :cond_2
    :goto_0
    if-nez v2, :cond_3

    monitor-exit v1

    goto :goto_2

    :cond_3
    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v7}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    goto :goto_2

    :cond_4
    :goto_1
    :try_start_1
    monitor-exit v1

    :goto_2
    return-void

    :goto_3
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :pswitch_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/am/AppLockLocalService;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iget p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$2:I

    sget-boolean v2, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    invoke-static {v1}, Ljava/util/List;->of(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Lcom/android/server/am/AppLockLocalService;->handleTaskVisibilityChanged(Ljava/util/List;IZ)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
