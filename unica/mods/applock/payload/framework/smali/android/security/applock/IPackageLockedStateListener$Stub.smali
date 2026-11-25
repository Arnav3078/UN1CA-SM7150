.class public abstract Landroid/security/applock/IPackageLockedStateListener$Stub;
.super Landroid/os/Binder;
.source "IPackageLockedStateListener.java"

# interfaces
.implements Landroid/security/applock/IPackageLockedStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/security/applock/IPackageLockedStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/security/applock/IPackageLockedStateListener$Stub$Proxy;
    }
.end annotation


# static fields
.field static final blacklist TRANSACTION_onPackageLockedStateChanged:I = 0x1


# direct methods
.method public constructor blacklist <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 43
    const-string/jumbo v0, "android.security.applock.IPackageLockedStateListener"

    invoke-virtual {p0, p0, v0}, Landroid/security/applock/IPackageLockedStateListener$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static blacklist asInterface(Landroid/os/IBinder;)Landroid/security/applock/IPackageLockedStateListener;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 54
    :cond_0
    const-string/jumbo v0, "android.security.applock.IPackageLockedStateListener"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 55
    instance-of v1, v0, Landroid/security/applock/IPackageLockedStateListener;

    if-eqz v1, :cond_1

    .line 56
    check-cast v0, Landroid/security/applock/IPackageLockedStateListener;

    return-object v0

    .line 58
    :cond_1
    new-instance v0, Landroid/security/applock/IPackageLockedStateListener$Stub$Proxy;

    invoke-direct {v0, p0}, Landroid/security/applock/IPackageLockedStateListener$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static blacklist getDefaultTransactionName(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 71
    :cond_0
    const-string/jumbo p0, "onPackageLockedStateChanged"

    return-object p0
.end method


# virtual methods
.method public whitelist asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public blacklist getTransactionName(I)Ljava/lang/String;
    .locals 0

    .line 82
    invoke-static {p1}, Landroid/security/applock/IPackageLockedStateListener$Stub;->getDefaultTransactionName(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public whitelist onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    const v1, 0xffffff

    if-gt p1, v1, :cond_0

    .line 87
    const-string/jumbo v1, "android.security.applock.IPackageLockedStateListener"

    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    :cond_0
    if-eq p1, v0, :cond_1

    .line 105
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    return p0

    .line 94
    :cond_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 96
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    .line 98
    invoke-virtual {p2}, Landroid/os/Parcel;->readBoolean()Z

    move-result p4

    .line 99
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 100
    invoke-virtual {p0, p1, p3, p4}, Landroid/security/applock/IPackageLockedStateListener$Stub;->onPackageLockedStateChanged(Ljava/lang/String;IZ)V

    return v0
.end method
