.class public final Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/honeyspace/ui/common/quickoption/AppLock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lcom/honeyspace/ui/common/quickoption/AppLock$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAPP_LOCK()Lcom/honeyspace/ui/common/quickoption/GlobalOption$Factory;
    .registers 1

    invoke-static {}, Lcom/honeyspace/ui/common/quickoption/AppLock;->access$getAPP_LOCK$cp()Lcom/honeyspace/ui/common/quickoption/GlobalOption$Factory;

    move-result-object p0

    return-object p0
.end method

.method public final isAppLockEnabled(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;)Z
    .registers 8

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    if-nez p2, :cond_0

    goto :cond_4

    :cond_0
    sget-object v1, Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;->INSTANCE:Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v1, p2, v2, v3, v4}, Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;->getComponentName$default(Lcom/honeyspace/ui/common/util/PopupAnchorInfoUtils;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;ZILjava/lang/Object;)Landroid/content/ComponentName;

    move-result-object p2

    if-nez p2, :cond_1

    return v0

    :cond_1
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_2

    return v0

    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string/jumbo v1, "applock_locked_packages"

    invoke-static {p1, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_3

    return v0

    :cond_3
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0

    :cond_4
    return v0
.end method

.method public final isAppLockSupported(Landroid/content/Context;Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;)Z
    .registers 3

    if-eqz p2, :cond_0

    invoke-interface {p2}, Lcom/honeyspace/common/interfaces/quickoption/PopupAnchorInfo;->isApplicationItem()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
