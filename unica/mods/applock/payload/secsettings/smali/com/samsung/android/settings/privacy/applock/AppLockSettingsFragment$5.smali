.class public final Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$5;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# instance fields
.field public synthetic this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;


# virtual methods
.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$5;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestFocus()Z

    :cond_1
    :goto_0
    return-void
.end method
