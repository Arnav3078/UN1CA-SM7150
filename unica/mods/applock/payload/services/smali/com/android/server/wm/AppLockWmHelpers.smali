.class public final Lcom/android/server/wm/AppLockWmHelpers;
.super Ljava/lang/Object;


# direct methods
.method public static addLockedByAppLockActivityOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)V
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/ActivityRecord;)V

    :cond_0
    return-void
.end method

.method public static applyDeferAppLockOptions(Lcom/android/server/wm/ActivityStartInterceptor;Landroid/content/Intent;Landroid/app/ActivityOptions;)Landroid/app/ActivityOptions;
    .locals 1

    if-eqz p0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mDeferAppLockIntercept:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    if-ne v0, p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    return-object p0

    :cond_0
    return-object p2
.end method

.method public static authorizeFolderBypassIfNeeded(Lcom/android/server/wm/ActivityStarter;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V
    .locals 2

    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/ActivityStarter;->mService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/ActivityStarter;->mInterceptor:Lcom/android/server/wm/ActivityStartInterceptor;

    iget p0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockFolderBypassId:I

    const/4 v1, -0x1

    if-eq p0, v1, :cond_0

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/server/wm/AppLockController;->authorizeAppLockFolderBypassForTaskLocked(ILcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V

    :cond_0
    return-void
.end method

.method public static canDeferEnterAnimationForSplitAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->deferSplitAppLockEnterAnimationCompleteLocked(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static finishKeyguardAppLockOverlaysIfNeeded(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V
    .locals 2

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_1

    iget-object v0, p0, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mKeyguardController:Lcom/android/server/wm/KeyguardController;

    invoke-virtual {p2}, Lcom/android/server/wm/TaskFragment;->getDisplayId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/server/wm/KeyguardController;->isKeyguardLocked(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget v1, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    invoke-virtual {p0, v1, v0}, Lcom/android/server/wm/AppLockController;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p2, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    iget p1, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    const-string/jumbo v1, "app-lock-launch-over-keyguard"

    invoke-virtual {p0, p2, v0, p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->finishLockedTaskAppLockOverlaysLocked(Lcom/android/server/wm/Task;Ljava/lang/String;ILjava/lang/String;)V

    :cond_1
    return-void
.end method

.method public static handleDeferFolderAppLockAliasCheck(Lcom/android/server/wm/ActivityStartInterceptor;)Z
    .locals 1

    if-eqz p0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mDeferAppLockIntercept:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/wm/ActivityStartInterceptor;->getLaunchRootTaskForAppLock()Lcom/android/server/wm/Task;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static handlePipTransitionTask(Lcom/android/server/wm/ChangeTransitionController;Lcom/android/server/wm/ActivityTaskManagerService;Lcom/android/server/wm/Task;Lcom/android/server/wm/TaskDisplayArea;)Z
    .locals 12

    const/4 v0, 0x0

    if-eqz p0, :cond_d

    if-eqz p2, :cond_d

    if-nez p3, :cond_0

    goto/16 :goto_4

    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p2, v1, v0}, Lcom/android/server/wm/Task;->getTopVisibleActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v2

    if-nez v2, :cond_1

    return v0

    :cond_1
    iget-object v3, p0, Lcom/android/server/wm/ChangeTransitionController;->mWm:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz v3, :cond_d

    invoke-static {v2}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v4

    if-nez v4, :cond_2

    return v0

    :cond_2
    invoke-virtual {p2, v0, v1}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v4

    if-nez v4, :cond_3

    return v0

    :cond_3
    iget-object v5, v4, Lcom/android/server/wm/ActivityRecord;->mLastParentBeforePip:Lcom/android/server/wm/Task;

    if-eqz v5, :cond_d

    invoke-virtual {v5}, Lcom/android/server/wm/TaskFragment;->isAttached()Z

    move-result v6

    if-eqz v6, :cond_d

    iget-object v6, v4, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eq v5, v6, :cond_d

    invoke-virtual {p2}, Lcom/android/server/wm/ConfigurationContainer;->getStageType()I

    move-result v6

    invoke-virtual {p3, v6}, Lcom/android/server/wm/TaskDisplayArea;->getTopRootTaskInStageType(I)Lcom/android/server/wm/Task;

    move-result-object v6

    if-eqz v6, :cond_d

    invoke-virtual {p3}, Lcom/android/server/wm/TaskDisplayArea;->isSplitScreenVisible()Z

    move-result v7

    if-nez v7, :cond_4

    goto/16 :goto_4

    :cond_4
    invoke-virtual {p3}, Lcom/android/server/wm/TaskDisplayArea;->getTopRootTask()Lcom/android/server/wm/Task;

    move-result-object p3

    if-eqz p3, :cond_5

    invoke-virtual {p3}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeHomeOrRecents()Z

    move-result p3

    if-eqz p3, :cond_5

    return v1

    :cond_5
    if-eq v4, v2, :cond_8

    iget-object p3, v4, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    iget-boolean v7, v4, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v7, :cond_d

    if-eqz p3, :cond_d

    if-eq p3, v5, :cond_d

    iget v7, p3, Lcom/android/server/wm/Task;->mUserId:I

    iget v8, v5, Lcom/android/server/wm/Task;->mUserId:I

    if-ne v7, v8, :cond_d

    iget v7, v4, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v7, v8, :cond_d

    invoke-virtual {p3}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v7

    invoke-virtual {v5}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v8

    if-eq v7, v8, :cond_6

    goto/16 :goto_4

    :cond_6
    invoke-virtual {p3, v4}, Lcom/android/server/wm/WindowContainer;->getActivityBelow(Lcom/android/server/wm/ActivityRecord;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v7

    if-eqz v7, :cond_7

    return v1

    :cond_7
    invoke-virtual {p3, v4}, Lcom/android/server/wm/WindowContainer;->getActivityAbove(Lcom/android/server/wm/ActivityRecord;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v7

    if-eqz v7, :cond_d

    invoke-virtual {p3, v0, v1}, Lcom/android/server/wm/Task;->getTopVisibleActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object p3

    if-ne v7, p3, :cond_d

    iget-object p3, v4, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz p3, :cond_d

    iget-object v8, v3, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    iget v9, v4, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    invoke-virtual {v8, v9, v7, p3}, Lcom/android/server/wm/AppLockOverlayController;->isTaskLevelAppLockOverlayForPipRestoreLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_8

    return v1

    :cond_8
    invoke-virtual {p1}, Lcom/android/server/wm/ActivityTaskManagerService;->deferWindowLayout()V

    iput-boolean v0, p2, Lcom/android/server/wm/Task;->mIsPipReparetingToLastParent:Z

    if-eq v4, v2, :cond_9

    :try_start_0
    invoke-virtual {v5}, Lcom/android/server/wm/WindowContainer;->getChildCount()I

    move-result p0

    const-string/jumbo p3, "restore-pip-app-lock-overlay"

    invoke-virtual {v2, v5, p0, p3}, Lcom/android/server/wm/ActivityRecord;->reparent(Lcom/android/server/wm/TaskFragment;ILjava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_9
    :goto_0
    invoke-virtual {v5}, Lcom/android/server/wm/WindowContainer;->getParent()Lcom/android/server/wm/WindowContainer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string/jumbo p3, "restoreLastParentBeforePip"

    if-eq p0, v6, :cond_a

    const p0, 0x7fffffff

    :try_start_1
    invoke-virtual {v5, p0, v6, p3, v1}, Lcom/android/server/wm/Task;->reparent(ILcom/android/server/wm/Task;Ljava/lang/String;Z)V

    :cond_a
    iget-object p0, p2, Lcom/android/server/wm/WindowContainer;->mSurfaceControl:Landroid/view/SurfaceControl;

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-virtual {p2}, Lcom/android/server/wm/WindowContainer;->getSyncTransaction()Landroid/view/SurfaceControl$Transaction;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, p0, v7}, Landroid/view/SurfaceControl$Transaction;->setShadowRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    move-result-object v6

    new-instance v7, Landroid/gui/BoxShadowSettings;

    invoke-direct {v7}, Landroid/gui/BoxShadowSettings;-><init>()V

    invoke-virtual {v6, p0, v7}, Landroid/view/SurfaceControl$Transaction;->setBoxShadowSettings(Landroid/view/SurfaceControl;Landroid/gui/BoxShadowSettings;)Landroid/view/SurfaceControl$Transaction;

    move-result-object v6

    new-instance v7, Landroid/gui/BorderSettings;

    invoke-direct {v7}, Landroid/gui/BorderSettings;-><init>()V

    invoke-virtual {v6, p0, v7}, Landroid/view/SurfaceControl$Transaction;->setBorderSettings(Landroid/view/SurfaceControl;Landroid/gui/BorderSettings;)Landroid/view/SurfaceControl$Transaction;

    :cond_b
    invoke-virtual {v5}, Lcom/android/server/wm/WindowContainer;->getChildCount()I

    move-result p0

    invoke-virtual {v4, v5, p0, p3}, Lcom/android/server/wm/ActivityRecord;->reparent(Lcom/android/server/wm/TaskFragment;ILjava/lang/String;)V

    if-eq v4, v2, :cond_c

    invoke-virtual {v3, v4, v2}, Lcom/android/server/wm/AppLockController;->finishReplacedPipAppLockOverlaysLocked(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;)V

    :cond_c
    const/4 p0, 0x0

    invoke-virtual {v5, p3, p0}, Lcom/android/server/wm/Task;->moveToFront(Ljava/lang/String;Lcom/android/server/wm/Task;)V

    invoke-virtual {v5}, Lcom/android/server/wm/WindowContainer;->getSyncTransaction()Landroid/view/SurfaceControl$Transaction;

    move-result-object p0

    iget-object p3, v5, Lcom/android/server/wm/WindowContainer;->mSurfaceControl:Landroid/view/SurfaceControl;

    invoke-virtual {p0, p3}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iput-boolean v0, p2, Lcom/android/server/wm/Task;->mIsPipReparetingToLastParent:Z

    invoke-virtual {p1}, Lcom/android/server/wm/ActivityTaskManagerService;->continueWindowLayout()V

    return v1

    :goto_3
    iput-boolean v0, p2, Lcom/android/server/wm/Task;->mIsPipReparetingToLastParent:Z

    invoke-virtual {p1}, Lcom/android/server/wm/ActivityTaskManagerService;->continueWindowLayout()V

    throw p0

    :cond_d
    :goto_4
    return v0
.end method

.method public static handleTaskConfigChangedAppLock(Lcom/android/server/wm/Task;Z)V
    .locals 6

    if-eqz p0, :cond_6

    iget-object v0, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v1

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    const-class v2, Landroid/app/AppLockInternal;

    invoke-static {v2}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AppLockInternal;

    if-eqz v2, :cond_6

    iget-object v3, p0, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v3, :cond_6

    iget v3, p0, Lcom/android/server/wm/Task;->mUserId:I

    invoke-interface {v2, v3}, Landroid/app/AppLockInternal;->getAppLockEnabledPackagesForUser(I)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_2

    :cond_1
    if-nez v1, :cond_3

    invoke-virtual {p0}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/android/server/wm/Task;->mUserId:I

    new-instance v3, Landroid/util/ArraySet;

    invoke-direct {v3}, Landroid/util/ArraySet;-><init>()V

    iget-object v4, v0, Lcom/android/server/wm/AppLockOverlayController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, p0, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3, v5}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    :cond_2
    new-instance v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;

    const/4 v5, 0x4

    invoke-direct {v4, v5}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;-><init>(B)V

    iput-object v0, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput v2, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$1:I

    iput-object v3, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, v4}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    const/4 v4, 0x0

    :goto_0
    invoke-virtual {v3}, Landroid/util/ArraySet;->size()I

    move-result v5

    if-ge v4, v5, :cond_3

    invoke-virtual {v3, v4}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v2, v5}, Lcom/android/server/wm/AppLockOverlayController;->lockActivitiesTasksForAppLock(ILjava/lang/String;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    iget v2, p0, Lcom/android/server/wm/Task;->mUserId:I

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, p0, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    new-instance v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;-><init>(B)V

    iput-object v3, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda7;->f$0:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, v4}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_1

    :cond_5
    invoke-virtual {p0}, Lcom/android/server/wm/Task;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object v0, v0, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v0, v0, Lcom/android/server/wm/ActivityTaskManagerService;->mH:Lcom/android/server/wm/ActivityTaskManagerService$H;

    new-instance v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object p0, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$0:Ljava/lang/String;

    iput-boolean v1, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$1:Z

    iput-object v3, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$2:Ljava/util/ArrayList;

    iput v2, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda8;->f$3:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_6
    :goto_1
    :goto_2
    return-void
.end method

.method public static initWmsAppLock(Lcom/android/server/wm/WindowManagerService;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/android/server/wm/AppLockController;

    invoke-direct {v0, p0}, Lcom/android/server/wm/AppLockController;-><init>(Lcom/android/server/wm/WindowManagerService;)V

    iput-object v0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    new-instance v0, Lcom/android/server/wm/AppLockBiometricFocusController;

    iget-object v1, p0, Lcom/android/server/wm/WindowManagerService;->mH:Lcom/android/server/wm/WindowManagerService$H;

    invoke-direct {v0, p0, v1}, Lcom/android/server/wm/AppLockBiometricFocusController;-><init>(Lcom/android/server/wm/WindowManagerService;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockBiometricFocusController:Lcom/android/server/wm/AppLockBiometricFocusController;

    return-void
.end method

.method public static interceptAppLockIfNeededLocked(Lcom/android/server/wm/ActivityStartInterceptor;)Z
    .locals 23

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserManager:Landroid/os/UserManager;

    iget v2, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    invoke-static {v2}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/UserManager;->isQuietModeEnabled(Landroid/os/UserHandle;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v1, :cond_25

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v1, :cond_1

    goto/16 :goto_13

    :cond_1
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v3, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v4, v3, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget v5, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    invoke-virtual {v4, v5, v1}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    return v2

    :cond_3
    iget-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mPresumableLaunchDisplayArea:Lcom/android/server/wm/TaskDisplayArea;

    if-eqz v4, :cond_4

    iget-object v4, v4, Lcom/android/server/wm/WindowContainer;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    iget v4, v4, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    goto :goto_0

    :cond_4
    move v4, v2

    :goto_0
    iget-object v5, v3, Lcom/android/server/wm/ActivityTaskManagerService;->mKeyguardController:Lcom/android/server/wm/KeyguardController;

    invoke-virtual {v5, v4}, Lcom/android/server/wm/KeyguardController;->isKeyguardLocked(I)Z

    move-result v5

    if-eqz v5, :cond_5

    return v2

    :cond_5
    sget-boolean v5, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    const/4 v6, -0x1

    if-eqz v5, :cond_8

    iget-object v5, v3, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz v5, :cond_8

    iget-object v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    const-string/jumbo v8, "com.android.server.wm.extra.APP_LOCK_LAUNCH_FOLDER_ID"

    if-eqz v7, :cond_6

    invoke-virtual {v7, v8}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-virtual {v7, v8, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    invoke-virtual {v7, v8}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    if-eq v9, v6, :cond_6

    iget v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRealCallingUid:I

    invoke-static {v7}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v8

    iget v10, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    if-ne v8, v10, :cond_6

    iget-object v8, v5, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    invoke-virtual {v8}, Lcom/android/server/wm/ActivityTaskManagerService;->getPackageManagerInternalLocked()Landroid/content/pm/PackageManagerInternal;

    move-result-object v8

    if-eqz v8, :cond_6

    invoke-virtual {v8, v10}, Landroid/content/pm/PackageManagerInternal;->getDefaultHomeActivity(I)Landroid/content/ComponentName;

    move-result-object v11

    if-eqz v11, :cond_6

    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v11

    iget-object v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingPackage:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    const-wide/16 v12, 0x0

    invoke-virtual {v8, v11, v12, v13, v10}, Landroid/content/pm/PackageManagerInternal;->getPackageUid(Ljava/lang/String;JI)I

    move-result v8

    if-ltz v8, :cond_6

    invoke-static {v7, v8}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v7

    if-eqz v7, :cond_6

    iget-object v7, v5, Lcom/android/server/wm/AppLockController;->mContext:Landroid/content/Context;

    const-string/jumbo v11, "android.permission.LOCK_APPS"

    invoke-virtual {v7, v11, v6, v8}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v5, v9, v10}, Lcom/android/server/wm/AppLockController;->isAppLockFolderUnlockedLocked(II)Z

    move-result v5

    if-eqz v5, :cond_6

    goto :goto_1

    :cond_6
    move v9, v6

    :goto_1
    iput v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockFolderBypassId:I

    if-eq v9, v6, :cond_7

    return v2

    :cond_7
    :cond_8
    iget-object v5, v3, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v7, v5, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz v7, :cond_b

    iget-object v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    iget-object v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mResolvedType:Ljava/lang/String;

    iget v11, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    iget-object v5, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mOriginatingPendingIntent:Lcom/android/server/am/PendingIntentRecord;

    if-eqz v5, :cond_9

    invoke-virtual {v5}, Landroid/content/IIntentSender$Stub;->asBinder()Landroid/os/IBinder;

    move-result-object v5

    move-object v13, v5

    goto :goto_2

    :cond_9
    const/4 v13, 0x0

    :goto_2
    iget-object v14, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mSourceRecord:Lcom/android/server/wm/ActivityRecord;

    move v12, v4

    invoke-virtual/range {v7 .. v14}, Lcom/android/server/wm/AppLockController;->isActivityPermittedToBypassAppLock(Landroid/content/Intent;Landroid/content/pm/ActivityInfo;Ljava/lang/String;IILandroid/os/IBinder;Lcom/android/server/wm/ActivityRecord;)Z

    move-result v5

    if-eqz v5, :cond_b

    iget-object v5, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserManager:Landroid/os/UserManager;

    iget v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    invoke-virtual {v5, v7}, Landroid/os/UserManager;->isUserUnlocked(I)Z

    move-result v5

    if-nez v5, :cond_a

    iget-object v5, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAInfo:Landroid/content/pm/ActivityInfo;

    iget-boolean v5, v5, Landroid/content/pm/ActivityInfo;->directBootAware:Z

    if-eqz v5, :cond_b

    :cond_a
    return v2

    :cond_b
    const/4 v5, 0x1

    iget-object v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-eqz v7, :cond_c

    invoke-virtual {v7}, Landroid/app/ActivityOptions;->getLaunchedFromBubble()Z

    move-result v7

    if-eqz v7, :cond_c

    :goto_3
    move v7, v5

    goto/16 :goto_6

    :cond_c
    invoke-virtual {v0}, Lcom/android/server/wm/ActivityStartInterceptor;->getLaunchRootTaskForAppLock()Lcom/android/server/wm/Task;

    move-result-object v7

    if-eqz v7, :cond_d

    invoke-virtual {v7}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v7

    goto/16 :goto_6

    :cond_d
    iget-object v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mSourceRecord:Lcom/android/server/wm/ActivityRecord;

    if-eqz v7, :cond_12

    iget-boolean v8, v7, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v8, :cond_12

    iget v8, v7, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    iget v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    if-ne v8, v9, :cond_12

    iget-object v8, v7, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_12

    iget-object v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mInTask:Lcom/android/server/wm/Task;

    if-nez v8, :cond_12

    iget-object v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mInTaskFragment:Lcom/android/server/wm/TaskFragment;

    if-nez v8, :cond_12

    iget v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRequestCode:I

    if-gez v8, :cond_12

    iget-object v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    if-eqz v8, :cond_12

    invoke-virtual {v8}, Landroid/content/Intent;->getFlags()I

    move-result v9

    and-int/lit16 v9, v9, 0x1000

    if-nez v9, :cond_12

    invoke-virtual {v8}, Landroid/content/Intent;->getLaunchOverTargetTaskId()I

    move-result v8

    if-ne v8, v6, :cond_12

    iget-object v8, v7, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v8, :cond_e

    invoke-virtual {v8}, Lcom/android/server/wm/Task;->getCreatedByOrganizerTask()Lcom/android/server/wm/Task;

    move-result-object v8

    goto :goto_4

    :cond_e
    const/4 v8, 0x0

    :goto_4
    if-eqz v8, :cond_12

    invoke-virtual {v8}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result v9

    if-eqz v9, :cond_12

    iget-object v9, v8, Lcom/android/server/wm/WindowContainer;->mRemoteToken:Lcom/android/server/wm/WindowContainer$RemoteToken;

    if-eqz v9, :cond_12

    iget-object v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-eqz v9, :cond_10

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getLaunchRootTask()Landroid/window/WindowContainerToken;

    move-result-object v10

    if-nez v10, :cond_12

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getLaunchTaskId()I

    move-result v10

    if-ne v10, v6, :cond_12

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getLaunchTaskFragmentToken()Landroid/os/IBinder;

    move-result-object v10

    if-nez v10, :cond_12

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getLaunchTaskDisplayArea()Landroid/window/WindowContainerToken;

    move-result-object v10

    if-nez v10, :cond_12

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getLaunchBounds()Landroid/graphics/Rect;

    move-result-object v10

    if-nez v10, :cond_12

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getLaunchWindowingMode()I

    move-result v10

    if-nez v10, :cond_12

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getForceLaunchWindowingMode()I

    move-result v10

    if-nez v10, :cond_12

    invoke-virtual {v9}, Landroid/app/ActivityOptions;->getLaunchDisplayId()I

    move-result v9

    if-eq v9, v6, :cond_10

    invoke-virtual {v7}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v10

    if-eq v9, v10, :cond_10

    goto :goto_5

    :cond_10
    iget-object v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-nez v9, :cond_11

    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v9

    iput-object v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    :cond_11
    iget-object v8, v8, Lcom/android/server/wm/WindowContainer;->mRemoteToken:Lcom/android/server/wm/WindowContainer$RemoteToken;

    invoke-virtual {v8}, Lcom/android/server/wm/WindowContainer$RemoteToken;->toWindowContainerToken()Landroid/window/WindowContainerToken;

    move-result-object v8

    invoke-virtual {v9, v8}, Landroid/app/ActivityOptions;->setLaunchRootTask(Landroid/window/WindowContainerToken;)Landroid/app/ActivityOptions;

    iget-object v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    invoke-virtual {v7}, Lcom/android/server/wm/ActivityRecord;->getDisplayId()I

    move-result v7

    invoke-virtual {v8, v7}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    goto/16 :goto_3

    :cond_12
    :goto_5
    move v7, v2

    :goto_6
    if-eqz v7, :cond_13

    iput-boolean v5, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mDeferAppLockIntercept:Z

    return v2

    :cond_13
    invoke-virtual {v0}, Lcom/android/server/wm/ActivityStartInterceptor;->interceptMultiWindowAliasActivityIfNeeded()Z

    iget v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRequestCode:I

    if-ltz v7, :cond_14

    iget-object v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    if-eqz v7, :cond_14

    const/high16 v8, 0x2000000

    invoke-virtual {v7, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_14
    iget-object v7, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    const/high16 v8, 0x10000000

    if-eqz v7, :cond_16

    iget-object v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mSourceRecord:Lcom/android/server/wm/ActivityRecord;

    if-nez v9, :cond_15

    iget-object v9, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mInTask:Lcom/android/server/wm/Task;

    if-nez v9, :cond_15

    invoke-virtual {v7}, Landroid/content/Intent;->getFlags()I

    move-result v9

    and-int/2addr v9, v8

    if-nez v9, :cond_15

    invoke-virtual {v7, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_15
    const-string/jumbo v9, "com.android.internal.app.extra.APP_LOCK_ORIGINAL_CALLING_UID"

    iget v10, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingUid:I

    invoke-virtual {v7, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string/jumbo v9, "com.android.internal.app.extra.APP_LOCK_ORIGINAL_CALLING_PID"

    iget v10, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingPid:I

    invoke-virtual {v7, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_16
    if-eqz v7, :cond_17

    invoke-virtual {v7}, Landroid/content/Intent;->getLaunchOverTargetTaskId()I

    move-result v9

    goto :goto_7

    :cond_17
    move v9, v6

    :goto_7
    iget-object v10, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mPresumableLaunchDisplayArea:Lcom/android/server/wm/TaskDisplayArea;

    if-eqz v10, :cond_18

    iget-object v10, v10, Lcom/android/server/wm/WindowContainer;->mDisplayContent:Lcom/android/server/wm/DisplayContent;

    iget v10, v10, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    move v11, v10

    goto :goto_8

    :cond_18
    move v11, v6

    :goto_8
    iget-object v10, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;

    invoke-virtual {v10}, Lcom/android/server/wm/ActivityTaskSupervisor;->getVirtualDeviceManagerInternal()Lcom/android/server/companion/virtual/VirtualDeviceManagerInternal;

    move-result-object v12

    if-eqz v12, :cond_19

    invoke-virtual {v12, v4}, Lcom/android/server/companion/virtual/VirtualDeviceManagerInternal;->isComputerControlDisplay(I)Z

    move-result v12

    if-eqz v12, :cond_19

    move/from16 v22, v5

    goto :goto_9

    :cond_19
    move/from16 v22, v2

    :goto_9
    if-eqz v7, :cond_1c

    if-nez v22, :cond_1c

    iget-object v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mSourceRecord:Lcom/android/server/wm/ActivityRecord;

    if-nez v12, :cond_1c

    iget-object v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mInTask:Lcom/android/server/wm/Task;

    if-nez v12, :cond_1c

    iget v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRequestCode:I

    if-gez v12, :cond_1c

    iget-object v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockPendingIntents:[Landroid/content/Intent;

    if-nez v12, :cond_1c

    invoke-virtual {v7}, Landroid/content/Intent;->getFlags()I

    move-result v12

    const/high16 v13, 0x100000

    and-int/2addr v12, v13

    if-nez v12, :cond_1c

    const-string/jumbo v12, "android.intent.action.MAIN"

    invoke-virtual {v7}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1a

    const-string/jumbo v12, "android.intent.category.LAUNCHER"

    invoke-virtual {v7, v12}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_1c

    const-string/jumbo v12, "android.intent.category.INFO"

    invoke-virtual {v7, v12}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_1c

    :cond_1a
    iget v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRealCallingUid:I

    invoke-virtual {v3, v12}, Lcom/android/server/wm/ActivityTaskManagerService;->isCallerRecents(I)Z

    move-result v12

    if-nez v12, :cond_1c

    iget-object v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-eqz v12, :cond_1b

    invoke-virtual {v12}, Landroid/app/ActivityOptions;->getLaunchTaskId()I

    move-result v12

    if-ne v12, v6, :cond_1c

    :cond_1b
    invoke-virtual {v7}, Landroid/content/Intent;->getLaunchOverTargetTaskId()I

    move-result v12

    if-ne v12, v6, :cond_1c

    iget-object v12, v3, Lcom/android/server/wm/ActivityTaskManagerService;->mAmInternal:Landroid/app/ActivityManagerInternal;

    iget v13, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    invoke-virtual {v12, v13}, Landroid/app/ActivityManagerInternal;->isCurrentProfile(I)Z

    move-result v12

    if-eqz v12, :cond_1c

    iget-object v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mPresumableLaunchDisplayArea:Lcom/android/server/wm/TaskDisplayArea;

    invoke-virtual {v12}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v12

    if-eqz v12, :cond_1c

    iget-object v13, v12, Lcom/android/server/wm/DisplayContent;->mDisplay:Landroid/view/Display;

    invoke-virtual {v13}, Landroid/view/Display;->isTrusted()Z

    move-result v13

    if-eqz v13, :cond_1c

    const-string v13, "Display-off"

    invoke-virtual {v12, v13}, Lcom/android/server/wm/DisplayContent;->hasSleepToken(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_1d

    iget-object v13, v12, Lcom/android/server/wm/DisplayContent;->mAllSleepTokens:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_1c

    iget-object v13, v12, Lcom/android/server/wm/DisplayContent;->mDisplayPolicy:Lcom/android/server/wm/DisplayPolicy;

    iget-boolean v13, v13, Lcom/android/server/wm/DisplayPolicy;->mAwake:Z

    if-nez v13, :cond_1c

    goto :goto_a

    :cond_1c
    move v4, v6

    goto :goto_b

    :cond_1d
    :goto_a
    iget-object v13, v3, Lcom/android/server/wm/ActivityTaskManagerService;->mKeyguardController:Lcom/android/server/wm/KeyguardController;

    iget v12, v12, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    invoke-virtual {v13, v12}, Lcom/android/server/wm/KeyguardController;->isKeyguardLocked(I)Z

    move-result v12

    if-nez v12, :cond_1c

    :goto_b
    iput v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockWakeDisplayId:I

    if-eq v9, v6, :cond_1e

    move v13, v9

    goto :goto_c

    :cond_1e
    if-eq v11, v6, :cond_1f

    move v13, v11

    goto :goto_c

    :cond_1f
    move v13, v2

    :goto_c
    iget-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-eqz v4, :cond_20

    invoke-virtual {v4}, Landroid/app/ActivityOptions;->getAnimationType()I

    move-result v4

    const/16 v12, 0xc

    if-ne v4, v12, :cond_20

    const/4 v4, 0x0

    iput-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    invoke-static {}, Landroid/app/ActivityOptions;->makeOpenCrossProfileAppsAnimation()Landroid/app/ActivityOptions;

    move-result-object v4

    goto :goto_d

    :cond_20
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v4

    :goto_d
    invoke-virtual {v4, v5}, Landroid/app/ActivityOptions;->setPendingIntentCreatorBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    invoke-virtual {v0}, Lcom/android/server/wm/ActivityStartInterceptor;->getLaunchTaskFragment()Lcom/android/server/wm/TaskFragment;

    move-result-object v12

    if-eqz v12, :cond_21

    iget-object v12, v12, Lcom/android/server/wm/TaskFragment;->mFragmentToken:Landroid/os/IBinder;

    invoke-virtual {v4, v12}, Landroid/app/ActivityOptions;->setLaunchTaskFragmentToken(Landroid/os/IBinder;)Landroid/app/ActivityOptions;

    :cond_21
    if-eq v11, v6, :cond_22

    invoke-virtual {v4, v11}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    :cond_22
    iget-object v11, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-eqz v11, :cond_24

    sget-boolean v12, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_REMOTE_TRANSITION:Z

    if-eqz v12, :cond_23

    invoke-virtual {v11}, Landroid/app/ActivityOptions;->getRemoteTransition()Landroid/window/RemoteTransition;

    move-result-object v12

    if-eqz v12, :cond_23

    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Landroid/app/ActivityOptions;->setRemoteTransition(Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    invoke-virtual {v4, v12}, Landroid/app/ActivityOptions;->setRemoteTransition(Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    sget-boolean v12, Lcom/samsung/android/rune/CoreRune;->FW_SHELL_TRANSITION_RAPID_LAUNCH:Z

    if-eqz v12, :cond_23

    invoke-virtual {v11}, Landroid/app/ActivityOptions;->getRapidLaunch()Z

    move-result v12

    if-eqz v12, :cond_23

    invoke-virtual {v4, v5}, Landroid/app/ActivityOptions;->setRapidLaunch(Z)Landroid/app/ActivityOptions;

    invoke-virtual {v11, v2}, Landroid/app/ActivityOptions;->setRapidLaunch(Z)Landroid/app/ActivityOptions;

    :cond_23
    invoke-virtual {v11}, Landroid/app/ActivityOptions;->getSceneTransitionInfo()Landroid/app/ActivityOptions$SceneTransitionInfo;

    move-result-object v12

    if-eqz v12, :cond_24

    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Landroid/app/ActivityOptions;->setSceneTransitionInfo(Landroid/app/ActivityOptions$SceneTransitionInfo;)Landroid/app/ActivityOptions;

    invoke-virtual {v4, v12}, Landroid/app/ActivityOptions;->setSceneTransitionInfo(Landroid/app/ActivityOptions$SceneTransitionInfo;)Landroid/app/ActivityOptions;

    :cond_24
    iget-object v11, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-eqz v11, :cond_25_b

    invoke-virtual {v11}, Landroid/app/ActivityOptions;->isStartedFromWindowTypeLauncher()Z

    move-result v11

    if-eqz v11, :cond_25_b

    invoke-virtual {v4, v5}, Landroid/app/ActivityOptions;->setStartedFromWindowTypeLauncher(Z)V

    :cond_25_b
    new-array v14, v5, [Landroid/content/Intent;

    iget-object v11, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    aput-object v11, v14, v2

    new-array v15, v5, [Ljava/lang/String;

    iget-object v11, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mResolvedType:Ljava/lang/String;

    aput-object v11, v15, v2

    const-string/jumbo v11, "app_lock"

    iget-object v6, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockPendingIntents:[Landroid/content/Intent;

    if-eqz v6, :cond_26

    const-class v11, Landroid/content/Intent;

    const/4 v5, 0x2

    new-array v8, v5, [[Landroid/content/Intent;

    aput-object v14, v8, v2

    const/4 v14, 0x1

    aput-object v6, v8, v14

    invoke-static {v11, v8}, Lcom/android/internal/util/ArrayUtils;->concat(Ljava/lang/Class;[[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    move-object v14, v6

    check-cast v14, [Landroid/content/Intent;

    const-class v6, Ljava/lang/String;

    iget-object v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockPendingResolvedTypes:[Ljava/lang/String;

    new-array v5, v5, [[Ljava/lang/String;

    aput-object v15, v5, v2

    const/4 v11, 0x1

    aput-object v8, v5, v11

    invoke-static {v6, v5}, Lcom/android/internal/util/ArrayUtils;->concat(Ljava/lang/Class;[[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, [Ljava/lang/String;

    const-string/jumbo v11, "app_lock_batch"

    :cond_26
    move-object/from16 v19, v11

    move-object/from16 v20, v14

    move-object/from16 v21, v15

    iget v12, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingUid:I

    iget v5, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    invoke-virtual {v4}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v15

    const/4 v11, 0x2

    const/high16 v14, 0x14000000

    const/16 v16, 0x0

    iget-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingPackage:Ljava/lang/String;

    iget-object v8, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingFeatureId:Ljava/lang/String;

    move-object/from16 v17, v4

    move-object/from16 v18, v8

    move v2, v9

    move-object v6, v10

    move-object v10, v3

    move v13, v5

    invoke-static/range {v10 .. v21}, Lcom/android/server/wm/AppLockWmHelpers;->createInterceptorPendingIntent(Lcom/android/server/wm/ActivityTaskManagerService;IIIILandroid/os/Bundle;Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Landroid/content/Intent;[Ljava/lang/String;)Lcom/android/server/am/PendingIntentRecord;

    move-result-object v4

    new-instance v8, Landroid/content/IntentSender;

    invoke-direct {v8, v4}, Landroid/content/IntentSender;-><init>(Landroid/content/IIntentSender;)V

    if-eqz v22, :cond_28

    invoke-static {v1, v5, v8}, Lcom/android/internal/app/LockedAppActivity;->createLockedTaskInterceptIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object v4

    goto :goto_e

    :cond_28
    invoke-static {v1, v5, v8}, Lcom/android/internal/app/LockedAppActivity;->createLockedAppActivityIntent(Ljava/lang/String;ILandroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object v4

    :goto_e
    iput-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    iget v5, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRequestCode:I

    if-ltz v5, :cond_29

    const-string/jumbo v5, "com.android.internal.app.extra.EXPECTS_RESULT"

    const/4 v8, 0x1

    invoke-virtual {v4, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_29
    iget-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    if-nez v4, :cond_2a

    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v4

    iput-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    :cond_2a
    const/4 v5, 0x1

    invoke-virtual {v4, v5, v5}, Landroid/app/ActivityOptions;->setTaskOverlay(ZZ)V

    iget-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mInTask:Lcom/android/server/wm/Task;

    const/high16 v5, 0x18000000

    if-nez v4, :cond_2e

    iget-object v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mSourceRecord:Lcom/android/server/wm/ActivityRecord;

    if-eqz v4, :cond_2c

    invoke-virtual {v4}, Lcom/android/server/wm/ActivityRecord;->isNoHistory()Z

    move-result v8

    if-nez v8, :cond_2c

    iget-object v8, v4, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v8, :cond_2c

    iget v9, v8, Lcom/android/server/wm/Task;->mUserId:I

    iget v10, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    if-ne v9, v10, :cond_2c

    iget-object v3, v3, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz v3, :cond_2c

    iget-object v9, v4, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c

    iget-object v1, v3, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    const/4 v3, 0x0

    invoke-virtual {v1, v4, v3}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;Z)Z

    move-result v1

    if-eqz v1, :cond_2c

    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    iget v3, v8, Lcom/android/server/wm/Task;->mTaskId:I

    invoke-virtual {v1, v3}, Landroid/app/ActivityOptions;->setLaunchTaskId(I)V

    :cond_2b
    const/4 v1, 0x0

    goto :goto_f

    :cond_2c
    iget v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRequestCode:I

    if-gez v1, :cond_2b

    if-eqz v4, :cond_2b

    iget-object v1, v4, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v1, :cond_2d

    invoke-virtual {v1}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeHome()Z

    move-result v3

    if-nez v3, :cond_2c_a

    invoke-virtual {v1}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeRecents()Z

    move-result v1

    if-eqz v1, :cond_2d

    :cond_2c_a
    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto :goto_f

    :cond_2d
    invoke-virtual {v4}, Lcom/android/server/wm/ActivityRecord;->isNoHistory()Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto :goto_f

    :cond_2e
    iget v1, v4, Lcom/android/server/wm/Task;->mTaskId:I

    iget-object v3, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;

    invoke-virtual {v3, v1}, Landroid/app/ActivityOptions;->setLaunchTaskId(I)V

    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    const-string/jumbo v3, "com.android.internal.app.extra.IN_TARGET_TASK"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :goto_f
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIsInterceptedForAliasActivity:Z

    const/4 v1, -0x1

    if-eq v2, v1, :cond_2f

    if-eqz v7, :cond_2f

    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    invoke-virtual {v7}, Landroid/content/Intent;->getForceLaunchOverTargetTask()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->semSetLaunchOverTargetTask(IZ)V

    :cond_2f
    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mInTask:Lcom/android/server/wm/Task;

    if-eqz v1, :cond_30

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v2}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v1

    if-nez v1, :cond_31

    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    const-string/jumbo v3, "com.android.internal.app.extra.SEND_INTENT_IN_LOCKED_TASK_MODE"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_10

    :cond_30
    const/4 v2, 0x1

    :cond_31
    :goto_10
    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    const-string/jumbo v3, "com.android.internal.app.extra.EXTRA_DISABLE_SPLASH_SCREEN"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz v7, :cond_32

    invoke-virtual {v7}, Landroid/content/Intent;->getFlags()I

    move-result v1

    const/high16 v2, 0x10000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_32

    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_32
    iget v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRealCallingPid:I

    iput v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingPid:I

    iget v2, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRealCallingUid:I

    iput v2, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingUid:I

    const/4 v3, 0x0

    iput-object v3, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mResolvedType:Ljava/lang/String;

    iget-object v14, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    iget v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mUserId:I

    const/16 v17, 0x0

    move-object v12, v6

    move-object v13, v14

    move-object v14, v3

    move v15, v4

    move/from16 v16, v17

    move/from16 v17, v2

    move/from16 v18, v1

    invoke-virtual/range {v12 .. v18}, Lcom/android/server/wm/ActivityTaskSupervisor;->resolveIntent(Landroid/content/Intent;Ljava/lang/String;IIII)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mRInfo:Landroid/content/pm/ResolveInfo;

    iget-object v2, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    iget v4, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mStartFlags:I

    invoke-virtual {v6, v2, v1, v4, v3}, Lcom/android/server/wm/ActivityTaskSupervisor;->resolveActivity(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;ILandroid/app/ProfilerInfo;)Landroid/content/pm/ActivityInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAInfo:Landroid/content/pm/ActivityInfo;

    const/4 v0, 0x1

    return v0

    :cond_25
    :goto_13
    const/4 v0, 0x0

    return v0
.end method

.method private static createInterceptorPendingIntent(Lcom/android/server/wm/ActivityTaskManagerService;IIIILandroid/os/Bundle;Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Landroid/content/Intent;[Ljava/lang/String;)Lcom/android/server/am/PendingIntentRecord;
    .locals 13

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    const/4 v4, 0x0

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    invoke-virtual/range {v0 .. v12}, Lcom/android/server/wm/ActivityTaskManagerService;->getIntentSenderLocked(IIIIILandroid/os/Bundle;Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Landroid/content/Intent;[Ljava/lang/String;)Lcom/android/server/am/PendingIntentRecord;

    move-result-object v0

    return-object v0
.end method

.method public static isActivityAppLockOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isActivityLockedByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityLockedByAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isActivityOverlayOrLockedTaskOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 1

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_1

    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_0

    return v0

    :cond_0
    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isAnyActivityLockedForBack(Lcom/android/server/wm/WindowManagerService;Ljava/util/ArrayList;)Z
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_0
    if-ltz v1, :cond_2

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/ActivityRecord;

    iget-object v3, v3, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v3, :cond_1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/wm/ActivityRecord;

    iget v3, v3, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/ActivityRecord;

    iget-object v0, v0, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v3, v0}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v2

    :cond_1
    add-int/lit8 v1, v1, -0x1

    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    :goto_1
    return v0
.end method

.method public static isLockedTaskAppLockOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayLocked(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static markDeferAppLockOnRecord(Lcom/android/server/wm/ActivityStartInterceptor;Lcom/android/server/wm/ActivityRecord;)V
    .locals 1

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mDeferAppLockIntercept:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mIntent:Landroid/content/Intent;

    iget-object v0, p1, Lcom/android/server/wm/ActivityRecord;->intent:Landroid/content/Intent;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    iput-boolean p0, p1, Lcom/android/server/wm/ActivityRecord;->mDeferAppLockIntercept:Z

    :cond_0
    return-void
.end method

.method public static onActivityRecordInitExtras(Lcom/android/server/wm/ActivityRecord;)V
    .locals 3

    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_APPLOCK:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/ActivityRecord;->info:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    const-string/jumbo v1, "com.samsung.android.applock.not_to_be_top_for_AppLock_exception"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mNotToBeTopForAppLockException:Z

    :cond_0
    return-void
.end method

.method public static onDisplayFocusedAppChanged(Lcom/android/server/wm/DisplayContent;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;)V
    .locals 8

    if-nez p0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget p0, p0, Lcom/android/server/wm/DisplayContent;->mDisplayId:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeRecents()Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v1

    goto :goto_0

    :cond_2
    move v3, v2

    :goto_0
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeRecents()Z

    move-result v4

    if-eqz v4, :cond_3

    move v4, v1

    goto :goto_1

    :cond_3
    move v4, v2

    :goto_1
    if-nez v3, :cond_4

    if-nez v4, :cond_4

    if-eqz p2, :cond_4

    return-void

    :cond_4
    if-eqz v3, :cond_5

    if-eqz v4, :cond_5

    iget v3, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    iget v5, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v3, v5, :cond_5

    return-void

    :cond_5
    const-class v3, Landroid/app/AppLockInternal;

    invoke-static {v3}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/AppLockInternal;

    if-nez v3, :cond_6

    return-void

    :cond_6
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    if-eqz v4, :cond_b

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeHome()Z

    move-result v4

    if-eqz v4, :cond_7

    iget-object v4, v0, Lcom/android/server/wm/AppLockController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v4, v4, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowOrganizerController:Lcom/android/server/wm/WindowOrganizerController;

    iget-object v4, v4, Lcom/android/server/wm/WindowOrganizerController;->mTransitionController:Lcom/android/server/wm/TransitionController;

    invoke-virtual {p2}, Lcom/android/server/wm/WindowContainer;->getDisplayContent()Lcom/android/server/wm/DisplayContent;

    move-result-object v6

    if-eqz v6, :cond_7

    invoke-virtual {v4, p1}, Lcom/android/server/wm/TransitionController;->isTransientLaunch(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v7

    if-eqz v7, :cond_7

    new-instance v7, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda2;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v4, v7, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda2;->f$0:Lcom/android/server/wm/TransitionController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v6, v7}, Lcom/android/server/wm/WindowContainer;->getTask(Ljava/util/function/Predicate;)Lcom/android/server/wm/Task;

    move-result-object v4

    if-eqz v4, :cond_7

    invoke-virtual {v4, v1, v1}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object p1

    :cond_7
    if-eqz p1, :cond_b

    iget-boolean v1, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    if-nez v1, :cond_b

    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->isActivityTypeStandard()Z

    move-result v1

    if-eqz v1, :cond_b

    iget v1, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    iget v4, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-eq v1, v4, :cond_8

    iget-object v0, v0, Lcom/android/server/wm/AppLockController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mUmInternal:Lcom/android/server/pm/UserManagerInternal;

    if-eqz v0, :cond_b

    invoke-virtual {v0, v1}, Lcom/android/server/pm/UserManagerInternal;->getProfileParentId(I)I

    move-result v0

    iget p2, p2, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne v0, p2, :cond_b

    :cond_8
    iget p2, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    invoke-static {v5, p1, p2}, Lcom/android/server/wm/AppLockController;->addRecentsDeferredPackages(Ljava/util/List;Lcom/android/server/wm/ActivityRecord;I)V

    iget-object p1, p1, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Lcom/android/server/wm/Task;->getCreatedByOrganizerTask()Lcom/android/server/wm/Task;

    move-result-object p1

    goto :goto_2

    :cond_9
    const/4 p1, 0x0

    :goto_2
    if-eqz p1, :cond_a

    new-instance v0, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;

    invoke-direct {v0, v2}, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object v5, v0, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p2, v0, Lcom/android/server/wm/AppLockController$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Lcom/android/server/wm/TaskFragment;->forOtherAdjacentTaskFragments(Ljava/util/function/Consumer;)V

    :cond_a
    goto :goto_3

    :cond_b
    const/16 p2, -0x2710

    :goto_3
    invoke-interface {v3, p0, p2, v5}, Landroid/app/AppLockInternal;->setAppLockRecentsDeferredPackages(IILjava/util/List;)V

    return-void
.end method

.method public static onDragClosedAppLock(Lcom/android/server/wm/WindowManagerService;)V
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockOverlayController;->schedulePendingSplitAppLockAuthenticationLocked()V

    :cond_0
    return-void
.end method

.method public static onWindowStateRemoved(Lcom/android/server/wm/WindowState;)V
    .locals 2

    if-eqz p0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/WindowState;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/wm/WindowManagerService;->mAppLockBiometricFocusController:Lcom/android/server/wm/AppLockBiometricFocusController;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/android/server/wm/AppLockBiometricFocusController;->mRequest:Lcom/android/server/wm/AppLockBiometricFocusController$Request;

    if-eqz v1, :cond_0

    iget-object v1, v1, Lcom/android/server/wm/AppLockBiometricFocusController$Request;->mWindow:Lcom/android/server/wm/WindowState;

    if-ne v1, p0, :cond_0

    invoke-virtual {v0}, Lcom/android/server/wm/AppLockBiometricFocusController;->clearRequestLocked()V

    :cond_0
    return-void
.end method

.method public static onWmsAddWindowBiometric(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/WindowState;)V
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockBiometricFocusController:Lcom/android/server/wm/AppLockBiometricFocusController;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockBiometricFocusController;->onWindowAddedLocked(Lcom/android/server/wm/WindowState;)V

    :cond_0
    return-void
.end method

.method public static onWmsSystemReady(Lcom/android/server/wm/WindowManagerService;)V
    .locals 6

    if-nez p0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-nez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "AppLockController.systemReady"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    iget-object v1, v0, Lcom/android/server/wm/AppLockController;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    iget-object v2, v0, Lcom/android/server/wm/AppLockController;->mContext:Landroid/content/Context;

    sget-object v3, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-static {}, Lcom/android/internal/os/BackgroundThread;->getHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/internal/content/PackageMonitor;->register(Landroid/content/Context;Landroid/os/UserHandle;Landroid/os/Handler;)V

    const-class v1, Landroid/app/AppLockInternal;

    invoke-static {v1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AppLockInternal;

    if-nez v1, :cond_2

    const-string v0, "AppLockController"

    const-string v1, "AppLockInternal is null in WMS.systemReady"

    invoke-static {v0, v1}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_2
    iget-object v2, v0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackageStateListener:Lcom/android/server/wm/AppLockController$1;

    invoke-interface {v1, v2}, Landroid/app/AppLockInternal;->registerPackageLockedStateListener(Landroid/app/AppLockInternal$PackageLockedStateListener;)V

    iget-object v2, v0, Lcom/android/server/wm/AppLockController;->mWmService:Lcom/android/server/wm/WindowManagerService;

    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->boostPriorityForLockedSection()V

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {v1}, Landroid/app/AppLockInternal;->getAppLockEnabledPackages()Landroid/util/SparseArray;

    move-result-object v1

    iget-object v3, v0, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    if-eqz v5, :cond_3

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0, v5}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    iget-object v5, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    iget-object v5, v5, Lcom/android/server/wm/AppLockController;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v5, v4, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :goto_3
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-static {}, Lcom/android/server/wm/WindowManagerService;->resetPriorityAfterLockedSection()V

    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public static onWmsUpdateFocus(Lcom/android/server/wm/WindowManagerService;)V
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockBiometricFocusController:Lcom/android/server/wm/AppLockBiometricFocusController;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/wm/AppLockBiometricFocusController;->onFocusUpdatedLocked()V

    :cond_0
    return-void
.end method

.method public static prepareInterceptor(Lcom/android/server/wm/ActivityStartInterceptor;Lcom/android/server/wm/ActivityStarter$Request;)V
    .locals 1

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/android/server/wm/ActivityStarter$Request;->appLockPendingIntents:[Landroid/content/Intent;

    iput-object v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockPendingIntents:[Landroid/content/Intent;

    iget-object v0, p1, Lcom/android/server/wm/ActivityStarter$Request;->appLockPendingResolvedTypes:[Ljava/lang/String;

    iput-object v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockPendingResolvedTypes:[Ljava/lang/String;

    iget v0, p1, Lcom/android/server/wm/ActivityStarter$Request;->requestCode:I

    iput v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mRequestCode:I

    iget-object p1, p1, Lcom/android/server/wm/ActivityStarter$Request;->originatingPendingIntent:Lcom/android/server/am/PendingIntentRecord;

    iput-object p1, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mOriginatingPendingIntent:Lcom/android/server/am/PendingIntentRecord;

    :cond_0
    return-void
.end method

.method public static removePendingOverlayTarget(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)V
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {p0, p1}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public static shouldSkipCloseTransitionForAppLock(Lcom/android/server/wm/WindowContainer;)Z
    .locals 2

    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->MW_CAPTION_FREEFORM_STASH:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/wm/WindowContainer;->asActivityRecord()Lcom/android/server/wm/ActivityRecord;

    move-result-object p0

    if-eqz p0, :cond_0

    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mTaskOverlay:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/android/server/wm/Task;->isAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/server/wm/Task;->isFreeformStashed()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "AppLockWmHelpers"

    const-string/jumbo v1, "requestCloseTransitionIfNeeded: skip stashed applock overlay"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static updateWindowHiddenByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/WindowState;)V
    .locals 2

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/android/server/wm/WindowState;->getUid()I

    move-result v0

    invoke-static {v0}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    invoke-virtual {p0, v0, v1}, Lcom/android/server/wm/WindowManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result p0

    invoke-virtual {p1, p0}, Lcom/android/server/wm/WindowState;->setHiddenWhileLockedByAppLock(Z)V

    :cond_0
    return-void
.end method
