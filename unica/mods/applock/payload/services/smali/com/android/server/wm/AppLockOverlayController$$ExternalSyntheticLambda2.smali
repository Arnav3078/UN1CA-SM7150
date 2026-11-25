.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public synthetic f$2:I

.field public synthetic f$3:Ljava/lang/String;

.field public synthetic f$4:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public synthetic f$5:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public synthetic f$6:Ljava/util/concurrent/atomic/AtomicBoolean;


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 10

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$1:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget v2, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$2:I

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$4:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v5, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$5:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda2;->f$6:Ljava/util/concurrent/atomic/AtomicBoolean;

    check-cast p1, Lcom/android/server/wm/Task;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v6, 0x1

    invoke-virtual {p1, v6, v6}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v7

    invoke-virtual {p1}, Lcom/android/server/wm/ConfigurationContainer;->inPinnedWindowingMode()Z

    move-result v8

    const/4 v9, 0x0

    if-eqz v8, :cond_0

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-nez p0, :cond_5

    invoke-virtual {p1}, Lcom/android/server/wm/Task;->getUserId()I

    move-result p0

    if-ne p0, v2, :cond_5

    iget-object p0, p1, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz p0, :cond_5

    if-eqz v7, :cond_5

    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p0

    new-instance v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;

    invoke-direct {v4, v6}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;-><init>(B)V

    iput-object v0, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-object v3, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$1:Ljava/lang/String;

    iput-object p0, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$3:Ljava/lang/Object;

    iput v2, v4, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$2:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v4}, Lcom/android/server/wm/TaskFragment;->forAllLeafTaskFragments(Ljava/util/function/Predicate;)Z

    move-result p0

    if-eqz p0, :cond_5

    invoke-virtual {v1, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return v9

    :cond_0
    invoke-virtual {p1}, Lcom/android/server/wm/Task;->getUserId()I

    move-result v1

    if-ne v1, v2, :cond_5

    iget-object v1, p1, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v1

    if-eqz v1, :cond_5

    if-nez v7, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {v2, v7, v3}, Lcom/android/server/wm/AppLockOverlayController;->isLockedTaskAppLockOverlayForPackageLocked(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v7, v9}, Lcom/android/server/wm/ActivityRecord;->occludesParent(Z)Z

    move-result v1

    if-nez v1, :cond_2

    return v6

    :cond_2
    invoke-static {v7}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    invoke-virtual {v1, v7}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, v0, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;

    new-instance v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda22;

    invoke-direct {v7, v6}, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda22;-><init>(B)V

    iput-object v1, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda22;->f$0:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v7}, Lcom/android/server/wm/WindowContainer;->getActivity(Ljava/util/function/Predicate;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v1

    if-eqz v1, :cond_3

    goto :goto_0

    :cond_3
    move v6, v9

    :cond_4
    :goto_0
    iget-object v1, p1, Lcom/android/server/wm/Task;->realActivity:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    new-instance v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v0, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iput-boolean v6, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$1:Z

    iput-object v3, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$2:Ljava/lang/String;

    iput-object v1, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$3:Ljava/lang/String;

    iput v2, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$4:I

    iput-object p1, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$5:Lcom/android/server/wm/Task;

    iput-object v4, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$6:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object v5, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$7:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p0, v7, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda12;->f$8:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v7}, Lcom/android/server/wm/TaskFragment;->forAllLeafTaskFragments(Ljava/util/function/Predicate;)Z

    move-result p0

    return p0

    :cond_5
    :goto_1
    return v9
.end method
