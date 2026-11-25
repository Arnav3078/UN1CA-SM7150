.class public final Lcom/android/server/am/AppLockAmHelpers;
.super Ljava/lang/Object;


# direct methods
.method public static initAppLockLocalService(Lcom/android/server/am/ActivityManagerService;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/ActivityManagerService;->mCurResumedAppLock:Ljava/lang/Object;

    new-instance v0, Lcom/android/server/am/AppLockLocalService;

    invoke-direct {v0, p0}, Lcom/android/server/am/AppLockLocalService;-><init>(Lcom/android/server/am/ActivityManagerService;)V

    iput-object v0, p0, Lcom/android/server/am/ActivityManagerService;->mAppLockLocalService:Lcom/android/server/am/AppLockLocalService;

    return-void
.end method

.method public static onAmsBootPhase500(Lcom/android/server/am/ActivityManagerService;)V
    .locals 5

    if-nez p0, :cond_0

    return-void

    :cond_0
    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService;->mAppLockLocalService:Lcom/android/server/am/AppLockLocalService;

    if-nez p0, :cond_1

    return-void

    :cond_1
    const-string v0, "AppLockLocalService.systemServicesReady"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    new-instance v0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v1}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/am/AppLockLocalService$SettingsObserver;-><init>(Lcom/android/server/am/AppLockLocalService;Landroid/os/Handler;)V

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 v1, 0x0

    :try_start_1
    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mResolver:Landroid/content/ContentResolver;

    iget-object v3, v0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mGracePeriodUri:Landroid/net/Uri;

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v1, v0, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->updateAllUsers()V

    iput-boolean v1, v0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mInitialLoad:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    monitor-exit v0

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->initAppLockLockedStates()V

    const-string v0, "AppLockLocalService.initSearchRoleHolders"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHoldersForAllUsers()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-static {}, Landroid/os/Trace;->endSection()V

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->registerSearchRoleListeners()V

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->registerExemptRoleListeners()V

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v2}, Landroid/util/ArraySet;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v2, v0}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/android/server/am/AppLockLocalService;->updateExemptRoleHoldersForAllUsers(Ljava/lang/String;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-static {}, Lcom/android/internal/os/BackgroundThread;->getHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/content/PackageMonitor;->register(Landroid/content/Context;Landroid/os/UserHandle;Landroid/os/Handler;)V

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    const-class v1, Landroid/app/KeyguardManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/internal/os/BackgroundThread;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Landroid/app/KeyguardManager;->addDeviceLockedStateListener(Ljava/util/concurrent/Executor;Landroid/app/KeyguardManager$DeviceLockedStateListener;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_3
    :try_start_5
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mNotificationListener:Lcom/android/server/am/AppLockLocalService$NotificationListener;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/content/ComponentName;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    const-class v3, Lcom/android/server/am/AppLockLocalService$NotificationListener;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x1

    invoke-virtual {v0, v1, v2, p0}, Landroid/service/notification/NotificationListenerService;->registerAsSystemService(Landroid/content/Context;Landroid/content/ComponentName;I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_1

    :catch_0
    move-exception p0

    :try_start_6
    const-string v0, "AppLockLocalService"

    const-string v1, "Failed to register NotificationListener"

    invoke-static {v0, v1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :goto_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception p0

    :try_start_7
    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_1
    move-exception p0

    :try_start_8
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :catchall_2
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public static onAmsStart(Lcom/android/server/am/ActivityManagerService;)V
    .locals 1

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService;->mAppLockLocalService:Lcom/android/server/am/AppLockLocalService;

    if-eqz p0, :cond_0

    const-class v0, Landroid/app/AppLockInternal;

    invoke-static {v0, p0}, Lcom/android/server/LocalServices;->addService(Ljava/lang/Class;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static onAmsUidChangeLocked(Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/UidRecord;II)V
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService;->mAppLockLocalService:Lcom/android/server/am/AppLockLocalService;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/server/am/AppLockLocalService;->handleUidChangeLocked(Lcom/android/server/am/UidRecord;II)V

    :cond_0
    return-void
.end method

.method public static onAmsUserRemoved(Lcom/android/server/am/ActivityManagerService;I)V
    .locals 8

    if-nez p0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService;->mAppLockLocalService:Lcom/android/server/am/AppLockLocalService;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService;->mSpcStateLock:Ljava/lang/Object;

    monitor-enter p0

    :try_start_0
    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService;->mSpcEnabledForUser:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService;->mGracePeriodMsForUser:Landroid/util/SparseLongArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseLongArray;->delete(I)V

    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {p0}, Landroid/util/ArraySet;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2

    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService;->mExemptRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_2
    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService;->mSearchRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {v0, p1}, Lcom/android/server/am/AppLockLocalService;->clearTrackedCallNotificationsForUserLocked(I)V

    iget-object p0, v0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->contains(I)Z

    move-result p0

    if-nez p0, :cond_3

    monitor-exit v1

    return-void

    :cond_3
    new-instance p0, Landroid/util/ArraySet;

    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/ArrayMap;

    invoke-virtual {v2}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {p0, v2}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Landroid/util/ArraySet;

    invoke-direct {v3}, Landroid/util/ArraySet;-><init>()V

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    invoke-virtual {p0}, Landroid/util/ArraySet;->size()I

    move-result v6

    if-ge v5, v6, :cond_5

    invoke-virtual {p0, v5}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, p1, v6}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v6

    if-eqz v6, :cond_4

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v6, v6, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {v7, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    invoke-virtual {p0, v5}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v3, v6}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Landroid/util/ArraySet;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    :goto_1
    if-ltz v5, :cond_7

    invoke-virtual {p0, v5}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v6, p1, v4}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {p0, v5}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {p0, v5}, Landroid/util/ArraySet;->removeAt(I)Ljava/lang/Object;

    :cond_6
    add-int/lit8 v5, v5, -0x1

    goto :goto_1

    :cond_7
    iget-object v3, v0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->remove(I)V

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v3}, Lcom/android/server/am/AppLockLocalService;->removeAppLockRecentsDeferralsLocked(ILjava/lang/String;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {p0}, Landroid/util/ArraySet;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    move v7, v1

    :goto_2
    if-ltz v7, :cond_8

    invoke-virtual {p0, v7}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v2

    move-object v2, v3

    move v3, p1

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    move-object v2, v1

    add-int/lit8 v7, v7, -0x1

    goto :goto_2

    :cond_8
    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_2
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0
.end method
