.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda7;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    iget-object p1, p1, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->collapseSearch()V

    return-void

    :cond_0
    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const-string p1, ""

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void
.end method
