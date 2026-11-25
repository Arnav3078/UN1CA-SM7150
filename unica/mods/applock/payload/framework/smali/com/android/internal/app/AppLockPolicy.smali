.class public Lcom/android/internal/app/AppLockPolicy;
.super Ljava/lang/Object;
.source "AppLockPolicy.java"


# static fields
.field public static final blacklist ACTIVE_LOCKED_PACKAGES:Ljava/lang/String; = "applock_locked_packages"

.field private static final blacklist APPLOCK_ENABLED:Ljava/lang/String; = "app_lock_enabled"

.field public static final blacklist BINDER_ARRAY_DISPLAYID:I = 0x0

.field public static final blacklist BINDER_ARRAY_EXCEPTIONLIST:I = 0x2

.field public static final blacklist BINDER_ARRAY_LOCKED:I = 0x0

.field public static final blacklist BINDER_ARRAY_MULTIWINDOW:I = 0x0

.field public static final blacklist BINDER_ARRAY_NOTIFICATION:I = 0x1

.field public static final blacklist BINDER_ARRAY_VERIFYING:I = 0x1

.field private static final blacklist BIOMETRICS_PASSWORD_TYPE:Ljava/lang/String; = "biometrics_password_type"

.field private static final blacklist BIOMETRICS_PATTERN_TYPE:Ljava/lang/String; = "biometrics_pattern_type"

.field private static final blacklist BIOMETRICS_PINCODE_TYPE:Ljava/lang/String; = "biometrics_pincode_type"

.field private static final blacklist BIOMETRICS_TYPE:Ljava/lang/String; = "biometrics_type"

.field private static final blacklist CHECK_APPLOCK_BIOMETRICS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_BIOMETRICS"

.field private static final blacklist CHECK_APPLOCK_FACE_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_FACE"

.field private static final blacklist CHECK_APPLOCK_FACE_SPASS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_FACE_SPASS"

.field private static final blacklist CHECK_APPLOCK_FINGERPRINT_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT"

.field private static final blacklist CHECK_APPLOCK_FINGERPRINT_PASSWORD_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT_PASSWORD"

.field private static final blacklist CHECK_APPLOCK_FINGERPRINT_PATTERN_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT_PATTERN"

.field private static final blacklist CHECK_APPLOCK_FINGERPRINT_PINCODE_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT_PINCODE"

.field private static final blacklist CHECK_APPLOCK_IRISES_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_IRISES"

.field private static final blacklist CHECK_APPLOCK_PASSWORD_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD"

.field private static final blacklist CHECK_APPLOCK_PASSWORD_BIOMETRICS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_BIOMETRICS"

.field private static final blacklist CHECK_APPLOCK_PASSWORD_FACE_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_FACE"

.field private static final blacklist CHECK_APPLOCK_PASSWORD_FACE_SPASS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_FACE_SPASS"

.field private static final blacklist CHECK_APPLOCK_PASSWORD_IRISES_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_IRISES"

.field private static final blacklist CHECK_APPLOCK_PATTERN_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN"

.field private static final blacklist CHECK_APPLOCK_PATTERN_BIOMETRICS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_BIOMETRICS"

.field private static final blacklist CHECK_APPLOCK_PATTERN_FACE_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_FACE"

.field private static final blacklist CHECK_APPLOCK_PATTERN_FACE_SPASS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_FACE_SPASS"

.field private static final blacklist CHECK_APPLOCK_PATTERN_IRISES_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_IRISES"

.field private static final blacklist CHECK_APPLOCK_PINCODE_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE"

.field private static final blacklist CHECK_APPLOCK_PINCODE_BIOMETRICS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_BIOMETRICS"

.field private static final blacklist CHECK_APPLOCK_PINCODE_FACE_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_FACE"

.field private static final blacklist CHECK_APPLOCK_PINCODE_FACE_SPASS_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_FACE_SPASS"

.field private static final blacklist CHECK_APPLOCK_PINCODE_IRISES_ACTION:Ljava/lang/String; = "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_IRISES"

.field private static final blacklist FACE_PASSWORD_TYPE:Ljava/lang/String; = "face_password_type"

.field private static final blacklist FACE_PATTERN_TYPE:Ljava/lang/String; = "face_pattern_type"

.field private static final blacklist FACE_PINCODE_TYPE:Ljava/lang/String; = "face_pincode_type"

.field private static final blacklist FACE_SPASS_PASSWORD_TYPE:Ljava/lang/String; = "face_spass_password_type"

.field private static final blacklist FACE_SPASS_PATTERN_TYPE:Ljava/lang/String; = "face_spass_pattern_type"

.field private static final blacklist FACE_SPASS_PINCODE_TYPE:Ljava/lang/String; = "face_spass_pincode_type"

.field private static final blacklist FACE_SPASS_TYPE:Ljava/lang/String; = "face_spass_type"

.field private static final blacklist FACE_TYPE:Ljava/lang/String; = "face_type"

.field private static final blacklist FINGERPRINT_PASSWORD_TYPE:Ljava/lang/String; = "fingerprint_password_type"

.field private static final blacklist FINGERPRINT_PATTERN_TYPE:Ljava/lang/String; = "fingerprint_pattern_type"

.field private static final blacklist FINGERPRINT_PINCODE_TYPE:Ljava/lang/String; = "fingerprint_pincode_type"

.field private static final blacklist FINGERPRINT_TYPE:Ljava/lang/String; = "fingerprint_type"

.field public static final blacklist FLOATING_MESSAGE_REQUEST:Ljava/lang/String; = "FLOATING_MESSAGE_REQUEST"

.field private static final blacklist HIDDEN_PACKAGE:Ljava/lang/String; = "ssecure_hidden_apps_packages"

.field private static final blacklist IRIS_PASSWORD_TYPE:Ljava/lang/String; = "iris_password_type"

.field private static final blacklist IRIS_PATTERN_TYPE:Ljava/lang/String; = "iris_pattern_type"

.field private static final blacklist IRIS_PINCODE_TYPE:Ljava/lang/String; = "iris_pincode_type"

.field private static final blacklist IRIS_TYPE:Ljava/lang/String; = "iris_type"

.field public static final blacklist LAUNCHER_REQUEST:Ljava/lang/String; = "LAUNCHER_REQUEST"

.field public static final blacklist LAUNCH_FROM_NOTIFICATION:Ljava/lang/String; = "LAUNCH_FROM_NOTIFICATION"

.field public static final blacklist LAUNCH_FROM_RESUME:Ljava/lang/String; = "LAUNCH_FROM_RESUME"

.field public static final blacklist LAUNCH_FROM_SETTINGS:Ljava/lang/String; = "APPLOCK_APPS_FROM_SETTINGS"

.field public static final blacklist LAUNCH_FROM_WECHAT_HUN:Ljava/lang/String; = "nofification_type"

.field public static final blacklist LOCKED_APP_CAN_SHOW_WHEN_LOCKED:Ljava/lang/String; = "LOCKED_APP_CAN_SHOW_WHEN_LOCKED"

.field private static final blacklist LOCKED_CLASSES:Ljava/lang/String; = "applock_locked_apps_classes"

.field private static final blacklist LOCKED_PACKAGE:Ljava/lang/String; = "applock_locked_apps_packages"

.field public static final blacklist LOCKED_PACKAGE_ACTIVITY_OPTIONS:Ljava/lang/String; = "LOCKED_PACKAGE_ACTIVITY_OPTIONS"

.field public static final blacklist LOCKED_PACKAGE_DISPLAYID:Ljava/lang/String; = "LOCKED_PACKAGE_DISPLAYID"

.field public static final blacklist LOCKED_PACKAGE_ICON:Ljava/lang/String; = "LOCKED_PACKAGE_ICON"

.field public static final blacklist LOCKED_PACKAGE_INTENT:Ljava/lang/String; = "LOCKED_PACKAGE_INTENT"

.field public static final blacklist LOCKED_PACKAGE_LABEL:Ljava/lang/String; = "LOCKED_PACKAGE_LABEL"

.field public static final blacklist LOCKED_PACKAGE_MULTIWINDOWSTYLE:Ljava/lang/String; = "LOCKED_PACKAGE_MULTIWINDOWSTYLE"

.field public static final blacklist LOCKED_PACKAGE_NAME:Ljava/lang/String; = "LOCKED_PACKAGE_NAME"

.field public static final blacklist LOCKED_PACKAGE_USERID:Ljava/lang/String; = "LOCKED_PACKAGE_USERID"

.field public static final blacklist LOCKED_PACKAGE_WINDOW_ATTRIBUTES:Ljava/lang/String; = "LOCKED_PACKAGE_WINDOW_ATTRIBUTES"

.field private static final blacklist LOCKED_TYPE:Ljava/lang/String; = "applock_lock_type"

.field private static final blacklist PACKAGE_NAME_CONTACTS:Ljava/lang/String; = "com.samsung.android.contacts"

.field private static final blacklist PASSWORD_TYPE:Ljava/lang/String; = "password_type"

.field private static final blacklist PATTERN_TYPE:Ljava/lang/String; = "pattern_type"

.field private static final blacklist PINCODE_TYPE:Ljava/lang/String; = "pincode_type"

.field public static final blacklist REQUEST_VERIFY_FROM:Ljava/lang/String; = "REQUEST_VERIFY_FROM"

.field public static final blacklist START_SERVICE_WITH_NO_ANIMATION:Ljava/lang/String; = "START_SERVICE_WITH_NO_ANIMATION"

.field private static final blacklist TAG:Ljava/lang/String; = "AppLockPolicy"

.field private static volatile blacklist mInstance:Lcom/android/internal/app/AppLockPolicy; = null

.field private static blacklist mIsAppLockEnabled:Z = false


# instance fields
.field private blacklist mAppLockActiveLockedPackages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blacklist mAppLockLaunchingExcpetionList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public blacklist mAppLockSharedPref:Landroid/app/AppLockCoreState;

.field private blacklist mAppLockedClassList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blacklist mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blacklist mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blacklist mAppLockedLock:Ljava/lang/Object;

.field private blacklist mAppLockedPackageList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blacklist mAppLockedRelatedClassMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private blacklist mAppLockedRelatedPackageMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private blacklist mAppLockedVerifyingList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blacklist mApplockCallingExceptionList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blacklist mContext:Landroid/content/Context;

.field private blacklist mLockedClasses:Ljava/lang/String;

.field private blacklist mLockedPackages:Ljava/lang/String;

.field private blacklist mLockedType:Ljava/lang/String;

.field private blacklist mLockedTypeInt:I

.field private final blacklist mReceiver:Landroid/content/BroadcastReceiver;

.field private blacklist mUserManager:Landroid/os/UserManager;

.field private blacklist mVold:Landroid/os/IVold;


# direct methods
.method public static synthetic blacklist $r8$lambda$QlRBLRR7OZ-eJEPxzRCSGjsvIOY(Lcom/android/internal/app/AppLockPolicy;Ljava/util/List;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockPolicy;->lambda$setApplockLockedAppsPackage$1(Ljava/util/List;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic blacklist $r8$lambda$SoMI5Qo6tx3HkcZp_y4S0VfkxtY(Lcom/android/internal/app/AppLockPolicy;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->lambda$connectVold$0()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mupdateLockedApps(Lcom/android/internal/app/AppLockPolicy;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->updateLockedApps()V

    return-void
.end method

.method static constructor blacklist <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor blacklist <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 1

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    const/4 p2, 0x0

    .line 162
    iput-object p2, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    const/4 v0, 0x0

    .line 163
    iput v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedTypeInt:I

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedClassList:Ljava/util/ArrayList;

    .line 167
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    .line 168
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    .line 169
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    .line 170
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedPackageMap:Ljava/util/HashMap;

    .line 171
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedClassMap:Ljava/util/HashMap;

    .line 172
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    .line 173
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockLaunchingExcpetionList:Ljava/util/ArrayList;

    .line 174
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mApplockCallingExceptionList:Ljava/util/ArrayList;

    .line 543
    new-instance v0, Lcom/android/internal/app/AppLockPolicy$2;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockPolicy$2;-><init>(Lcom/android/internal/app/AppLockPolicy;)V

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 581
    iput-object p2, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedPackages:Ljava/lang/String;

    .line 582
    iput-object p2, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedClasses:Ljava/lang/String;

    .line 861
    iput-object p2, p0, Lcom/android/internal/app/AppLockPolicy;->mVold:Landroid/os/IVold;

    .line 187
    iput-object p1, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    .line 188
    new-instance p1, Landroid/app/AppLockCoreState;

    iget-object p2, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-direct {p1, p2}, Landroid/app/AppLockCoreState;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    .line 189
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->init()V

    .line 190
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->getAppLockLaunchingExceptionList()V

    .line 191
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->getCallingExceptionList()V

    return-void
.end method

.method private blacklist connectVold()V
    .locals 3

    .line 863
    const-string/jumbo v0, "vold"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 866
    :try_start_0
    new-instance v1, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/AppLockPolicy;)V

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 876
    invoke-static {v0}, Landroid/os/IVold$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IVold;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mVold:Landroid/os/IVold;

    :cond_1
    return-void
.end method

.method private static blacklist fileUriMayExposed(Landroid/net/Uri;)Z
    .locals 2

    if-eqz p0, :cond_0

    .line 828
    const-string/jumbo v0, "file"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/system/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist getAppLockLaunchingExceptionList()V
    .locals 2

    .line 195
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x107000b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 196
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockLaunchingExcpetionList:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method private blacklist getCallingExceptionList()V
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x107000a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 201
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mApplockCallingExceptionList:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public static blacklist getInstance(Landroid/content/Context;Landroid/os/Handler;)Lcom/android/internal/app/AppLockPolicy;
    .locals 2

    .line 178
    sget-object v0, Lcom/android/internal/app/AppLockPolicy;->mInstance:Lcom/android/internal/app/AppLockPolicy;

    if-nez v0, :cond_0

    .line 179
    const-class v0, Lcom/android/internal/app/AppLockPolicy;

    monitor-enter v0

    .line 180
    :try_start_0
    new-instance v1, Lcom/android/internal/app/AppLockPolicy;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/app/AppLockPolicy;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    sput-object v1, Lcom/android/internal/app/AppLockPolicy;->mInstance:Lcom/android/internal/app/AppLockPolicy;

    .line 181
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 183
    :cond_0
    :goto_0
    sget-object p0, Lcom/android/internal/app/AppLockPolicy;->mInstance:Lcom/android/internal/app/AppLockPolicy;

    return-object p0
.end method

.method private blacklist getUserManager()Landroid/os/UserManager;
    .locals 1

    .line 835
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mUserManager:Landroid/os/UserManager;

    if-nez v0, :cond_0

    .line 836
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mUserManager:Landroid/os/UserManager;

    :cond_0
    return-object v0
.end method

.method private blacklist init()V
    .locals 3

    .line 513
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    new-instance v1, Lcom/android/internal/app/AppLockPolicy$1;

    invoke-direct {v1, p0}, Lcom/android/internal/app/AppLockPolicy$1;-><init>(Lcom/android/internal/app/AppLockPolicy;)V

    const-class v2, Lcom/android/internal/app/AppLockPolicy;

    .line 536
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 513
    invoke-interface {v0, v1, v2}, Landroid/app/IActivityManager;->registerUserSwitchObserver(Landroid/app/IUserSwitchObserver;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 538
    const-string v1, "AppLockPolicy"

    const-string/jumbo v2, "onUserSwitch, observe()"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    :goto_0
    new-instance v0, Landroid/content/IntentFilter;

    const-string/jumbo v1, "android.intent.action.USER_UNLOCKED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 541
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public static blacklist isSupportAppLock()Z
    .locals 1

    .line 776
    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->FW_APPLOCK:Z

    return v0
.end method

.method public static blacklist isSupportSSecure()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method private synthetic blacklist lambda$connectVold$0()V
    .locals 2

    .line 867
    const-string v0, "AppLockPolicy"

    const-string/jumbo v1, "vold died; reconnecting"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 868
    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mVold:Landroid/os/IVold;

    .line 869
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->connectVold()V

    return-void
.end method

.method static synthetic blacklist lambda$setApplockLockedAppsPackage$0(Ljava/lang/String;)Z
    .locals 1

    .line 312
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private synthetic blacklist lambda$setApplockLockedAppsPackage$1(Ljava/util/List;Ljava/lang/String;)Z
    .locals 0

    .line 314
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    .line 315
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    if-nez p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist notifyVoldAppLockStateChanged(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "autoLockKeepStorageAppLock returned error code: "

    const-string/jumbo v1, "notifyVoldAppLockStateChanged: packageCount="

    .line 886
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mVold:Landroid/os/IVold;

    if-nez v2, :cond_0

    .line 887
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->connectVold()V

    .line 889
    :cond_0
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mVold:Landroid/os/IVold;

    const-string v3, "AppLockPolicy"

    if-nez v2, :cond_1

    .line 890
    const-string/jumbo p0, "Vold not available for AppLock state change"

    invoke-static {v3, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 894
    :cond_1
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v2

    .line 895
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", userId="

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .line 896
    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    .line 897
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mVold:Landroid/os/IVold;

    invoke-interface {p0, p1, v2}, Landroid/os/IVold;->autoLockKeepStorageAppLock([Ljava/lang/String;I)I

    move-result p0

    if-eqz p0, :cond_2

    .line 899
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

    :catch_0
    move-exception p0

    .line 902
    const-string p1, "Cannot notify Vold for AppLock state change"

    invoke-static {v3, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static blacklist skipLockWhenStart(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Landroid/app/ActivityOptions;Ljava/lang/String;)Z
    .locals 1

    .line 791
    sget-boolean p1, Lcom/samsung/android/rune/CoreRune;->FW_APPLOCK:Z

    const-string p4, "AppLockPolicy"

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/android/internal/app/AppLockPolicy;->isSupportSSecure()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 792
    const-string/jumbo p0, "intent is starting with S secure, skip"

    invoke-static {p4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 800
    :cond_0
    invoke-static {}, Lcom/samsung/android/multiwindow/MultiWindowManager;->getInstance()Lcom/samsung/android/multiwindow/MultiWindowManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/samsung/android/multiwindow/MultiWindowManager;->inDesktopWindowing()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 801
    const-string/jumbo p0, "intent is starting in dex windowing mode, skip"

    invoke-static {p4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_1
    if-eqz p3, :cond_3

    .line 805
    invoke-virtual {p3}, Landroid/app/ActivityOptions;->getLaunchWindowingMode()I

    move-result p1

    invoke-static {p1}, Landroid/app/WindowConfiguration;->inMultiWindowMode(I)Z

    move-result p1

    if-nez p1, :cond_2

    .line 807
    invoke-virtual {p3}, Landroid/app/ActivityOptions;->getForceLaunchWindowingMode()I

    move-result p1

    invoke-static {p1}, Landroid/app/WindowConfiguration;->inMultiWindowMode(I)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 808
    :cond_2
    const-string/jumbo p0, "intent is starting in multi WindowingMode, skip"

    invoke-static {p4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 811
    :cond_3
    const-string/jumbo p1, "nofification_type"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 812
    const-string/jumbo p0, "starting from WeChat HeadsUp Notification"

    invoke-static {p4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 815
    :cond_4
    const-string/jumbo p1, "activity"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    const/4 p1, 0x7

    .line 816
    invoke-virtual {p0, p1}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object p0

    .line 817
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 818
    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->configuration:Landroid/content/res/Configuration;

    iget-object p1, p1, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    invoke-virtual {p1}, Landroid/app/WindowConfiguration;->getWindowingMode()I

    move-result p1

    if-eq p1, v0, :cond_5

    .line 820
    const-string/jumbo p0, "hasMultiWindowRunning, skip"

    invoke-static {p4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist updateLockedApps()V
    .locals 9

    .line 588
    iget v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedTypeInt:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    .line 659
    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto/16 :goto_0

    .line 656
    :pswitch_0
    const-string/jumbo v0, "face_spass_password_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto/16 :goto_0

    .line 653
    :pswitch_1
    const-string/jumbo v0, "face_spass_pincode_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto/16 :goto_0

    .line 650
    :pswitch_2
    const-string/jumbo v0, "face_spass_pattern_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto/16 :goto_0

    .line 647
    :pswitch_3
    const-string/jumbo v0, "face_spass_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto/16 :goto_0

    .line 644
    :pswitch_4
    const-string/jumbo v0, "face_password_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 641
    :pswitch_5
    const-string/jumbo v0, "face_pincode_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 638
    :pswitch_6
    const-string/jumbo v0, "face_pattern_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 635
    :pswitch_7
    const-string/jumbo v0, "face_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 632
    :pswitch_8
    const-string/jumbo v0, "biometrics_password_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 629
    :pswitch_9
    const-string/jumbo v0, "biometrics_pincode_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 626
    :pswitch_a
    const-string/jumbo v0, "biometrics_pattern_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 623
    :pswitch_b
    const-string/jumbo v0, "biometrics_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 620
    :pswitch_c
    const-string/jumbo v0, "iris_password_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 617
    :pswitch_d
    const-string/jumbo v0, "iris_pincode_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 614
    :pswitch_e
    const-string/jumbo v0, "iris_pattern_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 611
    :pswitch_f
    const-string/jumbo v0, "iris_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 608
    :pswitch_10
    const-string/jumbo v0, "fingerprint_password_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 605
    :pswitch_11
    const-string/jumbo v0, "fingerprint_pincode_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 602
    :pswitch_12
    const-string/jumbo v0, "fingerprint_pattern_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 599
    :pswitch_13
    const-string/jumbo v0, "fingerprint_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 596
    :pswitch_14
    const-string/jumbo v0, "password_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 593
    :pswitch_15
    const-string/jumbo v0, "pincode_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    goto :goto_0

    .line 590
    :pswitch_16
    const-string/jumbo v0, "pattern_type"

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    .line 663
    :goto_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 664
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedPackages:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    .line 665
    const-string v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 666
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 667
    array-length v4, v1

    move v5, v2

    :goto_1
    if-ge v5, v4, :cond_2

    aget-object v6, v1, v5

    .line 668
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 669
    iget-object v7, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedPackageMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 670
    iget-object v7, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedPackageMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 671
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 672
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 673
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 678
    :cond_2
    iput-object v3, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    .line 679
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 680
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :goto_3
    if-ge v4, v3, :cond_3

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/String;

    .line 681
    iget-object v6, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 683
    :cond_3
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v3, "applock_locked_packages"

    iget-object v4, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    .line 684
    invoke-virtual {v4}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v4

    .line 683
    invoke-static {v1, v3, v4}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 687
    :cond_4
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedClasses:Ljava/lang/String;

    if-eqz v1, :cond_8

    .line 688
    const-string v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 689
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 690
    array-length v4, v1

    :goto_4
    if-ge v2, v4, :cond_7

    aget-object v5, v1, v2

    .line 691
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 692
    iget-object v6, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedClassMap:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 693
    iget-object v6, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedClassMap:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 694
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5
    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 695
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 696
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 701
    :cond_7
    iput-object v3, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedClassList:Ljava/util/ArrayList;

    .line 703
    :cond_8
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
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
.method public blacklist clearAppLockedUnLockedApp()V
    .locals 8

    .line 396
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 398
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 399
    sget-boolean v2, Lcom/android/internal/app/AppLockPolicy;->mIsAppLockEnabled:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 400
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v3

    :cond_0
    :goto_0
    if-ge v5, v4, :cond_1

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/String;

    .line 401
    iget-object v7, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 402
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 406
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 407
    invoke-direct {p0, v1}, Lcom/android/internal/app/AppLockPolicy;->notifyVoldAppLockStateChanged(Ljava/util/List;)V

    .line 410
    :cond_2
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 411
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 412
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 413
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 414
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_1
    if-ge v3, v2, :cond_3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    .line 415
    iget-object v5, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 417
    :cond_3
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "applock_locked_packages"

    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    .line 418
    invoke-virtual {p0}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object p0

    .line 417
    invoke-static {v1, v2, p0}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 419
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist dumpAppLockPolicyLocked(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;)Z
    .locals 9

    .line 714
    const-string p1, "AppLockPolicy dump start"

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 715
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 717
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 718
    const-string/jumbo v0, "LockedPackage["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 719
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const-string v4, ","

    if-ge v3, v1, :cond_0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Ljava/lang/String;

    .line 720
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 721
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 723
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    const/16 v3, 0x2c

    if-ne v0, v3, :cond_1

    .line 724
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 726
    :cond_1
    const-string/jumbo v0, "]\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 728
    const-string/jumbo v5, "LockedClass["

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 729
    iget-object v5, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v2

    :goto_1
    if-ge v7, v6, :cond_2

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ljava/lang/String;

    .line 730
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 731
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 733
    :cond_2
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v3, :cond_3

    .line 734
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 736
    :cond_3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 738
    const-string/jumbo v5, "HasUnLockedPackage["

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 739
    iget-object v5, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v2

    :goto_2
    if-ge v7, v6, :cond_4

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ljava/lang/String;

    .line 740
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 741
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 743
    :cond_4
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v3, :cond_5

    .line 744
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 746
    :cond_5
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 748
    const-string/jumbo v5, "HasUnLockedClass["

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 749
    iget-object v5, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v2

    :goto_3
    if-ge v7, v6, :cond_6

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ljava/lang/String;

    .line 750
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 751
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 753
    :cond_6
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v3, :cond_7

    .line 754
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 756
    :cond_7
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 758
    const-string/jumbo v5, "mAppLockedVerifyingList["

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 759
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    :goto_4
    if-ge v2, v5, :cond_8

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v2, v2, 0x1

    check-cast v6, Ljava/lang/String;

    .line 760
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 761
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 763
    :cond_8
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    sub-int/2addr p0, v1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p0

    if-ne p0, v3, :cond_9

    .line 764
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    sub-int/2addr p0, v1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 766
    :cond_9
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 768
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 769
    const-string p0, "AppLockPolicy dump end"

    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 770
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    return v1
.end method

.method public blacklist getAppLockedCheckAction()Ljava/lang/String;
    .locals 2

    .line 242
    const-string/jumbo v0, "pattern_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN"

    goto/16 :goto_0

    .line 244
    :cond_0
    const-string/jumbo v0, "password_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 245
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD"

    goto/16 :goto_0

    .line 246
    :cond_1
    const-string/jumbo v0, "pincode_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 247
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE"

    goto/16 :goto_0

    .line 248
    :cond_2
    const-string/jumbo v0, "fingerprint_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 249
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT"

    goto/16 :goto_0

    .line 250
    :cond_3
    const-string/jumbo v0, "fingerprint_pattern_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 251
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT_PATTERN"

    goto/16 :goto_0

    .line 252
    :cond_4
    const-string/jumbo v0, "fingerprint_pincode_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 253
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT_PINCODE"

    goto/16 :goto_0

    .line 254
    :cond_5
    const-string/jumbo v0, "fingerprint_password_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 255
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_FINGERPRINT_PASSWORD"

    goto/16 :goto_0

    .line 256
    :cond_6
    const-string/jumbo v0, "iris_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 257
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_IRISES"

    goto/16 :goto_0

    .line 258
    :cond_7
    const-string/jumbo v0, "iris_pattern_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 259
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_IRISES"

    goto/16 :goto_0

    .line 260
    :cond_8
    const-string/jumbo v0, "iris_pincode_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 261
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_IRISES"

    goto/16 :goto_0

    .line 262
    :cond_9
    const-string/jumbo v0, "iris_password_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 263
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_IRISES"

    goto/16 :goto_0

    .line 264
    :cond_a
    const-string/jumbo v0, "biometrics_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 265
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_BIOMETRICS"

    goto/16 :goto_0

    .line 266
    :cond_b
    const-string/jumbo v0, "biometrics_pattern_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 267
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_BIOMETRICS"

    goto/16 :goto_0

    .line 268
    :cond_c
    const-string/jumbo v0, "biometrics_pincode_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 269
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_BIOMETRICS"

    goto/16 :goto_0

    .line 270
    :cond_d
    const-string/jumbo v0, "biometrics_password_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 271
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_BIOMETRICS"

    goto/16 :goto_0

    .line 272
    :cond_e
    const-string/jumbo v0, "face_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 273
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_FACE"

    goto :goto_0

    .line 274
    :cond_f
    const-string/jumbo v0, "face_pattern_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 275
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_FACE"

    goto :goto_0

    .line 276
    :cond_10
    const-string/jumbo v0, "face_pincode_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 277
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_FACE"

    goto :goto_0

    .line 278
    :cond_11
    const-string/jumbo v0, "face_password_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 279
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_FACE"

    goto :goto_0

    .line 280
    :cond_12
    const-string/jumbo v0, "face_spass_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 281
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_FACE_SPASS"

    goto :goto_0

    .line 282
    :cond_13
    const-string/jumbo v0, "face_spass_pattern_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 283
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PATTERN_FACE_SPASS"

    goto :goto_0

    .line 284
    :cond_14
    const-string/jumbo v0, "face_spass_pincode_type"

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 285
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PINCODE_FACE_SPASS"

    goto :goto_0

    .line 286
    :cond_15
    const-string/jumbo v0, "face_spass_password_type"

    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_16

    .line 287
    const-string/jumbo p0, "com.samsung.android.intent.action.CHECK_APPLOCK_PASSWORD_FACE_SPASS"

    goto :goto_0

    :cond_16
    const/4 p0, 0x0

    .line 289
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "getAppLockedCheckAction:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppLockPolicy"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0
.end method

.method public blacklist getAppLockedClassList()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 438
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedClassList:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 439
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v1

    .line 440
    :try_start_0
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    .line 441
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 443
    :cond_0
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist getAppLockedLockType()Ljava/lang/String;
    .locals 0

    .line 237
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedType:Ljava/lang/String;

    return-object p0
.end method

.method public blacklist getAppLockedPackageList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 295
    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public blacklist getApplockLockedAppsClass()Ljava/lang/String;
    .locals 0

    .line 356
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {p0}, Landroid/app/AppLockCoreState;->getApplockLockedAppsClass()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public blacklist getApplockLockedAppsPackage()Ljava/lang/String;
    .locals 0

    .line 352
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {p0}, Landroid/app/AppLockCoreState;->getApplockLockedAppsPackage()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public blacklist getApplockType()I
    .locals 0

    .line 360
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {p0}, Landroid/app/AppLockCoreState;->getApplockType()I

    move-result p0

    return p0
.end method

.method public blacklist getSsecureHiddenAppsPackages()Ljava/lang/String;
    .locals 0

    .line 368
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {p0}, Landroid/app/AppLockCoreState;->getSsecureHiddenAppsPackages()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public blacklist isActivityInExceptionList(Ljava/lang/String;)Z
    .locals 4

    .line 212
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 215
    :cond_0
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockLaunchingExcpetionList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :cond_1
    if-ge v2, v0, :cond_2

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    .line 216
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 p0, 0x1

    return p0

    .line 220
    :cond_2
    const-string p0, "AppLockPolicy"

    const-string/jumbo p1, "isActivityInExceptionList: "

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public blacklist isAppLockBypassList(Ljava/lang/String;)Z
    .locals 4

    .line 225
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 228
    :cond_0
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mApplockCallingExceptionList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :cond_1
    if-ge v2, v0, :cond_2

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    .line 229
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_2
    return v1
.end method

.method public blacklist isAppLockedClass(Ljava/lang/String;)Z
    .locals 3

    .line 468
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 471
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 472
    :try_start_0
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 473
    monitor-exit v0

    return v1

    .line 475
    :cond_1
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    .line 476
    monitor-exit v0

    return p0

    .line 478
    :cond_2
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist isAppLockedPackage(Ljava/lang/String;)Z
    .locals 3

    .line 423
    invoke-static {}, Lcom/android/internal/app/AppLockPolicy;->isSupportSSecure()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/android/internal/app/AppLockPolicy;->mIsAppLockEnabled:Z

    if-nez v0, :cond_0

    return v1

    .line 426
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 427
    :try_start_0
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 428
    monitor-exit v0

    return v1

    :cond_1
    if-eqz p1, :cond_2

    .line 430
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    .line 431
    monitor-exit v0

    return p0

    .line 433
    :cond_2
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist isAppLockedVerifying(Ljava/lang/String;)Z
    .locals 2

    .line 500
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 503
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 504
    :try_start_0
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    .line 505
    monitor-exit v0

    return p0

    .line 507
    :cond_1
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist isApplockEnabled()Z
    .locals 0

    .line 364
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {p0}, Landroid/app/AppLockCoreState;->isApplockEnabled()Z

    move-result p0

    return p0
.end method

.method public blacklist isManagedProfileUserId(I)Z
    .locals 0

    const/16 p0, 0xa

    if-lt p1, p0, :cond_0

    const/16 p0, 0x5e

    if-gt p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public blacklist setAppLockedUnLockClass(Ljava/lang/String;)V
    .locals 3

    .line 449
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 452
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 453
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 454
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedClassMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 456
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedClassMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 457
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 458
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 459
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedClassList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 464
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist setAppLockedUnLockPackage(Ljava/lang/String;)V
    .locals 4

    .line 371
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 374
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 375
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 376
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 378
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "applock_locked_packages"

    iget-object v3, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    .line 379
    invoke-virtual {v3}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v3

    .line 378
    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 380
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedPackageMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 381
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedRelatedPackageMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 382
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 383
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 384
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    iget-object v2, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 386
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "applock_locked_packages"

    iget-object v3, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    .line 387
    invoke-virtual {v3}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v3

    .line 386
    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 392
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist setAppLockedVerifying(Ljava/lang/String;Z)V
    .locals 2

    .line 483
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 486
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedLock:Ljava/lang/Object;

    monitor-enter v0

    .line 492
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    if-eqz p2, :cond_1

    .line 488
    :try_start_0
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 489
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 492
    :cond_1
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 493
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 496
    :cond_2
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public blacklist setApplockEnabled(Z)V
    .locals 1

    .line 340
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v0, p1}, Landroid/app/AppLockCoreState;->setApplockEnabled(Z)V

    .line 341
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPolicy;->updateSettings()V

    .line 342
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->updateLockedApps()V

    return-void
.end method

.method public blacklist setApplockLockedAppsClass(Ljava/lang/String;)V
    .locals 1

    .line 328
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v0, p1}, Landroid/app/AppLockCoreState;->setApplockLockedAppsClass(Ljava/lang/String;)V

    .line 329
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPolicy;->updateSettings()V

    .line 330
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->updateLockedApps()V

    return-void
.end method

.method public blacklist setApplockLockedAppsPackage(Ljava/lang/String;)V
    .locals 2

    .line 301
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedPackageList:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 303
    iget-object v1, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v1, p1}, Landroid/app/AppLockCoreState;->setApplockLockedAppsPackage(Ljava/lang/String;)V

    .line 304
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPolicy;->updateSettings()V

    .line 305
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->updateLockedApps()V

    .line 309
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 310
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v1, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda1;-><init>()V

    .line 311
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v1, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda2;-><init>()V

    .line 312
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v1, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, v0}, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda3;-><init>(Lcom/android/internal/app/AppLockPolicy;Ljava/util/List;)V

    .line 313
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    .line 318
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 320
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 321
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockPolicy;->notifyVoldAppLockStateChanged(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public blacklist setApplockType(I)V
    .locals 1

    .line 334
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v0, p1}, Landroid/app/AppLockCoreState;->setApplockType(I)V

    .line 335
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPolicy;->updateSettings()V

    .line 336
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->updateLockedApps()V

    return-void
.end method

.method public blacklist setSsecureHiddenAppsPackages(Ljava/lang/String;)V
    .locals 1

    .line 346
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v0, p1}, Landroid/app/AppLockCoreState;->setSsecureHiddenAppsPackages(Ljava/lang/String;)V

    .line 347
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPolicy;->updateSettings()V

    .line 348
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPolicy;->updateLockedApps()V

    return-void
.end method

.method public blacklist updateSettings()V
    .locals 1

    .line 707
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v0}, Landroid/app/AppLockCoreState;->getApplockLockedAppsPackage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedPackages:Ljava/lang/String;

    .line 708
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v0}, Landroid/app/AppLockCoreState;->getApplockLockedAppsClass()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedClasses:Ljava/lang/String;

    .line 709
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {v0}, Landroid/app/AppLockCoreState;->getApplockType()I

    move-result v0

    iput v0, p0, Lcom/android/internal/app/AppLockPolicy;->mLockedTypeInt:I

    .line 710
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy;->mAppLockSharedPref:Landroid/app/AppLockCoreState;

    invoke-virtual {p0}, Landroid/app/AppLockCoreState;->isApplockEnabled()Z

    move-result p0

    sput-boolean p0, Lcom/android/internal/app/AppLockPolicy;->mIsAppLockEnabled:Z

    return-void
.end method
