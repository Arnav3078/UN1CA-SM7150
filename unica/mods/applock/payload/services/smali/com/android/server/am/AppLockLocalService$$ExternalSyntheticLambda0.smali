.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;

.field public synthetic f$1:I


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/am/AppLockLocalService;

    iget p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda0;->f$1:I

    check-cast p1, Ljava/lang/String;

    sget-boolean v1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    invoke-virtual {v0, p1, p0}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabled(Ljava/lang/String;I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
