.class public final Lcom/android/server/wm/AppLockController$2;
.super Lcom/android/internal/content/PackageMonitor;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final synthetic this$0:Lcom/android/server/wm/AppLockController;


# direct methods
.method public constructor <init>(Lcom/android/server/wm/AppLockController;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/wm/AppLockController$2;->this$0:Lcom/android/server/wm/AppLockController;

    invoke-direct {p0}, Lcom/android/internal/content/PackageMonitor;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPackageAppLockDisabled(Ljava/lang/String;)V
    .locals 12

    const-string v0, "AppLockController.onPackageAppLockDisabled"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-super {p0, p1}, Lcom/android/internal/content/PackageMonitor;->onPackageAppLockDisabled(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/content/PackageMonitor;->getChangingUserId()I

    move-result v0

    sget-object v1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    sget-object v2, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v3

    aget-boolean v3, v1, v3

    if-eqz v3, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    int-to-long v4, v0

    sget-object v6, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v11

    const-wide v7, -0x651241ed2902cdd0L    # -5.734158501893677E-179

    const-wide/16 v9, 0x4

    invoke-static/range {v6 .. v11}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    iget-object v3, p0, Lcom/android/server/wm/AppLockController$2;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v4, v3, Lcom/android/server/wm/AppLockController;->mRecentTasks:Lcom/android/server/wm/RecentTasks;

    if-nez v4, :cond_1

    iget-object v4, v3, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v4, v4, Lcom/android/server/wm/ActivityTaskManagerService;->mRecentTasks:Lcom/android/server/wm/RecentTasks;

    iput-object v4, v3, Lcom/android/server/wm/AppLockController;->mRecentTasks:Lcom/android/server/wm/RecentTasks;

    :cond_1
    const/4 v3, 0x0

    invoke-virtual {v4, v0, p1, v3}, Lcom/android/server/wm/RecentTasks;->onPackageAppLockEnabledChanged(ILjava/lang/String;Z)V

    iget-object v3, p0, Lcom/android/server/wm/AppLockController$2;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v3, v3, Lcom/android/server/wm/AppLockController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    iget-object v4, p0, Lcom/android/server/wm/AppLockController$2;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v4, v4, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v5, v4, Lcom/android/server/wm/AppLockOverlayController;->mAppLockInternal:Landroid/app/AppLockInternal;

    if-nez v5, :cond_2

    const-class v5, Landroid/app/AppLockInternal;

    invoke-static {v5}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/AppLockInternal;

    iput-object v5, v4, Lcom/android/server/wm/AppLockOverlayController;->mAppLockInternal:Landroid/app/AppLockInternal;

    :cond_2
    if-eqz v5, :cond_3

    invoke-interface {v5, p1, v0}, Landroid/app/AppLockInternal;->clearAllCallStatesForPackage(Ljava/lang/String;I)V

    :cond_3
    iget-object v4, p0, Lcom/android/server/wm/AppLockController$2;->this$0:Lcom/android/server/wm/AppLockController;

    invoke-virtual {v4, v0, p1}, Lcom/android/server/wm/AppLockController;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v1, p0

    if-eqz p0, :cond_4

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, -0x12bb00807c5ccdb9L    # -2.316357677631651E218

    const-wide/16 v7, 0x0

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_4
    :goto_0
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_5
    :try_start_2
    iget-object p0, p0, Lcom/android/server/wm/AppLockController$2;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->getRootWindowContainer()Lcom/android/server/wm/RootWindowContainer;

    move-result-object v1

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;

    const/4 v4, 0x2

    invoke-direct {v2, v4}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;-><init>(B)V

    iput-object p0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput v0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iput-object p1, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const/4 p0, 0x1

    invoke-virtual {v1, v2, p0}, Lcom/android/server/wm/WindowContainer;->forAllLeafTasks(Ljava/util/function/Consumer;Z)V

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :goto_1
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    move-object p0, v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final onPackageAppLockEnabled(Ljava/lang/String;)V
    .locals 10

    const-string v0, "AppLockController.onPackageAppLockEnabled"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-super {p0, p1}, Lcom/android/internal/content/PackageMonitor;->onPackageAppLockEnabled(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/internal/content/PackageMonitor;->getChangingUserId()I

    move-result v0

    sget-object v1, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    sget-object v2, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v2

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    int-to-long v2, v0

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, -0x79854b44340dce9dL    # -1.8831837477419993E-277

    const-wide/16 v7, 0x4

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    iget-object p0, p0, Lcom/android/server/wm/AppLockController$2;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v1, p0, Lcom/android/server/wm/AppLockController;->mRecentTasks:Lcom/android/server/wm/RecentTasks;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v1, v1, Lcom/android/server/wm/ActivityTaskManagerService;->mRecentTasks:Lcom/android/server/wm/RecentTasks;

    iput-object v1, p0, Lcom/android/server/wm/AppLockController;->mRecentTasks:Lcom/android/server/wm/RecentTasks;

    :cond_1
    const/4 p0, 0x1

    invoke-virtual {v1, v0, p1, p0}, Lcom/android/server/wm/RecentTasks;->onPackageAppLockEnabledChanged(ILjava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method
