.class public Lcom/android/internal/app/LockedAppActivity$Injector;
.super Ljava/lang/Object;
.source "LockedAppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/LockedAppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Injector"
.end annotation


# direct methods
.method public constructor blacklist <init>()V
    .locals 0

    .line 1994
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic blacklist lambda$convertToTranslucent$0(Ljava/lang/Runnable;Z)V
    .locals 2

    .line 2031
    invoke-static {}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$sfgetDEBUG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2032
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Target draw before Locked Task finish: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v0, "LockedAppActivity"

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2034
    :cond_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method


# virtual methods
.method public blacklist convertToTranslucent(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 0

    .line 2030
    new-instance p0, Lcom/android/internal/app/LockedAppActivity$Injector$$ExternalSyntheticLambda0;

    invoke-direct {p0, p2}, Lcom/android/internal/app/LockedAppActivity$Injector$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/app/Activity;->convertToTranslucent(Landroid/app/Activity$TranslucentConversionListener;Landroid/app/ActivityOptions;)Z

    return-void
.end method

.method public blacklist findViewById(Landroid/app/Activity;I)Landroid/view/View;
    .locals 0

    .line 2075
    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public blacklist getAppLockManager(Landroid/app/Activity;)Landroid/security/applock/AppLockManager;
    .locals 0

    .line 2154
    const-class p0, Landroid/security/applock/AppLockManager;

    invoke-virtual {p1, p0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/security/applock/AppLockManager;

    return-object p0
.end method

.method public blacklist getBiometricPromptBuilder(Landroid/app/Activity;)Landroid/hardware/biometrics/BiometricPrompt$Builder;
    .locals 0

    .line 2164
    new-instance p0, Landroid/hardware/biometrics/BiometricPrompt$Builder;

    invoke-direct {p0, p1}, Landroid/hardware/biometrics/BiometricPrompt$Builder;-><init>(Landroid/content/Context;)V

    return-object p0
.end method

.method public blacklist getDisplayId(Landroid/app/Activity;)I
    .locals 0

    .line 2085
    invoke-virtual {p1}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 2086
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public blacklist getIntentSender(Landroid/content/Intent;)Landroid/content/IntentSender;
    .locals 1

    .line 2174
    const-string/jumbo p0, "android.intent.extra.INTENT"

    const-class v0, Landroid/content/IntentSender;

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/IntentSender;

    return-object p0
.end method

.method public blacklist getKeyguardManager(Landroid/app/Activity;)Landroid/app/KeyguardManager;
    .locals 0

    .line 2137
    const-class p0, Landroid/app/KeyguardManager;

    invoke-virtual {p1, p0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/KeyguardManager;

    return-object p0
.end method

.method public blacklist getOnBackInvokedDispatcher(Landroid/app/Activity;)Landroid/window/OnBackInvokedDispatcher;
    .locals 0

    .line 2147
    invoke-virtual {p1}, Landroid/app/Activity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object p0

    return-object p0
.end method

.method public blacklist getPackageManager(Landroid/app/Activity;)Landroid/content/pm/PackageManager;
    .locals 0

    .line 2126
    invoke-virtual {p1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    return-object p0
.end method

.method public blacklist getTelecomManager(Landroid/app/Activity;)Landroid/telecom/TelecomManager;
    .locals 0

    .line 2193
    const-class p0, Landroid/telecom/TelecomManager;

    invoke-virtual {p1, p0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telecom/TelecomManager;

    return-object p0
.end method

.method public blacklist getUninstallStatusReceiver(Landroid/content/Intent;)Landroid/content/IntentSender;
    .locals 1

    .line 2184
    const-string/jumbo p0, "com.android.internal.app.extra.STATUS_RECEIVER"

    const-class v0, Landroid/content/IntentSender;

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/IntentSender;

    return-object p0
.end method

.method public blacklist hasWindowFocus(Landroid/app/Activity;)Z
    .locals 0

    .line 2056
    invoke-virtual {p1}, Landroid/app/Activity;->hasWindowFocus()Z

    move-result p0

    return p0
.end method

.method blacklist isDisplaySleeping(Landroid/app/Activity;)Z
    .locals 0

    .line 2024
    invoke-virtual {p1}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 2025
    invoke-virtual {p0}, Landroid/view/Display;->getState()I

    move-result p0

    invoke-static {p0}, Landroid/view/Display;->isActiveState(I)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public blacklist isInSplitScreenWindowingMode(Landroid/app/Activity;)Z
    .locals 0

    .line 2062
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 2061
    invoke-static {p0}, Landroid/app/WindowConfiguration;->isSplitScreenWindowingMode(Landroid/app/WindowConfiguration;)Z

    move-result p0

    return p0
.end method

.method public blacklist isRunningOnComputerControlDisplay(Landroid/app/Activity;)Z
    .locals 3

    .line 2097
    invoke-virtual {p0, p1}, Lcom/android/internal/app/LockedAppActivity$Injector;->getDisplayId(Landroid/app/Activity;)I

    move-result p0

    const/4 v0, -0x1

    const/4 v1, 0x0

    if-eq p0, v0, :cond_3

    if-nez p0, :cond_0

    goto :goto_0

    .line 2101
    :cond_0
    const-class v0, Landroid/companion/virtual/VirtualDeviceManager;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/companion/virtual/VirtualDeviceManager;

    if-nez p1, :cond_1

    return v1

    .line 2105
    :cond_1
    invoke-virtual {p1, p0}, Landroid/companion/virtual/VirtualDeviceManager;->getDeviceIdForDisplayId(I)I

    move-result p0

    .line 2106
    invoke-virtual {p1, p0}, Landroid/companion/virtual/VirtualDeviceManager;->getVirtualDevice(I)Landroid/companion/virtual/VirtualDevice;

    move-result-object p0

    .line 2108
    sget-boolean p1, Lcom/samsung/android/rune/CoreRune;->FW_DEVICE_CONTROL:Z

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    if-eqz p0, :cond_2

    .line 2109
    invoke-virtual {p0}, Landroid/companion/virtual/VirtualDevice;->getDeviceProfile()I

    move-result p1

    const/4 v2, 0x2

    if-ne p1, v2, :cond_2

    return v0

    :cond_2
    if-eqz p0, :cond_3

    .line 2115
    invoke-virtual {p0}, Landroid/companion/virtual/VirtualDevice;->getDeviceProfile()I

    move-result p0

    if-ne p0, v0, :cond_3

    return v0

    :cond_3
    :goto_0
    return v1
.end method

.method public blacklist logAppLaunch(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2256
    invoke-static {p1, p2, p3}, Lcom/samsung/android/core/CoreSaLogger;->logForAppLock(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    return-void
.end method

.method public blacklist moveTaskToBack(Landroid/app/Activity;Z)V
    .locals 0

    .line 2250
    invoke-virtual {p1, p2}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    return-void
.end method

.method public blacklist sendTargetIntent(Landroid/app/Activity;Landroid/content/IntentSender;)V
    .locals 1

    const/4 v0, -0x1

    .line 2189
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/internal/app/LockedAppActivity$Injector;->sendTargetIntent(Landroid/app/Activity;Landroid/content/IntentSender;I)V

    return-void
.end method

.method public blacklist sendTargetIntent(Landroid/app/Activity;Landroid/content/IntentSender;I)V
    .locals 10

    .line 2205
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2207
    invoke-static {}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$sfgetDEBUG()Z

    move-result p0

    const-string/jumbo v1, "LockedAppActivity"

    if-eqz p0, :cond_0

    .line 2208
    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "Sending target intent: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2218
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object p0

    const/4 v0, 0x3

    .line 2219
    invoke-virtual {p0, v0}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    move-result-object p0

    const/4 v0, -0x1

    if-eq p3, v0, :cond_1

    .line 2225
    invoke-virtual {p0, p3}, Landroid/app/ActivityOptions;->setLaunchTaskId(I)V

    .line 2230
    :cond_1
    invoke-virtual {p0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v9

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, p1

    move-object v3, p2

    .line 2228
    invoke-virtual/range {v2 .. v9}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    .line 2232
    instance-of p0, v2, Lcom/android/internal/app/LockedAppActivity;

    if-eqz p0, :cond_2

    .line 2233
    move-object p1, v2

    check-cast p1, Lcom/android/internal/app/LockedAppActivity;

    .line 2234
    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mlogAppLaunchIfNeeded(Lcom/android/internal/app/LockedAppActivity;)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 2238
    const-string/jumbo p1, "Unable to send intent"

    invoke-static {v1, p1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public blacklist setContentView(Landroid/app/Activity;I)V
    .locals 0

    .line 2046
    invoke-virtual {p1, p2}, Landroid/app/Activity;->setContentView(I)V

    return-void
.end method

.method public blacklist setTheme(Landroid/app/Activity;I)V
    .locals 0

    .line 2005
    invoke-virtual {p1, p2}, Landroid/app/Activity;->setTheme(I)V

    return-void
.end method

.method public blacklist setTranslucent(Landroid/app/Activity;Z)V
    .locals 0

    .line 2015
    invoke-virtual {p1, p2}, Landroid/app/Activity;->setTranslucent(Z)Z

    return-void
.end method

.method blacklist setTurnScreenOn(Landroid/app/Activity;Z)V
    .locals 0

    .line 2020
    invoke-virtual {p1, p2}, Landroid/app/Activity;->setTurnScreenOn(Z)V

    return-void
.end method
