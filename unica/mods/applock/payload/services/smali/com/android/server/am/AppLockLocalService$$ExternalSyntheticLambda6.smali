.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Landroid/app/role/OnRoleHoldersChangedListener;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onRoleHoldersChanged(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 3

    iget-byte v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;->$r8$classId:B

    const/4 v1, -0x1

    const/4 v2, 0x1

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/am/AppLockLocalService;

    packed-switch v0, :pswitch_data_0

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    const-string/jumbo v0, "android.app.role.SEARCH_ENGINE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Landroid/os/UserHandle;->getIdentifier()I

    move-result p1

    if-ne p1, v1, :cond_0

    invoke-virtual {p0, v2}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHoldersForAllUsers(Z)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, v2}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHolderForUser(IZ)V

    :cond_1
    :goto_0
    return-void

    :pswitch_0
    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v0

    if-ne v0, v1, :cond_2

    invoke-virtual {p0, p1, v2}, Lcom/android/server/am/AppLockLocalService;->updateExemptRoleHoldersForAllUsers(Ljava/lang/String;Z)V

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Landroid/os/UserHandle;->getIdentifier()I

    move-result p2

    invoke-virtual {p0, p2, p1, v2}, Lcom/android/server/am/AppLockLocalService;->updateExemptRoleHolderForUser(ILjava/lang/String;Z)V

    :cond_3
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
