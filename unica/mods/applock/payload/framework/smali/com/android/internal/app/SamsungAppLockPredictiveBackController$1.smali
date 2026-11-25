.class Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;
.super Ljava/lang/Object;
.source "SamsungAppLockPredictiveBackController.java"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->createBackCallback()Landroid/window/OnBackInvokedCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;


# direct methods
.method constructor blacklist <init>(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 106
    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public whitelist onBackCancelled()V
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;

    move-result-object v0

    .line 134
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fputmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;Landroid/view/View;)V

    if-eqz v0, :cond_0

    .line 136
    invoke-static {v0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->animateRestore(Landroid/view/View;)Landroid/animation/Animator;

    :cond_0
    return-void
.end method

.method public whitelist onBackInvoked()V
    .locals 3

    .line 142
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmReleased(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActivity(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActivity(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;

    move-result-object v0

    .line 146
    iget-object v1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fputmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;Landroid/view/View;)V

    .line 148
    iget-object v1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmOnBackInvoked(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    if-eqz v0, :cond_1

    .line 151
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActivity(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_1

    .line 152
    invoke-static {v0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->reset(Landroid/view/View;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public whitelist onBackProgressed(Landroid/window/BackEvent;)V
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;

    move-result-object v0

    .line 128
    invoke-virtual {p1}, Landroid/window/BackEvent;->getProgress()F

    move-result p1

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmMaxTranslationY(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)F

    move-result p0

    const/4 v1, 0x0

    .line 127
    invoke-static {v0, p1, v1, p0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->applyTranslate(Landroid/view/View;FFF)V

    return-void
.end method

.method public whitelist onBackStarted(Landroid/window/BackEvent;)V
    .locals 1

    .line 111
    invoke-virtual {p1}, Landroid/window/BackEvent;->getSwipeEdge()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 112
    :goto_0
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    if-eqz p1, :cond_1

    invoke-static {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$mgetTargetView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;

    move-result-object p1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    invoke-static {v0, p1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fputmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;Landroid/view/View;)V

    .line 113
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {p1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 115
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {p1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmActiveView(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPredictiveBackController$1;->this$0:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    invoke-static {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->-$$Nest$fgetmMaxTranslationY(Lcom/android/internal/app/SamsungAppLockPredictiveBackController;)F

    move-result p0

    const/4 v0, 0x0

    invoke-static {p1, v0, v0, p0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->applyTranslate(Landroid/view/View;FFF)V

    :cond_2
    return-void
.end method
