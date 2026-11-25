.class public final Lcom/android/server/wm/AppLockController;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final mAppLockFolderBypassTasks:Landroid/util/SparseArray;

.field public final mAppLockLockedPackageStateListener:Lcom/android/server/wm/AppLockController$1;

.field public final mAppLockLockedPackages:Landroid/util/SparseArray;

.field final mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

.field public final mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

.field public final mContext:Landroid/content/Context;

.field final mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

.field public mRecentTasks:Lcom/android/server/wm/RecentTasks;

.field public final mUnlockedAppLockFolders:Landroid/util/SparseArray;

.field public final mWmService:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/wm/WindowManagerService;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mUnlockedAppLockFolders:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    new-instance v0, Lcom/android/server/wm/AppLockController$1;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/server/wm/AppLockController$1;->this$0:Lcom/android/server/wm/AppLockController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackageStateListener:Lcom/android/server/wm/AppLockController$1;

    new-instance v0, Lcom/android/server/wm/AppLockController$2;

    invoke-direct {v0, p0}, Lcom/android/server/wm/AppLockController$2;-><init>(Lcom/android/server/wm/AppLockController;)V

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    iput-object p1, p0, Lcom/android/server/wm/AppLockController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, p1, Lcom/android/server/wm/WindowManagerService;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mContext:Landroid/content/Context;

    iget-object v0, p1, Lcom/android/server/wm/WindowManagerService;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    new-instance v0, Lcom/android/server/wm/AppLockOverlayController;

    invoke-direct {v0, p1}, Lcom/android/server/wm/AppLockOverlayController;-><init>(Lcom/android/server/wm/WindowManagerService;)V

    iput-object v0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    return-void
.end method

.method public static addRecentsDeferredPackages(Ljava/util/List;Lcom/android/server/wm/ActivityRecord;I)V
    .locals 3

    iget v0, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-eq v0, p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v0, :cond_1

    move-object v1, p0

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    move-object v1, p0

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    invoke-virtual {p1}, Lcom/android/server/wm/ActivityRecord;->getTaskFragment()Lcom/android/server/wm/TaskFragment;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-boolean v0, p1, Lcom/android/server/wm/TaskFragment;->mIsEmbedded:Z

    if-eqz v0, :cond_3

    new-instance v0, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p0, v0, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p2, v0, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Lcom/android/server/wm/TaskFragment;->forOtherAdjacentTaskFragments(Ljava/util/function/Consumer;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public final authorizeAppLockFolderBypassForTaskLocked(ILcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V
    .locals 6

    if-eqz p3, :cond_2

    if-eqz p2, :cond_2

    iget v0, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    invoke-virtual {p0, p1, v0}, Lcom/android/server/wm/AppLockController;->isAppLockFolderUnlockedLocked(II)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p2, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget v1, p3, Lcom/android/server/wm/Task;->mUserId:I

    iget v2, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-eq v1, v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    iget v3, p3, Lcom/android/server/wm/Task;->mTaskId:I

    new-instance v4, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, v4, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mTask:Ljava/lang/ref/WeakReference;

    iput-object v0, v4, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mPackageName:Ljava/lang/String;

    iput v2, v4, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mUserId:I

    iput p1, v4, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mFolderId:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    iget p1, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    const-string/jumbo p2, "app-lock-folder-bypass"

    invoke-virtual {p0, p3, v0, p1, p2}, Lcom/android/server/wm/AppLockOverlayController;->finishLockedTaskAppLockOverlaysLocked(Lcom/android/server/wm/Task;Ljava/lang/String;ILjava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public final finishReplacedPipAppLockOverlaysLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;)V
    .locals 3

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v0, :cond_1

    iget-object v1, p2, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-ne v1, v0, :cond_1

    iget-object v1, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget v2, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    invoke-virtual {p0, v2, p2, v1}, Lcom/android/server/wm/AppLockOverlayController;->isTaskLevelAppLockOverlayForPipRestoreLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda1;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object p2, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda1;->f$1:Lcom/android/server/wm/ActivityRecord;

    iput-object p1, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda1;->f$2:Lcom/android/server/wm/ActivityRecord;

    iput-object v1, v2, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda1;->f$3:Ljava/util/ArrayList;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v2}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    const/4 p0, 0x0

    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p0, p1, :cond_1

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    const-string/jumbo p2, "replaced-pip-app-lock-overlay"

    invoke-static {p1, p2}, Lcom/android/server/wm/AppLockOverlayController;->finishActivitySafe(Lcom/android/server/wm/ActivityRecord;Ljava/lang/String;)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public isActivityPermittedToBypassAppLock(Landroid/content/Intent;Landroid/content/pm/ActivityInfo;Ljava/lang/String;IILandroid/os/IBinder;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual/range {p0 .. p7}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Landroid/content/Intent;Landroid/content/pm/ActivityInfo;Ljava/lang/String;IILandroid/os/IBinder;Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    return p0
.end method

.method public final isAppLockFolderBypassedForTaskLocked(Lcom/android/server/wm/Task;Ljava/lang/String;I)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    iget v2, p1, Lcom/android/server/wm/Task;->mTaskId:I

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;

    if-nez v1, :cond_1

    return v0

    :cond_1
    iget-object v2, v1, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/Task;

    if-eq v2, p1, :cond_2

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    iget p1, p1, Lcom/android/server/wm/Task;->mTaskId:I

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    return v0

    :cond_2
    iget p1, v1, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mUserId:I

    if-ne p1, p3, :cond_3

    iget-object p1, v1, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mPackageName:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, v1, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mFolderId:I

    invoke-virtual {p0, p1, p3}, Lcom/android/server/wm/AppLockController;->isAppLockFolderUnlockedLocked(II)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_0
    return v0
.end method

.method public isAppLockFolderUnlockedLocked(II)Z
    .locals 0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mUnlockedAppLockFolders:Landroid/util/SparseArray;

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/SparseBooleanArray;

    const/4 p2, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1, p2}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return p2
.end method

.method public final isPackageLockedByAppLockLocked(ILjava/lang/String;)Z
    .locals 1

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->contains(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArraySet;

    invoke-virtual {p0, p2}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final registerTask(Lcom/android/server/wm/Task;)V
    .locals 6

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskListeners:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    sget-object v0, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    aget-boolean p0, v0, p0

    if-eqz p0, :cond_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v3, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v5

    const-wide v1, 0x7a3a259e8ad83a6cL

    invoke-static/range {v0 .. v5}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Lcom/android/server/wm/AppLockOverlayController$1;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Lcom/android/server/wm/AppLockOverlayController$1;->val$task:Lcom/android/server/wm/Task;

    iput-object p0, v0, Lcom/android/server/wm/AppLockOverlayController$1;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Lcom/android/server/wm/WindowContainer;->registerWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mTaskListeners:Landroid/util/ArrayMap;

    invoke-virtual {p0, p1, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final setAppLockFolderStateLocked(IIZ)V
    .locals 7

    iget-object v0, p0, Lcom/android/server/wm/AppLockController;->mUnlockedAppLockFolders:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseBooleanArray;

    const/4 v1, 0x1

    if-eqz p3, :cond_1

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iget-object v2, p0, Lcom/android/server/wm/AppLockController;->mUnlockedAppLockFolders:Landroid/util/SparseArray;

    invoke-virtual {v2, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {v0, p1, v1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/server/wm/AppLockController;->mUnlockedAppLockFolders:Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->remove(I)V

    :cond_2
    :goto_0
    if-nez p3, :cond_7

    iget-object p3, p0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    invoke-virtual {p3}, Landroid/util/SparseArray;->size()I

    move-result p3

    sub-int/2addr p3, v1

    :goto_1
    if-ltz p3, :cond_7

    iget-object v0, p0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    invoke-virtual {v0, p3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;

    iget v2, v0, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mUserId:I

    if-ne v2, p2, :cond_6

    iget v2, v0, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mFolderId:I

    if-ne v2, p1, :cond_6

    iget-object v2, p0, Lcom/android/server/wm/AppLockController;->mAppLockFolderBypassTasks:Landroid/util/SparseArray;

    invoke-virtual {v2, p3}, Landroid/util/SparseArray;->removeAt(I)V

    iget-object v2, v0, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/Task;

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lcom/android/server/wm/TaskFragment;->isAttached()Z

    move-result v3

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v4, v0, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mPackageName:Ljava/lang/String;

    iget v0, v0, Lcom/android/server/wm/AppLockController$AppLockFolderBypassTask;->mUserId:I

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget v5, v2, Lcom/android/server/wm/Task;->mUserId:I

    if-eq v5, v0, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v2, v1, v1}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v5

    if-nez v5, :cond_4

    goto :goto_2

    :cond_4
    iget-object v6, v2, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v6, :cond_5

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {v5}, Lcom/android/server/wm/ActivityRecord;->canShowWhenLocked()Z

    move-result v5

    if-nez v5, :cond_5

    invoke-virtual {v3, v2, v4, v0}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockTaskOverlay(Lcom/android/server/wm/Task;Ljava/lang/String;I)V

    goto :goto_2

    :cond_5
    new-instance v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;-><init>(B)V

    iput-object v3, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput v0, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iput-object v4, v5, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v2, v5, v1}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;Z)V

    :cond_6
    :goto_2
    add-int/lit8 p3, p3, -0x1

    goto :goto_1

    :cond_7
    return-void
.end method
