.class final Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;
.super Ljava/lang/Object;
.source "SamsungAppLockPermissionReviewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ReviewTypeConfig"
.end annotation


# instance fields
.field final blacklist mPermissions:[Ljava/lang/String;


# direct methods
.method constructor blacklist <init>([Ljava/lang/String;)V
    .locals 0

    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;->mPermissions:[Ljava/lang/String;

    return-void
.end method
