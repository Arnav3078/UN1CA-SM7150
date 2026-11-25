.class public final synthetic Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Landroid/app/StatsManager$StatsPullAtomCallback;


# instance fields
.field public synthetic f$0:Lcom/android/server/pm/AppLockPackageHelper;


# virtual methods
.method public final onPullAtom(ILjava/util/List;)I
    .locals 12

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda8;->f$0:Lcom/android/server/pm/AppLockPackageHelper;

    sget-boolean v0, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    const-string v1, "AppLockPackageHelper"

    const/4 v2, 0x1

    const/16 v3, 0x2822

    if-eq p1, v3, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v0, :cond_7

    const-string/jumbo p0, "onPullAtom: Unsupported atom tag "

    invoke-static {p1, p0, v1}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(ILjava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    iget-object p1, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {p1}, Lcom/android/server/pm/PackageManagerService;->snapshotComputer()Lcom/android/server/pm/Computer;

    move-result-object p1

    const-class v4, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v4}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v5

    if-eqz v4, :cond_6

    if-nez v5, :cond_1

    goto :goto_3

    :cond_1
    invoke-virtual {v4}, Lcom/android/server/pm/UserManagerInternal;->getUserIds()[I

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_5

    aget v4, v0, v2

    invoke-interface {v5, v4}, Landroid/app/AppLockInternal;->isAppLockSupportedForUser(I)Z

    move-result v6

    if-nez v6, :cond_2

    goto :goto_2

    :cond_2
    invoke-static {p1, v4}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockEnabledPackages(Lcom/android/server/pm/Computer;I)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v1

    move v10, v9

    :cond_3
    :goto_1
    if-ge v10, v8, :cond_4

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Ljava/lang/String;

    invoke-static {p1, v11, v4}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockParent(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_3

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_4
    sub-int/2addr v7, v9

    iget-object v6, p0, Lcom/android/server/pm/AppLockPackageHelper;->mFrameworkStatsLogger:Lcom/android/server/pm/AppLockPackageHelper$AppLockFrameworkStatsLogger;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3, v4, v7}, Lcom/android/internal/util/FrameworkStatsLog;->buildStatsEvent(III)Landroid/util/StatsEvent;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_3
    if-eqz v0, :cond_7

    const-string/jumbo p0, "onPullAtom: UserManagerInternal or AppLockInternal is null"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    return v2
.end method
