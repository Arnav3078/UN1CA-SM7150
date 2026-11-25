.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:I


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 3

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;->f$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;->f$1:Ljava/lang/String;

    iget p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;->f$2:I

    check-cast p1, Ljava/lang/String;

    sget-boolean v2, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz p1, :cond_1

    invoke-virtual {v0, p0, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    if-eqz v2, :cond_1

    invoke-virtual {v0, p0, v1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-ne v2, p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
