.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda8;->f$0:Lcom/android/server/am/AppLockLocalService;

    check-cast p1, Landroid/os/UserHandle;

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result p1

    const/4 v0, -0x1

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHoldersForAllUsers(Z)V

    return-void

    :cond_0
    invoke-virtual {p0, p1, v1}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHolderForUser(IZ)V

    return-void
.end method
