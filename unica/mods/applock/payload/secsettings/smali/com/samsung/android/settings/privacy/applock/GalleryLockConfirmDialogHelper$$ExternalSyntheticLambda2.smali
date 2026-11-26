.class public final synthetic Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroidx/picker/adapter/AppPickerAdapter$OnBindListener;


# instance fields
.field public synthetic f$0:Landroidx/picker/widget/SeslAppPickerListView;


# virtual methods
.method public final onBindViewHolder(Landroidx/picker/adapter/viewholder/PickerViewHolder;Landroidx/picker/model/viewdata/ViewData;)V
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda2;->f$0:Landroidx/picker/widget/SeslAppPickerListView;

    iget-object p0, p1, Landroidx/picker/adapter/viewholder/PickerViewHolder;->item:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    return-void
.end method
