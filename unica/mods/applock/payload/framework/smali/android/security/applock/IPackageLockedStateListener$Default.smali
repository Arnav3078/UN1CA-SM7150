.class public Landroid/security/applock/IPackageLockedStateListener$Default;
.super Ljava/lang/Object;
.source "IPackageLockedStateListener.java"

# interfaces
.implements Landroid/security/applock/IPackageLockedStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/security/applock/IPackageLockedStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Default"
.end annotation


# direct methods
.method public constructor blacklist <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public whitelist asBinder()Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public blacklist onPackageLockedStateChanged(Ljava/lang/String;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    return-void
.end method
