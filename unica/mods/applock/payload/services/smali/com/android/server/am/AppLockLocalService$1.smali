.class public final Lcom/android/server/am/AppLockLocalService$1;
.super Landroid/content/BroadcastReceiver;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final synthetic $r8$classId:B

.field public final synthetic this$0:Lcom/android/server/am/AppLockLocalService;


# direct methods
.method public synthetic constructor <init>(Lcom/android/server/am/AppLockLocalService;B)V
    .locals 0

    iput-byte p2, p0, Lcom/android/server/am/AppLockLocalService$1;->$r8$classId:B

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService$1;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    iget-byte p1, p0, Lcom/android/server/am/AppLockLocalService$1;->$r8$classId:B

    const/4 v0, -0x1

    const/16 v1, -0x2710

    const-string/jumbo v2, "android.intent.extra.user_handle"

    packed-switch p1, :pswitch_data_0

    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-ne p1, v1, :cond_0

    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->getPendingResult()Landroid/content/BroadcastReceiver$PendingResult;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->getSendingUserId()I

    move-result p1

    :cond_0
    const-string/jumbo v2, "android.intent.action.USER_UNLOCKED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    if-eq p1, v0, :cond_2

    if-ne p1, v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$1;->this$0:Lcom/android/server/am/AppLockLocalService;

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHolderForUser(IZ)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$1;->this$0:Lcom/android/server/am/AppLockLocalService;

    sget-boolean p1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    invoke-virtual {p0, p2}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHoldersForAllUsers(Z)V

    :goto_1
    return-void

    :pswitch_0
    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 p2, 0x0

    move v2, p2

    :goto_2
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$1;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v3, v3, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v3}, Landroid/util/ArraySet;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    if-eq p1, v0, :cond_4

    if-ne p1, v1, :cond_3

    goto :goto_3

    :cond_3
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$1;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v4, v3, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v4, v2}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, p1, v4, p2}, Lcom/android/server/am/AppLockLocalService;->updateExemptRoleHolderForUser(ILjava/lang/String;Z)V

    goto :goto_4

    :cond_4
    :goto_3
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$1;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v4, v3, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v4, v2}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4, p2}, Lcom/android/server/am/AppLockLocalService;->updateExemptRoleHoldersForAllUsers(Ljava/lang/String;Z)V

    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
