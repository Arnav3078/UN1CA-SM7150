.class public final synthetic Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Lcom/android/server/wm/AppLockOverlayController;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:I

.field public synthetic f$3:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 6

    iget-byte v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->$r8$classId:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$0:Lcom/android/server/wm/AppLockOverlayController;

    iget-object v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$1:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$3:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$2:I

    check-cast p1, Lcom/android/server/wm/TaskFragment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v1, v1}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;

    move-result-object v5

    if-nez v5, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1, v3, v4, p0}, Lcom/android/server/wm/AppLockOverlayController;->evaluateTaskFragmentLockVisibility(Lcom/android/server/wm/TaskFragment;Ljava/lang/String;Ljava/lang/String;I)Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    move-result-object p0

    sget-object p1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->NONE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    if-eq p0, p1, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v2

    :goto_1
    return v1

    :pswitch_0
    iget-object v0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$1:Ljava/lang/String;

    iget v3, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$2:I

    iget-object p0, p0, Lcom/android/server/wm/AppLockOverlayController$$ExternalSyntheticLambda14;->f$3:Ljava/lang/Object;

    check-cast p0, Lcom/android/server/wm/Task;

    check-cast p1, Lcom/android/server/wm/ActivityRecord;

    invoke-static {v3, p1, v0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForPackage(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {p0}, Lcom/android/server/wm/ConfigurationContainer;->inSplitScreenWindowingMode()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-static {v3, p1, v0}, Lcom/android/server/wm/AppLockOverlayController;->isActivityAppLockOverlayForVisibility(ILcom/android/server/wm/ActivityRecord;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :cond_3
    :goto_2
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
