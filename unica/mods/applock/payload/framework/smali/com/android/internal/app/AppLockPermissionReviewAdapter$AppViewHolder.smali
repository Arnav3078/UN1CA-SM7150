.class public Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;
.super Lcom/android/internal/widget/RecyclerView$ViewHolder;
.source "AppLockPermissionReviewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/AppLockPermissionReviewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppViewHolder"
.end annotation


# instance fields
.field final blacklist mAppIconView:Landroid/widget/ImageView;

.field final blacklist mAppNameView:Landroid/widget/TextView;


# direct methods
.method public constructor blacklist <init>(Landroid/view/View;)V
    .locals 1

    .line 56
    invoke-direct {p0, p1}, Lcom/android/internal/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x102024d

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->mAppIconView:Landroid/widget/ImageView;

    const v0, 0x102024e

    .line 58
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->mAppNameView:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public blacklist bind(Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;)V
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->mAppIconView:Landroid/widget/ImageView;

    iget-object v1, p1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    iget-object p0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->mAppNameView:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppName:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
