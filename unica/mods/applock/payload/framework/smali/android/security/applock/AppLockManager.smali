.class public final Landroid/security/applock/AppLockManager;
.super Ljava/lang/Object;
.source "AppLockManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/security/applock/AppLockManager$PackageLockedStateListener;
    }
.end annotation


# static fields
.field private static final blacklist DEBUG:Z

.field private static final blacklist TAG:Ljava/lang/String; = "AppLockManager"


# instance fields
.field private final blacklist mListeners:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/security/applock/AppLockManager$PackageLockedStateListener;",
            "Landroid/security/applock/IPackageLockedStateListener;",
            ">;"
        }
    .end annotation
.end field

.field private final blacklist mService:Landroid/security/applock/IAppLockManager;


# direct methods
.method static bridge synthetic blacklist -$$Nest$sfgetDEBUG()Z
    .locals 1

    sget-boolean v0, Landroid/security/applock/AppLockManager;->DEBUG:Z

    return v0
.end method

.method static constructor blacklist <clinit>()V
    .locals 2

    .line 40
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockManager"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Landroid/security/applock/AppLockManager;->DEBUG:Z

    return-void
.end method

.method public constructor blacklist <init>(Landroid/security/applock/IAppLockManager;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/security/applock/AppLockManager;->mListeners:Landroid/util/ArrayMap;

    .line 47
    const-string v0, "AppLockManager service is null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    iput-object p1, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    return-void
.end method


# virtual methods
.method public blacklist getPackagesWithVisibleAppLockOverlay(I)Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 223
    :try_start_0
    iget-object p0, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    invoke-interface {p0, p1}, Landroid/security/applock/IAppLockManager;->getPackagesWithVisibleAppLockOverlay(I)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 224
    new-instance p1, Landroid/util/ArraySet;

    invoke-direct {p1, p0}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    return-object p1

    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 226
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public blacklist isAppLockSupportedForDevice()Z
    .locals 0

    .line 185
    :try_start_0
    iget-object p0, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    invoke-interface {p0}, Landroid/security/applock/IAppLockManager;->isAppLockSupportedForDevice()Z

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 187
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public blacklist isAppLockSupportedForUser(I)Z
    .locals 0

    .line 201
    :try_start_0
    iget-object p0, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    invoke-interface {p0, p1}, Landroid/security/applock/IAppLockManager;->isAppLockSupportedForUser(I)Z

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 203
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public blacklist isPackageLocked(Ljava/lang/String;I)Z
    .locals 0

    .line 69
    :try_start_0
    iget-object p0, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    invoke-interface {p0, p1, p2}, Landroid/security/applock/IAppLockManager;->isPackageLocked(Ljava/lang/String;I)Z

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 71
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public blacklist registerPackageLockedStateListener(Ljava/util/concurrent/Executor;Landroid/security/applock/AppLockManager$PackageLockedStateListener;)V
    .locals 2

    .line 111
    const-string/jumbo v0, "executor must not be null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    const-string/jumbo v0, "listener must not be null"

    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 113
    iget-object v0, p0, Landroid/security/applock/AppLockManager;->mListeners:Landroid/util/ArrayMap;

    monitor-enter v0

    .line 114
    :try_start_0
    iget-object v1, p0, Landroid/security/applock/AppLockManager;->mListeners:Landroid/util/ArrayMap;

    invoke-virtual {v1, p2}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    monitor-exit v0

    return-void

    .line 117
    :cond_0
    new-instance v1, Landroid/security/applock/AppLockManager$1;

    invoke-direct {v1, p0, p2, p1}, Landroid/security/applock/AppLockManager$1;-><init>(Landroid/security/applock/AppLockManager;Landroid/security/applock/AppLockManager$PackageLockedStateListener;Ljava/util/concurrent/Executor;)V

    .line 136
    iget-object p1, p0, Landroid/security/applock/AppLockManager;->mListeners:Landroid/util/ArrayMap;

    invoke-virtual {p1, p2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    :try_start_1
    iget-object p1, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    invoke-interface {p1, v1}, Landroid/security/applock/IAppLockManager;->registerPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    :try_start_2
    monitor-exit v0

    return-void

    :catch_0
    move-exception p1

    .line 140
    iget-object p0, p0, Landroid/security/applock/AppLockManager;->mListeners:Landroid/util/ArrayMap;

    invoke-virtual {p0, p2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    invoke-virtual {p1}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    :catchall_0
    move-exception p0

    .line 143
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public blacklist setAppLockEnabledPackageSuccessfullyAuthenticated(Ljava/lang/String;I)V
    .locals 0

    .line 96
    :try_start_0
    iget-object p0, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    invoke-interface {p0, p1, p2}, Landroid/security/applock/IAppLockManager;->setAppLockEnabledPackageSuccessfullyAuthenticated(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 98
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public blacklist unregisterPackageLockedStateListener(Landroid/security/applock/AppLockManager$PackageLockedStateListener;)V
    .locals 2

    .line 154
    const-string/jumbo v0, "listener must not be null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 155
    iget-object v0, p0, Landroid/security/applock/AppLockManager;->mListeners:Landroid/util/ArrayMap;

    monitor-enter v0

    .line 156
    :try_start_0
    iget-object v1, p0, Landroid/security/applock/AppLockManager;->mListeners:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/security/applock/IPackageLockedStateListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    .line 159
    :try_start_1
    iget-object p0, p0, Landroid/security/applock/AppLockManager;->mService:Landroid/security/applock/IAppLockManager;

    invoke-interface {p0, p1}, Landroid/security/applock/IAppLockManager;->unregisterPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 161
    :try_start_2
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 164
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method
