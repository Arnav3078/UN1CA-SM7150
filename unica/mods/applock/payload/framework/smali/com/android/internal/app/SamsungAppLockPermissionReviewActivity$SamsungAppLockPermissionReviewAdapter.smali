.class final Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;
.super Lcom/android/internal/app/AppLockPermissionReviewAdapter;
.source "SamsungAppLockPermissionReviewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SamsungAppLockPermissionReviewAdapter"
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;


# direct methods
.method private constructor blacklist <init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 322
    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;->this$0:Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;

    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor blacklist <init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V

    return-void
.end method


# virtual methods
.method public blacklist onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;
    .locals 2

    .line 326
    invoke-super {p0, p1, p2}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;

    move-result-object p1

    .line 327
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;->this$0:Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;

    iget-object p2, p1, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p1, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->mAppIconView:Landroid/widget/ImageView;

    iget-object v1, p1, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->mAppNameView:Landroid/widget/TextView;

    invoke-static {p0, p2, v0, v1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->-$$Nest$mapplySamsungAppRowStyle(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Landroid/view/View;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    return-object p1
.end method

.method public bridge synthetic blacklist onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/internal/widget/RecyclerView$ViewHolder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 322
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;

    move-result-object p0

    return-object p0
.end method
