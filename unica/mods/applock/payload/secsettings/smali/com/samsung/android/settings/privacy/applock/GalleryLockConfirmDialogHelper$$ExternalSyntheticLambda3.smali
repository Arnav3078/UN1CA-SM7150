.class public final synthetic Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public synthetic f$0:Landroidx/fragment/app/FragmentActivity;


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda3;->f$0:Landroidx/fragment/app/FragmentActivity;

    new-instance p1, Landroid/content/Intent;

    const-string/jumbo v0, "android.intent.action.MANAGE_PERMISSION_APPS"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v0, "android.intent.extra.PERMISSION_GROUP_NAME"

    const-string/jumbo v1, "android.permission-group.READ_MEDIA_VISUAL"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string p1, "GalleryLockConfirmDialog"

    const-string/jumbo v0, "No activity for ACTION_MANAGE_PERMISSION_APPS"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
