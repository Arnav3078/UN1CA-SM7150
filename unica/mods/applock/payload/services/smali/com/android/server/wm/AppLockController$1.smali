.class public final Lcom/android/server/wm/AppLockController$1;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Landroid/app/AppLockInternal$PackageLockedStateListener;


# instance fields
.field public synthetic this$0:Lcom/android/server/wm/AppLockController;


# virtual methods
.method public final onPackageLockedStateChanged(Ljava/lang/String;IZ)V
    .locals 10

    const-string v0, "AppLockController.onPackageLockedStateChanged"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v1, v0, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceBeforeWmsLock()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsLock()V

    sget-object v0, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    sget-object v2, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {v2}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result v2

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_0

    int-to-long v2, p2

    sget-object v4, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {p1, v0, v2}, [Ljava/lang/Object;

    move-result-object v9

    const-wide v5, -0x6d5ab773df43ca43L    # -7.536573293488263E-219

    const-wide/16 v7, 0x34

    invoke-static/range {v4 .. v9}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_6

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/ArraySet;

    const/16 v2, 0x22

    const/4 v3, 0x1

    if-eqz p3, :cond_4

    if-nez v0, :cond_1

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iget-object v4, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v4, v4, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v4, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_1
    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v4, v0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    sub-int/2addr v4, v3

    :goto_1
    if-ltz v4, :cond_3

    iget-object v3, v0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;

    iget v5, v3, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mUserId:I

    if-ne v5, p2, :cond_2

    iget-object v3, v3, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->removeAt(I)V

    :cond_2
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {v0, p2, p1}, Lcom/android/server/wm/AppLockOverlayController;->lockActivitiesTasksForAppLock(ILjava/lang/String;)V

    goto/16 :goto_4

    :cond_4
    const/4 v4, 0x0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    const-string/jumbo v3, "app-lock-package-unlocked"

    invoke-virtual {v0, v4, p1, p2, v3}, Lcom/android/server/wm/AppLockOverlayController;->finishLockedTaskAppLockOverlaysLocked(Lcom/android/server/wm/Task;Ljava/lang/String;ILjava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object p0, p0, Lcom/android/server/wm/ActivityTaskManagerService;->mTaskChangeNotificationController:Lcom/android/server/wm/TaskChangeNotificationController;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    if-gez p2, :cond_5

    goto :goto_2

    :cond_5
    iget-object p0, p0, Lcom/android/server/wm/TaskChangeNotificationController;->mHandler:Lcom/android/server/wm/TaskChangeNotificationController$MainHandler;

    invoke-virtual {p0, v2, p2, p3, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    :cond_6
    :goto_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_7
    :try_start_2
    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->remove(I)V

    :cond_8
    const-string v0, "AppLockController"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "AppLockTrace WM_UNLOCK_CACHE_CLEARED userId="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v6, "ro.product_ship"

    invoke-static {v6, v3}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, " package="

    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    :cond_9
    const-string v3, ""

    :goto_3
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    const-string/jumbo v3, "app-lock-package-unlocked"

    invoke-virtual {v0, v4, p1, p2, v3}, Lcom/android/server/wm/AppLockOverlayController;->finishLockedTaskAppLockOverlaysLocked(Lcom/android/server/wm/Task;Ljava/lang/String;ILjava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mRoot:Lcom/android/server/wm/RootWindowContainer;

    invoke-virtual {v0}, Lcom/android/server/wm/RootWindowContainer;->resumeFocusedTasksTopActivities()V

    :goto_4
    iget-object v0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mRoot:Lcom/android/server/wm/RootWindowContainer;

    new-instance v3, Lcom/android/server/wm/AppLockController$1$$ExternalSyntheticLambda0;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object p1, v3, Lcom/android/server/wm/AppLockController$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-boolean p3, v3, Lcom/android/server/wm/AppLockController$1$$ExternalSyntheticLambda0;->f$1:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/android/server/wm/WindowContainer;->forAllWindows(Ljava/util/function/Consumer;Z)V

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->traceAfterWmsUnlock()V

    iget-object p0, p0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object p0, p0, Lcom/android/server/wm/ActivityTaskManagerService;->mTaskChangeNotificationController:Lcom/android/server/wm/TaskChangeNotificationController;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    if-gez p2, :cond_a

    goto :goto_5

    :cond_a
    iget-object p0, p0, Lcom/android/server/wm/TaskChangeNotificationController;->mHandler:Lcom/android/server/wm/TaskChangeNotificationController$MainHandler;

    invoke-virtual {p0, v2, p2, p3, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_b
    :goto_5
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :goto_6
    :try_start_4
    monitor-exit v1
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
