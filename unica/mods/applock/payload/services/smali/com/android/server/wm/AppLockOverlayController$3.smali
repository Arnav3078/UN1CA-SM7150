.class public final Lcom/android/server/wm/AppLockOverlayController$3;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Lcom/android/server/wm/WindowContainerListener;


# instance fields
.field public synthetic this$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic val$currentTask:Lcom/android/server/wm/Task;

.field public synthetic val$currentTop:Lcom/android/server/wm/ActivityRecord;

.field public synthetic val$display:Lcom/android/server/wm/DisplayContent;

.field public synthetic val$packageName:Ljava/lang/String;

.field public synthetic val$restoreFocusRef:Ljava/lang/ref/WeakReference;

.field public synthetic val$userId:I


# virtual methods
.method public final onRemoved()V
    .locals 8

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$3;->val$currentTop:Lcom/android/server/wm/ActivityRecord;

    invoke-virtual {v0, p0}, Lcom/android/server/wm/WindowContainer;->unregisterWindowContainerListener(Lcom/android/server/wm/WindowContainerListener;)V

    iget-object v1, p0, Lcom/android/server/wm/AppLockOverlayController$3;->this$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v1, v1, Lcom/android/server/wm/AppLockOverlayController;->mAtmService:Lcom/android/server/wm/ActivityTaskManagerService;

    iget-object v1, v1, Lcom/android/server/wm/ActivityTaskManagerService;->mH:Lcom/android/server/wm/ActivityTaskManagerService$H;

    iget-object v2, p0, Lcom/android/server/wm/AppLockOverlayController$3;->val$restoreFocusRef:Ljava/lang/ref/WeakReference;

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController$3;->val$display:Lcom/android/server/wm/DisplayContent;

    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController$3;->val$currentTask:Lcom/android/server/wm/Task;

    iget v5, p0, Lcom/android/server/wm/AppLockOverlayController$3;->val$userId:I

    iget-object v6, p0, Lcom/android/server/wm/AppLockOverlayController$3;->val$packageName:Ljava/lang/String;

    new-instance v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object p0, v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/wm/AppLockOverlayController$3;

    iput-object v2, v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$1:Ljava/lang/ref/WeakReference;

    iput-object v3, v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$2:Lcom/android/server/wm/DisplayContent;

    iput-object v4, v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$3:Lcom/android/server/wm/Task;

    iput v5, v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$4:I

    iput-object v6, v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    iput-object v0, v7, Lcom/android/server/wm/AppLockOverlayController$3$$ExternalSyntheticLambda0;->f$6:Lcom/android/server/wm/ActivityRecord;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
