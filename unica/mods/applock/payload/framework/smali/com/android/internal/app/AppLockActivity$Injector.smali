.class public Lcom/android/internal/app/AppLockActivity$Injector;
.super Ljava/lang/Object;
.source "AppLockActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/AppLockActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Injector"
.end annotation


# direct methods
.method public constructor blacklist <init>()V
    .locals 0

    .line 1841
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public blacklist getBiometricPromptBuilder(Landroid/app/Activity;)Landroid/hardware/biometrics/BiometricPrompt$Builder;
    .locals 0

    .line 1844
    new-instance p0, Landroid/hardware/biometrics/BiometricPrompt$Builder;

    invoke-direct {p0, p1}, Landroid/hardware/biometrics/BiometricPrompt$Builder;-><init>(Landroid/content/Context;)V

    return-object p0
.end method

.method public blacklist getButtonLineCount(Landroid/widget/Button;)I
    .locals 0

    if-eqz p1, :cond_0

    .line 1861
    invoke-virtual {p1}, Landroid/widget/Button;->getLineCount()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public blacklist getCallingUid()I
    .locals 0

    .line 1849
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result p0

    return p0
.end method

.method public blacklist getRoleHolders(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1854
    const-class p0, Landroid/app/role/RoleManager;

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/role/RoleManager;

    if-eqz p0, :cond_0

    .line 1855
    invoke-virtual {p0, p2}, Landroid/app/role/RoleManager;->getRoleHolders(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 1856
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method
