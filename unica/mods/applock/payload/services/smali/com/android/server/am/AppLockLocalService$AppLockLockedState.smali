.class public final Lcom/android/server/am/AppLockLocalService$AppLockLockedState;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public mLastAuthTimeSinceDeviceUnlock:J

.field public mLastSentLockedState:Ljava/lang/Boolean;

.field public mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

.field public mOwnerPackage:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastAuthTimeSinceDeviceUnlock:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    return-void
.end method
