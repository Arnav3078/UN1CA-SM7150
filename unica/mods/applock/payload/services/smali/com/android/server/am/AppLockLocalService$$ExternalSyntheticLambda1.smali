.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Function;


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/String;

    sget-boolean p0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    new-instance p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    invoke-direct {p0}, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;-><init>()V

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mOwnerPackage:Ljava/lang/String;

    return-object p0
.end method
