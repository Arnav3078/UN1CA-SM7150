.class public final Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;
.super Lcom/android/internal/content/PackageMonitor;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public mService:Lcom/android/server/am/AppLockLocalService;


# virtual methods
.method public final onPackageAdded(Ljava/lang/String;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/android/internal/content/PackageMonitor;->onPackageAdded(Ljava/lang/String;I)V

    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->refreshSpcForPackage(Ljava/lang/String;)V

    return-void
.end method

.method public final onPackageAppLockDisabled(Ljava/lang/String;)V
    .locals 4

    const-string/jumbo v0, "onPackageAppLockDisabled for "

    const-string v1, "AppLockLocalService.onPackageAppLockDisabled"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-super {p0, p1}, Lcom/android/internal/content/PackageMonitor;->onPackageAppLockDisabled(Ljava/lang/String;)V

    sget-boolean v1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "AppLockLocalService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/content/PackageMonitor;->getChangingUserId()I

    move-result v0

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v1, v1, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v1}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;-><init>(B)V

    iput-object p0, v2, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    iput-object p1, v2, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iput v0, v2, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$2:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final onPackageAppLockEnabled(Ljava/lang/String;)V
    .locals 3

    const-string/jumbo v0, "onPackageAppLockEnabled for "

    const-string v1, "AppLockLocalService.onPackageAppLockEnabled"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-super {p0, p1}, Lcom/android/internal/content/PackageMonitor;->onPackageAppLockEnabled(Ljava/lang/String;)V

    sget-boolean v1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "AppLockLocalService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/content/PackageMonitor;->getChangingUserId()I

    move-result v0

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, p1, v0}, Lcom/android/server/am/AppLockLocalService;->handleAppLockEnabled(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final onPackageRemoved(Ljava/lang/String;I)V
    .locals 3

    const-string/jumbo v0, "onPackageRemoved for "

    const-string v1, "AppLockLocalService.onPackageRemoved"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/android/internal/content/PackageMonitor;->onPackageRemoved(Ljava/lang/String;I)V

    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->refreshSpcForPackage(Ljava/lang/String;)V

    sget-boolean p2, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz p2, :cond_0

    const-string p2, "AppLockLocalService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/content/PackageMonitor;->getChangingUserId()I

    move-result p2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    iget-object v0, v0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v0}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    iput-object p1, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iput p2, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$2:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final onPackageUpdateFinished(Ljava/lang/String;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/android/internal/content/PackageMonitor;->onPackageUpdateFinished(Ljava/lang/String;I)V

    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->refreshSpcForPackage(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/content/PackageMonitor;->getChangingUserId()I

    move-result p2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabled(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->updateAppLockGroupMembership(ILjava/lang/String;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->handleAppLockEnabled(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public final refreshSpcForPackage(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/android/server/am/AppLockLocalService;->SPC_SERVICE_STATE_COMPONENT:Landroid/content/ComponentName;

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0}, Lcom/android/internal/content/PackageMonitor;->getChangingUserId()I

    move-result p0

    iget-object p1, p1, Lcom/android/server/am/AppLockLocalService;->mSpcStateRefreshCallback:Ljava/util/function/IntConsumer;

    if-eqz p1, :cond_0

    invoke-interface {p1, p0}, Ljava/util/function/IntConsumer;->accept(I)V

    :cond_0
    return-void
.end method
