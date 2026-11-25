.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;


# virtual methods
.method public final run()V
    .locals 3

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda10;->f$0:Lcom/android/server/am/AppLockLocalService;

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lcom/android/server/am/AppLockLocalService;->pruneRecentlyRemovedCallsLocked(J)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
