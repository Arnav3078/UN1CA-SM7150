.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:I

.field public synthetic f$3:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;

.field public synthetic f$4:Z


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 14

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$1:Ljava/lang/String;

    iget v2, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$2:I

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$3:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;

    iget-boolean p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda25;->f$4:Z

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    iget-boolean v4, p1, Lcom/android/server/wm/ActivityRecord;->finishing:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForVisibility(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v4

    sget-object v6, Lcom/android/internal/protolog/ProtoLogImpl_1983143371$Cache;->WM_DEBUG_APP_LOCK_enabled:[Z

    const/4 v7, 0x1

    if-eqz v4, :cond_3

    invoke-static {v2, p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForVisibility(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v6, p0

    if-eqz p0, :cond_1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v8, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v11, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v13

    const-wide v9, -0x72956109f096cf81L

    invoke-static/range {v8 .. v13}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_1
    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundTargetOverlay:Z

    return v7

    :cond_2
    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOpaqueActivity:Z

    goto :goto_0

    :cond_3
    invoke-static {p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockPrompt(Lcom/android/server/wm/ActivityRecord;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-static {v2, p1, v1}, Lcom/android/server/wm/AppLockOverlayController;->isAppLockPromptTarget(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v6, p0

    if-eqz p0, :cond_4

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v8, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v11, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v13

    const-wide v9, 0x70644d3036b832a5L    # 2.521477787221796E233

    invoke-static/range {v8 .. v13}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_4
    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundTargetOverlay:Z

    return v7

    :cond_5
    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOpaqueActivity:Z

    :cond_6
    :goto_0
    if-nez p0, :cond_7

    iget-object p0, p1, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a

    iget p0, p1, Lcom/android/server/wm/ActivityRecord;->mUserId:I

    if-ne p0, v2, :cond_a

    :cond_7
    iget-boolean p0, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOpaqueActivity:Z

    if-nez p0, :cond_c

    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundVisibleTarget:Z

    invoke-virtual {v0, p1}, Lcom/android/server/wm/AppLockOverlayController;->isActivityPermittedToBypassAppLock(Lcom/android/server/wm/ActivityRecord;)Z

    move-result p0

    if-nez p0, :cond_9

    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v6, p0

    if-eqz p0, :cond_8

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v8, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v11, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v13

    const-wide v9, -0x5bdd0e0c4e73ca03L

    invoke-static/range {v8 .. v13}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_8
    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mVisibleTargetRequiresAppLock:Z

    return v7

    :cond_9
    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v6, p0

    if-eqz p0, :cond_a

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v8, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v11, 0x0

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v13

    const-wide v9, 0x4fd6a6816f2f307aL    # 4.098029041755003E76

    invoke-static/range {v8 .. v13}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_a
    invoke-virtual {p1, v5}, Lcom/android/server/wm/ActivityRecord;->occludesParent(Z)Z

    move-result p0

    if-eqz p0, :cond_b

    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOpaqueActivity:Z

    :cond_b
    :goto_1
    return v5

    :cond_c
    sget-object p0, Lcom/android/internal/protolog/common/LogLevel;->DEBUG:Lcom/android/internal/protolog/common/LogLevel;

    invoke-virtual {p0}, Lcom/android/internal/protolog/common/LogLevel;->ordinal()I

    move-result p0

    aget-boolean p0, v6, p0

    if-eqz p0, :cond_d

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    sget-object v8, Lcom/android/internal/protolog/WmProtoLogGroups;->WM_DEBUG_APP_LOCK:Lcom/android/internal/protolog/WmProtoLogGroups;

    const-wide/16 v11, 0x0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v13

    const-wide v9, 0x203705bafae357dL

    invoke-static/range {v8 .. v13}, Lcom/android/internal/protolog/ProtoLogImpl_1983143371;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;JJ[Ljava/lang/Object;)V

    :cond_d
    iput-boolean v7, v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentVisibilityState;->mFoundOccludedTarget:Z

    return v7
.end method
