.class public final Lcom/android/server/am/AppLockLocalService;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Landroid/app/AppLockInternal;
.implements Landroid/app/KeyguardManager$DeviceLockedStateListener;


# static fields
.field public static final DEBUG:Z

.field public static final SPC_SERVICE_STATE_COMPONENT:Landroid/content/ComponentName;


# instance fields
.field final mAmService:Lcom/android/server/am/ActivityManagerService;

.field public final mAnsweredIncomingCalls:Landroid/util/SparseArray;

.field public final mAppLockLockedStatesForUser:Landroid/util/SparseArray;

.field public final mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

.field public final mAtmInternal:Lcom/android/server/wm/ActivityTaskManagerInternal;

.field public final mContext:Landroid/content/Context;

.field public final mExemptRoleHoldersChangedListener:Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;

.field public final mExemptRolePackagesForUser:Landroid/util/SparseArray;

.field public final mExemptRoleUserUnlockedReceiver:Lcom/android/server/am/AppLockLocalService$1;

.field public final mExemptRoles:Landroid/util/ArraySet;

.field public final mGracePeriodMsForUser:Landroid/util/SparseLongArray;

.field public final mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

.field public volatile mIsAppLockSupportedForDevice:Ljava/lang/Boolean;

.field public final mLocalListenerDispatchLock:Ljava/lang/Object;

.field public final mLock:Ljava/lang/Object;

.field mNotificationListener:Lcom/android/server/am/AppLockLocalService$NotificationListener;

.field public final mPackageLockedStateListeners:Ljava/util/ArrayList;

.field final mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

.field public mPmInternal:Landroid/content/pm/PackageManagerInternal;

.field public final mRecentlyRemovedCalls:Ljava/util/ArrayList;

.field public final mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

.field final mRoleHoldersChangedListener:Landroid/app/role/OnRoleHoldersChangedListener;

.field public final mSearchRoleAvailabilityListener:Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda8;

.field public final mSearchRolePackagesForUser:Landroid/util/SparseArray;

.field final mSearchablesChangedReceiver:Landroid/content/BroadcastReceiver;

.field public final mSpcEnabledForUser:Landroid/util/SparseBooleanArray;

.field public final mSpcStateLock:Ljava/lang/Object;

.field public volatile mSpcStateRefreshCallback:Ljava/util/function/IntConsumer;

.field public final mTrackedCallNotifications:Landroid/util/ArrayMap;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Landroid/os/Build;->isDebuggable()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "AppLockLocalService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    new-instance v0, Landroid/content/ComponentName;

    const-string/jumbo v1, "com.samsung.android.app.parentalcare"

    const-string/jumbo v2, "com.samsung.android.app.parentalcare.provider.ServiceStateReceiver"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/am/AppLockLocalService;->SPC_SERVICE_STATE_COMPONENT:Landroid/content/ComponentName;

    return-void
.end method

.method public constructor <init>(Lcom/android/server/am/ActivityManagerService;)V
    .locals 1

    .line 207
    new-instance v0, Lcom/android/server/am/AppLockLocalService$InjectorImpl;

    .line 208
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 209
    invoke-direct {p0, p1, v0}, Lcom/android/server/am/AppLockLocalService;-><init>(Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/AppLockLocalService$Injector;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/AppLockLocalService$Injector;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mIsAppLockSupportedForDevice:Ljava/lang/Boolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mSpcStateLock:Ljava/lang/Object;

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mSpcEnabledForUser:Landroid/util/SparseBooleanArray;

    new-instance v0, Landroid/util/SparseLongArray;

    invoke-direct {v0}, Landroid/util/SparseLongArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mGracePeriodMsForUser:Landroid/util/SparseLongArray;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLocalListenerDispatchLock:Ljava/lang/Object;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mSearchRolePackagesForUser:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRolePackagesForUser:Landroid/util/SparseArray;

    new-instance v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/am/AppLockLocalService;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoleHoldersChangedListener:Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;

    new-instance v1, Lcom/android/server/am/AppLockLocalService$1;

    invoke-direct {v1, p0, v2}, Lcom/android/server/am/AppLockLocalService$1;-><init>(Lcom/android/server/am/AppLockLocalService;B)V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoleUserUnlockedReceiver:Lcom/android/server/am/AppLockLocalService$1;

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    new-instance v1, Landroid/os/RemoteCallbackList;

    invoke-direct {v1}, Landroid/os/RemoteCallbackList;-><init>()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mPackageLockedStateListeners:Ljava/util/ArrayList;

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    new-instance v1, Landroid/util/ArrayMap;

    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    new-instance v1, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;

    invoke-direct {v1}, Lcom/android/internal/content/PackageMonitor;-><init>()V

    iput-object p0, v1, Lcom/android/server/am/AppLockLocalService$AppLockPackageMonitor;->mService:Lcom/android/server/am/AppLockLocalService;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    new-instance v1, Lcom/android/server/am/AppLockLocalService$NotificationListener;

    invoke-direct {v1, p0}, Lcom/android/server/am/AppLockLocalService$NotificationListener;-><init>(Lcom/android/server/am/AppLockLocalService;)V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mNotificationListener:Lcom/android/server/am/AppLockLocalService$NotificationListener;

    new-instance v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/am/AppLockLocalService;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mRoleHoldersChangedListener:Landroid/app/role/OnRoleHoldersChangedListener;

    new-instance v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda8;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda8;->f$0:Lcom/android/server/am/AppLockLocalService;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mSearchRoleAvailabilityListener:Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda8;

    new-instance v1, Lcom/android/server/am/AppLockLocalService$1;

    invoke-direct {v1, p0, v2}, Lcom/android/server/am/AppLockLocalService$1;-><init>(Lcom/android/server/am/AppLockLocalService;B)V

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mSearchablesChangedReceiver:Landroid/content/BroadcastReceiver;

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService;->mAmService:Lcom/android/server/am/ActivityManagerService;

    iget-object v1, p1, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    iget-object p1, p1, Lcom/android/server/am/ActivityManagerService;->mAtmInternal:Lcom/android/server/wm/ActivityTaskManagerInternal;

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService;->mAtmInternal:Lcom/android/server/wm/ActivityTaskManagerInternal;

    iput-object p2, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    const-string/jumbo p0, "android.app.role.HOME"

    invoke-virtual {v0, p0}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    const-string/jumbo p0, "android.app.role.DIALER"

    invoke-virtual {v0, p0}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static addCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V
    .locals 1

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/ArrayMap;

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {v0, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-nez p0, :cond_1

    new-instance p0, Landroid/util/ArraySet;

    invoke-direct {p0}, Landroid/util/ArraySet;-><init>()V

    invoke-virtual {v0, p2, p0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-interface {p0, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static addPendingIntent(Landroid/util/ArraySet;Landroid/util/ArraySet;Ljava/lang/String;Landroid/app/PendingIntent;)V
    .locals 2

    if-eqz p3, :cond_2

    invoke-virtual {p3}, Landroid/app/PendingIntent;->isActivity()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p3}, Landroid/app/PendingIntent;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p0, v0}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p3}, Landroid/app/PendingIntent;->getTarget()Landroid/content/IIntentSender;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-virtual {p3}, Landroid/app/PendingIntent;->getTarget()Landroid/content/IIntentSender;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/IIntentSender;->asBinder()Landroid/os/IBinder;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_1
    return-void
.end method

.method public static logAppLockEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const-string v0, " userId="

    const-string v1, " "

    const-string v2, "AppLockTrace "

    invoke-static {p0, v2, p1, v0, v1}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo p1, "ro.product_ship"

    const/4 p3, 0x1

    invoke-static {p1, p3}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, " package="

    invoke-static {p1, p2}, Landroid/net/ConnectivityModuleConnector$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    const-string p2, "AppLockLocalService"

    invoke-static {p0, p1, p2}, Lcom/android/server/HeapdumpWatcher$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static removeCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V
    .locals 2

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/ArrayMap;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_1

    invoke-interface {v1, p3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-virtual {v0, p2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final cancelPackageAppLockedJobLocked(ILjava/lang/String;)V
    .locals 4

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    const-string v1, "AppLockLocalService"

    if-eqz v0, :cond_0

    const-string/jumbo v2, "cancelPackageAppLockedJobLocked for "

    const-string v3, " and user: "

    invoke-static {p1, v2, p2, v3, v1}, Lcom/android/server/security/applock/AppLockOutlineActiveSvc;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v3, v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    if-nez v3, :cond_1

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {p0}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object p0

    iget-object v0, v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "jobRef="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "LOCK_JOB_CANCEL"

    invoke-static {p1, v0, p2, p0}, Lcom/android/server/am/AppLockLocalService;->logAppLockEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    iput-object p0, v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    return-void

    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    const-string/jumbo p0, "cancelPackageAppLockedJobLocked: no job to cancel"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void
.end method

.method public final checkAndAcceptIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;Landroid/os/IBinder;)Z
    .locals 2

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    if-nez p4, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/server/am/AppLockLocalService;->isCallPendingIntentLocked(Ljava/lang/String;ILandroid/content/ComponentName;Landroid/os/IBinder;)Z

    move-result p4

    if-nez p4, :cond_1

    monitor-exit v1

    return v0

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-static {p0, p2, p1, p3}, Lcom/android/server/am/AppLockLocalService;->addCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V

    const/4 p0, 0x1

    monitor-exit v1

    return p0

    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final cleanupTrackedCallNotificationLocked(Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;Z)V
    .locals 10

    iget-object v0, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    iget v1, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    iget-object v2, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    if-nez v2, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    invoke-virtual {p0, v8, v9}, Lcom/android/server/am/AppLockLocalService;->pruneRecentlyRemovedCallsLocked(J)V

    iget v2, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mCallType:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3

    :cond_1
    if-nez p2, :cond_3

    iget-object v2, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-virtual {v2}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mTokens:Landroid/util/ArraySet;

    if-eqz v2, :cond_2

    :goto_0
    move-object v7, v2

    goto :goto_1

    :cond_2
    new-instance v2, Landroid/util/ArraySet;

    invoke-direct {v2}, Landroid/util/ArraySet;-><init>()V

    goto :goto_0

    :goto_1
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    iget v4, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    iget-object v5, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    iget-object v6, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-direct/range {v3 .. v9}, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;-><init>(ILjava/lang/String;Landroid/util/ArraySet;Landroid/util/ArraySet;J)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v2}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda10;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object p0, v3, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda10;->f$0:Lcom/android/server/am/AppLockLocalService;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const-wide/16 v4, 0x1388

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    const/4 v2, 0x0

    :goto_2
    iget-object v3, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-virtual {v3}, Landroid/util/ArraySet;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    iget-object v3, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-virtual {v3, v2}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ComponentName;

    if-eqz p2, :cond_4

    iget-object v4, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mKey:Ljava/lang/String;

    invoke-virtual {p0, v1, v3, v4, v0}, Lcom/android/server/am/AppLockLocalService;->isComponentReferencedByOtherNotificationLocked(ILandroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-static {v4, v1, v0, v3}, Lcom/android/server/am/AppLockLocalService;->removeCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    return-void
.end method

.method public final clearAllCallStatesForPackage(Ljava/lang/String;I)V
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->clearAllCallStatesForPackageLocked(ILjava/lang/String;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final clearAllCallStatesForPackageLocked(ILjava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/ArrayMap;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v1, v0}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    iget v2, v1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    if-ne v2, p1, :cond_1

    iget-object v1, v1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v1, v0}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->pruneRecentlyRemovedCallsForPackageLocked(ILjava/lang/String;)V

    return-void
.end method

.method public final clearTrackedCallNotificationsForUserLocked(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v1, v0}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    iget v1, v1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    if-ne v1, p1, :cond_0

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v1, v0}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_3

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    iget v1, v1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    if-ne v1, p1, :cond_2

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public final copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mPackageLockedStateListeners:Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public final detachAppLockGroupMemberLocked(Ljava/lang/String;ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Z)Z
    .locals 5

    invoke-virtual {p0, p3, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    if-eqz p4, :cond_0

    invoke-virtual {p0, p1, p2, v2}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->cancelPackageAppLockedJobLocked(ILjava/lang/String;)V

    :cond_1
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->removeAppLockRecentsDeferralsLocked(ILjava/lang/String;)V

    sget-boolean v1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v1, :cond_2

    const-string v1, " (user "

    const-string v3, ") leaves the group of "

    const-string/jumbo v4, "detachAppLockGroupMemberLocked: "

    invoke-static {p2, v4, p1, v1, v3}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v1, p3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mOwnerPackage:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", leaving="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", remaining="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "AppLockLocalService"

    invoke-static {v1, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v0}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;

    invoke-direct {v1, v2}, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    iput-object p1, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iput p2, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda2;->f$2:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3
    if-eqz p4, :cond_4

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object p1, p3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    return v2
.end method

.method public final dispatchAppLockGroupLockedStateChanged(Ljava/util/ArrayList;Ljava/util/List;Lcom/android/server/am/AppLockLocalService$AppLockLockedState;IZ)V
    .locals 9

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v8, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v2 .. v8}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V
    .locals 8

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const-string v1, "AppLockLocalService"

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0}, Landroid/os/RemoteCallbackList;->getRegisteredCallbackCount()I

    move-result v0

    if-nez v0, :cond_1

    sget-boolean p0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz p0, :cond_0

    const-string/jumbo p0, "dispatchPackageLockedStateChanged: no listeners"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void

    :cond_1
    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    const-string v2, ") locked="

    const-string v3, " (user "

    if-eqz v0, :cond_2

    const-string/jumbo v4, "dispatchPackageLockedStateChanged: "

    invoke-static {p3, v4, p2, v3, v2}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, " for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " listeners, notifyLocalListenersSynchronously="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v4, p5}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    :cond_2
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v4, "dispatchPackageLockedStateChanged: Should not be holding the internal lock!"

    invoke-static {v1, v4}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    if-eqz p5, :cond_4

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAmService:Lcom/android/server/am/ActivityManagerService;

    invoke-static {v4}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string/jumbo v4, "dispatchPackageLockedStateChanged: Should not be holding the AMS lock when notifying local listeners synchronously!"

    invoke-static {v1, v4}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    if-eqz p5, :cond_6

    if-eqz v0, :cond_5

    const-string/jumbo p5, "dispatchPackageLockedStateChanged: Notifying local listeners onPackageLockedStateChanged synchronously for "

    invoke-static {p3, p5, p2, v3, v2}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-static {v1, p5, p4}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    :cond_5
    move-object v2, p0

    move-object v6, p1

    move-object v5, p2

    move v3, p3

    move v7, p4

    move-object v4, p6

    invoke-virtual/range {v2 .. v7}, Lcom/android/server/am/AppLockLocalService;->notifyLocalListenersIfLockedStateIsUpToDate(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)V

    iget-object p0, v2, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {p0}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object p0

    new-instance p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v2, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$0:Lcom/android/server/am/AppLockLocalService;

    iput-object v4, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$1:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    iput-object v5, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iput v3, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$3:I

    iput-boolean v7, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda3;->f$4:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_6
    move-object v2, p0

    move-object v6, p1

    move-object v5, p2

    move v3, p3

    move v7, p4

    move-object v4, p6

    iget-object p0, v2, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {p0}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object p0

    new-instance p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v2, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$0:Lcom/android/server/am/AppLockLocalService;

    iput-object v5, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$1:Ljava/lang/String;

    iput v3, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$2:I

    iput-boolean v7, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$3:Z

    iput-object v4, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$4:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    iput-object v6, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda4;->f$5:Ljava/util/ArrayList;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final dispatchPackageLockedStateChangedForRemoteListeners(ILjava/lang/String;Z)V
    .locals 5

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    const-string v1, "AppLockLocalService"

    if-eqz v0, :cond_0

    const-string v0, " user "

    const-string v2, " locked="

    const-string/jumbo v3, "dispatchPackageLockedStateChangedForRemoteListeners: "

    invoke-static {p1, v3, p2, v0, v2}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v1, v0, p3}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

    if-ge v2, v0, :cond_1

    :try_start_0
    invoke-virtual {v3, v2}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v3

    check-cast v3, Landroid/security/applock/IPackageLockedStateListener;

    invoke-interface {v3, p2, p1, p3}, Landroid/security/applock/IPackageLockedStateListener;->onPackageLockedStateChanged(Ljava/lang/String;IZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v3

    :try_start_1
    const-string v4, "Failed to notify remote listener of package locked state change"

    invoke-static {v1, v4, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :goto_2
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {p0}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    throw p1

    :cond_1
    invoke-virtual {v3}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    return-void
.end method

.method public final findAppLockGroupOwnerStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;
    .locals 2

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    const/4 p1, 0x0

    :goto_0
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/util/ArrayMap;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mOwnerPackage:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getAppLockEnabledPackages()Landroid/util/SparseArray;
    .locals 6

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/ArrayMap;

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    new-instance v5, Landroid/util/ArraySet;

    invoke-virtual {v4}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v5, v4}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    monitor-exit v1

    return-object v0

    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final getAppLockEnabledPackagesForUser(I)Ljava/util/Set;
    .locals 2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->contains(I)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance p0, Landroid/util/ArraySet;

    invoke-direct {p0}, Landroid/util/ArraySet;-><init>()V

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_0
    new-instance v1, Landroid/util/ArraySet;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    invoke-virtual {p0}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-direct {v1, p0}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public getAppLockGracePeriodMs()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;
    .locals 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    const/4 p2, 0x0

    move v1, p2

    :goto_0
    if-eqz p1, :cond_2

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/util/ArrayMap;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0, v1}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mOwnerPackage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0, p2, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1

    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public final getAppLockGroupTaskVisibilityState(ILjava/lang/String;)I
    .locals 11

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-gt v0, v2, :cond_1

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAtmInternal:Lcom/android/server/wm/ActivityTaskManagerInternal;

    invoke-virtual {p0, p1, p2}, Lcom/android/server/wm/ActivityTaskManagerInternal;->getAppLockTaskVisibilityState(ILjava/lang/String;)I

    move-result p0

    return p0

    :cond_1
    const/4 p2, 0x0

    move v0, p2

    move v3, v0

    move v4, v3

    move v5, v4

    move v6, v2

    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x5

    const/4 v9, 0x2

    if-ge v0, v7, :cond_7

    iget-object v7, p0, Lcom/android/server/am/AppLockLocalService;->mAtmInternal:Lcom/android/server/wm/ActivityTaskManagerInternal;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v7, p1, v10}, Lcom/android/server/wm/ActivityTaskManagerInternal;->getAppLockTaskVisibilityState(ILjava/lang/String;)I

    move-result v7

    if-eqz v7, :cond_6

    if-eq v7, v2, :cond_5

    if-eq v7, v9, :cond_4

    const/4 v9, 0x3

    if-eq v7, v9, :cond_5

    const/4 v9, 0x4

    if-eq v7, v9, :cond_3

    if-eq v7, v8, :cond_2

    const-string v8, "AppLockLocalService"

    const-string/jumbo v9, "getAppLockGroupTaskVisibilityState: Unhandled AppLockTaskVisibility state "

    invoke-static {v7, v9, v8}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m$1(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    move v3, v2

    goto :goto_1

    :cond_3
    return v7

    :cond_4
    move v4, v2

    goto :goto_1

    :cond_5
    move v6, p2

    move v4, v2

    if-nez v5, :cond_6

    move v5, v7

    :cond_6
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_7
    if-eqz v3, :cond_8

    return v8

    :cond_8
    if-nez v4, :cond_9

    return p2

    :cond_9
    if-eqz v6, :cond_a

    return v9

    :cond_a
    return v5

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;
    .locals 0

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getLastSuccessfulAuthTimeForLockedPackage(Ljava/lang/String;I)J
    .locals 4

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabledLocked(ILjava/lang/String;)Z

    move-result v1

    const-wide/16 v2, -0x1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-eqz p0, :cond_1

    iget-wide v2, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastAuthTimeSinceDeviceUnlock:J

    :cond_1
    :goto_0
    monitor-exit v0

    return-wide v2

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;
    .locals 1

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mPmInternal:Landroid/content/pm/PackageManagerInternal;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mAmService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0}, Lcom/android/server/am/ActivityManagerService;->getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mPmInternal:Landroid/content/pm/PackageManagerInternal;

    :cond_0
    return-object v0
.end method

.method public getSearchRolePackageForUser(I)Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1, p1}, Lcom/android/server/am/AppLockLocalService$Injector;->getSearchManager(Landroid/content/Context;I)Landroid/app/SearchManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/android/server/am/AppLockLocalService$Injector;->getRoleManager(Landroid/content/Context;)Landroid/app/role/RoleManager;

    move-result-object v1

    const-string v2, "AppLockLocalService"

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0}, Landroid/app/SearchManager;->isSearchEngineRoleAvailable()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "getSearchRolePackageForUser: Failed to check search engine role availability for user "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    move v0, v3

    :goto_0
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    :try_start_1
    const-string/jumbo v0, "android.app.role.SEARCH_ENGINE"

    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v4

    invoke-virtual {v1, v0, v4}, Landroid/app/role/RoleManager;->getRoleHoldersAsUser(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    :catch_1
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "getSearchRolePackageForUser: Failed to get role holders for user "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_2

    const-string/jumbo p0, "getSearchRolePackageForUser: PackageManager is null"

    invoke-static {v2, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_2
    :try_start_2
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "android.search.action.GLOBAL_SEARCH"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v4, 0x10000

    invoke-virtual {p0, v1, v4, p1}, Landroid/content/pm/PackageManager;->queryIntentActivitiesAsUser(Landroid/content/Intent;II)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    move v1, v3

    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_4

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    iget-object v4, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v4, :cond_3

    iget-object v5, v4, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v5, :cond_3

    iget v5, v5, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_3

    iget-object p0, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    return-object p0

    :catch_2
    move-exception p0

    goto :goto_2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v1, :cond_5

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/ResolveInfo;

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    return-object p0

    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "getSearchRolePackageForUser: Failed to query global search activity for user "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    return-object v0
.end method

.method public handleAppLockEnabled(Ljava/lang/String;I)V
    .locals 8

    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->updateAppLockGroupMembership(ILjava/lang/String;)I

    move-result v2

    const/4 v6, 0x1

    if-ne v2, v6, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v4, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/ArrayMap;

    if-nez v4, :cond_1

    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    iget-object v5, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v5, p2, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v4, v2

    goto/16 :goto_4

    :cond_1
    :goto_0
    new-instance v5, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda1;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v4, p1, v5}, Landroid/util/ArrayMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, v2

    :try_start_1
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p0, v2, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v5

    goto :goto_1

    :catchall_1
    move-exception v0

    goto/16 :goto_4

    :cond_2
    const/4 v5, 0x0

    :goto_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-virtual {p0, p1, p2, v6}, Lcom/android/server/am/AppLockLocalService;->isPackageLocked(Ljava/lang/String;IZ)Z

    move-result v4

    iget-object v7, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    if-eqz v4, :cond_7

    monitor-enter v7

    if-eqz v2, :cond_3

    move-object v4, v5

    const/4 v5, 0x0

    move-object v0, p0

    move-object v3, p1

    move v1, p2

    :try_start_2
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->isAppLockGroupQueryStaleLocked(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)Z

    move-result v5

    if-eqz v5, :cond_4

    monitor-exit v7

    return-void

    :catchall_2
    move-exception v0

    goto :goto_2

    :cond_3
    move-object v4, v5

    :cond_4
    invoke-virtual {p0, p1, p2, v6}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v5

    if-nez v5, :cond_5

    monitor-exit v7

    return-void

    :cond_5
    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v1

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v2, :cond_6

    const/4 v5, 0x1

    move-object v0, p0

    move-object v3, v2

    move-object v2, v4

    move v4, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->dispatchAppLockGroupLockedStateChanged(Ljava/util/ArrayList;Ljava/util/List;Lcom/android/server/am/AppLockLocalService$AppLockLockedState;IZ)V

    return-void

    :cond_6
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x1

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    return-void

    :goto_2
    :try_start_3
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :cond_7
    move-object v4, v5

    monitor-enter v7

    if-eqz v2, :cond_8

    const/4 v5, 0x1

    move-object v0, p0

    move-object v3, p1

    move v1, p2

    :try_start_4
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->isAppLockGroupQueryStaleLocked(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)Z

    move-result v2

    if-eqz v2, :cond_8

    monitor-exit v7

    return-void

    :catchall_3
    move-exception v0

    goto :goto_3

    :cond_8
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    if-eqz v2, :cond_9

    iget-object v2, v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    if-nez v2, :cond_9

    const/4 v2, 0x0

    invoke-virtual {p0, p1, p2, v2}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    :cond_9
    monitor-exit v7

    return-void

    :goto_3
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v0

    :goto_4
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0
.end method

.method public final handleTaskPinnedStateChanged(Ljava/util/List;IZ)V
    .locals 6

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "AppLockLocalService.handleTaskPinnedStateChanged"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1, p2}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabled(Ljava/lang/String;I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    sget-boolean v3, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v3, :cond_1

    const-string v3, "AppLockLocalService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "handleTaskPinnedStateChanged: package: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", pinned: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_1
    :goto_1
    invoke-virtual {p0, p2, v1}, Lcom/android/server/am/AppLockLocalService;->cancelPackageAppLockedJobLocked(ILjava/lang/String;)V

    monitor-exit v2

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :goto_3
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_1
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final handleTaskVisibilityChanged(Ljava/util/List;IZ)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v5, p3

    const-string v2, "AppLockLocalService.handleTaskVisibilityChanged"

    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    new-instance v6, Landroid/util/ArraySet;

    invoke-direct {v6}, Landroid/util/ArraySet;-><init>()V

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v8, v2, :cond_d

    move-object/from16 v9, p1

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabled(Ljava/lang/String;I)Z

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    move-object v4, v2

    :try_start_1
    invoke-virtual {v0, v1, v3}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v6, v2}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-nez v10, :cond_2

    :cond_1
    move-object v10, v4

    goto/16 :goto_3

    :cond_2
    move-object v10, v4

    :try_start_2
    invoke-virtual {v0, v2, v1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v4

    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    invoke-virtual {v0, v3, v1, v7}, Lcom/android/server/am/AppLockLocalService;->isPackageLocked(Ljava/lang/String;IZ)Z

    move-result v10

    sget-boolean v11, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v11, :cond_3

    const-string v12, "AppLockLocalService"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "handleTaskVisibilityChanged: package: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ", isVisibleRequested: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v14, ", isCurrentlyLocked: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    iget-object v12, v0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v12
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    :try_start_4
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->isAppLockGroupQueryStaleLocked(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)Z

    move-result v13

    if-eqz v13, :cond_4

    monitor-exit v12

    goto/16 :goto_4

    :catchall_0
    move-exception v0

    goto/16 :goto_2

    :cond_4
    invoke-virtual {v0, v1, v3}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v5

    if-nez v5, :cond_5

    monitor-exit v12

    goto/16 :goto_4

    :cond_5
    const/4 v13, 0x0

    if-nez p3, :cond_9

    if-eqz v10, :cond_a

    iget-object v5, v5, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v14, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    const-string v5, "LOCK_REQUEST"

    const-string/jumbo v14, "reason=task_hidden"

    invoke-static {v1, v5, v3, v14}, Lcom/android/server/am/AppLockLocalService;->logAppLockEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v11, :cond_6

    const-string v5, "AppLockLocalService"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "handleTaskVisibilityChanged: scheduleLockedStateLocked for package: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v5, v14}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    invoke-virtual {v0, v3, v1}, Lcom/android/server/am/AppLockLocalService;->scheduleLockedStateLocked(Ljava/lang/String;I)V

    goto :goto_1

    :cond_7
    if-nez v5, :cond_a

    if-eqz v11, :cond_8

    const-string v5, "AppLockLocalService"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "handleTaskVisibilityChanged: locking never-unlocked package immediately: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v5, v14}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    const/4 v5, 0x1

    invoke-virtual {v0, v3, v1, v5}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v13

    goto :goto_1

    :cond_9
    if-nez v10, :cond_a

    invoke-virtual {v0, v3, v1, v7}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v13

    :cond_a
    :goto_1
    monitor-exit v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v13, :cond_c

    if-eqz v11, :cond_b

    :try_start_5
    const-string v5, "AppLockLocalService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "handleTaskVisibilityChanged: dispatchPackageLockedStateChanged for package: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    move-object v3, v2

    move-object v2, v4

    move v5, v10

    move v4, v1

    move-object v1, v13

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->dispatchAppLockGroupLockedStateChanged(Ljava/util/ArrayList;Ljava/util/List;Lcom/android/server/am/AppLockLocalService$AppLockLockedState;IZ)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_4

    :goto_2
    :try_start_6
    monitor-exit v12
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    :catchall_1
    move-exception v0

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object v10, v4

    goto :goto_5

    :goto_3
    :try_start_8
    monitor-exit v10

    :cond_c
    :goto_4
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v5, p3

    goto/16 :goto_0

    :goto_5
    monitor-exit v10
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    :cond_d
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_3
    move-exception v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0
.end method

.method public final handleUidChangeLocked(Lcom/android/server/am/UidRecord;II)V
    .locals 10

    const-string v0, "AppLockLocalService.handleUidChangeLocked"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    if-nez p1, :cond_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_0
    const/high16 v0, -0x80000000

    and-int/2addr p3, v0

    if-nez p3, :cond_1

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_1
    :try_start_0
    invoke-static {p2}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v1

    new-instance p2, Landroid/util/ArraySet;

    invoke-direct {p2}, Landroid/util/ArraySet;-><init>()V

    const/4 p3, 0x0

    move v0, p3

    :goto_0
    iget-object v2, p1, Lcom/android/server/am/UidRecord;->mProcRecords:Landroid/util/ArraySet;

    invoke-virtual {v2}, Landroid/util/ArraySet;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    invoke-virtual {p1, v0}, Lcom/android/server/am/UidRecord;->getProcessRecordByIndex(I)Lcom/android/server/am/ProcessRecord;

    move-result-object v2

    iget-object v2, v2, Lcom/android/server/am/ProcessRecord;->mPkgList:Lcom/android/server/am/PackageList;

    invoke-virtual {v2}, Lcom/android/server/am/PackageList;->getPackageNames()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Set;->of([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/util/ArraySet;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    new-instance p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda0;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/am/AppLockLocalService;

    iput v1, p1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p2, p1}, Landroid/util/ArraySet;->removeIf(Ljava/util/function/Predicate;)Z

    invoke-virtual {p2}, Landroid/util/ArraySet;->isEmpty()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-eqz p1, :cond_3

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_3
    :try_start_1
    new-instance p1, Landroid/util/ArraySet;

    invoke-direct {p1}, Landroid/util/ArraySet;-><init>()V

    move v6, p3

    :goto_1
    invoke-virtual {p2}, Landroid/util/ArraySet;->size()I

    move-result v0

    if-ge v6, v0, :cond_e

    invoke-virtual {p2, v6}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    move-object v4, v2

    :try_start_2
    invoke-virtual {p0, v1, v3}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {p1, v2}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-nez v0, :cond_5

    :cond_4
    move-object v0, p0

    move-object v5, v4

    goto/16 :goto_4

    :cond_5
    move-object v5, v4

    :try_start_3
    invoke-virtual {p0, v2, v1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v4

    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    sget-boolean v7, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v7, :cond_6

    const-string v0, "AppLockLocalService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "handleUidChangeLocked: packageName: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    invoke-virtual {p0, v3, v1, p3}, Lcom/android/server/am/AppLockLocalService;->isPackageLocked(Ljava/lang/String;IZ)Z

    move-result v8

    iget-object v9, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    const/4 v5, 0x0

    move-object v0, p0

    :try_start_5
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->isAppLockGroupQueryStaleLocked(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)Z

    move-result p0

    if-eqz p0, :cond_7

    monitor-exit v9

    goto/16 :goto_5

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_2

    :cond_7
    invoke-virtual {v0, v1, v3}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-nez p0, :cond_8

    monitor-exit v9

    goto :goto_5

    :cond_8
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-ne v5, v8, :cond_b

    if-eqz v7, :cond_9

    const-string p0, "AppLockLocalService"

    const-string/jumbo v2, "handleUidChangeLocked: lastSentLockedState is the same"

    invoke-static {p0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    if-nez v8, :cond_a

    invoke-virtual {v0, v1, v3}, Lcom/android/server/am/AppLockLocalService;->cancelPackageAppLockedJobLocked(ILjava/lang/String;)V

    :cond_a
    monitor-exit v9

    goto :goto_5

    :cond_b
    if-eqz v8, :cond_c

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    const-string p0, "LOCK_REQUEST"

    const-string/jumbo v2, "reason=uid_state"

    invoke-static {v1, p0, v3, v2}, Lcom/android/server/am/AppLockLocalService;->logAppLockEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3, v1}, Lcom/android/server/am/AppLockLocalService;->scheduleLockedStateLocked(Ljava/lang/String;I)V

    monitor-exit v9

    goto :goto_5

    :cond_c
    invoke-virtual {v0, v3, v1, v8}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result p0

    if-nez p0, :cond_d

    monitor-exit v9

    goto :goto_5

    :cond_d
    move-object v3, v2

    move-object v2, v4

    move v4, v1

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v1

    monitor-exit v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move v5, v8

    :try_start_6
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/AppLockLocalService;->dispatchAppLockGroupLockedStateChanged(Ljava/util/ArrayList;Ljava/util/List;Lcom/android/server/am/AppLockLocalService$AppLockLockedState;IZ)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    move v1, v4

    goto :goto_5

    :goto_2
    :try_start_7
    monitor-exit v9
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    throw p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :catchall_1
    move-exception v0

    :goto_3
    move-object p0, v0

    goto :goto_6

    :catchall_2
    move-exception v0

    move-object v5, v4

    goto :goto_3

    :goto_4
    :try_start_9
    monitor-exit v5

    :goto_5
    add-int/lit8 v6, v6, 0x1

    move-object p0, v0

    goto/16 :goto_1

    :goto_6
    monitor-exit v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :try_start_a
    throw p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    :cond_e
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_3
    move-exception v0

    move-object p0, v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final hasOngoingCallForPackage(Ljava/lang/String;I)Z
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    const/4 p2, 0x0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p2, 0x1

    :cond_1
    :goto_0
    monitor-exit v0

    return p2

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public hasPendingIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;)Z
    .locals 7

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v3}, Landroid/util/ArrayMap;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    iget v4, v3, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    if-ne v4, p2, :cond_1

    iget-object v4, v3, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget v4, v3, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mCallType:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    const/4 v6, 0x3

    if-ne v4, v6, :cond_1

    :cond_0
    iget-object v3, v3, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-virtual {v3, p3}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v1, v5

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final initAppLockLockedStates()V
    .locals 9

    const-string v0, "AppLockLocalService.initAppLockLockedStates"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    const-class v0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/UserManagerInternal;

    if-nez v0, :cond_0

    const-string p0, "AppLockLocalService"

    const-string/jumbo v0, "Unable to retrieve UserManagerInternal"

    invoke-static {p0, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_0
    :try_start_1
    sget-object v1, Lcom/android/server/pm/UserManagerInternal;->USER_FILTER_WITH_ALL_COMPLETE_USERS:Lcom/android/server/pm/UserFilter;

    invoke-virtual {v0, v1}, Lcom/android/server/pm/UserManagerInternal;->getUsers(Lcom/android/server/pm/UserFilter;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/UserInfo;

    invoke-virtual {v1}, Landroid/content/pm/UserInfo;->isFull()Z

    move-result v2

    if-nez v2, :cond_1

    iget v2, v1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {p0, v2}, Lcom/android/server/am/AppLockLocalService;->isSupportedDualAppUser(I)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget v1, v1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManagerInternal;->getAppLockEnabledPackagesForUser(I)Ljava/util/List;

    move-result-object v2

    new-instance v3, Landroid/util/ArrayMap;

    invoke-direct {v3}, Landroid/util/ArrayMap;-><init>()V

    const/4 v4, 0x0

    :goto_1
    move-object v5, v2

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v4, v6, :cond_3

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;

    move-result-object v6

    invoke-virtual {v6, v1, v5}, Landroid/content/pm/PackageManagerInternal;->getAppLockParentPackage(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    goto :goto_2

    :cond_2
    move-object v6, v5

    :goto_2
    invoke-virtual {v3, v5, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/ArrayMap;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    :goto_3
    if-ltz v6, :cond_6

    if-nez v4, :cond_4

    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    iget-object v7, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v7, v1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_4

    :catchall_0
    move-exception p0

    goto :goto_5

    :cond_4
    :goto_4
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p0, v1, v7}, Lcom/android/server/am/AppLockLocalService;->findAppLockGroupOwnerStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v8

    if-nez v8, :cond_5

    new-instance v8, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    invoke-direct {v8}, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;-><init>()V

    iput-object v7, v8, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mOwnerPackage:Ljava/lang/String;

    :cond_5
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v7, v8}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v6, v6, -0x1

    goto :goto_3

    :cond_6
    monitor-exit v2

    goto/16 :goto_0

    :goto_5
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_7
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_1
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final isAnyAppLockGroupMemberInForeground(ILjava/lang/String;)Z
    .locals 9

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p2

    new-array p2, p2, [I

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;

    move-result-object v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-wide/16 v5, 0x0

    invoke-virtual {v3, v4, v5, v6, p1}, Landroid/content/pm/PackageManagerInternal;->getPackageUid(Ljava/lang/String;JI)I

    move-result v3

    aput v3, p2, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/server/am/AppLockLocalService;->mAmService:Lcom/android/server/am/ActivityManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceBeforeAmsLock()V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    monitor-enter p1

    :try_start_1
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceAfterAmsLock()V

    move v2, v0

    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    aget v4, p2, v2

    iget-object v5, p0, Lcom/android/server/am/AppLockLocalService;->mAmService:Lcom/android/server/am/ActivityManagerService;

    iget-object v5, v5, Lcom/android/server/am/ActivityManagerService;->mProcessList:Lcom/android/server/am/ProcessList;

    iget-object v5, v5, Lcom/android/server/am/ProcessList;->mActiveUids:Lcom/android/server/am/ActiveUids;

    invoke-virtual {v5, v4}, Lcom/android/server/am/ActiveUids;->get(I)Lcom/android/server/am/UidRecord;

    move-result-object v4

    if-eqz v4, :cond_3

    iget-object v5, v4, Lcom/android/server/am/UidRecord;->mProcRecords:Landroid/util/ArraySet;

    invoke-virtual {v5}, Landroid/util/ArraySet;->size()I

    move-result v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    :goto_2
    if-ltz v5, :cond_3

    iget-object v7, v4, Lcom/android/server/am/UidRecord;->mProcRecords:Landroid/util/ArraySet;

    invoke-virtual {v7, v5}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/am/ProcessRecord;

    if-eqz v7, :cond_2

    iget-object v8, v7, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v8, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2

    iget v7, v7, Lcom/android/server/am/psc/ProcessRecordInternal;->mSetProcState:I

    const/4 v8, 0x2

    if-gt v7, v8, :cond_2

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceAfterAmsUnlock()V

    return v6

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_2
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceAfterAmsUnlock()V

    return v0

    :goto_3
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->traceAfterAmsUnlock()V

    throw p0

    :catchall_1
    move-exception p0

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0
.end method

.method public final isAppLockDeferredForRecentsLocked(ILjava/lang/String;)Z
    .locals 7

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_5

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;

    iget v3, v2, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    const/4 v4, 0x1

    if-ne v3, p1, :cond_0

    iget-object v3, v2, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v3, p2}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return v4

    :cond_0
    iget v3, v2, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    if-ne v3, p1, :cond_4

    move v3, v0

    :goto_1
    iget-object v5, v2, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v5}, Landroid/util/ArraySet;->size()I

    move-result v5

    if-ge v3, v5, :cond_4

    iget-object v5, v2, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v5, v3}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_3

    if-nez p2, :cond_1

    goto :goto_2

    :cond_1
    invoke-virtual {p0, p1, v5}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v6

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    if-eqz v6, :cond_3

    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v5

    if-ne v6, v5, :cond_3

    :cond_2
    return v4

    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    return v0
.end method

.method public final isAppLockGroupQueryStaleLocked(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)Z
    .locals 2

    invoke-virtual {p0, p1, p3}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v0

    if-ne v0, p2, :cond_0

    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    sget-boolean p2, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz p2, :cond_1

    const-string p2, " (user "

    const-string p4, ") changed during the query, discarding the result"

    const-string/jumbo v1, "isAppLockGroupQueryStaleLocked: the group of "

    invoke-static {p1, v1, p3, p2, p4}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p4, "AppLockLocalService"

    invoke-static {p4, p2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    if-eqz v0, :cond_2

    iget-object p2, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {p2}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object p2

    new-instance p4, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    iput-object p0, p4, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$0:Lcom/android/server/am/AppLockLocalService;

    iput-object p3, p4, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$1:Ljava/lang/String;

    iput p1, p4, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$2:I

    iput-boolean p5, p4, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda9;->f$3:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p2, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public final isAppLockSupportedForDevice()Z
    .locals 3

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mIsAppLockSupportedForDevice:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mIsAppLockSupportedForDevice:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110199

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move v1, v0

    :goto_0
    if-nez v1, :cond_1

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mIsAppLockSupportedForDevice:Ljava/lang/Boolean;

    return v0

    :cond_1
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    if-nez v1, :cond_2

    const-string p0, "AppLockLocalService"

    const-string/jumbo v1, "isAppLockSupportedForDevice: PackageManager is null"

    invoke-static {p0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_2
    const-string/jumbo v2, "android.hardware.type.watch"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string/jumbo v2, "android.hardware.type.automotive"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string/jumbo v2, "android.software.leanback"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v0, 0x1

    :cond_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mIsAppLockSupportedForDevice:Ljava/lang/Boolean;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mIsAppLockSupportedForDevice:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final isAppLockSupportedForUser(I)Z
    .locals 4

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->isAppLockSupportedForDevice()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-class v0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/UserManagerInternal;

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v0, p1}, Lcom/android/server/pm/UserManagerInternal;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isFull()Z

    move-result v0

    if-eqz v0, :cond_7

    const-class v0, Landroid/app/admin/DevicePolicyManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManagerInternal;

    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Landroid/app/admin/DevicePolicyManagerInternal;->isUserOrganizationManaged(I)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    :cond_2
    const-class v0, Landroid/app/supervision/SupervisionManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/supervision/SupervisionManagerInternal;

    if-nez v0, :cond_3

    move v0, v1

    goto :goto_0

    :cond_3
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    :try_start_0
    invoke-virtual {v0, p1}, Landroid/app/supervision/SupervisionManagerInternal;->isSupervisionEnabledForUser(I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    :goto_0
    if-eqz v0, :cond_4

    return v1

    :cond_4
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mSpcStateLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_1
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mSpcEnabledForUser:Landroid/util/SparseBooleanArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p0, :cond_6

    sget-boolean p0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz p0, :cond_5

    const-string p0, "AppLockLocalService"

    const-string v0, "App Lock is not supported for user "

    const-string v2, ": SPC is enabled"

    invoke-static {p1, v0, v2, p0}, Lcom/android/server/BootReceiver$$ExternalSyntheticOutline0;->m$1(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    return v1

    :cond_6
    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_1
    move-exception p0

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0

    :cond_7
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService;->isSupportedDualAppUser(I)Z

    move-result p0

    return p0
.end method

.method public final isAppLockUnlockedLocked(ILjava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    if-eqz p0, :cond_1

    invoke-virtual {p0, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_2

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    :goto_1
    return v0
.end method

.method public final isCallPendingIntentLocked(Ljava/lang/String;ILandroid/content/ComponentName;Landroid/os/IBinder;)Z
    .locals 5

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v2}, Landroid/util/ArrayMap;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    iget v4, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    if-ne v4, p2, :cond_0

    iget-object v4, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mTokens:Landroid/util/ArraySet;

    if-eqz v4, :cond_0

    invoke-virtual {v4, p4}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    if-eqz v4, :cond_0

    invoke-virtual {v4, p3}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iput-boolean v3, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mIsAccepted:Z

    return v3

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lcom/android/server/am/AppLockLocalService;->pruneRecentlyRemovedCallsLocked(J)V

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v3

    :goto_1
    if-ltz v1, :cond_3

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    iget v4, v2, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    if-ne v4, p2, :cond_2

    iget-object v4, v2, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, v2, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->tokens:Landroid/util/ArraySet;

    invoke-virtual {v4, p4}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v2, v2, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    invoke-virtual {v2, p3}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return v3

    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_3
    return v0
.end method

.method public final isComponentReferencedByOtherNotificationLocked(ILandroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v2}, Landroid/util/ArrayMap;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    iget-object v3, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mKey:Ljava/lang/String;

    invoke-static {v3, p3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget v3, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    if-ne v3, p1, :cond_1

    iget-object v3, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    invoke-virtual {v3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-virtual {v3, p2}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mCallType:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    iget-boolean v2, v2, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mIsAccepted:Z

    if-eqz v2, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public final isLastAuthWithinGracePeriod(ILjava/lang/String;)Z
    .locals 8

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabledLocked(ILjava/lang/String;)Z

    move-result v1

    const-wide/16 v2, -0x1

    if-nez v1, :cond_1

    :cond_0
    move-wide v4, v2

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-wide v4, p2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastAuthTimeSinceDeviceUnlock:J

    :goto_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mGracePeriodMsForUser:Landroid/util/SparseLongArray;

    const-wide/16 v6, 0x0

    invoke-virtual {p0, p1, v6, v7}, Landroid/util/SparseLongArray;->get(IJ)J

    move-result-wide p0

    add-long/2addr p0, v4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    cmp-long p0, p0, v6

    if-lez p0, :cond_2

    cmp-long p0, v4, v2

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :goto_1
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final isPackageAppLockDynamicallyExempt(Ljava/lang/String;I)Z
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockDynamicallyExemptLocked(ILjava/lang/String;)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final isPackageAppLockDynamicallyExemptLocked(ILjava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoles:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/ArrayMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroid/util/ArrayMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mSearchRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_1

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public final isPackageAppLockEnabled(Ljava/lang/String;I)Z
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabledLocked(ILjava/lang/String;)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final isPackageAppLockEnabledLocked(ILjava/lang/String;)Z
    .locals 0

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final isPackageLocked(Ljava/lang/String;I)Z
    .locals 1

    const/4 v0, 0x1

    .line 388
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/server/am/AppLockLocalService;->isPackageLocked(Ljava/lang/String;IZ)Z

    move-result p0

    return p0
.end method

.method public isPackageLocked(Ljava/lang/String;IZ)Z
    .locals 8

    const-string/jumbo v0, "isPackageLocked: taskVisibilityState=ALL_NON_OVERLAY_CAN_SHOW_WHEN_LOCKED, returning lastSentLockedState="

    const-string/jumbo v1, "isPackageLocked: taskVisibilityState=ONLY_TASKS_WITH_INTERMEDIATE_ACTIVITIES, returning lastSentLockedState="

    const-string/jumbo v2, "Unhandled AppLockTaskVisibility state: "

    const-string v3, "AppLockLocalService.isPackageLocked"

    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    sget-boolean v3, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v4, "AppLockLocalService"

    const-string/jumbo v5, "isPackageLocked for "

    const-string v6, " and user: "

    const-string v7, ", respectGracePeriod: "

    invoke-static {p2, v5, p1, v6, v7}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v4, v5, p3}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabled(Ljava/lang/String;I)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_2

    if-eqz v3, :cond_1

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "isPackageLocked: App Lock is disabled, returning false"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :cond_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :cond_2
    :try_start_1
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    :try_start_2
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isAppLockDeferredForRecentsLocked(ILjava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :catchall_0
    move-exception p0

    goto/16 :goto_7

    :cond_3
    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p3, :cond_7

    :try_start_4
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isLastAuthWithinGracePeriod(ILjava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_5

    if-eqz v3, :cond_4

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "isPackageLocked: last successful auth is within grace period, returning false"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    :cond_4
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :cond_5
    :try_start_5
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->packageHasQueuedAppLockedJob(ILjava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_7

    if-eqz v3, :cond_6

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "isPackageLocked: there is a pending job to lock the package, returning false"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :cond_6
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :cond_7
    :try_start_6
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupTaskVisibilityState(ILjava/lang/String;)I

    move-result p3

    const/4 v4, 0x1

    if-eqz p3, :cond_15

    const/4 v6, 0x3

    if-eq p3, v4, :cond_e

    const/4 v7, 0x2

    if-eq p3, v7, :cond_c

    if-eq p3, v6, :cond_e

    const/4 v0, 0x4

    if-eq p3, v0, :cond_a

    const/4 v0, 0x5

    if-eq p3, v0, :cond_8

    const-string v0, "AppLockLocalService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    :cond_8
    iget-object p3, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter p3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :try_start_7
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-eqz p0, :cond_9

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9

    move v5, v4

    goto :goto_0

    :catchall_1
    move-exception p0

    goto :goto_1

    :cond_9
    :goto_0
    monitor-exit p3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :goto_1
    :try_start_8
    monitor-exit p3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    throw p0

    :cond_a
    if-eqz v3, :cond_b

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "isPackageLocked: taskVisibilityState=UNLOCKED, returning false"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :cond_b
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :cond_c
    if-eqz v3, :cond_d

    :try_start_a
    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "isPackageLocked: taskVisibilityState=ALL_HAVE_APP_LOCK_OVERLAY, returning true"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    :cond_d
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v4

    :cond_e
    :try_start_b
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    :try_start_c
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabledLocked(ILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_f

    monitor-exit v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :catchall_2
    move-exception p0

    goto :goto_3

    :cond_f
    :try_start_d
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-nez p0, :cond_10

    monitor-exit v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :cond_10
    :try_start_e
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_12

    :cond_11
    move v5, v4

    :cond_12
    monitor-exit v2
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    if-eqz v3, :cond_14

    if-ne p3, v6, :cond_13

    :try_start_f
    const-string p0, "AppLockLocalService"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_13
    const-string p0, "AppLockLocalService"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    :cond_14
    :goto_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :goto_3
    :try_start_10
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    :try_start_11
    throw p0

    :cond_15
    :goto_4
    iget-object p3, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_16

    const-string p3, "AppLockLocalService"

    const-string/jumbo v0, "isPackageLocked: Attempting to acquire AMS lock while holding AppLockLocalService lock!"

    invoke-static {p3, v0}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :cond_16
    iget-object p3, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter p3
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_4

    :try_start_12
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabledLocked(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_17

    monitor-exit p3
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :catchall_3
    move-exception p0

    goto :goto_6

    :cond_17
    :try_start_13
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v0

    if-nez v0, :cond_18

    monitor-exit p3
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v5

    :cond_18
    :try_start_14
    iget-object v0, v0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_19

    goto :goto_5

    :cond_19
    monitor-exit p3
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    :try_start_15
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isAnyAppLockGroupMemberInForeground(ILjava/lang/String;)Z

    move-result p0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_4

    xor-int/2addr p0, v4

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return p0

    :cond_1a
    :goto_5
    if-eqz v3, :cond_1b

    :try_start_16
    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "isPackageLocked: package has no visible tasks and is currently locked, returning true"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1b
    monitor-exit p3
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v4

    :goto_6
    :try_start_17
    monitor-exit p3
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_3

    :try_start_18
    throw p0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_4

    :goto_7
    :try_start_19
    monitor-exit v4
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    :try_start_1a
    throw p0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_4

    :catchall_4
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final isSupportedDualAppUser(I)Z
    .locals 3

    const-class v0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/UserManagerInternal;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/server/pm/UserManagerInternal;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/content/pm/UserInfo;->isDualAppProfile()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0, p1}, Lcom/android/server/pm/UserManagerInternal;->getProfileParentId(I)I

    move-result v0

    if-eq v0, p1, :cond_2

    invoke-virtual {p0, v0}, Lcom/android/server/am/AppLockLocalService;->isAppLockSupportedForUser(I)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    :goto_0
    return v1
.end method

.method public logCoAuthenticatedAppLaunch(Ljava/lang/String;)V
    .locals 1

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v0, "PackageName"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "ALK101"

    const-string v0, "ALK1020"

    invoke-static {p1, v0, p0}, Lcom/samsung/android/core/CoreSaLogger;->logForAppLock(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    return-void
.end method

.method public final matchesAnsweredIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;)Z
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    const/4 p2, 0x0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_1

    invoke-interface {p0, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p2, 0x1

    :cond_1
    :goto_0
    monitor-exit v0

    return p2

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final notifyLocalListenersIfLockedStateIsUpToDate(ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Ljava/lang/String;Ljava/util/ArrayList;Z)V
    .locals 5

    const-string/jumbo v0, "notifyLocalListenersIfLockedStateIsUpToDate: skipping stale update for "

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLocalListenerDispatchLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {p0, p1, p3}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-eqz p2, :cond_0

    if-eq p0, p2, :cond_0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    goto :goto_4

    :catchall_1
    move-exception p0

    goto :goto_3

    :cond_0
    const/4 p2, 0x0

    const/4 v3, 0x1

    if-eqz p0, :cond_1

    :try_start_3
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {v4, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    move p0, v3

    goto :goto_0

    :cond_1
    move p0, p2

    :goto_0
    if-ne p0, p5, :cond_2

    goto :goto_1

    :cond_2
    move v3, p2

    :goto_1
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-nez v3, :cond_4

    :try_start_4
    sget-boolean p0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz p0, :cond_3

    const-string p0, "AppLockLocalService"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " (user "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ") locked="

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    monitor-exit v1

    return-void

    :cond_4
    :goto_2
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge p2, p0, :cond_6

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/AppLockInternal$PackageLockedStateListener;

    if-eqz p0, :cond_5

    invoke-interface {p0, p3, p1, p5}, Landroid/app/AppLockInternal$PackageLockedStateListener;->onPackageLockedStateChanged(Ljava/lang/String;IZ)V

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_6
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    return-void

    :goto_3
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw p0

    :goto_4
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw p0
.end method

.method public final onDeviceLockedStateChanged(Z)V
    .locals 13

    const-string v0, "AppLockLocalService.onDeviceLockedStateChanged"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    if-nez p1, :cond_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_0
    :try_start_0
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v2, Landroid/util/ArraySet;

    invoke-direct {v2}, Landroid/util/ArraySet;-><init>()V

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    iget-object v5, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    if-ge v4, v5, :cond_8

    iget-object v5, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v6, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/ArrayMap;

    if-nez v6, :cond_1

    goto/16 :goto_5

    :cond_1
    move v7, v3

    :goto_1
    invoke-virtual {v6}, Landroid/util/ArrayMap;->size()I

    move-result v8

    if-ge v7, v8, :cond_7

    invoke-virtual {v6, v7}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    if-eqz v9, :cond_6

    invoke-virtual {v2, v9}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    goto :goto_4

    :cond_2
    const-wide/16 v10, -0x1

    iput-wide v10, v9, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastAuthTimeSinceDeviceUnlock:J

    const/4 v10, 0x1

    invoke-virtual {p0, v8, v5, v10}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v10

    if-eqz v10, :cond_6

    sget-boolean v10, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v10, :cond_3

    const-string v10, "AppLockLocalService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " has become locked due to the device locking"

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_8

    :cond_3
    :goto_2
    invoke-virtual {p1, v5}, Landroid/util/SparseArray;->contains(I)Z

    move-result v8

    if-nez v8, :cond_4

    new-instance v8, Landroid/util/ArraySet;

    invoke-direct {v8}, Landroid/util/ArraySet;-><init>()V

    invoke-virtual {p1, v5, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_4
    invoke-virtual {p0, v9, v5}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {p1, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/util/ArraySet;

    invoke-virtual {v10, v8}, Landroid/util/ArraySet;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/util/ArrayMap;

    if-nez v10, :cond_5

    new-instance v10, Landroid/util/ArrayMap;

    invoke-direct {v10}, Landroid/util/ArrayMap;-><init>()V

    invoke-virtual {v0, v5, v10}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_5
    move v11, v3

    :goto_3
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v11, v12, :cond_6

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v10, v12, v9}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    :cond_6
    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    :cond_7
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_8
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-nez v2, :cond_9

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_9
    :try_start_2
    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v5

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v1, v3

    :goto_6
    :try_start_3
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_b

    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v7

    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/ArraySet;

    move v11, v3

    :goto_7
    invoke-virtual {v2}, Landroid/util/ArraySet;->size()I

    move-result v4

    if-ge v11, v4, :cond_a

    invoke-virtual {v2, v11}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/ArrayMap;

    invoke-virtual {v2, v11}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    const/4 v8, 0x1

    const/4 v9, 0x0

    move-object v4, p0

    invoke-virtual/range {v4 .. v10}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    add-int/lit8 v11, v11, 0x1

    move-object p0, v4

    goto :goto_7

    :cond_a
    move-object v4, p0

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_b
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :goto_8
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    move-object p0, v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final packageHasQueuedAppLockedJob(ILjava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object p0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final pruneRecentlyRemovedCallsForPackageLocked(ILjava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    iget v2, v1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    if-ne v2, p1, :cond_1

    iget-object v2, v1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    const/4 v2, 0x0

    :goto_1
    iget-object v3, v1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    invoke-virtual {v3}, Landroid/util/ArraySet;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v3, v1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    invoke-virtual {v3, v2}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ComponentName;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, v4, p2}, Lcom/android/server/am/AppLockLocalService;->isComponentReferencedByOtherNotificationLocked(ILandroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-static {v4, p1, p2, v3}, Lcom/android/server/am/AppLockLocalService;->removeCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public pruneRecentlyRemovedCallsLocked(J)V
    .locals 6

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    iget-wide v2, v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->removedTimeMs:J

    sub-long v2, p1, v2

    const-wide/16 v4, 0x1388

    cmp-long v0, v2, v4

    if-ltz v0, :cond_2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mRecentlyRemovedCalls:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    :goto_0
    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    invoke-virtual {v2}, Landroid/util/ArraySet;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    invoke-virtual {v2, v1}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ComponentName;

    iget v3, v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    iget-object v4, v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v2, v5, v4}, Lcom/android/server/am/AppLockLocalService;->isComponentReferencedByOtherNotificationLocked(ILandroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    iget v4, v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    iget-object v5, v0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    invoke-static {v3, v4, v5, v2}, Lcom/android/server/am/AppLockLocalService;->removeCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public final registerExemptRoleListeners()V
    .locals 9

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/android/server/am/AppLockLocalService$Injector;->getRoleManager(Landroid/content/Context;)Landroid/app/role/RoleManager;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v1}, Lcom/android/server/am/AppLockLocalService$Injector;->getBackgroundExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoleHoldersChangedListener:Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda6;

    sget-object v3, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/role/RoleManager;->addOnRoleHoldersChangedListenerAsUser(Ljava/util/concurrent/Executor;Landroid/app/role/OnRoleHoldersChangedListener;Landroid/os/UserHandle;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "AppLockLocalService"

    const-string v2, "Failed to register exempt role listener"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRoleUserUnlockedReceiver:Lcom/android/server/am/AppLockLocalService$1;

    new-instance v5, Landroid/content/IntentFilter;

    const-string/jumbo v0, "android.intent.action.USER_UNLOCKED"

    invoke-direct {v5, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {p0}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object v7

    const/4 v8, 0x4

    const/4 v6, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/Context;->registerReceiverForAllUsers(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    return-void
.end method

.method public final registerPackageLockedStateListener(Landroid/app/AppLockInternal$PackageLockedStateListener;)V
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mPackageLockedStateListeners:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final registerPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V
    .locals 0

    .line 16
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {p0, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z

    return-void
.end method

.method public final registerSearchRoleListeners()V
    .locals 6

    const-string v0, "AppLockLocalService.registerSearchRoleListeners"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/android/server/am/AppLockLocalService$Injector;->getRoleManager(Landroid/content/Context;)Landroid/app/role/RoleManager;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v1, "AppLockLocalService"

    if-eqz v0, :cond_0

    :try_start_1
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v2}, Lcom/android/server/am/AppLockLocalService$Injector;->getBackgroundExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mRoleHoldersChangedListener:Landroid/app/role/OnRoleHoldersChangedListener;

    sget-object v4, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v0, v2, v3, v4}, Landroid/app/role/RoleManager;->addOnRoleHoldersChangedListenerAsUser(Ljava/util/concurrent/Executor;Landroid/app/role/OnRoleHoldersChangedListener;Landroid/os/UserHandle;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v2, "registerSearchRoleListeners: Failed to register role holders changed listener"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Lcom/android/server/am/AppLockLocalService$Injector;->getSearchManager(Landroid/content/Context;I)Landroid/app/SearchManager;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_1

    :try_start_3
    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v3}, Lcom/android/server/am/AppLockLocalService$Injector;->getBackgroundExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mSearchRoleAvailabilityListener:Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda8;

    invoke-virtual {v0, v2, v3, v4}, Landroid/app/SearchManager;->addOnSearchEngineRoleAvailabilityChangedListenerAsUser(Landroid/os/UserHandle;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_4
    const-string/jumbo v2, "registerSearchRoleListeners: Failed to register search engine role availability changed listener"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_1
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    const-string/jumbo v0, "android.search.action.GLOBAL_SEARCH_ACTIVITY_CHANGED"

    invoke-virtual {v2, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v0, "android.search.action.SEARCHABLES_CHANGED"

    invoke-virtual {v2, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v0, "android.intent.action.USER_UNLOCKED"

    invoke-virtual {v2, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mSearchablesChangedReceiver:Landroid/content/BroadcastReceiver;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {p0}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object v4

    const/4 v5, 0x4

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiverForAllUsers(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final removeAppLockRecentsDeferralsLocked(ILjava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;

    if-nez p2, :cond_0

    iget v1, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    if-ne v1, p1, :cond_1

    goto :goto_1

    :cond_0
    iget v2, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    if-ne v2, p1, :cond_1

    iget-object v2, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v2, p2}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v2, p2}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    iget-object v1, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v1}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    :goto_1
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->removeAt(I)V

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public scheduleLockedStateLocked(Ljava/lang/String;I)V
    .locals 8

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v1, "AppLockLocalService"

    const-string/jumbo v2, "handleLockedState for "

    const-string v3, " and user: "

    invoke-static {p2, v2, p1, v3, v1}, Lcom/android/server/security/applock/AppLockOutlineActiveSvc;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v1

    if-nez v1, :cond_1

    if-eqz v0, :cond_3

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "handleLockedState: App Lock is disabled, returning early"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    iget-object v2, v1, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    if-eqz v2, :cond_2

    if-eqz v0, :cond_3

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "handleLockedState: there is already a job to lock the package, returning early"

    invoke-static {p0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isAppLockDeferredForRecentsLocked(ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    return-void

    :cond_4
    new-instance v0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mService:Lcom/android/server/am/AppLockLocalService;

    iput-object p1, v0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mPackageName:Ljava/lang/String;

    iput p2, v0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mUserId:I

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v3

    iput-object v3, v0, Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;->mState:Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    monitor-exit v2

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-object v0, v1, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLockedUpdateRunnable:Lcom/android/server/am/AppLockLocalService$SetPackageLockedRunnable;

    const-string v1, "LOCK_JOB_QUEUE"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "jobRef="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " graceMs="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mGracePeriodMsForUser:Landroid/util/SparseLongArray;

    const-wide/16 v4, 0x0

    invoke-virtual {v3, p2, v4, v5}, Landroid/util/SparseLongArray;->get(IJ)J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v1, p1, v2}, Lcom/android/server/am/AppLockLocalService;->logAppLockEvent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {p1}, Lcom/android/server/am/AppLockLocalService$Injector;->getHandler()Landroid/os/Handler;

    move-result-object p1

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mGracePeriodMsForUser:Landroid/util/SparseLongArray;

    invoke-virtual {p0, p2, v4, v5}, Landroid/util/SparseLongArray;->get(IJ)J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final setAppLockEnabledPackageSuccessfullyAuthenticated(Ljava/lang/String;I)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    move/from16 v3, p2

    const-string/jumbo v1, "setAppLockEnabledPackageSuccessfullyAuthenticated for "

    const-string v2, "AppLockLocalService.setAppLockEnabledPackageSuccessfullyAuthenticated"

    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v2}, Lcom/android/server/am/AppLockLocalService$Injector;->getCallingUid()I

    move-result v2

    const/16 v4, 0x3e8

    invoke-static {v2, v4}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v2

    const/4 v8, 0x0

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    invoke-interface {v2}, Lcom/android/server/am/AppLockLocalService$Injector;->getCallingUid()I

    move-result v2

    invoke-static {v2, v8}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/SecurityException;

    const-string/jumbo v1, "setAppLockEnabledPackageSuccessfullyAuthenticated can only be called by the system"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    sget-boolean v2, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v2, :cond_2

    const-string v2, "AppLockLocalService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " and user: "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    new-instance v9, Landroid/util/ArraySet;

    invoke-direct {v9}, Landroid/util/ArraySet;-><init>()V

    invoke-virtual {v9, v7}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService;->mAtmInternal:Lcom/android/server/wm/ActivityTaskManagerInternal;

    invoke-virtual {v1, v3}, Lcom/android/server/wm/ActivityTaskManagerInternal;->getPackagesWithVisibleAppLockOverlay(I)Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v9, v1}, Landroid/util/ArraySet;->addAll(Ljava/util/Collection;)Z

    :cond_3
    new-instance v10, Landroid/util/ArraySet;

    invoke-direct {v10}, Landroid/util/ArraySet;-><init>()V

    new-instance v11, Landroid/util/ArrayMap;

    invoke-direct {v11}, Landroid/util/ArrayMap;-><init>()V

    iget-object v1, v0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    new-instance v2, Landroid/util/ArraySet;

    invoke-direct {v2}, Landroid/util/ArraySet;-><init>()V

    move v6, v8

    :goto_1
    invoke-virtual {v9}, Landroid/util/ArraySet;->size()I

    move-result v12

    if-ge v6, v12, :cond_9

    invoke-virtual {v9, v6}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    if-nez v12, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v0, v3, v12}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v13

    if-nez v13, :cond_5

    goto :goto_4

    :cond_5
    sget-boolean v14, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v14, :cond_6

    const-string v14, "AppLockLocalService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "setAppLockEnabledPackageSuccessfullyAuthenticated: authenticating package "

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v14, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v2, v1

    goto/16 :goto_8

    :cond_6
    :goto_2
    invoke-virtual {v2, v13}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    const/4 v8, 0x0

    goto :goto_4

    :cond_7
    iput-wide v4, v13, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastAuthTimeSinceDeviceUnlock:J

    const/4 v8, 0x0

    invoke-virtual {v0, v12, v3, v8}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-virtual {v0, v13, v3}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v10, v12}, Landroid/util/ArraySet;->addAll(Ljava/util/Collection;)Z

    move v14, v8

    :goto_3
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-ge v14, v15, :cond_8

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v11, v15, v13}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    :cond_8
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_9
    invoke-virtual {v0, v3, v7}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabledLocked(ILjava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {v10, v7}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v3, v7}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    invoke-virtual {v11, v7, v2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    invoke-virtual {v10}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_b
    move-object v2, v1

    :try_start_2
    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v12
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move v14, v8

    :goto_5
    :try_start_4
    invoke-virtual {v10}, Landroid/util/ArraySet;->size()I

    move-result v2

    if-ge v14, v2, :cond_c

    invoke-virtual {v10, v14}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v10, v14}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v11, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    add-int/lit8 v14, v14, 0x1

    move/from16 v3, p2

    goto :goto_5

    :catchall_1
    move-exception v0

    goto :goto_7

    :cond_c
    :try_start_5
    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    invoke-virtual {v10, v9}, Landroid/util/ArraySet;->retainAll(Ljava/util/Collection;)Z

    if-ltz p2, :cond_e

    :goto_6
    invoke-virtual {v10}, Landroid/util/ArraySet;->size()I

    move-result v1

    if-ge v8, v1, :cond_e

    invoke-virtual {v10, v8}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    invoke-virtual {v0, v1}, Lcom/android/server/am/AppLockLocalService;->logCoAuthenticatedAppLaunch(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :cond_d
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    :cond_e
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :goto_7
    :try_start_6
    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :catchall_2
    move-exception v0

    :goto_8
    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :catchall_3
    move-exception v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0
.end method

.method public final setAppLockRecentsDeferredPackages(IILjava/util/List;)V
    .locals 6

    if-gez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Landroid/util/ArraySet;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/util/ArraySet;-><init>(I)V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    invoke-interface {p3, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, p2, v4}, Lcom/android/server/am/AppLockLocalService;->isAppLockUnlockedLocked(ILjava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v1, v4}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :catchall_0
    move-exception p0

    goto/16 :goto_5

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    iget-object p3, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;

    if-eqz p3, :cond_4

    iget v3, p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    if-ne v3, p2, :cond_3

    iget-object v3, p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v3, v1}, Landroid/util/ArraySet;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x1

    goto :goto_2

    :cond_3
    move v3, v2

    :goto_2
    if-eqz v3, :cond_4

    monitor-exit v0

    return-void

    :cond_4
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {v1}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    new-instance v4, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput p2, v4, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    iput-object v1, v4, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v3, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move p1, v2

    :goto_3
    invoke-virtual {v1}, Landroid/util/ArraySet;->size()I

    move-result v3

    if-ge p1, v3, :cond_5

    invoke-virtual {v1, p1}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, p2, v3}, Lcom/android/server/am/AppLockLocalService;->cancelPackageAppLockedJobLocked(ILjava/lang/String;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_5
    :goto_4
    if-eqz p3, :cond_7

    iget-object p1, p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {p1}, Landroid/util/ArraySet;->size()I

    move-result p1

    if-ge v2, p1, :cond_7

    iget-object p1, p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {p1, v2}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget p2, p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isAppLockDeferredForRecentsLocked(ILjava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_6

    iget p2, p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->isAppLockUnlockedLocked(ILjava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_6

    iget p2, p3, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->scheduleLockedStateLocked(Ljava/lang/String;I)V

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_7
    monitor-exit v0

    return-void

    :goto_5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final setSpcStateForUser(IZ)Z
    .locals 2

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mSpcStateLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mSpcEnabledForUser:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v1

    if-ne v1, p2, :cond_0

    const/4 p0, 0x0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mSpcEnabledForUser:Landroid/util/SparseBooleanArray;

    invoke-virtual {p0, p1, p2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    const/4 p0, 0x1

    monitor-exit v0

    return p0

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final setSpcStateRefreshCallback(Ljava/util/function/IntConsumer;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService;->mSpcStateRefreshCallback:Ljava/util/function/IntConsumer;

    return-void
.end method

.method public final showAppLockRoleExemptToast(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string/jumbo v0, "sys.boot_completed"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/server/UiThread;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda5;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda5;->f$0:Lcom/android/server/am/AppLockLocalService;

    iput p1, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda5;->f$1:I

    iput-object p3, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iput-object p2, v1, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda5;->f$3:Ljava/lang/String;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final unregisterPackageLockedStateListener(Landroid/app/AppLockInternal$PackageLockedStateListener;)V
    .locals 1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mPackageLockedStateListeners:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final unregisterPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V
    .locals 0

    .line 16
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mRemotePackageLockedStateListeners:Landroid/os/RemoteCallbackList;

    invoke-virtual {p0, p1}, Landroid/os/RemoteCallbackList;->unregister(Landroid/os/IInterface;)Z

    return-void
.end method

.method public final updateAppLockGroupMembership(ILjava/lang/String;)I
    .locals 12

    const-string/jumbo v0, "updateAppLockGroupMembership: "

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Landroid/content/pm/PackageManagerInternal;->getAppLockParentPackage(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, p2

    :goto_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_2

    iget-object v6, v3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mOwnerPackage:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    monitor-exit v2

    return v4

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_4

    :cond_1
    invoke-virtual {p0, p2, p1, v3, v4}, Lcom/android/server/am/AppLockLocalService;->detachAppLockGroupMemberLocked(Ljava/lang/String;ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Z)Z

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v4, v5

    :cond_2
    invoke-virtual {p0, p1, v1}, Lcom/android/server/am/AppLockLocalService;->findAppLockGroupOwnerStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v3

    if-nez v3, :cond_3

    new-instance v3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    invoke-direct {v3}, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;-><init>()V

    iput-object v1, v3, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mOwnerPackage:Ljava/lang/String;

    :cond_3
    move-object v9, v3

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/ArrayMap;

    if-nez v3, :cond_4

    new-instance v3, Landroid/util/ArrayMap;

    invoke-direct {v3}, Landroid/util/ArrayMap;-><init>()V

    iget-object v6, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v6, p1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_4
    invoke-virtual {v3, p2, v9}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-boolean v3, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v3, :cond_5

    const-string v3, "AppLockLocalService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (user "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ") owner="

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", separated="

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", members="

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v9, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", lastSentLockedState="

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v9, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    if-eqz v4, :cond_7

    const-wide/16 v0, -0x1

    iput-wide v0, v9, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastAuthTimeSinceDeviceUnlock:J

    invoke-virtual {p0, p2, p1, v5}, Lcom/android/server/am/AppLockLocalService;->updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0, v9, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockGroupMembersLocked(Lcom/android/server/am/AppLockLocalService$AppLockLockedState;I)Ljava/util/ArrayList;

    move-result-object p2

    goto :goto_1

    :cond_6
    invoke-static {p2}, Ljava/util/List;->of(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    :goto_1
    move v11, v5

    :goto_2
    move-object v8, p2

    goto :goto_3

    :cond_7
    iget-object v0, v9, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {p2}, Ljava/util/List;->of(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    move v11, v0

    goto :goto_2

    :goto_3
    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v7

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v6, p0

    move v10, p1

    invoke-virtual/range {v6 .. v11}, Lcom/android/server/am/AppLockLocalService;->dispatchAppLockGroupLockedStateChanged(Ljava/util/ArrayList;Ljava/util/List;Lcom/android/server/am/AppLockLocalService$AppLockLockedState;IZ)V

    return v5

    :cond_8
    const/4 p0, 0x2

    :try_start_1
    monitor-exit v2

    return p0

    :goto_4
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final updateExemptRoleHolderForUser(ILjava/lang/String;Z)V
    .locals 9

    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService;->isAppLockSupportedForUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_0
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mInjector:Lcom/android/server/am/AppLockLocalService$Injector;

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/android/server/am/AppLockLocalService$Injector;->getRoleManager(Landroid/content/Context;)Landroid/app/role/RoleManager;

    move-result-object v0

    if-nez v0, :cond_1

    goto/16 :goto_7

    :cond_1
    :try_start_1
    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/app/role/RoleManager;->getRoleHoldersAsUser(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object p0, v0

    move v8, p1

    move-object p1, p0

    move p0, v8

    goto/16 :goto_9

    :cond_3
    :goto_0
    move-object v0, v1

    :goto_1
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_3
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/ArrayMap;

    if-eqz v4, :cond_4

    invoke-virtual {v4, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object p0, v0

    goto/16 :goto_8

    :cond_4
    move-object v5, v1

    :goto_2
    const/4 v6, 0x1

    if-eqz p3, :cond_5

    if-eqz v0, :cond_5

    invoke-static {v5, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5

    move p3, v6

    goto :goto_3

    :cond_5
    move p3, v2

    :goto_3
    if-eqz v0, :cond_7

    if-nez v4, :cond_6

    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    iget-object v5, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {v5, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_6
    invoke-virtual {v4, p2, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_7
    if-eqz v4, :cond_8

    invoke-virtual {v4, p2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v4}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_8

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mExemptRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_8
    :goto_4
    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/ArrayMap;

    if-eqz v0, :cond_9

    if-eqz v4, :cond_9

    invoke-virtual {v4, v0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    move v7, v6

    goto :goto_5

    :cond_9
    move v7, v2

    :goto_5
    if-eqz v7, :cond_b

    invoke-virtual {p0, p1, v0}, Lcom/android/server/am/AppLockLocalService;->clearAllCallStatesForPackageLocked(ILjava/lang/String;)V

    invoke-virtual {v4, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    invoke-virtual {p0, v0, p1, v2, v6}, Lcom/android/server/am/AppLockLocalService;->detachAppLockGroupMemberLocked(Ljava/lang/String;ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Z)Z

    move-result v2

    invoke-virtual {v4, v0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v4}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_a

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_a
    if-eqz v2, :cond_b

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v1

    :cond_b
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_c

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    move v3, p1

    move-object v2, v0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    move p0, v3

    goto :goto_6

    :cond_c
    move-object v2, v0

    move-object v0, p0

    move p0, p1

    :goto_6
    if-eqz v7, :cond_d

    invoke-virtual {v0}, Lcom/android/server/am/AppLockLocalService;->getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;

    move-result-object p1

    invoke-virtual {p1, p0, v2}, Landroid/content/pm/PackageManagerInternal;->setPackageAppLockEnabled(ILjava/lang/String;)Z

    :cond_d
    if-eqz p3, :cond_e

    if-eqz v7, :cond_e

    invoke-virtual {v0, p0, v2, p2}, Lcom/android/server/am/AppLockLocalService;->showAppLockRoleExemptToast(ILjava/lang/String;Ljava/lang/String;)V

    :cond_e
    :goto_7
    return-void

    :goto_8
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0

    :catch_1
    move-exception v0

    move p0, p1

    move-object p1, v0

    :goto_9
    const-string p3, "AppLockLocalService"

    const-string v0, "Failed to get "

    const-string v1, " holder for user "

    invoke-static {p0, v0, p2, v1}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p3, p0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public final updateExemptRoleHoldersForAllUsers(Ljava/lang/String;Z)V
    .locals 3

    const-class v0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/UserManagerInternal;

    if-nez v0, :cond_0

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "updateExemptRoleHoldersForAllUsers: UserManagerInternal is unavailable"

    invoke-static {p0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    sget-object v1, Lcom/android/server/pm/UserManagerInternal;->USER_FILTER_WITH_ALL_COMPLETE_USERS:Lcom/android/server/pm/UserFilter;

    invoke-virtual {v0, v1}, Lcom/android/server/pm/UserManagerInternal;->getUsers(Lcom/android/server/pm/UserFilter;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/UserInfo;

    iget v2, v2, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {p0, v2, p1, p2}, Lcom/android/server/am/AppLockLocalService;->updateExemptRoleHolderForUser(ILjava/lang/String;Z)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public updatePackageLockedStateLocked(Ljava/lang/String;IZ)Z
    .locals 6

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-boolean v0, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    const-string v1, "AppLockLocalService"

    if-eqz v0, :cond_0

    const-string v2, " (user "

    const-string v3, ") state changing to locked="

    const-string/jumbo v4, "updatePackageLockedStateLocked: "

    invoke-static {p2, v4, p1, v2, v3}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1, v2, p3}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->getAppLockLockedStateLocked(ILjava/lang/String;)Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    if-eqz v0, :cond_1

    const-string/jumbo p0, "updatePackageLockedStateLocked: App Lock is disabled, returning false"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return v3

    :cond_2
    if-nez p3, :cond_3

    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->cancelPackageAppLockedJobLocked(ILjava/lang/String;)V

    :cond_3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v5, v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    if-eqz v0, :cond_4

    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo p1, "updatePackageLockedStateLocked: already sent an update with locked="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", returning false"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return v3

    :cond_5
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v2, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;->mLastSentLockedState:Ljava/lang/Boolean;

    const/4 v0, 0x1

    if-eqz p3, :cond_9

    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->removeAppLockRecentsDeferralsLocked(ILjava/lang/String;)V

    iget-object p3, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {p3}, Landroid/util/SparseArray;->size()I

    move-result p3

    sub-int/2addr p3, v0

    :goto_0
    if-ltz p3, :cond_8

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v1, p3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;

    iget v2, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mUserId:I

    if-eq v2, p2, :cond_6

    goto :goto_1

    :cond_6
    iget-object v2, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    new-instance v3, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object p0, v3, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;->f$0:Lcom/android/server/am/AppLockLocalService;

    iput-object p1, v3, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;->f$1:Ljava/lang/String;

    iput p2, v3, Lcom/android/server/am/AppLockLocalService$$ExternalSyntheticLambda11;->f$2:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v2, v3}, Landroid/util/ArraySet;->removeIf(Ljava/util/function/Predicate;)Z

    iget-object v1, v1, Lcom/android/server/am/AppLockLocalService$RecentsDeferredPackage;->mPackageNames:Landroid/util/ArraySet;

    invoke-virtual {v1}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockRecentsDeferredPackages:Landroid/util/SparseArray;

    invoke-virtual {v1, p3}, Landroid/util/SparseArray;->removeAt(I)V

    :cond_7
    :goto_1
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_8
    invoke-virtual {p0, p2, p1}, Lcom/android/server/am/AppLockLocalService;->cancelPackageAppLockedJobLocked(ILjava/lang/String;)V

    :cond_9
    return v0
.end method

.method public updateSearchRoleHolderForUser(I)V
    .locals 1

    const/4 v0, 0x0

    .line 191
    invoke-virtual {p0, p1, v0}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHolderForUser(IZ)V

    return-void
.end method

.method public final updateSearchRoleHolderForUser(IZ)V
    .locals 10

    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService;->isAppLockSupportedForUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService;->mSearchRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/server/am/AppLockLocalService;->getSearchRolePackageForUser(I)Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService;->mSearchRolePackagesForUser:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    move-object p0, v0

    goto/16 :goto_5

    :cond_1
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mSearchRolePackagesForUser:Landroid/util/SparseArray;

    if-eqz v4, :cond_2

    :try_start_2
    invoke-virtual {v2, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    :goto_0
    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/ArrayMap;

    const/4 v3, 0x1

    if-eqz v4, :cond_3

    if-eqz v2, :cond_3

    invoke-virtual {v2, v4}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    move v9, v3

    goto :goto_1

    :cond_3
    const/4 v5, 0x0

    move v9, v5

    :goto_1
    if-eqz v9, :cond_5

    invoke-virtual {p0, p1, v4}, Lcom/android/server/am/AppLockLocalService;->clearAllCallStatesForPackageLocked(ILjava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/am/AppLockLocalService$AppLockLockedState;

    invoke-virtual {p0, v4, p1, v5, v3}, Lcom/android/server/am/AppLockLocalService;->detachAppLockGroupMemberLocked(Ljava/lang/String;ILcom/android/server/am/AppLockLocalService$AppLockLockedState;Z)Z

    move-result v3

    invoke-virtual {v2, v4}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService;->mAppLockLockedStatesForUser:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_4
    if-eqz v3, :cond_5

    invoke-virtual {p0}, Lcom/android/server/am/AppLockLocalService;->copyPackageLockedStateListenersLocked()Ljava/util/ArrayList;

    move-result-object v2

    :goto_2
    move-object v3, v2

    goto :goto_3

    :cond_5
    const/4 v2, 0x0

    goto :goto_2

    :goto_3
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    sget-boolean v1, Lcom/android/server/am/AppLockLocalService;->DEBUG:Z

    if-eqz v1, :cond_6

    const-string v1, "AppLockLocalService"

    const-string/jumbo v2, "updateSearchRoleHolderForUser: userId="

    const-string v5, ", oldSearchPkg="

    const-string v6, ", newSearchPkg="

    invoke-static {p1, v2, v5, v0, v6}, Lcom/android/server/HeapdumpWatcher$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", hadAppLockEnabled="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    if-eqz v3, :cond_7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    move v5, p1

    invoke-virtual/range {v2 .. v8}, Lcom/android/server/am/AppLockLocalService;->dispatchPackageLockedStateChanged(Ljava/util/ArrayList;Ljava/lang/String;IZZLcom/android/server/am/AppLockLocalService$AppLockLockedState;)V

    goto :goto_4

    :cond_7
    move-object v2, p0

    move v5, p1

    :goto_4
    if-eqz v9, :cond_8

    invoke-virtual {v2}, Lcom/android/server/am/AppLockLocalService;->getPackageManagerInternal()Landroid/content/pm/PackageManagerInternal;

    move-result-object p0

    invoke-virtual {p0, v5, v4}, Landroid/content/pm/PackageManagerInternal;->setPackageAppLockEnabled(ILjava/lang/String;)Z

    :cond_8
    if-eqz p2, :cond_9

    if-eqz v9, :cond_9

    const-string/jumbo p0, "android.app.role.SEARCH_ENGINE"

    invoke-virtual {v2, v5, v4, p0}, Lcom/android/server/am/AppLockLocalService;->showAppLockRoleExemptToast(ILjava/lang/String;Ljava/lang/String;)V

    :cond_9
    return-void

    :goto_5
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p0
.end method

.method public updateSearchRoleHoldersForAllUsers()V
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHoldersForAllUsers(Z)V

    return-void
.end method

.method public final updateSearchRoleHoldersForAllUsers(Z)V
    .locals 3

    const-class v0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/UserManagerInternal;

    if-nez v0, :cond_0

    const-string p0, "AppLockLocalService"

    const-string/jumbo p1, "updateSearchRoleHoldersForAllUsers: Unable to retrieve UserManagerInternal"

    invoke-static {p0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    sget-object v1, Lcom/android/server/pm/UserManagerInternal;->USER_FILTER_WITH_ALL_COMPLETE_USERS:Lcom/android/server/pm/UserFilter;

    invoke-virtual {v0, v1}, Lcom/android/server/pm/UserManagerInternal;->getUsers(Lcom/android/server/pm/UserFilter;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/UserInfo;

    iget v2, v2, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {p0, v2, p1}, Lcom/android/server/am/AppLockLocalService;->updateSearchRoleHolderForUser(IZ)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method
