.class final Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;
.super Ljava/lang/Object;
.source "AppLockPermissionReviewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/AppLockPermissionReviewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReviewTypeConfig"
.end annotation


# instance fields
.field final blacklist mPermissions:[Ljava/lang/String;

.field final blacklist mSubtitleResId:I

.field final blacklist mTitleResId:I


# direct methods
.method constructor blacklist <init>([Ljava/lang/String;II)V
    .locals 0

    .line 466
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 467
    iput-object p1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;->mPermissions:[Ljava/lang/String;

    .line 468
    iput p2, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;->mTitleResId:I

    .line 469
    iput p3, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;->mSubtitleResId:I

    return-void
.end method
