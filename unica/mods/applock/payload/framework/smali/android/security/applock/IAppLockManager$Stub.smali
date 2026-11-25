.class public abstract Landroid/security/applock/IAppLockManager$Stub;
.super Landroid/os/Binder;
.source "IAppLockManager.java"

# interfaces
.implements Landroid/security/applock/IAppLockManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/security/applock/IAppLockManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/security/applock/IAppLockManager$Stub$Proxy;
    }
.end annotation


# static fields
.field static final blacklist TRANSACTION_getPackagesWithVisibleAppLockOverlay:I = 0x7

.field static final blacklist TRANSACTION_isAppLockSupportedForDevice:I = 0x5

.field static final blacklist TRANSACTION_isAppLockSupportedForUser:I = 0x6

.field static final blacklist TRANSACTION_isPackageLocked:I = 0x1

.field static final blacklist TRANSACTION_registerPackageLockedStateListener:I = 0x3

.field static final blacklist TRANSACTION_setAppLockEnabledPackageSuccessfullyAuthenticated:I = 0x2

.field static final blacklist TRANSACTION_unregisterPackageLockedStateListener:I = 0x4


# direct methods
.method public constructor blacklist <init>()V
    .locals 1

    .line 67
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 68
    const-string/jumbo v0, "android.security.applock.IAppLockManager"

    invoke-virtual {p0, p0, v0}, Landroid/security/applock/IAppLockManager$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static blacklist asInterface(Landroid/os/IBinder;)Landroid/security/applock/IAppLockManager;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 79
    :cond_0
    const-string/jumbo v0, "android.security.applock.IAppLockManager"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 80
    instance-of v1, v0, Landroid/security/applock/IAppLockManager;

    if-eqz v1, :cond_1

    .line 81
    check-cast v0, Landroid/security/applock/IAppLockManager;

    return-object v0

    .line 83
    :cond_1
    new-instance v0, Landroid/security/applock/IAppLockManager$Stub$Proxy;

    invoke-direct {v0, p0}, Landroid/security/applock/IAppLockManager$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static blacklist getDefaultTransactionName(I)Ljava/lang/String;
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 120
    :pswitch_0
    const-string/jumbo p0, "getPackagesWithVisibleAppLockOverlay"

    return-object p0

    .line 116
    :pswitch_1
    const-string/jumbo p0, "isAppLockSupportedForUser"

    return-object p0

    .line 112
    :pswitch_2
    const-string/jumbo p0, "isAppLockSupportedForDevice"

    return-object p0

    .line 108
    :pswitch_3
    const-string/jumbo p0, "unregisterPackageLockedStateListener"

    return-object p0

    .line 104
    :pswitch_4
    const-string/jumbo p0, "registerPackageLockedStateListener"

    return-object p0

    .line 100
    :pswitch_5
    const-string/jumbo p0, "setAppLockEnabledPackageSuccessfullyAuthenticated"

    return-object p0

    .line 96
    :pswitch_6
    const-string/jumbo p0, "isPackageLocked"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public whitelist asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public blacklist getTransactionName(I)Ljava/lang/String;
    .locals 0

    .line 131
    invoke-static {p1}, Landroid/security/applock/IAppLockManager$Stub;->getDefaultTransactionName(I)Ljava/lang/String;

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

    .line 136
    const-string/jumbo v1, "android.security.applock.IAppLockManager"

    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 210
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p0

    return p0

    .line 201
    :pswitch_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 202
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 203
    invoke-virtual {p0, p1}, Landroid/security/applock/IAppLockManager$Stub;->getPackagesWithVisibleAppLockOverlay(I)Ljava/util/List;

    move-result-object p0

    .line 204
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 205
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    goto :goto_0

    .line 191
    :pswitch_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 192
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 193
    invoke-virtual {p0, p1}, Landroid/security/applock/IAppLockManager$Stub;->isAppLockSupportedForUser(I)Z

    move-result p0

    .line 194
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 195
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeBoolean(Z)V

    goto :goto_0

    .line 183
    :pswitch_2
    invoke-virtual {p0}, Landroid/security/applock/IAppLockManager$Stub;->isAppLockSupportedForDevice()Z

    move-result p0

    .line 184
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 185
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeBoolean(Z)V

    goto :goto_0

    .line 175
    :pswitch_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/security/applock/IPackageLockedStateListener$Stub;->asInterface(Landroid/os/IBinder;)Landroid/security/applock/IPackageLockedStateListener;

    move-result-object p1

    .line 176
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 177
    invoke-virtual {p0, p1}, Landroid/security/applock/IAppLockManager$Stub;->unregisterPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V

    .line 178
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 166
    :pswitch_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/security/applock/IPackageLockedStateListener$Stub;->asInterface(Landroid/os/IBinder;)Landroid/security/applock/IPackageLockedStateListener;

    move-result-object p1

    .line 167
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 168
    invoke-virtual {p0, p1}, Landroid/security/applock/IAppLockManager$Stub;->registerPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V

    .line 169
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 155
    :pswitch_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 157
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    .line 158
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 159
    invoke-virtual {p0, p1, p4}, Landroid/security/applock/IAppLockManager$Stub;->setAppLockEnabledPackageSuccessfullyAuthenticated(Ljava/lang/String;I)V

    .line 160
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 143
    :pswitch_6
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 145
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    .line 146
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 147
    invoke-virtual {p0, p1, p4}, Landroid/security/applock/IAppLockManager$Stub;->isPackageLocked(Ljava/lang/String;I)Z

    move-result p0

    .line 148
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 149
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeBoolean(Z)V

    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
