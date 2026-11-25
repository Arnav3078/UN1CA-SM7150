.class public Lcom/android/internal/app/AppLockPermissionReviewAdapter;
.super Lcom/android/internal/widget/RecyclerView$Adapter;
.source "AppLockPermissionReviewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/internal/widget/RecyclerView$Adapter<",
        "Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final blacklist mAppList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor blacklist <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Lcom/android/internal/widget/RecyclerView$Adapter;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->mAppList:Ljava/util/List;

    return-void
.end method

.method private blacklist isListDataIdentical(Ljava/util/List;Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;)Z"
        }
    .end annotation

    const/4 p0, 0x1

    if-ne p1, p2, :cond_0

    return p0

    .line 117
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    return v2

    :cond_1
    move v0, v2

    .line 119
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 120
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;

    .line 121
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;

    .line 124
    iget-object v4, v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mPackageName:Ljava/lang/String;

    iget-object v5, v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mPackageName:Ljava/lang/String;

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppName:Ljava/lang/CharSequence;

    iget-object v5, v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppName:Ljava/lang/CharSequence;

    .line 125
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v1, v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppIcon:Landroid/graphics/drawable/Drawable;

    iget-object v3, v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppIcon:Landroid/graphics/drawable/Drawable;

    .line 126
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return v2

    :cond_4
    return p0
.end method


# virtual methods
.method public blacklist getItemCount()I
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->mAppList:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public blacklist onBindViewHolder(Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;I)V
    .locals 0

    .line 84
    iget-object p0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->mAppList:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;

    invoke-virtual {p1, p0}, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;->bind(Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;)V

    return-void
.end method

.method public bridge synthetic blacklist onBindViewHolder(Lcom/android/internal/widget/RecyclerView$ViewHolder;I)V
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

    .line 45
    check-cast p1, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->onBindViewHolder(Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;I)V

    return-void
.end method

.method public blacklist onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;
    .locals 1

    .line 77
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const p2, 0x109004d

    const/4 v0, 0x0

    .line 78
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 79
    new-instance p1, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;

    invoke-direct {p1, p0}, Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;-><init>(Landroid/view/View;)V

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

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/internal/app/AppLockPermissionReviewAdapter$AppViewHolder;

    move-result-object p0

    return-object p0
.end method

.method public blacklist updateData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;)V"
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->mAppList:Ljava/util/List;

    invoke-direct {p0, v0, p1}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->isListDataIdentical(Ljava/util/List;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->mAppList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 104
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->mAppList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 105
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->notifyDataSetChanged()V

    return-void
.end method
