.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Ljava/lang/Object;

.field public synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-byte v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->$r8$classId:B

    const/16 v1, 0x8

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/samsung/android/settings/widget/SecFloatingBottomLayout;

    iget-boolean v2, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v2, Landroidx/core/view/SoftwareKeyboardControllerCompat;

    invoke-direct {v2, p0}, Landroidx/core/view/SoftwareKeyboardControllerCompat;-><init>(Landroid/view/View;)V

    new-instance p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;

    invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v3

    invoke-direct {p0, v3, v2}, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;-><init>(Landroid/view/WindowInsetsController;Landroidx/core/view/SoftwareKeyboardControllerCompat;)V

    iput-object v0, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mWindow:Landroid/view/Window;

    and-int v0, v1, v1

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mSoftwareKeyboardControllerCompat:Landroidx/core/view/SoftwareKeyboardControllerCompat;

    invoke-virtual {v0}, Landroidx/core/view/SoftwareKeyboardControllerCompat;->show()V

    :cond_1
    iget-object p0, p0, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mInsetsController:Landroid/view/WindowInsetsController;

    and-int/lit8 v0, v1, -0x9

    invoke-interface {p0, v0}, Landroid/view/WindowInsetsController;->show(I)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
