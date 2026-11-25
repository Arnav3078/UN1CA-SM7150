.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroidx/core/util/Consumer;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

.field public synthetic f$1:Landroid/view/ViewGroup;


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;->f$1:Landroid/view/ViewGroup;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, 0x7f0712a8

    goto :goto_0

    :cond_0
    const p1, 0x7f0712a9

    :goto_0
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setElevation(F)V

    return-void
.end method
