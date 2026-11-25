.class public Lcom/android/server/security/applock/AppLockService$Lifecycle;
.super Lcom/android/server/SystemService;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/SystemService;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final onStart()V
    .locals 4

    const-class v0, Landroid/app/AppLockInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppLockInternal;

    new-instance v1, Lcom/android/server/security/applock/AppLockService;

    invoke-virtual {p0}, Lcom/android/server/SystemService;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1}, Landroid/security/applock/IAppLockManager$Stub;-><init>()V

    sget-object v3, Lcom/android/server/security/applock/AppLockService;->sInjector:Lcom/android/server/security/applock/AppLockService$Injector;

    if-nez v3, :cond_0

    new-instance v3, Lcom/android/server/security/applock/AppLockService$Injector;

    invoke-direct {v3}, Lcom/android/server/security/applock/AppLockService$Injector;-><init>()V

    goto :goto_0

    :cond_0
    sget-object v3, Lcom/android/server/security/applock/AppLockService;->sInjector:Lcom/android/server/security/applock/AppLockService$Injector;

    :goto_0
    iput-object v3, v1, Lcom/android/server/security/applock/AppLockService;->mInjector:Lcom/android/server/security/applock/AppLockService$Injector;

    const-string/jumbo v3, "context is null"

    invoke-static {v2, v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v3, "AppLockInternal is null"

    invoke-static {v0, v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    iput-object v2, v1, Lcom/android/server/security/applock/AppLockService;->mContext:Landroid/content/Context;

    iput-object v0, v1, Lcom/android/server/security/applock/AppLockService;->mLocalService:Landroid/app/AppLockInternal;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const-string/jumbo v0, "app_lock"

    invoke-virtual {p0, v0, v1}, Lcom/android/server/SystemService;->publishBinderService(Ljava/lang/String;Landroid/os/IBinder;)V

    return-void
.end method
