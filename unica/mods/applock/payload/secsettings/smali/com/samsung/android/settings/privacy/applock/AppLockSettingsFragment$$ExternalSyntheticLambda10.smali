.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

.field public synthetic f$1:Ljava/lang/String;

.field public synthetic f$2:Z


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda10;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda10;->f$1:Ljava/lang/String;

    iget-boolean p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda10;->f$2:Z

    iget-object v2, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/picker/model/AppInfoData;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroidx/picker/model/AppInfoData;->getSelected()Z

    move-result v2

    if-eq v2, p0, :cond_1

    invoke-interface {v1, p0}, Landroidx/picker/model/AppInfoData;->setSelected(Z)V

    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {p0, v1}, Landroidx/picker/widget/SeslAppPickerView;->updateItem(Landroidx/picker/model/AppInfoData;)V

    iget-boolean p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz p0, :cond_0

    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    new-instance v1, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;-><init>(B)V

    iput-object v0, v1, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mAppList:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_1

    invoke-virtual {v0, p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->onAppListLoaded(Ljava/util/List;)V

    :cond_1
    return-void
.end method
