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

    invoke-virtual {p0}, Lcom/android/server/pm/AppLockPackageHelper;->systemReady()V

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

.method public static onPmsExistingPackageInstalled(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;IZ)V
    .locals 2

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p2, v0, v1

    if-eqz p3, :cond_0

    invoke-virtual {p0, p1, v0}, Lcom/android/server/pm/PackageManagerService;->maybeRestoreAppLockState(Ljava/lang/String;[I)V

    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/android/server/pm/PackageManagerService;->maybeSyncAppLockGroup(Ljava/lang/String;[I)V

    :cond_1
    return-void
.end method

.method public static maybeNormalizePlatformPkgSignature(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;Lcom/android/server/pm/pkg/AndroidPackage;[Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    invoke-interface {p0}, Lcom/android/internal/pm/parsing/pkg/ParsedPackage;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "android"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p2, p3}, Lcom/android/server/pm/ScanPackageUtils;->signedWithCustomSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z

    move-result v1

    if-eqz v1, :cond_1

    :try_start_0
    const-string v1, "308204d4308203bca003020102020900d20995a79c0daad6300d06092a864886f70d01010505003081a2310b3009060355040613024b52311430120603550408130b536f757468204b6f726561311330110603550407130a5375776f6e2043697479311c301a060355040a131353616d73756e6720436f72706f726174696f6e310c300a060355040b1303444d43311530130603550403130c53616d73756e6720436572743125302306092a864886f70d0109011616616e64726f69642e6f734073616d73756e672e636f6d301e170d3131303632323132323531325a170d3338313130373132323531325a3081a2310b3009060355040613024b52311430120603550408130b536f757468204b6f726561311330110603550407130a5375776f6e2043697479311c301a060355040a131353616d73756e6720436f72706f726174696f6e310c300a060355040b1303444d43311530130603550403130c53616d73756e6720436572743125302306092a864886f70d0109011616616e64726f69642e6f734073616d73756e672e636f6d30820120300d06092a864886f70d01010105000382010d00308201080282010100c986384a3e1f2fb206670e78ef232215c0d26f45a22728db99a44da11c35ac33a71fe071c4a2d6825a9b4c88b333ed96f3c5e6c666d60f3ee94c490885abcf8dc660f707aabc77ead3e2d0d8aee8108c15cd260f2e85042c28d2f292daa3c6da0c7bf2391db7841aade8fdf0c9d0defcf77124e6d2de0a9e0d2da746c3670e4ffcdc85b701bb4744861b96ff7311da3603c5a10336e55ffa34b4353eedc85f51015e1518c67e309e39f87639ff178107f109cd18411a6077f26964b6e63f8a70b9619db04306a323c1a1d23af867e19f14f570ffe573d0e3a0c2b30632aaec3173380994be1e341e3a90bd2e4b615481f46db39ea83816448ec35feb1735c1f3020103a382010b30820107301d0603551d0e04160414932c3af70b627a0c7610b5a0e7427d6cfaea3f1e3081d70603551d230481cf3081cc8014932c3af70b627a0c7610b5a0e7427d6cfaea3f1ea181a8a481a53081a2310b3009060355040613024b52311430120603550408130b536f757468204b6f726561311330110603550407130a5375776f6e2043697479311c301a060355040a131353616d73756e6720436f72706f726174696f6e310c300a060355040b1303444d43311530130603550403130c53616d73756e6720436572743125302306092a864886f70d0109011616616e64726f69642e6f734073616d73756e672e636f6d820900d20995a79c0daad6300c0603551d13040530030101ff300d06092a864886f70d01010505000382010100329601fe40e036a4a86cc5d49dd8c1b5415998e72637538b0d430369ac51530f63aace8c019a1a66616a2f1bb2c5fabd6f313261f380e3471623f053d9e3c53f5fd6d1965d7b000e4dc244c1b27e2fe9a323ff077f52c4675e86247aa801187137e30c9bbf01c567a4299db4bf0b25b7d7107a7b81ee102f72ff47950164e26752e114c42f8b9d2a42e7308897ec640ea1924ed13abbe9d120912b62f4926493a86db94c0b46f44c6161d58c2f648164890c512dfb28d42c855bf470dbee2dab6960cad04e81f71525ded46cdd0f359f99c460db9f007d96ce83b4b218ac2d82c48f12608d469733f05a3375594669ccbf8a495544d6c5701e9369c08c810158"

    new-instance v2, Landroid/content/pm/Signature;

    invoke-direct {v2, v1}, Landroid/content/pm/Signature;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v3, v1, [Landroid/content/pm/Signature;

    aput-object v2, v3, v0

    new-instance v2, Landroid/content/pm/SigningDetails;

    const/4 v0, 0x3

    invoke-direct {v2, v3, v0}, Landroid/content/pm/SigningDetails;-><init>([Landroid/content/pm/Signature;I)V

    invoke-interface {p0, v2}, Lcom/android/internal/pm/parsing/pkg/ParsedPackage;->setSigningDetails(Landroid/content/pm/SigningDetails;)Lcom/android/internal/pm/parsing/pkg/ParsedPackage;

    invoke-interface {p0, v1}, Lcom/android/internal/pm/parsing/pkg/ParsedPackage;->setSignedWithPlatformKey(Z)Lcom/android/internal/pm/parsing/pkg/ParsedPackage;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v1

    :catchall_0
    move-exception v0

    const/4 v0, 0x0

    :cond_1
    return v0
.end method
