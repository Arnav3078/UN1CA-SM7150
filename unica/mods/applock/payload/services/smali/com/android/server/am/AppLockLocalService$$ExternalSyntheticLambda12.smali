.class public final synthetic Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/android/server/am/AppLockLocalService;

.field public synthetic f$1:I


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda12;->f$0:Lcom/android/server/am/AppLockLocalService;

    iget p0, p0, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda12;->f$1:I

    sget-boolean v1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService;->mAmService:Lcom/android/server/am/ActivityManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceBeforeAmsLock()V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceAfterAmsLock()V

    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService;->mAmService:Lcom/android/server/am/ActivityManagerService;

    iget-object v2, v2, Lcom/android/server/am/ActivityManagerService;->mProcessList:Lcom/android/server/am/ProcessList;

    iget-object v2, v2, Lcom/android/server/am/ProcessList;->mActiveUids:Lcom/android/server/am/ActiveUids;

    invoke-virtual {v2, p0}, Lcom/android/server/am/ActiveUids;->get(I)Lcom/android/server/am/UidRecord;

    move-result-object v2

    const/high16 v3, -0x80000000

    invoke-virtual {v0, v2, p0, v3}, Lcom/android/server/am/AppLockLocalService;->handleUidChangeLocked(Lcom/android/server/am/UidRecord;II)V

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceAfterAmsUnlock()V

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceAfterAmsUnlock()V

    throw p0
.end method
