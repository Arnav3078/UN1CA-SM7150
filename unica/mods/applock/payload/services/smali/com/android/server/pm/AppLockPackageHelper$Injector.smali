.class interface abstract Lcom/android/server/pm/AppLockPackageHelper$Injector;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# direct methods
.method public static getBackgroundExecutor(Lcom/android/server/pm/PackageManagerService;)Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;
    .locals 1

    new-instance v0, Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/pm/PackageManagerService;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    return-object v0
.end method


# virtual methods
.method public abstract getPendingBackupRestoreFile(I)Ljava/io/File;
.end method

.method public abstract isDeviceSecure(Landroid/content/Context;I)Z
.end method
