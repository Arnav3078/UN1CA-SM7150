.class public final Lcom/android/server/pm/AppLockPackageHelper;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# static fields
.field public static final ALLOWED_PACKAGES_FOR_APP_LOCK_BNR:Ljava/util/Set;

.field public static final DEBUG:Z

.field static final PENDING_RESTORE_TTL_MILLIS:J

.field public static sAppLockExemptPackages:Landroid/util/ArraySet;

.field public static volatile sAppLockExemptPackagesOverride:Ljava/util/Set;

.field public static volatile sAppLockInternal:Landroid/app/AppLockInternal;

.field public static volatile sIsSupportedDeviceForAppLock:Ljava/lang/Boolean;

.field public static volatile sResourcesForTesting:Landroid/content/res/Resources;

.field public static volatile sSystemDialerPackage:Ljava/lang/String;


# instance fields
.field public final mBroadcastHelper:Lcom/android/server/pm/BroadcastHelper;

.field public final mContext:Landroid/content/Context;

.field public final mFrameworkStatsLogger:Lcom/android/server/pm/AppLockPackageHelper$AppLockFrameworkStatsLogger;

.field public final mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

.field public final mPackagesPendingAppLockRestore:Landroid/util/SparseArray;

.field public final mPackagesRemovedAtBoot:Landroid/util/ArraySet;

.field public final mPms:Lcom/android/server/pm/PackageManagerService;

.field public final mSpcCleanupCompleted:Landroid/util/SparseBooleanArray;

.field public final mSupervisionListener:Lcom/android/server/pm/AppLockPackageHelper$1;

.field public final mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockPackageHelper"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    const-string/jumbo v0, "com.sec.android.easyMover"

    const-string/jumbo v1, "com.samsung.android.scloud"

    invoke-static {v0, v1}, Ljava/util/Set;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/AppLockPackageHelper;->ALLOWED_PACKAGES_FOR_APP_LOCK_BNR:Ljava/util/Set;

    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackages:Landroid/util/ArraySet;

    sput-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sResourcesForTesting:Landroid/content/res/Resources;

    sput-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sSystemDialerPackage:Ljava/lang/String;

    const-wide/32 v0, 0x240c8400

    sput-wide v0, Lcom/android/server/pm/AppLockPackageHelper;->PENDING_RESTORE_TTL_MILLIS:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/BroadcastHelper;)V
    .locals 1

    .line 57
    new-instance v0, Lcom/android/server/pm/AppLockPackageHelper$InjectorImpl;

    .line 58
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/server/pm/AppLockPackageHelper;-><init>(Landroid/content/Context;Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/BroadcastHelper;Lcom/android/server/pm/AppLockPackageHelper$Injector;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/BroadcastHelper;Lcom/android/server/pm/AppLockPackageHelper$Injector;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mSpcCleanupCompleted:Landroid/util/SparseBooleanArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesRemovedAtBoot:Landroid/util/ArraySet;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesPendingAppLockRestore:Landroid/util/SparseArray;

    new-instance v0, Lcom/android/server/pm/AppLockPackageHelper$1;

    invoke-direct {v0, p0}, Lcom/android/server/pm/AppLockPackageHelper$1;-><init>(Lcom/android/server/pm/AppLockPackageHelper;)V

    iput-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mSupervisionListener:Lcom/android/server/pm/AppLockPackageHelper$1;

    iput-object p1, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iput-object p3, p0, Lcom/android/server/pm/AppLockPackageHelper;->mBroadcastHelper:Lcom/android/server/pm/BroadcastHelper;

    iput-object p4, p0, Lcom/android/server/pm/AppLockPackageHelper;->mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lcom/android/server/pm/AppLockPackageHelper$AppLockFrameworkStatsLogger;

    invoke-direct {p1}, Lcom/android/server/pm/AppLockPackageHelper$AppLockFrameworkStatsLogger;-><init>()V

    iput-object p1, p0, Lcom/android/server/pm/AppLockPackageHelper;->mFrameworkStatsLogger:Lcom/android/server/pm/AppLockPackageHelper$AppLockFrameworkStatsLogger;

    return-void
.end method

.method public static addFailure(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    if-nez p0, :cond_0

    const-string p0, ""

    :cond_0
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static enforceAppLockBnrCaller(IILcom/android/server/pm/Computer;Ljava/lang/String;)V
    .locals 3

    const/16 v0, 0x3e8

    invoke-static {p1, v0}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    if-eqz p3, :cond_1

    if-ne p0, v0, :cond_1

    sget-object v1, Lcom/android/server/pm/AppLockPackageHelper;->ALLOWED_PACKAGES_FOR_APP_LOCK_BNR:Ljava/util/Set;

    invoke-interface {v1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-wide/16 v1, 0x0

    invoke-interface {p2, p3, v1, v2, v0}, Lcom/android/server/pm/Computer;->getPackageUid(Ljava/lang/String;JI)I

    move-result p2

    if-ne p2, p1, :cond_1

    const-class p2, Landroid/content/pm/PackageManagerInternal;

    invoke-static {p2}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/pm/PackageManagerInternal;

    invoke-virtual {p2, p3}, Landroid/content/pm/PackageManagerInternal;->isPlatformSigned(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    const-string p2, " with uid "

    const-string v0, " is not allowed to back up or restore App Lock state of user "

    const-string/jumbo v1, "Package "

    invoke-static {p1, v1, p3, p2, v0}, Lcom/android/server/security/applock/AppLockOutlineSysCfg;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/android/server/wm/Task$$ExternalSyntheticBUOutline0;->m(Ljava/lang/StringBuilder;I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public static getAppLockEnabledPackages(Lcom/android/server/pm/Computer;I)Ljava/util/List;
    .locals 1

    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Landroid/app/AppLockInternal;->isAppLockSupportedForUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0, p1}, Lcom/android/server/pm/AppLockPackageHelper;->getPersistedAppLockEnabledPackages(Lcom/android/server/pm/Computer;I)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method public static getAppLockInternal()Landroid/app/AppLockInternal;
    .locals 1

    sget-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockInternal:Landroid/app/AppLockInternal;

    if-nez v0, :cond_0

    const-class v0, Landroid/app/AppLockInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppLockInternal;

    sput-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockInternal:Landroid/app/AppLockInternal;

    :cond_0
    sget-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockInternal:Landroid/app/AppLockInternal;

    return-object v0
.end method

.method public static getAppLockParent(ILcom/android/server/pm/Computer;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-nez p3, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-interface {p1, p2}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-interface {p3}, Lcom/android/server/pm/pkg/PackageStateInternal;->getPkg()Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    invoke-static {v1}, Lcom/android/server/pm/AppLockPackageHelper;->getDeclaredAppLockParent(Lcom/android/server/pm/pkg/AndroidPackage;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    sget-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackagesOverride:Ljava/util/Set;

    if-eqz v2, :cond_2

    check-cast v2, Landroid/util/ArraySet;

    invoke-virtual {v2, p2}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result p2

    goto :goto_1

    :cond_2
    sget-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackages:Landroid/util/ArraySet;

    if-nez v2, :cond_3

    invoke-static {}, Lcom/android/server/SystemConfig;->getInstance()Lcom/android/server/SystemConfig;

    move-result-object v2

    iget-object v2, v2, Lcom/android/server/SystemConfig;->mAppLockExemptPackages:Landroid/util/ArraySet;

    sput-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackages:Landroid/util/ArraySet;

    :cond_3
    invoke-virtual {v2, p2}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result p2

    :goto_1
    if-eqz p2, :cond_4

    goto :goto_3

    :cond_4
    invoke-interface {p1, v1}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getPkg()Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;

    move-result-object p2

    goto :goto_2

    :cond_5
    move-object p2, v0

    :goto_2
    if-eqz p2, :cond_7

    invoke-interface {p1, p0}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/server/pm/pkg/PackageUserState;->isInstalled()Z

    move-result p0

    if-eqz p0, :cond_7

    invoke-static {p2}, Lcom/android/server/pm/AppLockPackageHelper;->getDeclaredAppLockParent(Lcom/android/server/pm/pkg/AndroidPackage;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_7

    invoke-interface {p3}, Lcom/android/server/pm/pkg/PackageStateInternal;->getSigningDetails()Landroid/content/pm/SigningDetails;

    move-result-object p0

    if-eqz p0, :cond_7

    invoke-interface {p1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getSigningDetails()Landroid/content/pm/SigningDetails;

    move-result-object p0

    if-eqz p0, :cond_7

    invoke-interface {p1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getSigningDetails()Landroid/content/pm/SigningDetails;

    move-result-object p0

    invoke-interface {p3}, Lcom/android/server/pm/pkg/PackageStateInternal;->getSigningDetails()Landroid/content/pm/SigningDetails;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->compareSignatures(Landroid/content/pm/SigningDetails;Landroid/content/pm/SigningDetails;)I

    move-result p0

    if-eqz p0, :cond_6

    goto :goto_3

    :cond_6
    return-object v1

    :cond_7
    :goto_3
    return-object v0
.end method

.method public static getAppLockParent(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 118
    invoke-static {p2}, Lcom/android/server/pm/AppLockPackageHelper;->isAppLockSupportedForUser(I)Z

    move-result v0

    invoke-static {p2, p0, p1, v0}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockParent(ILcom/android/server/pm/Computer;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDeclaredAppLockParent(Lcom/android/server/pm/pkg/AndroidPackage;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-interface {p0}, Lcom/android/server/pm/pkg/AndroidPackage;->getProperties()Ljava/util/Map;

    move-result-object p0

    goto :goto_0

    :cond_0
    move-object p0, v0

    :goto_0
    if-eqz p0, :cond_1

    const-string/jumbo v1, "com.samsung.android.applock.PARENT_PACKAGE"

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/PackageManager$Property;

    goto :goto_1

    :cond_1
    move-object p0, v0

    :goto_1
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/content/pm/PackageManager$Property;->isString()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/content/pm/PackageManager$Property;->getString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Landroid/content/pm/PackageManager$Property;->getString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v0
.end method

.method public static getPackageCertificateSha256Digests(Lcom/android/server/pm/pkg/PackageStateInternal;)Ljava/util/List;
    .locals 4

    invoke-interface {p0}, Lcom/android/server/pm/pkg/PackageStateInternal;->getSigningDetails()Landroid/content/pm/SigningDetails;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/content/pm/SigningDetails;->getSignatures()[Landroid/content/pm/Signature;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/content/pm/SigningDetails;->getSignatures()[Landroid/content/pm/Signature;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    invoke-virtual {v3}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v3

    invoke-static {v3}, Landroid/util/PackageUtils;->computeSha256DigestBytes([B)[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    :goto_1
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method public static getPersistedAppLockEnabledPackages(Lcom/android/server/pm/Computer;I)Ljava/util/List;
    .locals 4

    invoke-interface {p0}, Lcom/android/server/pm/Computer;->getPackageStates()Landroid/util/ArrayMap;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Landroid/util/ArrayMap;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    invoke-virtual {p0, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/pm/pkg/PackageStateInternal;

    invoke-interface {v2, p1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Lcom/android/server/pm/pkg/PackageState;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static isAppLockSupported(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Z
    .locals 1

    .line 260
    invoke-interface {p0, p1}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 261
    :cond_0
    invoke-interface {v0}, Lcom/android/server/pm/pkg/PackageStateInternal;->getPkg()Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;

    move-result-object v0

    if-nez v0, :cond_1

    :goto_0
    const/4 p0, 0x0

    return p0

    .line 262
    :cond_1
    invoke-interface {v0}, Lcom/android/server/pm/pkg/AndroidPackage;->getActivities()Ljava/util/List;

    move-result-object v0

    invoke-static {p1, p2, v0, p0}, Lcom/android/server/pm/AppLockPackageHelper;->isAppLockSupported(Ljava/lang/String;ILjava/util/List;Lcom/android/server/pm/Computer;)Z

    move-result p0

    return p0
.end method

.method public static isAppLockSupported(Ljava/lang/String;ILjava/util/List;Lcom/android/server/pm/Computer;)Z
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lcom/android/internal/pm/pkg/component/ParsedActivity;",
            ">;",
            "Lcom/android/server/pm/Computer;",
            ")Z"
        }
    .end annotation

    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    invoke-interface {v0}, Landroid/app/AppLockInternal;->isAppLockSupportedForDevice()Z

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_7

    :cond_0
    sget-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackagesOverride:Ljava/util/Set;

    if-eqz v2, :cond_1

    check-cast v2, Landroid/util/ArraySet;

    invoke-virtual {v2, p0}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackages:Landroid/util/ArraySet;

    if-nez v2, :cond_2

    invoke-static {}, Lcom/android/server/SystemConfig;->getInstance()Lcom/android/server/SystemConfig;

    move-result-object v2

    iget-object v2, v2, Lcom/android/server/SystemConfig;->mAppLockExemptPackages:Landroid/util/ArraySet;

    sput-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackages:Landroid/util/ArraySet;

    :cond_2
    invoke-virtual {v2, p0}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v2

    :goto_0
    if-eqz v2, :cond_3

    goto/16 :goto_7

    :cond_3
    sget-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sSystemDialerPackage:Ljava/lang/String;

    const/4 v3, 0x0

    if-nez v2, :cond_7

    sget-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sResourcesForTesting:Landroid/content/res/Resources;

    if-eqz v2, :cond_4

    sget-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sResourcesForTesting:Landroid/content/res/Resources;

    goto :goto_1

    :cond_4
    invoke-static {}, Landroid/app/ActivityThread;->currentSystemContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    goto :goto_1

    :cond_5
    move-object v2, v3

    :goto_1
    if-nez v2, :cond_6

    goto :goto_3

    :cond_6
    const v4, 0x1040023

    :try_start_0
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    const-string v2, ""

    :goto_2
    sput-object v2, Lcom/android/server/pm/AppLockPackageHelper;->sSystemDialerPackage:Ljava/lang/String;

    :cond_7
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_8

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    goto/16 :goto_7

    :cond_8
    :goto_3
    invoke-interface {v0, p1}, Landroid/app/AppLockInternal;->isAppLockSupportedForUser(I)Z

    move-result v2

    if-nez v2, :cond_9

    goto/16 :goto_7

    :cond_9
    invoke-interface {v0, p0, p1}, Landroid/app/AppLockInternal;->isPackageAppLockDynamicallyExempt(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_7

    :cond_a
    const-class v0, Landroid/content/pm/PackageManagerInternal;

    const/4 v2, 0x1

    if-eqz p3, :cond_b

    invoke-static {p1, p3, p0, v2}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockParent(ILcom/android/server/pm/Computer;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_c

    goto/16 :goto_7

    :cond_b
    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/PackageManagerInternal;

    if-eqz v4, :cond_c

    invoke-virtual {v4, p1, p0}, Landroid/content/pm/PackageManagerInternal;->getAppLockParentPackage(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_c

    goto/16 :goto_7

    :cond_c
    if-eqz p3, :cond_d

    invoke-interface {p3, p0}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v4

    goto :goto_4

    :cond_d
    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/PackageManagerInternal;

    if-eqz v4, :cond_e

    invoke-virtual {v4, p0}, Landroid/content/pm/PackageManagerInternal;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/pkg/PackageStateInternal;

    move-result-object v4

    goto :goto_4

    :cond_e
    move-object v4, v3

    :goto_4
    if-eqz v4, :cond_f

    invoke-interface {v4, p1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result v4

    if-eqz v4, :cond_f

    return v2

    :cond_f
    new-instance v6, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.MAIN"

    invoke-direct {v6, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "android.intent.category.LAUNCHER"

    invoke-virtual {v6, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v6, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-wide/32 v8, 0xc0000

    if-eqz p3, :cond_10

    const/4 v7, 0x0

    const/16 v10, 0x3e8

    move v11, p1

    move-object v5, p3

    invoke-interface/range {v5 .. v11}, Lcom/android/server/pm/Computer;->queryIntentActivitiesInternal(Landroid/content/Intent;Ljava/lang/String;JII)Ljava/util/List;

    move-result-object v3

    goto :goto_5

    :cond_10
    move v11, p1

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Landroid/content/pm/PackageManagerInternal;

    if-eqz v5, :cond_11

    const/4 v7, 0x0

    const/16 v10, 0x3e8

    invoke-virtual/range {v5 .. v11}, Landroid/content/pm/PackageManagerInternal;->queryIntentActivities(Landroid/content/Intent;Ljava/lang/String;JII)Ljava/util/List;

    move-result-object v3

    :cond_11
    :goto_5
    if-eqz v3, :cond_13

    move p0, v1

    :goto_6
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result p1

    if-ge p0, p1, :cond_14

    invoke-interface {v3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/pm/ResolveInfo;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz p1, :cond_12

    iget-boolean p1, p1, Landroid/content/pm/ActivityInfo;->exported:Z

    if-eqz p1, :cond_12

    move v1, v2

    goto :goto_7

    :cond_12
    add-int/lit8 p0, p0, 0x1

    goto :goto_6

    :cond_13
    invoke-static {p2}, Lcom/android/server/pm/InstallPackageHelper;->hasLauncherEntry(Ljava/util/List;)Z

    move-result v1

    :cond_14
    :goto_7
    return v1
.end method

.method public static isAppLockSupportedForUser(I)Z
    .locals 1

    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p0}, Landroid/app/AppLockInternal;->isAppLockSupportedForUser(I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isPackageAppLockEnabled(IILcom/android/server/pm/Computer;Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x3e8

    invoke-static {p1, v0}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {p2, p1, v0}, Lcom/android/server/pm/Computer;->checkUidSignatures(II)I

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const-string/jumbo p0, "isPackageAppLockEnabled can only be called by the system or platform-signed apps"

    invoke-static {p0}, Lcom/android/server/wm/Task$$ExternalSyntheticBUOutline0;->m(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    invoke-static {p2, p3, p0}, Lcom/android/server/pm/AppLockPackageHelper;->isPackageAppLockEnabled(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Z

    move-result p0

    return p0
.end method

.method public static isPackageAppLockEnabled(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Z
    .locals 1

    .line 35
    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 36
    invoke-interface {v0, p2}, Landroid/app/AppLockInternal;->isAppLockSupportedForUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 37
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 38
    invoke-interface {p0, p2}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object p0

    .line 39
    invoke-interface {p0}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public static resetAppLockInternalForTesting()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockInternal:Landroid/app/AppLockInternal;

    return-void
.end method

.method public static setResourcesForTesting(Landroid/content/res/Resources;)V
    .locals 0

    sput-object p0, Lcom/android/server/pm/AppLockPackageHelper;->sResourcesForTesting:Landroid/content/res/Resources;

    const/4 p0, 0x0

    sput-object p0, Lcom/android/server/pm/AppLockPackageHelper;->sSystemDialerPackage:Ljava/lang/String;

    return-void
.end method

.method public static syncAppLockChild(Lcom/android/server/pm/Computer;Ljava/lang/String;IZZZLandroid/util/ArrayMap;)V
    .locals 3

    invoke-static {p2, p0, p1, p3}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockParent(ILcom/android/server/pm/Computer;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_1

    if-nez p5, :cond_0

    goto :goto_4

    :cond_0
    const/4 p3, 0x0

    goto :goto_0

    :cond_1
    invoke-interface {p0, p3}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object p3

    :goto_0
    const/4 p5, 0x0

    const/4 v0, 0x1

    if-eqz p3, :cond_2

    invoke-interface {p3, p2}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object p3

    invoke-interface {p3}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result p3

    if-eqz p3, :cond_2

    move p3, v0

    goto :goto_1

    :cond_2
    move p3, p5

    :goto_1
    invoke-interface {p0, p1}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-interface {v1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getPkg()Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_2

    :cond_3
    invoke-interface {v1, p2}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object v2

    invoke-interface {v1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getPkg()Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;

    move-result-object v1

    invoke-static {v1}, Lcom/android/server/pm/AppLockPackageHelper;->getDeclaredAppLockParent(Lcom/android/server/pm/pkg/AndroidPackage;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    move p5, v0

    :cond_4
    invoke-interface {v2}, Lcom/android/server/pm/pkg/PackageUserState;->isInstalled()Z

    move-result v0

    if-eqz v0, :cond_5

    if-eqz p5, :cond_5

    invoke-interface {v2}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result p5

    if-eq p5, p3, :cond_5

    goto :goto_3

    :cond_5
    :goto_2
    if-eqz p4, :cond_6

    if-eqz p3, :cond_6

    invoke-interface {p0, p1}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/server/pm/pkg/PackageUserState;->isInstalled()Z

    move-result p0

    if-eqz p0, :cond_6

    :goto_3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p6, p1, p0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    :goto_4
    return-void
.end method

.method public static targetPackages(Ljava/util/List;)[Ljava/lang/String;
    .locals 3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    iget-object v2, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static targetUsers(Ljava/util/List;)[I
    .locals 3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [I

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static validateDualTargets(Lcom/android/server/pm/Computer;[Ljava/lang/String;[IZI)Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;
    .locals 8

    new-instance v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->eligible:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->toChange:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->alreadyAtTarget:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->failed:Ljava/util/ArrayList;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    new-instance v1, Landroid/util/ArraySet;

    invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V

    const/4 v2, 0x0

    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_7

    aget-object v3, p1, v2

    aget v4, p2, v2

    if-nez v3, :cond_0

    const-string v5, ""

    goto :goto_1

    :cond_0
    move-object v5, v3

    :goto_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_6

    invoke-virtual {v1, v5}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_3

    :cond_1
    invoke-interface {p0, v3}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v6

    if-eqz v6, :cond_5

    invoke-interface {v6}, Lcom/android/server/pm/pkg/PackageStateInternal;->getPkg()Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;

    move-result-object v7

    if-eqz v7, :cond_5

    invoke-interface {v6, v4}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/server/pm/pkg/PackageUserState;->isInstalled()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {p0, v6, p4, v4}, Lcom/android/server/pm/Computer;->shouldFilterApplication(Lcom/android/server/pm/pkg/PackageStateInternal;II)Z

    move-result v7

    if-nez v7, :cond_5

    if-eqz p3, :cond_2

    invoke-static {p0, v3, v4}, Lcom/android/server/pm/AppLockPackageHelper;->isAppLockSupported(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_5

    :cond_2
    invoke-static {p0, v3, v4}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockParent(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    iget-object v3, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->eligible:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v6, v4}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result v3

    if-ne v3, p3, :cond_4

    iget-object v3, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->alreadyAtTarget:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_4
    iget-object v3, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->toChange:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_5
    :goto_2
    iget-object v3, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->failed:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_6
    :goto_3
    iget-object v3, v0, Lcom/android/server/pm/AppLockPackageHelper$DualValidationResult;->failed:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_7
    return-object v0
.end method


# virtual methods
.method public addUninstalledPackagesWithAppLockEnabled(ILandroid/util/ArrayMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "[B>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {p0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final createPendingIntent(ILandroid/content/Intent;)Landroid/app/PendingIntent;
    .locals 9

    const/high16 v0, 0x4000000

    invoke-virtual {p2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "unique:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setIdentifier(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    :try_start_0
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v0

    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/app/ActivityOptions;->setPendingIntentCreatorBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    move-result-object v0

    iget-object v3, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v7

    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v8

    const/4 v4, 0x0

    const/high16 v6, 0x44000000    # 512.0f

    move-object v5, p2

    invoke-static/range {v3 .. v8}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0
.end method

.method public final disableAppLockForExemptPackages(Lcom/android/server/pm/Computer;[I)V
    .locals 12

    sget-object v0, Lcom/android/server/pm/AppLockPackageHelper;->sAppLockExemptPackagesOverride:Ljava/util/Set;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/server/SystemConfig;->getInstance()Lcom/android/server/SystemConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/SystemConfig;->mAppLockExemptPackages:Landroid/util/ArraySet;

    :goto_0
    array-length v1, p2

    const/4 v2, 0x0

    move v3, v2

    :goto_1
    if-ge v3, v1, :cond_3

    aget v7, p2, v3

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v0

    check-cast v4, Landroid/util/ArraySet;

    invoke-virtual {v4}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {p1, v5}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v8

    if-eqz v8, :cond_1

    invoke-interface {v8, v7}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object v8

    invoke-interface {v8}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    const/4 v8, 0x0

    const/4 v9, 0x2

    move-object v4, p0

    move-object v5, p1

    invoke-virtual/range {v4 .. v9}, Lcom/android/server/pm/AppLockPackageHelper;->storeAppLockStateForMultiplePackages(Lcom/android/server/pm/Computer;Ljava/util/List;IZI)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    move-object v4, p0

    iget-object p0, v4, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    monitor-enter p0

    move p1, v2

    :goto_3
    :try_start_0
    iget-object p2, v4, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    move-result p2

    if-ge p1, p2, :cond_5

    iget-object p2, v4, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/util/ArrayMap;

    move-object v1, v0

    check-cast v1, Landroid/util/ArraySet;

    invoke-virtual {v1}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p2, v3}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto/16 :goto_9

    :cond_4
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_5
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-class p0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {p0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/server/pm/UserManagerInternal;

    if-nez p0, :cond_6

    goto :goto_8

    :cond_6
    invoke-virtual {p0}, Lcom/android/server/pm/UserManagerInternal;->getUserIds()[I

    move-result-object p0

    array-length p1, p0

    :goto_5
    if-ge v2, p1, :cond_8

    aget v7, p0, v2

    invoke-static {v7}, Lcom/android/server/pm/AppLockPackageHelper;->isAppLockSupportedForUser(I)Z

    move-result v8

    iget-object p2, v4, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {p2}, Lcom/android/server/pm/PackageManagerService;->snapshotComputer()Lcom/android/server/pm/Computer;

    move-result-object p2

    invoke-static {p2, v7}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockEnabledPackages(Lcom/android/server/pm/Computer;I)Ljava/util/List;

    move-result-object p2

    iget-object v0, v4, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v1, v0, Lcom/android/server/pm/PackageManagerService;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceBeforePmsLock()V

    monitor-enter v1

    :try_start_1
    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsLock()V

    iget-object v0, v4, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->snapshotComputer()Lcom/android/server/pm/Computer;

    move-result-object v5

    const/4 v0, 0x0

    invoke-virtual {v4, v0}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockChildCandidates(Ljava/lang/String;)Landroid/util/ArraySet;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/util/ArraySet;->addAll(Ljava/util/Collection;)Z

    new-instance v11, Landroid/util/ArrayMap;

    invoke-direct {v11}, Landroid/util/ArrayMap;-><init>()V

    invoke-virtual {v0}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v5 .. v11}, Lcom/android/server/pm/AppLockPackageHelper;->syncAppLockChild(Lcom/android/server/pm/Computer;Ljava/lang/String;IZZZLandroid/util/ArrayMap;)V

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object p0, v0

    goto :goto_7

    :cond_7
    invoke-virtual {v4, v7, v11}, Lcom/android/server/pm/AppLockPackageHelper;->storeAppLockChildren(ILandroid/util/ArrayMap;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :goto_7
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    throw p0

    :cond_8
    :goto_8
    return-void

    :goto_9
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method

.method public final getAppLockChildCandidates(Ljava/lang/String;)Landroid/util/ArraySet;
    .locals 4

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object p0, p0, Lcom/android/server/pm/PackageManagerService;->mPackageProperty:Lcom/android/server/pm/PackageProperty;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v2, "com.samsung.android.applock.PARENT_PACKAGE"

    const/4 v3, 0x5

    invoke-virtual {p0, v2, v3, v1}, Lcom/android/server/pm/PackageProperty;->queryProperty(Ljava/lang/String;ILjava/util/function/Predicate;)Ljava/util/List;

    move-result-object p0

    :goto_0
    if-nez p0, :cond_1

    goto :goto_2

    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageManager$Property;

    if-eqz p1, :cond_3

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$Property;->isString()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$Property;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_3
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$Property;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    :goto_2
    return-object v0
.end method

.method public getPendingBackupRestoreEntries(I)Landroid/util/ArrayMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesPendingAppLockRestore:Landroid/util/SparseArray;

    monitor-enter v0

    :try_start_0
    new-instance v1, Landroid/util/ArrayMap;

    invoke-virtual {p0, p1}, Lcom/android/server/pm/AppLockPackageHelper;->getPendingBackupRestoreEntriesLocked(I)Landroid/util/ArrayMap;

    move-result-object p0

    invoke-direct {v1, p0}, Landroid/util/ArrayMap;-><init>(Landroid/util/ArrayMap;)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final getPendingBackupRestoreEntriesLocked(I)Landroid/util/ArrayMap;
    .locals 12

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesPendingAppLockRestore:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/ArrayMap;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

    if-nez v0, :cond_3

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    invoke-interface {v2, p1}, Lcom/android/server/pm/AppLockPackageHelper$Injector;->getPendingBackupRestoreFile(I)Ljava/io/File;

    move-result-object v3

    new-instance v4, Landroid/util/AtomicFile;

    invoke-direct {v4, v3}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    invoke-virtual {v4}, Landroid/util/AtomicFile;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    :try_start_0
    invoke-virtual {v4}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-static {v3}, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->readEntries(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v5

    move v6, v1

    :goto_0
    move-object v7, v5

    check-cast v7, Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v6, v8, :cond_0

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;

    iget-object v8, v8, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mPackageName:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;

    invoke-virtual {v0, v8, v7}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :catchall_0
    move-exception v5

    goto :goto_1

    :cond_0
    if-eqz v3, :cond_2

    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    :catch_0
    move-exception v3

    goto :goto_3

    :goto_1
    if-eqz v3, :cond_1

    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v5, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_2
    throw v5
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    :goto_3
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Failed to read pending App Lock restore entries for user "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "AppLockPackageHelper"

    invoke-static {v6, v5, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v4}, Landroid/util/AtomicFile;->delete()V

    :catch_1
    :cond_2
    :goto_4
    iget-object v3, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesPendingAppLockRestore:Landroid/util/SparseArray;

    invoke-virtual {v3, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v4, Landroid/os/Build;->TIME:J

    cmp-long v4, v2, v4

    if-ltz v4, :cond_8

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    move v6, v1

    :goto_5
    if-ltz v4, :cond_7

    invoke-virtual {v0, v4}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;

    iget-wide v8, v7, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mRestoredAtMillis:J

    sget-wide v10, Landroid/os/Build;->TIME:J

    cmp-long v10, v8, v10

    if-ltz v10, :cond_5

    cmp-long v10, v8, v2

    if-lez v10, :cond_4

    goto :goto_7

    :cond_4
    sub-long v7, v2, v8

    sget-wide v9, Lcom/android/server/pm/AppLockPackageHelper;->PENDING_RESTORE_TTL_MILLIS:J

    cmp-long v7, v7, v9

    if-lez v7, :cond_6

    invoke-virtual {v0, v4}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    :goto_6
    move v6, v5

    goto :goto_8

    :cond_5
    :goto_7
    new-instance v6, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;

    iget-object v8, v7, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mPackageName:Ljava/lang/String;

    iget-object v7, v7, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mCertDigest:[B

    invoke-direct {v6, v8, v7, v2, v3}, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;-><init>(Ljava/lang/String;[BJ)V

    invoke-virtual {v0, v4, v6}, Landroid/util/ArrayMap;->setValueAt(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_6
    :goto_8
    add-int/lit8 v4, v4, -0x1

    goto :goto_5

    :cond_7
    if-eqz v6, :cond_8

    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-static {v2}, Lcom/android/server/pm/AppLockPackageHelper$Injector;->getBackgroundExecutor(Lcom/android/server/pm/PackageManagerService;)Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;

    move-result-object v2

    new-instance v3, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;

    invoke-direct {v3, v1}, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p0, v3, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p1, v3, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v2, v3}, Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;->execute(Ljava/lang/Runnable;)V

    :cond_8
    return-object v0
.end method

.method public getUninstalledPackagesWithAppLockEnabled()Landroid/util/SparseArray;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "[B>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    monitor-enter v0

    :try_start_0
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    iget-object v4, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    iget-object v5, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/ArrayMap;

    move v6, v2

    :goto_1
    invoke-virtual {v5}, Landroid/util/ArrayMap;->size()I

    move-result v7

    if-ge v6, v7, :cond_0

    invoke-virtual {v5, v6}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    invoke-virtual {v4, v7, v8}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_0
    iget-object v5, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    invoke-virtual {v1, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-object v1

    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final onSpcStateChanged(I)V
    .locals 5

    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v1, v1, Lcom/android/server/pm/PackageManagerService;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceBeforePmsLock()V

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsLock()V

    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    const-string/jumbo v3, "com.samsung.android.app.parentalcare"

    invoke-virtual {v2, v3}, Lcom/android/server/pm/Settings;->getPackageLPr(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    invoke-virtual {v2, p1}, Lcom/android/server/pm/PackageSetting;->getInstalled(I)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string/jumbo v4, "com.samsung.android.app.parentalcare.provider.ServiceStateReceiver"

    invoke-virtual {v2, p1, v4}, Lcom/android/server/pm/PackageSetting;->getCurrentEnabledStateLPr(ILjava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_1

    move v2, v3

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0, p1, v2}, Landroid/app/AppLockInternal;->setSpcStateForUser(IZ)Z

    move-result v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    if-eqz v0, :cond_2

    const-string v0, "AppLockPackageHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "SPC state changed for user "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", enabled="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/content/pm/PackageManager;->invalidatePackageInfoCache()V

    :cond_2
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mSpcCleanupCompleted:Landroid/util/SparseBooleanArray;

    if-nez v2, :cond_3

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    return-void

    :cond_3
    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->snapshotComputer()Lcom/android/server/pm/Computer;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/android/server/pm/AppLockPackageHelper;->onSupervisionEnabled(Lcom/android/server/pm/Computer;I)V

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mSpcCleanupCompleted:Landroid/util/SparseBooleanArray;

    invoke-virtual {p0, p1, v3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    :cond_4
    :goto_1
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    throw p0
.end method

.method public final onSupervisionEnabled(Lcom/android/server/pm/Computer;I)V
    .locals 8

    sget-boolean v0, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockPackageHelper"

    const-string/jumbo v1, "onSupervisionEnabled: disabling App Lock for user "

    invoke-static {p2, v1, v0}, Lcom/android/server/security/applock/AppLockOutlineBattery;->m(ILjava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-static {p1, p2}, Lcom/android/server/pm/AppLockPackageHelper;->getPersistedAppLockEnabledPackages(Lcom/android/server/pm/Computer;I)Ljava/util/List;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x2

    move-object v2, p0

    move-object v3, p1

    move v5, p2

    invoke-virtual/range {v2 .. v7}, Lcom/android/server/pm/AppLockPackageHelper;->storeAppLockStateForMultiplePackages(Lcom/android/server/pm/Computer;Ljava/util/List;IZI)V

    iget-object p0, v2, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    monitor-enter p0

    :try_start_0
    iget-object p1, v2, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {p1, v5}, Landroid/util/SparseArray;->remove(I)V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final onUserRemoved(I)V
    .locals 3

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v0, v0, Lcom/android/server/pm/PackageManagerService;->mBackgroundHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p0, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput p1, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final removeFromUninstalledPackageCache(ILjava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/ArrayMap;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final reportLockCredentialChanged(Lcom/android/server/pm/Computer;I)V
    .locals 7

    const-class v0, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/UserManagerInternal;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lcom/android/server/pm/UserManagerInternal;->getUserIds()[I

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget v4, v1, v3

    invoke-virtual {v0, v4}, Lcom/android/server/pm/UserManagerInternal;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v5

    if-eq v4, p2, :cond_1

    if-eqz v5, :cond_1

    invoke-virtual {v5}, Landroid/content/pm/UserInfo;->isDualAppProfile()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v0, v4}, Lcom/android/server/pm/UserManagerInternal;->getProfileParentId(I)I

    move-result v5

    if-ne v5, p2, :cond_1

    invoke-virtual {p0, p1, v4}, Lcom/android/server/pm/AppLockPackageHelper;->reportLockCredentialChanged(Lcom/android/server/pm/Computer;I)V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

    iget-object v1, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1, p2}, Lcom/android/server/pm/AppLockPackageHelper$Injector;->isDeviceSecure(Landroid/content/Context;I)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    :cond_3
    invoke-static {p1, p2}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockEnabledPackages(Lcom/android/server/pm/Computer;I)Ljava/util/List;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x3

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    invoke-virtual/range {v1 .. v6}, Lcom/android/server/pm/AppLockPackageHelper;->storeAppLockStateForMultiplePackages(Lcom/android/server/pm/Computer;Ljava/util/List;IZI)V

    iget-object p0, v1, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    monitor-enter p0

    :try_start_0
    iget-object p1, v1, Lcom/android/server/pm/AppLockPackageHelper;->mUninstalledPackagesWithAppLockEnabled:Landroid/util/SparseArray;

    invoke-virtual {p1, v4}, Landroid/util/SparseArray;->remove(I)V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final setPackageAppLockEnabled(Ljava/util/function/Supplier;Ljava/lang/String;IZII)Z
    .locals 8

    const/16 v0, 0x3e8

    invoke-static {p5, v0}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {p5, v1}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.TEST_LOCK_APPS"

    const-string/jumbo v3, "setPackageAppLockEnabled can only be called by the system"

    invoke-virtual {v0, v2, p6, p5, v3}, Landroid/content/Context;->enforcePermission(Ljava/lang/String;IILjava/lang/String;)V

    :cond_0
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/server/pm/Computer;

    invoke-interface {p1, p5, p3, p2}, Lcom/android/server/pm/Computer;->getPackageStateFiltered(IILjava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object p6

    if-nez p6, :cond_1

    sget-boolean p0, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    if-eqz p0, :cond_2

    const-string/jumbo p0, "packageName="

    const-string p1, " not found or not visible to callingUid="

    const-string p3, "AppLockPackageHelper"

    invoke-static {p5, p0, p2, p1, p3}, Lcom/android/server/security/applock/AppLockOutlineActiveSvc;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    invoke-interface {p6}, Lcom/android/server/pm/pkg/PackageState;->getAppId()I

    move-result p5

    invoke-static {p3, p5}, Landroid/os/UserHandle;->getUid(II)I

    move-result v3

    invoke-interface {p6, p3}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object p5

    invoke-interface {p5}, Lcom/android/server/pm/pkg/PackageUserState;->isAppLockEnabled()Z

    move-result p5

    invoke-static {p1, p2, p3}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockParent(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p6

    const/4 v0, 0x1

    if-eqz p6, :cond_3

    if-ne p5, p4, :cond_2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    iget-object p6, p0, Lcom/android/server/pm/AppLockPackageHelper;->mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

    iget-object v1, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    invoke-interface {p6, v1, p3}, Lcom/android/server/pm/AppLockPackageHelper$Injector;->isDeviceSecure(Landroid/content/Context;I)Z

    move-result p6

    invoke-static {p1, p2, p3}, Lcom/android/server/pm/AppLockPackageHelper;->isAppLockSupported(Lcom/android/server/pm/Computer;Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_5

    if-eqz p6, :cond_5

    if-eq p4, p5, :cond_4

    const/4 v6, 0x1

    move-object v2, p0

    move-object v5, p2

    move v4, p3

    move v7, p4

    invoke-virtual/range {v2 .. v7}, Lcom/android/server/pm/AppLockPackageHelper;->storeAppLockState(IILjava/lang/String;IZ)V

    :cond_4
    :goto_0
    return v0

    :cond_5
    move-object v2, p0

    move-object v5, p2

    move v4, p3

    move p0, p4

    if-eqz p5, :cond_7

    if-nez p6, :cond_6

    const/4 p1, 0x3

    :goto_1
    move v6, p1

    goto :goto_2

    :cond_6
    const/4 p1, 0x2

    goto :goto_1

    :goto_2
    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/android/server/pm/AppLockPackageHelper;->storeAppLockState(IILjava/lang/String;IZ)V

    :cond_7
    xor-int/2addr p0, v0

    return p0
.end method

.method public final storeAppLockChildren(ILandroid/util/ArrayMap;)V
    .locals 4

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {p2}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p2, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda4;->f$0:Landroid/util/ArrayMap;

    iput p1, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda4;->f$1:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Lcom/android/server/pm/PackageManagerService;->commitPackageStateMutation(Ljava/util/function/Consumer;)Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;

    invoke-virtual {v0, p1}, Lcom/android/server/pm/PackageManagerService;->scheduleWritePackageRestrictions(I)V

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p2}, Landroid/util/ArrayMap;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "App Lock of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " follows parent, enabled="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", userId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "AppLockPackageHelper"

    invoke-static {v2, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2, v0}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, p0, Lcom/android/server/pm/AppLockPackageHelper;->mBroadcastHelper:Lcom/android/server/pm/BroadcastHelper;

    invoke-virtual {v3, p1, v1, v2}, Lcom/android/server/pm/BroadcastHelper;->sendPackageAppLockStateChangedForUser(ILjava/lang/String;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public final storeAppLockState(IILjava/lang/String;IZ)V
    .locals 3

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;-><init>(B)V

    iput-object p3, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput p2, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;->f$1:I

    iput-boolean p5, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;->f$2:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Lcom/android/server/pm/PackageManagerService;->commitPackageStateMutation(Ljava/util/function/Consumer;)Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;

    invoke-virtual {v0, p2}, Lcom/android/server/pm/PackageManagerService;->scheduleWritePackageRestrictions(I)V

    iget-object v0, v0, Lcom/android/server/pm/PackageManagerService;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p2, p3}, Lcom/android/server/pm/AppLockPackageHelper;->syncAppLockChildren(ILjava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mBroadcastHelper:Lcom/android/server/pm/BroadcastHelper;

    invoke-virtual {v0, p2, p3, p5}, Lcom/android/server/pm/BroadcastHelper;->sendPackageAppLockStateChangedForUser(ILjava/lang/String;Z)V

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mFrameworkStatsLogger:Lcom/android/server/pm/AppLockPackageHelper$AppLockFrameworkStatsLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 p0, 0x570

    invoke-static {p0, p1, p5, p4}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIZI)V

    return-void
.end method

.method public final storeAppLockStateForMultiplePackages(Lcom/android/server/pm/Computer;Ljava/util/List;IZI)V
    .locals 4

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    move-object v1, p2

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_3

    :cond_0
    new-instance v2, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;-><init>(B)V

    iput-object p2, v2, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput p3, v2, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;->f$1:I

    iput-boolean p4, v2, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda1;->f$2:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v2}, Lcom/android/server/pm/PackageManagerService;->commitPackageStateMutation(Ljava/util/function/Consumer;)Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;

    invoke-virtual {v0, p3}, Lcom/android/server/pm/PackageManagerService;->scheduleWritePackageRestrictions(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, p3, v2}, Lcom/android/server/pm/AppLockPackageHelper;->syncAppLockChildren(ILjava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, v3

    :goto_1
    if-ltz p2, :cond_3

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mBroadcastHelper:Lcom/android/server/pm/BroadcastHelper;

    invoke-virtual {v2, p3, v0, p4}, Lcom/android/server/pm/BroadcastHelper;->sendPackageAppLockStateChangedForUser(ILjava/lang/String;Z)V

    invoke-interface {p1, v0}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/server/pm/pkg/PackageState;->getAppId()I

    move-result v0

    invoke-static {p3, v0}, Landroid/os/UserHandle;->getUid(II)I

    move-result v0

    goto :goto_2

    :cond_2
    const/4 v0, -0x1

    :goto_2
    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mFrameworkStatsLogger:Lcom/android/server/pm/AppLockPackageHelper$AppLockFrameworkStatsLogger;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x570

    invoke-static {v2, v0, p4, p5}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIZI)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    :cond_3
    :goto_3
    return-void
.end method

.method public final syncAppLockChildren(ILjava/lang/String;)V
    .locals 8

    invoke-static {p1}, Lcom/android/server/pm/AppLockPackageHelper;->isAppLockSupportedForUser(I)Z

    move-result v3

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v7, v0, Lcom/android/server/pm/PackageManagerService;->mLock:Lcom/android/server/pm/PackageManagerTracedLock;

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceBeforePmsLock()V

    monitor-enter v7

    :try_start_0
    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsLock()V

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->snapshotComputer()Lcom/android/server/pm/Computer;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/android/server/pm/Computer;->getPackageStateInternal(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getPkg()Lcom/android/internal/pm/parsing/pkg/AndroidPackageInternal;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-interface {v1, p1}, Lcom/android/server/pm/pkg/PackageStateInternal;->getUserStateOrDefault(I)Lcom/android/server/pm/pkg/PackageUserStateInternal;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/server/pm/pkg/PackageUserState;->isInstalled()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    xor-int/lit8 v5, v1, 0x1

    new-instance v6, Landroid/util/ArrayMap;

    invoke-direct {v6}, Landroid/util/ArrayMap;-><init>()V

    invoke-virtual {p0, p2}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockChildCandidates(Ljava/lang/String;)Landroid/util/ArraySet;

    move-result-object p2

    invoke-virtual {p2}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v4, 0x0

    move v2, p1

    invoke-static/range {v0 .. v6}, Lcom/android/server/pm/AppLockPackageHelper;->syncAppLockChild(Lcom/android/server/pm/Computer;Ljava/lang/String;IZZZLandroid/util/ArrayMap;)V

    move p1, v2

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_2

    :cond_1
    move v2, p1

    invoke-virtual {p0, v2, v6}, Lcom/android/server/pm/AppLockPackageHelper;->storeAppLockChildren(ILandroid/util/ArrayMap;)V

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    return-void

    :goto_2
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V

    throw p0
.end method

.method public final systemReady()V
    .locals 8

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    const-class v1, Landroid/app/StatsManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatsManager;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/server/pm/AppLockPackageHelper;->mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lcom/android/server/pm/AppLockPackageHelper$Injector;->getBackgroundExecutor(Lcom/android/server/pm/PackageManagerService;)Lcom/android/server/pm/AppLockPackageHelper$Injector$$ExternalSyntheticLambda0;

    move-result-object v1

    new-instance v2, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda8;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda8;->f$0:Lcom/android/server/pm/AppLockPackageHelper;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const/16 v3, 0x2822

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/app/StatsManager;->setPullAtomCallback(ILandroid/app/StatsManager$PullAtomMetadata;Ljava/util/concurrent/Executor;Landroid/app/StatsManager$StatsPullAtomCallback;)V

    :cond_0
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    const-class v1, Landroid/app/supervision/SupervisionManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/supervision/SupervisionManager;

    if-eqz v0, :cond_1

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mSupervisionListener:Lcom/android/server/pm/AppLockPackageHelper$1;

    invoke-virtual {v0, v1, v2}, Landroid/app/supervision/SupervisionManager;->registerSupervisionListenerForUser(ILandroid/app/supervision/SupervisionManager$SupervisionListener;)V

    :cond_1
    invoke-static {}, Lcom/android/server/pm/AppLockPackageHelper;->getAppLockInternal()Landroid/app/AppLockInternal;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda6;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda6;->f$0:Lcom/android/server/pm/AppLockPackageHelper;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-interface {v0, v1}, Landroid/app/AppLockInternal;->setSpcStateRefreshCallback(Ljava/util/function/IntConsumer;)V

    :cond_2
    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mContext:Landroid/content/Context;

    new-instance v3, Lcom/android/server/pm/AppLockPackageHelper$2;

    invoke-direct {v3, p0}, Lcom/android/server/pm/AppLockPackageHelper$2;-><init>(Lcom/android/server/pm/AppLockPackageHelper;)V

    new-instance v4, Landroid/content/IntentFilter;

    const-string/jumbo v0, "com.samsung.android.app.parentalcare.action.SERVICE_STATE_CHANGED"

    invoke-direct {v4, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "com.samsung.android.app.parentalcare.permission.RECEIVE_BROADCAST"

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v6, v0, Lcom/android/server/pm/PackageManagerService;->mBackgroundHandler:Landroid/os/Handler;

    const/4 v7, 0x2

    invoke-virtual/range {v2 .. v7}, Landroid/content/Context;->registerReceiverForAllUsers(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    iget-object v0, v0, Lcom/android/server/pm/PackageManagerService;->mBackgroundHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda7;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda7;->f$0:Lcom/android/server/pm/AppLockPackageHelper;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->snapshotComputer()Lcom/android/server/pm/Computer;

    move-result-object v0

    const-class v1, Lcom/android/server/pm/UserManagerInternal;

    invoke-static {v1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/pm/UserManagerInternal;

    invoke-virtual {v2}, Lcom/android/server/pm/UserManagerInternal;->getUserIds()[I

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/android/server/pm/AppLockPackageHelper;->disableAppLockForExemptPackages(Lcom/android/server/pm/Computer;[I)V

    iget-object v2, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesRemovedAtBoot:Landroid/util/ArraySet;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesRemovedAtBoot:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_3

    :cond_3
    new-instance v0, Landroid/util/ArraySet;

    iget-object v3, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesRemovedAtBoot:Landroid/util/ArraySet;

    invoke-direct {v0, v3}, Landroid/util/ArraySet;-><init>(Landroid/util/ArraySet;)V

    iget-object v3, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesRemovedAtBoot:Landroid/util/ArraySet;

    invoke-virtual {v3}, Landroid/util/ArraySet;->clear()V

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/pm/UserManagerInternal;

    if-nez v1, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v1}, Lcom/android/server/pm/UserManagerInternal;->getUserIds()[I

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-virtual {v0}, Landroid/util/ArraySet;->size()I

    move-result v4

    if-ge v3, v4, :cond_6

    invoke-virtual {v0, v3}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "AppLockPackageHelper"

    const-string/jumbo v6, "Synchronizing App Lock children of "

    const-string v7, " removed at boot"

    invoke-static {v6, v4, v7, v5}, Lcom/android/server/BootReceiver$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    array-length v5, v1

    move v6, v2

    :goto_1
    if-ge v6, v5, :cond_5

    aget v7, v1, v6

    invoke-virtual {p0, v7, v4}, Lcom/android/server/pm/AppLockPackageHelper;->syncAppLockChildren(ILjava/lang/String;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_6
    :goto_2
    return-void

    :goto_3
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final writePendingBackupRestoreEntriesLocked(I)V
    .locals 4

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesPendingAppLockRestore:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/ArrayMap;

    iget-object p0, p0, Lcom/android/server/pm/AppLockPackageHelper;->mInjector:Lcom/android/server/pm/AppLockPackageHelper$Injector;

    invoke-interface {p0, p1}, Lcom/android/server/pm/AppLockPackageHelper$Injector;->getPendingBackupRestoreFile(I)Ljava/io/File;

    move-result-object p0

    if-eqz v0, :cond_1

    new-instance v1, Landroid/util/AtomicFile;

    invoke-direct {v1, p0}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {v1}, Landroid/util/AtomicFile;->delete()V

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {v1}, Landroid/util/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {v0}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->writeEntries(Ljava/io/OutputStream;Ljava/util/Collection;)V

    invoke-virtual {v1, p0}, Landroid/util/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    const/4 p0, 0x0

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Failed to write pending App Lock restore entries for user "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "AppLockPackageHelper"

    invoke-static {v2, p1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v1, p0}, Landroid/util/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    :cond_1
    return-void
.end method

.method public static hasSystemFeature(Ljava/lang/String;)Z
    .locals 1

    invoke-static {}, Lcom/android/server/SystemConfig;->getInstance()Lcom/android/server/SystemConfig;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/server/SystemConfig;->getAvailableFeatures()Landroid/util/ArrayMap;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
