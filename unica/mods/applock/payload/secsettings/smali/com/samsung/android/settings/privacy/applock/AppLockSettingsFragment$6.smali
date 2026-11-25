.class public final Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$6;
.super Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# instance fields
.field public final synthetic this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;


# direct methods
.method public constructor <init>(Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$6;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-direct {p0}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 1

    iget-object p2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$6;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    const/4 v0, 0x0

    iput-object v0, p2, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mCancellationSignal:Landroid/os/CancellationSignal;

    const/4 v0, 0x5

    if-eq p1, v0, :cond_2

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$6;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    invoke-static {}, Lcom/android/settingslib/utils/ThreadUtils;->getUiThreadHandler()Landroid/os/Handler;

    move-result-object p1

    new-instance p2, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda4;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda4;-><init>(B)V

    iput-object p0, p2, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$6;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mCancellationSignal:Landroid/os/CancellationSignal;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mIsAuthed:Z

    invoke-virtual {p0, p1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setContentVisible$2(Z)V

    return-void
.end method
