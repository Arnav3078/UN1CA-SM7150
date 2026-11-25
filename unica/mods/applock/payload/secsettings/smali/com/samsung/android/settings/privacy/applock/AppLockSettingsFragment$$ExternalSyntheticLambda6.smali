.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;


# virtual methods
.method public final onWindowFocusChanged(Z)V
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mIsAuthed:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->updateAuthState$1()V

    :cond_0
    return-void
.end method
