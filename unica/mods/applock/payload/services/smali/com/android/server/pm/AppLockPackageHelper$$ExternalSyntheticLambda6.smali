.class public final synthetic Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/IntConsumer;


# instance fields
.field public synthetic f$0:Lcom/android/server/pm/AppLockPackageHelper;


# virtual methods
.method public final accept(I)V
    .locals 3

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/pm/AppLockPackageHelper;

    sget-boolean v0, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v0, v0, Lcom/android/server/pm/PackageManagerService;->mBackgroundHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p1, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
