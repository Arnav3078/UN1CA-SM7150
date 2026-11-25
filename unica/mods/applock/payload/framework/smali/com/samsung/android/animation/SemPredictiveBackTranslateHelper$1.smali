.class Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SemPredictiveBackTranslateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->animateRestore(Landroid/view/View;J)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic blacklist val$animatorSet:Landroid/animation/AnimatorSet;

.field final synthetic blacklist val$view:Landroid/view/View;


# direct methods
.method constructor blacklist <init>(Landroid/view/View;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 99
    iput-object p1, p0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;->val$view:Landroid/view/View;

    iput-object p2, p0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;->val$animatorSet:Landroid/animation/AnimatorSet;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public whitelist onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 103
    invoke-static {}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->-$$Nest$sfgetsRunningRestores()Ljava/util/WeakHashMap;

    move-result-object p1

    iget-object v0, p0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;->val$view:Landroid/view/View;

    invoke-virtual {p1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;->val$animatorSet:Landroid/animation/AnimatorSet;

    if-ne p1, v0, :cond_0

    .line 104
    invoke-static {}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->-$$Nest$sfgetsRunningRestores()Ljava/util/WeakHashMap;

    move-result-object p1

    iget-object p0, p0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;->val$view:Landroid/view/View;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
