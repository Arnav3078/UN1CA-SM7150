.class public final Lcom/android/server/pm/AppLockPackageHelper$1;
.super Landroid/app/supervision/SupervisionManager$SupervisionListener;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final synthetic this$0:Lcom/android/server/pm/AppLockPackageHelper;


# direct methods
.method public constructor <init>(Lcom/android/server/pm/AppLockPackageHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/pm/AppLockPackageHelper$1;->this$0:Lcom/android/server/pm/AppLockPackageHelper;

    invoke-direct {p0}, Landroid/app/supervision/SupervisionManager$SupervisionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onSupervisionEnabled(I)V
    .locals 3

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper$1;->this$0:Lcom/android/server/pm/AppLockPackageHelper;

    iget-object v1, v0, Lcom/android/server/pm/AppLockPackageHelper;->mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

    iget-object v0, v0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lcom/android/server/pm/AppLockPackageHelper$Injector;->getBackgroundExecutor(Lcom/android/server/pm/PackageManagerService;)Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;

    move-result-object v0

    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p1, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
