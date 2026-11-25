.class final Lcom/android/server/pm/AppLockPmHelpers$ClearDataDeniedRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final mObserver:Landroid/content/pm/IPackageDataObserver;

.field private final mPackageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/pm/IPackageDataObserver;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/server/pm/AppLockPmHelpers$ClearDataDeniedRunnable;->mObserver:Landroid/content/pm/IPackageDataObserver;

    iput-object p2, p0, Lcom/android/server/pm/AppLockPmHelpers$ClearDataDeniedRunnable;->mPackageName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/android/server/pm/AppLockPmHelpers$ClearDataDeniedRunnable;->mObserver:Landroid/content/pm/IPackageDataObserver;

    iget-object p0, p0, Lcom/android/server/pm/AppLockPmHelpers$ClearDataDeniedRunnable;->mPackageName:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Landroid/content/pm/IPackageDataObserver;->onRemoveCompleted(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string/jumbo p0, "PackageManager"

    const-string/jumbo v0, "Observer no longer exists."

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
