.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:I

.field public synthetic f$3:Z


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$1:Ljava/lang/String;

    iget v2, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$2:I

    iget-boolean p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$3:Z

    sget-boolean v3, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    invoke-static {v1}, Ljava/util/List;->of(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Lcom/android/server/am/AppLockLocalService;->handleTaskVisibilityChanged(Ljava/util/List;IZ)V

    return-void
.end method
