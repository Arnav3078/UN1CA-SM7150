.class public final Lcom/android/server/pm/AppLockPackageHelper$2;
.super Landroid/content/BroadcastReceiver;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final synthetic this$0:Lcom/android/server/pm/AppLockPackageHelper;


# direct methods
.method public constructor <init>(Lcom/android/server/pm/AppLockPackageHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/pm/AppLockPackageHelper$2;->this$0:Lcom/android/server/pm/AppLockPackageHelper;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string/jumbo p1, "com.samsung.android.app.parentalcare.action.SERVICE_STATE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->getSendingUserId()I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper$2;->this$0:Lcom/android/server/pm/AppLockPackageHelper;

    sget-boolean p1, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class p1, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {p1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/server/pm/UserManagerInternal;

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Lcom/android/server/pm/UserManagerInternal;->getUserIds()[I

    move-result-object p1

    array-length p2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_3

    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/android/server/pm/AppLockPackageHelper;->onSpcStateChanged(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    if-ltz p1, :cond_3

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper$2;->this$0:Lcom/android/server/pm/AppLockPackageHelper;

    sget-boolean p2, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    invoke-virtual {p0, p1}, Lcom/android/server/pm/AppLockPackageHelper;->onSpcStateChanged(I)V

    :cond_3
    :goto_1
    return-void
.end method
