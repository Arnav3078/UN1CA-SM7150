.class public final Lcom/android/server/pm/AppLockPmHelpers;
.super Ljava/lang/Object;


# direct methods
.method public static onPmsMainAppLock(Lcom/android/server/pm/PackageManagerService;)V
    .locals 12
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;

    if-nez p0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService;->mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v1

    const-class v2, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v2}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/pm/UserManagerInternal;

    if-eqz v1, :cond_7

    if-nez v2, :cond_2

    goto :goto_4

    :cond_2
    invoke-virtual {v2}, Lcom/android/server/pm/UserManagerInternal;->getUserIds()[I

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/pm/PackageManagerService;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceBeforePmsLock()V

    monitor-enter v3

    :try_start_0
    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsLock()V

    array-length v4, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_5

    aget v6, v2, v5

    iget-object v7, p0, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    const-string/jumbo v8, "com.samsung.android.app.parentalcare"

    invoke-virtual {v7, v8}, Lcom/android/server/pm/Settings;->getPackageLPr(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v7

    const/4 v8, 0x1

    if-eqz v7, :cond_3

    invoke-virtual {v7, v6}, Lcom/android/server/pm/PackageSetting;->getInstalled(I)Z

    move-result v9

    if-eqz v9, :cond_3

    const-string/jumbo v9, "com.samsung.android.app.parentalcare.provider.ServiceStateReceiver"

    invoke-virtual {v7, v6, v9}, Lcom/android/server/pm/PackageSetting;->getCurrentEnabledStateLPr(ILjava/lang/String;)I

    move-result v7

    if-ne v7, v8, :cond_3

    goto :goto_1

    :cond_3
    const/4 v8, 0x0

    :goto_1
    invoke-interface {v1, v6, v8}, Landroid/app/AppLockInternal;->setSpcStateForUser(IZ)Z

    const-string v9, "AppLockPackageHelper"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Initialized SPC state for user "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", enabled="

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_2

    :cond_5
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    return-void

    :goto_2
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    throw v0

    :cond_7
    :goto_4
    return-void
.end method

.method public static onPmsPostInstallAppLock(Lcom/android/server/pm/InstallPackageHelper;Lcom/android/server/pm/InstallRequest;Ljava/lang/String;)V
    .locals 1

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iget-object p0, p0, Lcom/android/server/pm/InstallPackageHelper;->mPm:Lcom/android/server/pm/PackageManagerService;

    iget-object p1, p1, Lcom/android/server/pm/InstallRequest;->mNewUsers:[I

    invoke-virtual {p0, p2, p1}, Lcom/android/server/pm/PackageManagerService;->maybeRestoreAppLockState(Ljava/lang/String;[I)V

    invoke-virtual {p0, p2, p1}, Lcom/android/server/pm/PackageManagerService;->maybeSyncAppLockGroup(Ljava/lang/String;[I)V

    :cond_0
    return-void
.end method

.method public static onPmsSystemReady(Lcom/android/server/pm/PackageManagerService;)V
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/pm/PackageManagerService;->mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/pm/AppLockPackageHelper;->onSystemReady()V

    :cond_0
    return-void
.end method

.method public static onPmsUserRemoved(Lcom/android/server/pm/PackageManagerService;I)V
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/pm/PackageManagerService;->mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/server/pm/AppLockPackageHelper;->onUserRemoved(I)V

    :cond_0
    return-void
.end method

.method public static shouldBlockClearAppUserData(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/Computer;Ljava/lang/String;ILandroid/content/pm/IPackageDataObserver;I)Z
    .locals 1

    const/16 v0, 0x3e8

    if-eq p5, v0, :cond_1

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/server/pm/PackageManagerService;->isPackageAppLockEnabledInternal(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_1

    if-eqz p4, :cond_0

    iget-object p0, p0, Lcom/android/server/pm/PackageManagerService;->mHandler:Landroid/os/Handler;

    new-instance p1, Lcom/android/server/pm/AppLockPmHelpers$ClearDataDeniedRunnable;

    invoke-direct {p1, p4, p2}, Lcom/android/server/pm/AppLockPmHelpers$ClearDataDeniedRunnable;-><init>(Landroid/content/pm/IPackageDataObserver;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
