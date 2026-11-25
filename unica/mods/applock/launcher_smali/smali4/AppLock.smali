.class public final Lcom/honeyspace/ui/common/quickoption/AppLock;
.super Lcom/honeyspace/ui/common/quickoption/GlobalOption;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0018\u0000 \u00122\u00020\u0001:\u0001\u0012B!\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0016J\u0008\u0010\u000e\u001a\u00020\u000bH\u0002J\u0010\u0010\u000f\u001a\u00020\u000b2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u0011\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/honeyspace/ui/common/quickoption/AppLock;",
        "Lcom/honeyspace/ui/common/quickoption/GlobalOption;",
        "context",
        "Landroid/content/Context;",
        "itemInfo",
        "Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;",
        "honeyPot",
        "Lcom/honeyspace/common/entity/HoneyPot;",
        "<init>",
        "(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;Lcom/honeyspace/common/entity/HoneyPot;)V",
        "onClick",
        "",
        "view",
        "Landroid/view/View;",
        "createAndShowUnlockDialog",
        "sendPendingIntent",
        "inFolder",
        "",
        "Companion",
        "ui-uicommon_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final APP_LOCK:Lcom/honeyspace/ui/common/quickoption/GlobalOption$Factory;

.field public static final Companion:Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/honeyspace/ui/common/quickoption/AppLock;->Companion:Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;

    new-instance v0, Lcom/honeyspace/ui/common/quickoption/AppLock$Companion$APP_LOCK$1;

    invoke-direct {v0}, Lcom/honeyspace/ui/common/quickoption/AppLock$Companion$APP_LOCK$1;-><init>()V

    sput-object v0, Lcom/honeyspace/ui/common/quickoption/AppLock;->APP_LOCK:Lcom/honeyspace/ui/common/quickoption/GlobalOption$Factory;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;Lcom/honeyspace/common/entity/HoneyPot;)V
    .registers 12

    .line 2
    sget-object v0, Lcom/honeyspace/ui/common/quickoption/AppLock;->Companion:Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;

    invoke-virtual {v0, p1, p2}, Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;->isAppLockEnabled(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;)Z

    move-result v1

    if-eqz v1, :cond_c

    sget v1, Lcom/honeyspace/ui/common/R$drawable;->quick_option_ic_app_lock:I

    :goto_a
    move v3, v1

    goto :goto_f

    .line 3
    :cond_c
    sget v1, Lcom/honeyspace/ui/common/R$drawable;->quick_option_ic_app_unlock:I

    goto :goto_a

    .line 4
    :goto_f
    invoke-virtual {v0, p1, p2}, Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;->isAppLockEnabled(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_1d

    sget v0, Lcom/honeyspace/ui/common/R$string;->unlock:I

    :goto_17
    move-object v2, p0

    move-object v6, p1

    move-object v5, p2

    move-object v7, p3

    move v4, v0

    goto :goto_20

    :cond_1d
    sget v0, Lcom/honeyspace/ui/common/R$string;->lock:I

    goto :goto_17

    .line 5
    :goto_20
    invoke-direct/range {v2 .. v7}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;-><init>(IILcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;Landroid/content/Context;Lcom/honeyspace/common/entity/HoneyPot;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;Lcom/honeyspace/common/entity/HoneyPot;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/honeyspace/ui/common/quickoption/AppLock;-><init>(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;Lcom/honeyspace/common/entity/HoneyPot;)V

    return-void
.end method

.method public static final synthetic access$getAPP_LOCK$cp()Lcom/honeyspace/ui/common/quickoption/GlobalOption$Factory;
    .registers 1

    sget-object v0, Lcom/honeyspace/ui/common/quickoption/AppLock;->APP_LOCK:Lcom/honeyspace/ui/common/quickoption/GlobalOption$Factory;

    return-object v0
.end method

.method public static synthetic b(Lcom/honeyspace/ui/common/quickoption/AppLock;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lcom/honeyspace/ui/common/quickoption/AppLock;->createAndShowUnlockDialog$lambda$0(Lcom/honeyspace/ui/common/quickoption/AppLock;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private final createAndShowUnlockDialog()V
    .registers 6

    sget-object v0, Lcom/honeyspace/ui/common/quickoption/AppInFolderUnlockDialog;->Companion:Lcom/honeyspace/ui/common/quickoption/AppInFolderUnlockDialog$Companion;

    invoke-virtual {p0}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;->getHoneyPot()Lcom/honeyspace/common/entity/HoneyPot;

    move-result-object v1

    invoke-virtual {v1}, Lcom/honeyspace/common/entity/HoneyPot;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type android.app.Activity"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;->getItemInfo()Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;

    move-result-object v2

    invoke-interface {v2}, Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;->getItemInfo()Lcom/honeyspace/sdk/source/entity/BaseItem;

    move-result-object v2

    const-string v3, "null cannot be cast to non-null type com.honeyspace.sdk.source.entity.AppItem"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lcom/honeyspace/sdk/source/entity/AppItem;

    invoke-virtual {v2}, Lcom/honeyspace/sdk/source/entity/AppItem;->getLabel()Landroidx/lifecycle/MutableLiveData;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/honeyspace/ui/common/iconview/renderer/a;

    const/16 v4, 0x8

    invoke-direct {v3, p0, v4}, Lcom/honeyspace/ui/common/iconview/renderer/a;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/honeyspace/ui/common/quickoption/AppInFolderUnlockDialog$Companion;->createAndShow(Landroid/app/Activity;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method private static final createAndShowUnlockDialog$lambda$0(Lcom/honeyspace/ui/common/quickoption/AppLock;)Lkotlin/Unit;
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/honeyspace/ui/common/quickoption/AppLock;->sendPendingIntent(Z)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static synthetic sendPendingIntent$default(Lcom/honeyspace/ui/common/quickoption/AppLock;ZILjava/lang/Object;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_5

    const/4 p1, 0x0

    :cond_5
    invoke-virtual {p0, p1}, Lcom/honeyspace/ui/common/quickoption/AppLock;->sendPendingIntent(Z)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    const-string/jumbo v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-super {p0, p1}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;->onClick(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;->getClose()Lkotlin/jvm/functions/Function0;

    move-result-object p1

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;->getItemInfo()Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;

    move-result-object p1

    invoke-interface {p1}, Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;->isItemInFolder()Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-direct {p0}, Lcom/honeyspace/ui/common/quickoption/AppLock;->createAndShowUnlockDialog()V

    return-void

    :cond_1e
    const/4 p1, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v1, p1, v0}, Lcom/honeyspace/ui/common/quickoption/AppLock;->sendPendingIntent$default(Lcom/honeyspace/ui/common/quickoption/AppLock;ZILjava/lang/Object;)V

    return-void
.end method

.method public final sendPendingIntent(Z)V
    .registers 10

    sget-object v0, Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;->INSTANCE:Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;

    invoke-virtual {p0}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;->getItemInfo()Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;->getComponentName$default(Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;ZILjava/lang/Object;)Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/honeyspace/ui/common/quickoption/GlobalOption;->getContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_2

    return-void

    :cond_2
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/4 v2, 0x0

    :try_start_pm
    invoke-virtual {p1, v0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object p1
    :try_end_pm
    .catch Ljava/lang/Exception; {:try_start_pm .. :try_end_pm} :catch_pm

    goto :goto_has_title

    :catch_pm
    move-object p1, v0

    :goto_has_title
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "applock_locked_packages"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    const-string v4, ""

    :cond_3
    const-string v5, "["

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "]"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    const-string v5, " "

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_7

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    const-string/jumbo v3, "applock_locked_apps_packages"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    :try_start_0
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-interface {v2, v4}, Landroid/app/IActivityTaskManager;->setApplockLockedAppsPackage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_5
    invoke-static {v0}, Lcom/android/internal/app/AppLockPolicy;->clearUnlockedPackage(Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.samsung.applock.intent.action.APPLOCKED_STATUS_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "packageName"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v0, "status"

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Lock removed from "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_7
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_8

    move-object v4, v0

    goto :goto_store

    :cond_8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_store
    const-string/jumbo v5, "app_lock_enabled"

    const/4 v6, 0x1

    invoke-static {v2, v5, v6}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    const-string/jumbo v5, "applock_enabled"

    invoke-static {v2, v5, v6}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    const-string/jumbo v3, "applock_locked_apps_packages"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    const/4 v5, 0x0

    :try_start_1
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    move-result-object v2

    if-eqz v2, :cond_9

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Landroid/app/IActivityTaskManager;->setApplockEnabled(Z)V

    invoke-interface {v2, v4}, Landroid/app/IActivityTaskManager;->setApplockLockedAppsPackage(Ljava/lang/String;)V

    invoke-interface {v2}, Landroid/app/IActivityTaskManager;->getApplockType()I

    move-result v3

    if-nez v3, :cond_9

    const/4 v5, 0x1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_9
    invoke-static {v0}, Lcom/android/internal/app/AppLockPolicy;->clearUnlockedPackage(Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.samsung.applock.intent.action.APPLOCKED_STATUS_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "packageName"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v0, "status"

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is locked"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    if-eqz v5, :cond_next_done

    :try_start_setup
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.samsung.android.applock"

    const-string v3, "com.samsung.android.applock.settings.AppLockSettingsActivity"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_setup
    .catch Ljava/lang/Exception; {:try_start_setup .. :try_end_setup} :catch_setup

    :catch_setup
    :cond_next_done
    :goto_0
    return-void
.end method
