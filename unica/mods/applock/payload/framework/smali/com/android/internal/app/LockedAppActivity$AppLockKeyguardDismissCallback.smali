.class Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;
.super Landroid/app/KeyguardManager$KeyguardDismissCallback;
.source "LockedAppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/LockedAppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AppLockKeyguardDismissCallback"
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/LockedAppActivity;


# direct methods
.method private constructor blacklist <init>(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 1945
    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-direct {p0}, Landroid/app/KeyguardManager$KeyguardDismissCallback;-><init>()V

    return-void
.end method

.method synthetic constructor blacklist <init>(Lcom/android/internal/app/LockedAppActivity;Lcom/android/internal/app/LockedAppActivity-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;-><init>(Lcom/android/internal/app/LockedAppActivity;)V

    return-void
.end method


# virtual methods
.method public whitelist onDismissCancelled()V
    .locals 1

    .line 1976
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const-string/jumbo v0, "Keyguard dismiss cancelled"

    invoke-static {p0, v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$monKeyguardDismissFailed(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;)V

    return-void
.end method

.method public whitelist onDismissError()V
    .locals 1

    .line 1981
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const-string/jumbo v0, "Keyguard dismiss error"

    invoke-static {p0, v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$monKeyguardDismissFailed(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;)V

    return-void
.end method

.method public whitelist onDismissSucceeded()V
    .locals 3

    .line 1949
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmIsKeyguardDismissPending(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result v0

    const-string/jumbo v1, "LockedAppActivity"

    if-nez v0, :cond_0

    .line 1951
    invoke-static {}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$sfgetDEBUG()Z

    move-result p0

    if-eqz p0, :cond_4

    .line 1952
    const-string/jumbo p0, "Ignoring stale Keyguard dismiss callback"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1957
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsKeyguardDismissPending(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 1958
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {v0}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {v0}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1965
    :cond_1
    invoke-static {}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$sfgetDEBUG()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1966
    const-string/jumbo v0, "Keyguard dismiss succeeded, showing biometric prompt"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1970
    :cond_2
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {v0, v2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsAuthFlowActive(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 1971
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockKeyguardDismissCallback;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mshowBiometricPrompt(Lcom/android/internal/app/LockedAppActivity;)V

    return-void

    .line 1959
    :cond_3
    :goto_0
    invoke-static {}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$sfgetDEBUG()Z

    move-result p0

    if-eqz p0, :cond_4

    .line 1960
    const-string/jumbo p0, "Keyguard dismiss succeeded, but the activity is finishing or destroyed, returning"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return-void
.end method
