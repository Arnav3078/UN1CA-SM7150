.class Lcom/android/internal/app/LockedAppActivity$1;
.super Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;
.source "LockedAppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/LockedAppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/LockedAppActivity;


# direct methods
.method public static synthetic blacklist $r8$lambda$J5-PgKbX17leXFJ12GQzEo1GfmM(Lcom/android/internal/app/LockedAppActivity$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/LockedAppActivity$1;->lambda$onAuthenticationSucceeded$0()V

    return-void
.end method

.method constructor blacklist <init>(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 274
    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-direct {p0}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;-><init>()V

    return-void
.end method

.method private synthetic blacklist lambda$onAuthenticationSucceeded$0()V
    .locals 2

    .line 315
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsLockedTaskUnlockTargetDrawComplete(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 316
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mcompleteLockedTaskUnlockIfReady(Lcom/android/internal/app/LockedAppActivity;)V

    return-void
.end method


# virtual methods
.method public whitelist onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 2

    .line 354
    invoke-super {p0, p1, p2}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationError(ILjava/lang/CharSequence;)V

    .line 355
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Authentication error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo p2, "LockedAppActivity"

    invoke-static {p2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsAuthFlowActive(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 358
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 363
    :cond_0
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misUninstallMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    .line 371
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    if-eqz p1, :cond_1

    const/4 p1, 0x3

    .line 364
    const-string p2, "App lock user authentication failed"

    invoke-static {v0, p1, p2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$msendUninstallFailure(Lcom/android/internal/app/LockedAppActivity;ILjava/lang/String;)V

    .line 366
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 371
    :cond_1
    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misInterceptMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    .line 384
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    if-eqz p1, :cond_3

    .line 380
    invoke-virtual {v0}, Lcom/android/internal/app/LockedAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string/jumbo v0, "com.android.internal.app.extra.IN_TARGET_TASK"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 381
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmInjector(Lcom/android/internal/app/LockedAppActivity;)Lcom/android/internal/app/LockedAppActivity$Injector;

    move-result-object p1

    iget-object p2, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->moveTaskToBack(Landroid/app/Activity;Z)V

    .line 383
    :cond_2
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 384
    :cond_3
    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misOneShotAuthMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 386
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    :cond_4
    :goto_0
    return-void
.end method

.method public whitelist onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V
    .locals 3

    .line 277
    invoke-super {p0, p1}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V

    .line 278
    invoke-static {}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$sfgetDEBUG()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 279
    const-string/jumbo p1, "LockedAppActivity"

    const-string v0, "Authentication succeeded"

    invoke-static {p1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    :cond_0
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsAuthFlowActive(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 284
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const-string v0, "AUTH_SUCCESS"

    invoke-static {p1, v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mlogAppLockEvent(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;)V

    .line 286
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    .line 287
    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    sget-boolean p1, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    .line 289
    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misInterceptMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    if-nez p1, :cond_2

    goto/16 :goto_0

    .line 293
    :cond_2
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misClearStorageMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    .line 298
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    if-eqz p1, :cond_3

    const/4 p1, -0x1

    .line 294
    invoke-virtual {v0, p1}, Lcom/android/internal/app/LockedAppActivity;->setResult(I)V

    .line 295
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    .line 298
    :cond_3
    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misUninstallMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    .line 307
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    if-eqz p1, :cond_4

    .line 299
    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmInjector(Lcom/android/internal/app/LockedAppActivity;)Lcom/android/internal/app/LockedAppActivity$Injector;

    move-result-object p1

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p1, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->getPackageManager(Landroid/app/Activity;)Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/pm/PackageManager;->getPackageInstaller()Landroid/content/pm/PackageInstaller;

    move-result-object p1

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmUninstallVersionedPackage(Lcom/android/internal/app/LockedAppActivity;)Landroid/content/pm/VersionedPackage;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmUninstallFlags(Lcom/android/internal/app/LockedAppActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmUninstallStatusReceiver(Lcom/android/internal/app/LockedAppActivity;)Landroid/content/IntentSender;

    move-result-object v2

    .line 300
    invoke-virtual {p1, v0, v1, v2}, Landroid/content/pm/PackageInstaller;->uninstall(Landroid/content/pm/VersionedPackage;ILandroid/content/IntentSender;)V

    .line 302
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p0}, Lcom/android/internal/app/LockedAppActivity;->finish()V

    return-void

    :cond_4
    const/4 p1, 0x1

    .line 307
    invoke-static {v0, p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsAuthenticationSucceededForSaLogging(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 309
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misLockedTaskMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 313
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0, p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsWaitingForLockedTaskUnlockDraw(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 314
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmInjector(Lcom/android/internal/app/LockedAppActivity;)Lcom/android/internal/app/LockedAppActivity$Injector;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    new-instance v2, Lcom/android/internal/app/LockedAppActivity$1$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/android/internal/app/LockedAppActivity$1$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/LockedAppActivity$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/app/LockedAppActivity$Injector;->convertToTranslucent(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 320
    :cond_5
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmAppLockManager(Lcom/android/internal/app/LockedAppActivity;)Landroid/security/applock/AppLockManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmPackageName(Lcom/android/internal/app/LockedAppActivity;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmUserId(Lcom/android/internal/app/LockedAppActivity;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/security/applock/AppLockManager;->setAppLockEnabledPackageSuccessfullyAuthenticated(Ljava/lang/String;I)V

    .line 324
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const-string v1, "AUTH_UNLOCK_RETURN"

    invoke-static {v0, v1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mlogAppLockEvent(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;)V

    .line 326
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misLockedTaskMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result v0

    .line 337
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    if-eqz v0, :cond_7

    .line 327
    invoke-static {v1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmShowLockedTaskUiInEmptyTask(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_0

    .line 333
    :cond_6
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0, p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsLockedTaskUnlockStateUpdated(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 334
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mcompleteLockedTaskUnlockIfReady(Lcom/android/internal/app/LockedAppActivity;)V

    return-void

    .line 337
    :cond_7
    invoke-static {v1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misInterceptMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result v0

    .line 349
    iget-object v1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    if-eqz v0, :cond_9

    .line 338
    invoke-static {v1, p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsInterceptUnlockStateUpdated(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 339
    sget-boolean p1, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    .line 340
    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 341
    :cond_8
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$1;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mcompleteUnlockAfterDestroyed(Lcom/android/internal/app/LockedAppActivity;)V

    return-void

    .line 349
    :cond_9
    invoke-static {v1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mcompleteUnlockAndFinish(Lcom/android/internal/app/LockedAppActivity;)V

    :cond_a
    :goto_0
    return-void
.end method
