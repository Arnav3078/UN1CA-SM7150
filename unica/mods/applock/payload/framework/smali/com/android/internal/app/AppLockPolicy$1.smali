.class Lcom/android/internal/app/AppLockPolicy$1;
.super Landroid/app/IUserSwitchObserver$Stub;
.source "AppLockPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/app/AppLockPolicy;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/AppLockPolicy;


# direct methods
.method constructor blacklist <init>(Lcom/android/internal/app/AppLockPolicy;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 514
    iput-object p1, p0, Lcom/android/internal/app/AppLockPolicy$1;->this$0:Lcom/android/internal/app/AppLockPolicy;

    invoke-direct {p0}, Landroid/app/IUserSwitchObserver$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public blacklist onBeforeUserSwitching(ILandroid/os/IRemoteCallback;)V
    .locals 0

    return-void
.end method

.method public blacklist onForegroundProfileSwitch(I)V
    .locals 0

    return-void
.end method

.method public blacklist onLockedBootComplete(I)V
    .locals 0

    return-void
.end method

.method public blacklist onUserSwitchComplete(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 525
    const-string p1, "AppLockPolicy"

    const-string/jumbo v0, "onUserSwitchComplete getLockedApps"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy$1;->this$0:Lcom/android/internal/app/AppLockPolicy;

    invoke-static {p0}, Lcom/android/internal/app/AppLockPolicy;->-$$Nest$mupdateLockedApps(Lcom/android/internal/app/AppLockPolicy;)V

    return-void
.end method

.method public blacklist onUserSwitching(ILandroid/os/IRemoteCallback;)V
    .locals 0

    return-void
.end method
