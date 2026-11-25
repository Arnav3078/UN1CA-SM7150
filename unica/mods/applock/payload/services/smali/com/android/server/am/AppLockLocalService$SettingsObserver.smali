.class public final Lcom/android/server/am/AppLockLocalService$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final mGracePeriodUri:Landroid/net/Uri;

.field public mInitialLoad:Z

.field public final mResolver:Landroid/content/ContentResolver;

.field public final synthetic this$0:Lcom/android/server/am/AppLockLocalService;


# direct methods
.method public constructor <init>(Lcom/android/server/am/AppLockLocalService;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    const-string/jumbo p2, "app_lock_grace_period_ms"

    invoke-static {p2}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iput-object p2, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mGracePeriodUri:Landroid/net/Uri;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mInitialLoad:Z

    iget-object p1, p1, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mResolver:Landroid/content/ContentResolver;

    return-void
.end method


# virtual methods
.method public final declared-synchronized onChange(ZLjava/util/Collection;ILandroid/os/UserHandle;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iget-object p1, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mGracePeriodUri:Landroid/net/Uri;

    invoke-interface {p2, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-interface {p2, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    :try_start_1
    invoke-virtual {p4}, Landroid/os/UserHandle;->getIdentifier()I

    move-result p1

    if-ltz p1, :cond_1

    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->updateGracePeriod(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->updateAllUsers()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public final updateAllUsers()V
    .locals 5

    const-class v0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/UserManagerInternal;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    sget-object v1, Lcom/android/server/pm/UserManagerInternal;->USER_FILTER_WITH_ALL_COMPLETE_USERS:Lcom/android/server/pm/UserFilter;

    invoke-virtual {v0, v1}, Lcom/android/server/pm/UserManagerInternal;->getUsers(Lcom/android/server/pm/UserFilter;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/UserInfo;

    invoke-virtual {v1}, Landroid/content/pm/UserInfo;->isFull()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget v3, v1, Landroid/content/pm/UserInfo;->id:I

    sget-boolean v4, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    invoke-virtual {v2, v3}, Lcom/android/server/am/AppLockLocalService;->isSupportedDualAppUser(I)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget v1, v1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {p0, v1}, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->updateGracePeriod(I)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public final updateGracePeriod(I)V
    .locals 13

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mResolver:Landroid/content/ContentResolver;

    const-string/jumbo v1, "app_lock_grace_period_ms"

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3, p1}, Landroid/provider/Settings$Secure;->getLongForUser(Landroid/content/ContentResolver;Ljava/lang/String;JI)J

    move-result-wide v0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    iget-object v5, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v5, v5, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v5

    :try_start_0
    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v6, v6, Lcom/android/server/am/AppLockLocalService;->mGracePeriodMsForUser:Landroid/util/SparseLongArray;

    invoke-virtual {v6, p1, v2, v3}, Landroid/util/SparseLongArray;->get(IJ)J

    move-result-wide v2

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v6, v6, Lcom/android/server/am/AppLockLocalService;->mGracePeriodMsForUser:Landroid/util/SparseLongArray;

    invoke-virtual {v6, p1, v0, v1}, Landroid/util/SparseLongArray;->put(IJ)V

    iget-boolean v6, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->mInitialLoad:Z

    if-nez v6, :cond_8

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v0, v0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/ArrayMap;

    if-nez v0, :cond_1

    monitor-exit v5

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_5

    :cond_1
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    if-nez v6, :cond_2

    goto :goto_2

    :cond_2
    const-wide/16 v7, -0x1

    iput-wide v7, v6, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastAuthTimeSinceDeviceUnlock:J

    iget-object v7, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v7, p1, v3}, Lcom/android/server/am/AppLockLocalService;->cancelPackageAppLockedJobLocked(ILjava/lang/String;)V

    iget-object v7, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    const/4 v8, 0x1

    invoke-virtual {v7, v3, p1, v8}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_2

    :cond_3
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v3, v6, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v1

    :goto_1
    if-ge v8, v7, :cond_4

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v4, v9, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    invoke-virtual {v4}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    monitor-exit v5

    return-void

    :cond_6
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v7

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_3
    invoke-virtual {v4}, Landroid/util/ArrayMap;->size()I

    move-result v0

    if-ge v1, v0, :cond_7

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService$SettingsObserver;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v4, v1}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v4, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    const/4 v10, 0x1

    const/4 v11, 0x0

    move v9, p1

    invoke-virtual/range {v6 .. v12}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_7
    return-void

    :cond_8
    :goto_4
    :try_start_1
    monitor-exit v5

    return-void

    :goto_5
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
