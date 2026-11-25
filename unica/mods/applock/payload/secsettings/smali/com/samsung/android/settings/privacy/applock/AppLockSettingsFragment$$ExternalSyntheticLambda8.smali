.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroidx/picker/widget/SeslAppPickerView$OnSearchFilterListener;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

.field public synthetic f$1:Ljava/lang/String;


# virtual methods
.method public final onSearchFilterCompleted(I)V
    .locals 2

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda8;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda8;->f$1:Ljava/lang/String;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    iget-boolean v1, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->updateSearchResultHeaders()I

    move-result p1

    :cond_1
    const/4 v1, 0x1

    if-ge p1, v1, :cond_2

    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mEmptyView:Landroid/widget/TextView;

    const p1, 0x7f152be9

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLoadingViewController:Lcom/android/settings/widget/LoadingViewController;

    invoke-virtual {p0}, Lcom/android/settings/widget/LoadingViewController;->showEmpty()V

    goto :goto_0

    :cond_2
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mEmptyView:Landroid/widget/TextView;

    const p1, 0x7f152be8

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    :cond_3
    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLoadingViewController:Lcom/android/settings/widget/LoadingViewController;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/settings/widget/LoadingViewController;->showContent(Z)V

    :goto_0
    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOverlapChecker:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    if-eqz p0, :cond_4

    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->checkOverlap()V

    :cond_4
    :goto_1
    return-void
.end method
