.class public final Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# instance fields
.field public bottomNavContainer:Landroid/view/View;

.field public lastOverlapState:Z

.field public onOverlapChanged:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;

.field public recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field public scrollListener:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;


# virtual methods
.method public final checkOverlap()V
    .locals 10

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->onOverlapChanged:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v3, 0x0

    if-eqz v2, :cond_7

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_4

    :cond_0
    invoke-virtual {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v4

    invoke-virtual {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v5

    const/4 v6, -0x1

    if-eq v4, v6, :cond_6

    if-ne v5, v6, :cond_1

    goto :goto_3

    :cond_1
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v1

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    const/4 v6, 0x1

    sub-int/2addr v1, v6

    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    iget-object v8, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->bottomNavContainer:Landroid/view/View;

    invoke-virtual {v8, v7}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    iget v7, v7, Landroid/graphics/Rect;->top:I

    :goto_0
    if-gt v4, v5, :cond_5

    if-lt v4, v1, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v8

    if-nez v8, :cond_3

    goto :goto_1

    :cond_3
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v8, v9}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    iget v8, v9, Landroid/graphics/Rect;->bottom:I

    if-le v8, v7, :cond_4

    move v3, v6

    goto :goto_2

    :cond_4
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    iget-boolean v1, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->lastOverlapState:Z

    if-eq v1, v3, :cond_8

    iput-boolean v3, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->lastOverlapState:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;->accept(Ljava/lang/Object;)V

    return-void

    :cond_6
    :goto_3
    iget-boolean v1, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->lastOverlapState:Z

    if-eqz v1, :cond_8

    iput-boolean v3, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->lastOverlapState:Z

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;->accept(Ljava/lang/Object;)V

    return-void

    :cond_7
    :goto_4
    iget-boolean v1, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->lastOverlapState:Z

    if-eqz v1, :cond_8

    iput-boolean v3, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->lastOverlapState:Z

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;->accept(Ljava/lang/Object;)V

    :cond_8
    return-void
.end method
