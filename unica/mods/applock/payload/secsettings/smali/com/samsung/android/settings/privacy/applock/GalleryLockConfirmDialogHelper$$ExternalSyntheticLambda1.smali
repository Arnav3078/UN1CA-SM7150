.class public final synthetic Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Landroidx/fragment/app/FragmentActivity;

.field public synthetic f$1:Ljava/util/List;

.field public synthetic f$2:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;

.field public synthetic f$3:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda13;


# virtual methods
.method public final run()V
    .locals 11

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda1;->f$0:Landroidx/fragment/app/FragmentActivity;

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda1;->f$1:Ljava/util/List;

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda1;->f$2:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda1;->f$3:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda13;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    const-string v4, "GalleryLockConfirmDialog"

    if-nez v3, :cond_5

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string/jumbo p0, "showIfNeeded: no rows, run onContinue without dialog"

    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;->run()V

    return-void

    :cond_1
    const-string/jumbo v3, "showIfNeeded: showing dialog"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v5, 0x7f0e07f3

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    const v5, 0x7f0b07b0

    invoke-virtual {v3, v5}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/picker/widget/SeslAppPickerListView;

    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroidx/picker/widget/SeslAppPickerView;->setAppListOrder(I)V

    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    :goto_0
    if-ltz v8, :cond_4

    invoke-virtual {v5, v8}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationAt(I)Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    move-result-object v9

    instance-of v10, v9, Landroidx/picker/decorator/ListDividerItemDecoration;

    if-nez v10, :cond_2

    instance-of v9, v9, Landroidx/picker/decorator/RoundedCornerDecoration;

    if-eqz v9, :cond_3

    :cond_2
    invoke-virtual {v5, v8}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationAt(I)Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    move-result-object v9

    if-eqz v9, :cond_3

    invoke-virtual {v5, v9}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    :cond_3
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    :cond_4
    iput-boolean v7, v5, Landroidx/recyclerview/widget/RecyclerView;->mDrawLastRoundedCorner:Z

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    const v9, 0x7f0e07f2

    invoke-virtual {v8, v9, v5, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroidx/picker/widget/SeslAppPickerView;->addHeader(Landroid/view/View;)V

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    const v9, 0x7f0e07f4

    invoke-virtual {v8, v9, v5, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    new-instance v9, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda3;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    iput-object v0, v9, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda3;->f$0:Landroidx/fragment/app/FragmentActivity;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v5, v8}, Landroidx/picker/widget/SeslAppPickerView;->addFooter(Landroid/view/View;)V

    invoke-virtual {v5, v1}, Landroidx/picker/widget/SeslAppPickerView;->submitList(Ljava/util/List;)V

    :try_start_0
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string/jumbo v5, "com.sec.android.gallery3d"

    invoke-virtual {v1, v5, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    new-instance v5, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v5, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v7, 0x7f152be3

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v7, v1}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v5, Landroidx/appcompat/app/AlertDialog$Builder;->P:Landroidx/appcompat/app/AlertController$AlertParams;

    iput-object v0, v1, Landroidx/appcompat/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v5, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)V

    const v0, 0x7f150bee

    invoke-virtual {v5, v0, v6}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)V

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda4;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const v1, 0x7f152be2

    invoke-virtual {v5, v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {v5}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "showDialog: isShowing="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda13;->accept(Ljava/lang/Object;)V

    return-void

    :catch_0
    move-exception p0

    invoke-static {p0}, Lokhttp3/Headers$$ExternalSyntheticBUOutline0;->m(Ljava/lang/Throwable;)V

    return-void

    :cond_5
    :goto_1
    const-string/jumbo p0, "showIfNeeded: activity finishing/destroyed, skip"

    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
