.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda13;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    check-cast p1, Landroidx/appcompat/app/AlertDialog;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "showGalleryConfirmDialog: onDialogShown isResumed="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppLockSettingsFragment"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatDialog;->dismiss()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast v0, Ljava/util/HashMap;

    const-string/jumbo v1, "com.sec.android.gallery3d0"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/picker/model/AppInfoData;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/picker/model/AppInfoData;->setSelected(Z)V

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {v1, v0}, Landroidx/picker/widget/SeslAppPickerView;->updateItem(Landroidx/picker/model/AppInfoData;)V

    :cond_1
    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mGalleryConfirmDialog:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
