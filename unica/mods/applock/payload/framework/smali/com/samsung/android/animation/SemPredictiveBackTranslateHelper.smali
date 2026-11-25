.class public final Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;
.super Ljava/lang/Object;
.source "SemPredictiveBackTranslateHelper.java"


# static fields
.field private static final blacklist DEFAULT_CANCEL_DURATION_MS:J = 0x64L

.field private static final blacklist PROGRESS_INTERPOLATOR:Landroid/animation/TimeInterpolator;

.field private static final blacklist RESTORE_INTERPOLATOR:Landroid/animation/TimeInterpolator;

.field private static final blacklist sRunningRestores:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic blacklist -$$Nest$sfgetsRunningRestores()Ljava/util/WeakHashMap;
    .locals 1

    sget-object v0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->sRunningRestores:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static constructor blacklist <clinit>()V
    .locals 5

    .line 21
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    sput-object v0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->PROGRESS_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 23
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3e4ccccd    # 0.2f

    const/high16 v2, 0x3f800000    # 1.0f

    const v3, 0x3ecccccd    # 0.4f

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    sput-object v0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->RESTORE_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 31
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->sRunningRestores:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor blacklist <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blacklist animateRestore(Landroid/view/View;)Landroid/animation/Animator;
    .locals 2

    const-wide/16 v0, 0x64

    .line 117
    invoke-static {p0, v0, v1}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->animateRestore(Landroid/view/View;J)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist animateRestore(Landroid/view/View;J)Landroid/animation/Animator;
    .locals 7

    .line 91
    invoke-static {p0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->cancelRunningRestore(Landroid/view/View;)V

    .line 93
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v1, 0x2

    .line 94
    new-array v1, v1, [Landroid/animation/Animator;

    sget-object v2, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    const/4 v3, 0x1

    new-array v4, v3, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v4, v5

    .line 95
    invoke-static {p0, v2, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v5

    sget-object v2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v4, v3, [F

    aput v6, v4, v5

    .line 96
    invoke-static {p0, v2, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v3

    .line 94
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 97
    sget-object v1, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->RESTORE_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 98
    invoke-virtual {v0, p1, p2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 99
    new-instance p1, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;

    invoke-direct {p1, p0, v0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper$1;-><init>(Landroid/view/View;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 108
    sget-object p1, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->sRunningRestores:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-object v0
.end method

.method public static blacklist applyTranslate(Landroid/view/View;FFF)V
    .locals 2

    .line 63
    invoke-static {p0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->cancelRunningRestore(Landroid/view/View;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 65
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 66
    sget-object v1, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->PROGRESS_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    invoke-interface {v1, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result p1

    .line 68
    invoke-static {v0, p2, p1}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->lerp(FFF)F

    move-result p2

    .line 69
    invoke-static {v0, p3, p1}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->lerp(FFF)F

    move-result p1

    .line 70
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result p3

    if-nez p3, :cond_1

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 75
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    :cond_1
    :goto_0
    return-void
.end method

.method private static blacklist cancelRunningRestore(Landroid/view/View;)V
    .locals 1

    .line 37
    sget-object v0, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->sRunningRestores:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/animation/Animator;

    if-eqz p0, :cond_0

    .line 39
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    :cond_0
    return-void
.end method

.method private static blacklist lerp(FFF)F
    .locals 0

    sub-float/2addr p1, p0

    mul-float/2addr p2, p1

    add-float/2addr p0, p2

    return p0
.end method

.method public static blacklist reset(Landroid/view/View;)V
    .locals 1

    .line 127
    invoke-static {p0}, Lcom/samsung/android/animation/SemPredictiveBackTranslateHelper;->cancelRunningRestore(Landroid/view/View;)V

    const/4 v0, 0x0

    .line 128
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 129
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method
