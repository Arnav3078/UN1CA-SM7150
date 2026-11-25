.class public final synthetic Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/internal/widget/DismissableView$OnDismissListener;


# instance fields
.field public final synthetic blacklist f$0:Lcom/android/internal/app/AppLockPermissionReviewActivity;


# direct methods
.method public synthetic constructor blacklist <init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda1;->f$0:Lcom/android/internal/app/AppLockPermissionReviewActivity;

    return-void
.end method


# virtual methods
.method public final blacklist onDismiss()V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda1;->f$0:Lcom/android/internal/app/AppLockPermissionReviewActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->onBackPressed()V

    return-void
.end method
