.class public final synthetic Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Ljava/lang/Object;

.field public synthetic f$1:Ljava/lang/Object;

.field public synthetic f$2:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 6

    iget-byte v0, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->$r8$classId:B

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, [Z

    iget-object v1, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->f$1:Ljava/lang/Object;

    check-cast v1, [Z

    iget-object p0, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->f$2:Ljava/lang/Object;

    check-cast p0, Lcom/android/server/wm/ActivityRecord;

    check-cast p1, Lcom/android/server/wm/TaskDisplayArea;

    invoke-virtual {p1}, Lcom/android/server/wm/TaskDisplayArea;->getFocusedActivity()Lcom/android/server/wm/ActivityRecord;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object p1, p1, Lcom/android/server/wm/ActivityRecord;->app:Lcom/android/server/wm/WindowProcessController;

    :goto_0
    const/4 v2, 0x0

    aget-boolean v3, v0, v2

    const/4 v4, 0x1

    if-nez p1, :cond_1

    move v5, v4

    goto :goto_1

    :cond_1
    move v5, v2

    :goto_1
    and-int/2addr v3, v5

    aput-boolean v3, v0, v2

    if-eqz p1, :cond_3

    aget-boolean v0, v1, v2

    iget-object p0, p0, Lcom/android/server/wm/ActivityRecord;->app:Lcom/android/server/wm/WindowProcessController;

    if-eq p1, p0, :cond_2

    move p0, v2

    goto :goto_2

    :cond_2
    move p0, v4

    :goto_2
    xor-int/2addr p0, v4

    and-int/2addr p0, v0

    aput-boolean p0, v1, v2

    :cond_3
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/wm/Task;

    iget-object v1, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->f$1:Ljava/lang/Object;

    check-cast v1, Lcom/android/server/wm/RootWindowContainer$$ExternalSyntheticLambda16;

    iget-object p0, p0, Lcom/android/server/wm/RootWindowContainer$$AppLockLambda1;->f$2:Ljava/lang/Object;

    check-cast p0, Lcom/android/server/wm/RootWindowContainer$$ExternalSyntheticLambda16;

    check-cast p1, Lcom/android/server/wm/Task;

    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->isVisibleRequested()Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_3

    :cond_4
    if-ne p1, v0, :cond_5

    invoke-virtual {p1, v1}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    goto :goto_3

    :cond_5
    invoke-virtual {p1, p0}, Lcom/android/server/wm/WindowContainer;->forAllActivities(Ljava/util/function/Consumer;)V

    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
