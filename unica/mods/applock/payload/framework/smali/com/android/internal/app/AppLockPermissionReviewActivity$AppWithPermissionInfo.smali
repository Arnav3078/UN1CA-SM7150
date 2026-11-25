.class Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;
.super Ljava/lang/Object;
.source "AppLockPermissionReviewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/AppLockPermissionReviewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AppWithPermissionInfo"
.end annotation


# instance fields
.field final blacklist mAppIcon:Landroid/graphics/drawable/Drawable;

.field final blacklist mAppName:Ljava/lang/CharSequence;

.field final blacklist mPackageName:Ljava/lang/String;


# direct methods
.method constructor blacklist <init>(Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    .locals 0

    .line 449
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 450
    iput-object p1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppName:Ljava/lang/CharSequence;

    .line 451
    iput-object p2, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppIcon:Landroid/graphics/drawable/Drawable;

    .line 452
    iput-object p3, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mPackageName:Ljava/lang/String;

    return-void
.end method
