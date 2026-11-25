.class public interface abstract Landroid/security/applock/IPackageLockedStateListener;
.super Ljava/lang/Object;
.source "IPackageLockedStateListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/security/applock/IPackageLockedStateListener$Stub;,
        Landroid/security/applock/IPackageLockedStateListener$Default;
    }
.end annotation


# static fields
.field public static final blacklist DESCRIPTOR:Ljava/lang/String; = "android.security.applock.IPackageLockedStateListener"


# virtual methods
.method public abstract blacklist onPackageLockedStateChanged(Ljava/lang/String;IZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
