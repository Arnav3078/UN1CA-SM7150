.class public final synthetic Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic blacklist f$0:Ljava/text/Collator;


# direct methods
.method public synthetic constructor blacklist <init>(Ljava/text/Collator;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda5;->f$0:Ljava/text/Collator;

    return-void
.end method


# virtual methods
.method public final whitelist test-api compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda5;->f$0:Ljava/text/Collator;

    check-cast p1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;

    check-cast p2, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;

    invoke-static {p0, p1, p2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->lambda$getAppsWithPermissions$0(Ljava/text/Collator;Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;)I

    move-result p0

    return p0
.end method
