.class Lcom/android/internal/app/AppLockActivity$2;
.super Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;
.source "AppLockActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/app/AppLockActivity;->showBiometricPrompt([Ljava/lang/String;Ljava/lang/CharSequence;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/AppLockActivity;

.field final synthetic blacklist val$newAppLockEnabled:Z

.field final synthetic blacklist val$packageLabel:Ljava/lang/CharSequence;

.field final synthetic blacklist val$packageNames:[Ljava/lang/String;


# direct methods
.method constructor blacklist <init>(Lcom/android/internal/app/AppLockActivity;Z[Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 977
    iput-boolean p2, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    iput-object p3, p0, Lcom/android/internal/app/AppLockActivity$2;->val$packageNames:[Ljava/lang/String;

    iput-object p4, p0, Lcom/android/internal/app/AppLockActivity$2;->val$packageLabel:Ljava/lang/CharSequence;

    iput-object p1, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-direct {p0}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public whitelist onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 3

    .line 1018
    invoke-super {p0, p1, p2}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationError(ILjava/lang/CharSequence;)V

    .line 1019
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Authentication error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AppLockActivity"

    invoke-static {p2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1020
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {p1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mhasFolderFlow(Lcom/android/internal/app/AppLockActivity;)Z

    move-result p1

    .line 1024
    iget-object p2, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    if-eqz p1, :cond_0

    .line 1021
    invoke-static {p2}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mcreateAuthenticationCanceledResult(Lcom/android/internal/app/AppLockActivity;)Landroid/os/Bundle;

    move-result-object p1

    iget-boolean v0, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    invoke-static {p2, p1, v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$msendAppLockResultBroadcast(Lcom/android/internal/app/AppLockActivity;Landroid/os/Bundle;Z)V

    goto :goto_0

    .line 1024
    :cond_0
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity$2;->val$packageNames:[Ljava/lang/String;

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$2;->val$packageLabel:Ljava/lang/CharSequence;

    iget-boolean v1, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    const/4 v2, 0x0

    invoke-static {p2, v2, p1, v0, v1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mshowResultToast(Lcom/android/internal/app/AppLockActivity;Z[Ljava/lang/String;Ljava/lang/CharSequence;Z)V

    .line 1027
    :goto_0
    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method public whitelist onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V
    .locals 5

    .line 981
    invoke-super {p0, p1}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V

    .line 982
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$sfgetDEBUG()Z

    move-result p1

    const-string v0, "AppLockActivity"

    if-eqz p1, :cond_0

    .line 983
    const-string p1, "Authentication succeeded"

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 985
    :cond_0
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {p1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mhasFolderFlow(Lcom/android/internal/app/AppLockActivity;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 988
    :try_start_0
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmEligiblePackageNames(Lcom/android/internal/app/AppLockActivity;)[Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmEligibleUserIds(Lcom/android/internal/app/AppLockActivity;)[I

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    .line 989
    invoke-interface {p1, v0, v1, v2}, Landroid/content/pm/IPackageManager;->setPackagesAppLockEnabledAsUsers([Ljava/lang/String;[IZ)Landroid/os/Bundle;

    move-result-object p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 994
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0, p1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mmergeFailures(Lcom/android/internal/app/AppLockActivity;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    .line 995
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    iget-boolean v1, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    invoke-static {v0, p1, v1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$msendAppLockResultBroadcast(Lcom/android/internal/app/AppLockActivity;Landroid/os/Bundle;Z)V

    .line 996
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    iget-boolean v1, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    invoke-static {v0, p1, v1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mshowFolderResultToast(Lcom/android/internal/app/AppLockActivity;Landroid/os/Bundle;Z)V

    .line 997
    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    :catch_0
    move-exception p0

    .line 992
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 999
    :cond_1
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity$2;->val$packageNames:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object p1, p1, v1

    .line 1001
    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$misAppLockCrossUserTarget(Lcom/android/internal/app/AppLockActivity;)Z

    move-result v1

    .line 1004
    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    if-eqz v1, :cond_2

    .line 1002
    iget-boolean v1, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    invoke-static {v2, p1, v1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$msetAppLockEnabledForTargetUser(Lcom/android/internal/app/AppLockActivity;Ljava/lang/String;Z)Z

    move-result v1

    goto :goto_0

    .line 1004
    :cond_2
    invoke-virtual {v2}, Lcom/android/internal/app/AppLockActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->setPackageAppLockEnabled(Ljava/lang/String;Z)Z

    move-result v1

    .line 1006
    :goto_0
    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    iget-boolean v3, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    iget-object v4, p0, Lcom/android/internal/app/AppLockActivity$2;->val$packageLabel:Ljava/lang/CharSequence;

    invoke-static {v2, v1, v3, v4}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mshowSettingsPromoIfNeeded(Lcom/android/internal/app/AppLockActivity;ZZLjava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 1007
    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    iget-object v3, p0, Lcom/android/internal/app/AppLockActivity$2;->val$packageLabel:Ljava/lang/CharSequence;

    iget-boolean v4, p0, Lcom/android/internal/app/AppLockActivity$2;->val$newAppLockEnabled:Z

    invoke-static {v2, v1, p1, v3, v4}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$mshowResultToast(Lcom/android/internal/app/AppLockActivity;ZLjava/lang/String;Ljava/lang/CharSequence;Z)V

    .line 1008
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$sfgetDEBUG()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1009
    const-string/jumbo p1, "Finishing, promo was not shown"

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1011
    :cond_3
    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity$2;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    :cond_4
    return-void
.end method
