.class public final Lcom/android/server/security/applock/AppLockService;
.super Landroid/security/applock/IAppLockManager$Stub;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# static fields
.field public static final DEBUG:Z

.field public static volatile sInjector:Lcom/android/server/security/applock/AppLockService$Injector;


# instance fields
.field public mContext:Landroid/content/Context;

.field public mInjector:Lcom/android/server/security/applock/AppLockService$Injector;

.field public mLocalService:Landroid/app/AppLockInternal;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/android/server/security/applock/AppLockService;->DEBUG:Z

    return-void
.end method

.method public static logDebug(Ljava/lang/String;)V
    .locals 1

    sget-boolean v0, Lcom/android/server/security/applock/AppLockService;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockService"

    invoke-static {v0, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static setInjectorForTesting(Lcom/android/server/security/applock/AppLockService$Injector;)V
    .locals 1

    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    sput-object p0, Lcom/android/server/security/applock/AppLockService;->sInjector:Lcom/android/server/security/applock/AppLockService$Injector;

    return-void

    :cond_0
    const-string p0, "Injector should only be set in debuggable builds."

    invoke-static {p0}, Lcom/android/server/wm/Task$$ExternalSyntheticBUOutline0;->m(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final enforceSystemOrRootUid(Ljava/lang/String;)V
    .locals 1

    iget-object p0, p0, Lcom/android/server/security/applock/AppLockService;->mInjector:Lcom/android/server/security/applock/AppLockService$Injector;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result p0

    const/16 v0, 0x3e8

    invoke-static {p0, v0}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const-string p0, " can only be called by the system"

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/android/server/wm/Task$$ExternalSyntheticBUOutline0;->m(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final getPackagesWithVisibleAppLockOverlay(I)Ljava/util/List;
    .locals 1

    const-string/jumbo v0, "getPackagesWithVisibleAppLockOverlay"

    invoke-virtual {p0, v0}, Lcom/android/server/security/applock/AppLockService;->enforceSystemOrRootUid(Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "getPackagesWithVisibleAppLockOverlay: userId="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/android/server/security/applock/AppLockService;->logDebug(Ljava/lang/String;)V

    const-class p0, Lcom/android/server/wm/ActivityTaskManagerInternal;

    invoke-static {p0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/wm/ActivityTaskManagerInternal;

    if-nez p0, :cond_0

    const-string p0, "AppLockService"

    const-string p1, "ActivityTaskManagerInternal is null"

    invoke-static {p0, p1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/server/wm/ActivityTaskManagerInternal;->getPackagesWithVisibleAppLockOverlay(I)Ljava/util/Set;

    move-result-object p0

    if-eqz p0, :cond_1

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1

    :cond_1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public final isAppLockSupportedForDevice()Z
    .locals 1

    const-string/jumbo v0, "isAppLockSupportedForDevice"

    invoke-static {v0}, Lcom/android/server/security/applock/AppLockService;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/security/applock/AppLockService;->mLocalService:Landroid/app/AppLockInternal;

    invoke-interface {p0}, Landroid/app/AppLockInternal;->isAppLockSupportedForDevice()Z

    move-result p0

    return p0
.end method

.method public final isAppLockSupportedForUser(I)Z
    .locals 3

    iget-object v0, p0, Lcom/android/server/security/applock/AppLockService;->mInjector:Lcom/android/server/security/applock/AppLockService$Injector;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-static {v0}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/server/security/applock/AppLockService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.INTERACT_ACROSS_USERS"

    const-string/jumbo v2, "isAppLockSupportedForUser: Cross-user queries require INTERACT_ACROSS_USERS"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "isAppLockSupportedForUser: userId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/security/applock/AppLockService;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/security/applock/AppLockService;->mLocalService:Landroid/app/AppLockInternal;

    invoke-interface {p0, p1}, Landroid/app/AppLockInternal;->isAppLockSupportedForUser(I)Z

    move-result p0

    return p0
.end method

.method public final isPackageLocked(Ljava/lang/String;I)Z
    .locals 5

    iget-object v0, p0, Lcom/android/server/security/applock/AppLockService;->mInjector:Lcom/android/server/security/applock/AppLockService$Injector;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    const/16 v1, 0x3e8

    invoke-static {v0, v1}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/android/server/security/applock/AppLockService;->mContext:Landroid/content/Context;

    const-string/jumbo v3, "android.permission.LOCK_APPS"

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v4

    invoke-virtual {v2, v3, v4, v0}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v0}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    if-eq v0, p2, :cond_2

    iget-object v0, p0, Lcom/android/server/security/applock/AppLockService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.INTERACT_ACROSS_USERS"

    const-string/jumbo v2, "isPackageLocked: Cross-user queries require INTERACT_ACROSS_USERS"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string/jumbo p0, "isPackageLocked requires the LOCK_APPS permission"

    invoke-static {p0}, Lcom/android/server/wm/Task$$ExternalSyntheticBUOutline0;->m(Ljava/lang/String;)V

    return v1

    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "isPackageLocked: packageName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", userId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/security/applock/AppLockService;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/security/applock/AppLockService;->mLocalService:Landroid/app/AppLockInternal;

    invoke-interface {p0, p1, p2}, Landroid/app/AppLockInternal;->isPackageLocked(Ljava/lang/String;I)Z

    move-result p0

    return p0
.end method

.method public final registerPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V
    .locals 1

    const-string/jumbo v0, "listener must not be null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string/jumbo v0, "registerPackageLockedStateListener"

    invoke-virtual {p0, v0}, Lcom/android/server/security/applock/AppLockService;->enforceSystemOrRootUid(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/android/server/security/applock/AppLockService;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/security/applock/AppLockService;->mLocalService:Landroid/app/AppLockInternal;

    invoke-interface {p0, p1}, Landroid/app/AppLockInternal;->registerPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V

    return-void
.end method

.method public final setAppLockEnabledPackageSuccessfullyAuthenticated(Ljava/lang/String;I)V
    .locals 2

    const-string/jumbo v0, "setAppLockEnabledPackageSuccessfullyAuthenticated"

    invoke-virtual {p0, v0}, Lcom/android/server/security/applock/AppLockService;->enforceSystemOrRootUid(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "setAppLockEnabledPackageSuccessfullyAuthenticated: packageName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", userId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/security/applock/AppLockService;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/security/applock/AppLockService;->mLocalService:Landroid/app/AppLockInternal;

    invoke-interface {p0, p1, p2}, Landroid/app/AppLockInternal;->setAppLockEnabledPackageSuccessfullyAuthenticated(Ljava/lang/String;I)V

    return-void
.end method

.method public final unregisterPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V
    .locals 1

    const-string/jumbo v0, "listener must not be null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string/jumbo v0, "unregisterPackageLockedStateListener"

    invoke-virtual {p0, v0}, Lcom/android/server/security/applock/AppLockService;->enforceSystemOrRootUid(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/android/server/security/applock/AppLockService;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/security/applock/AppLockService;->mLocalService:Landroid/app/AppLockInternal;

    invoke-interface {p0, p1}, Landroid/app/AppLockInternal;->unregisterPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V

    return-void
.end method
