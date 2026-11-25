.class public final Lcom/samsung/android/core/pm/SALogger;
.super Ljava/lang/Object;
.source "SALogger.java"


# static fields
.field private static final blacklist ACTION_USE_APP_FEATURE_SURVEY:Ljava/lang/String; = "com.sec.android.diagmonagent.intent.USE_APP_FEATURE_SURVEY"

.field public static final blacklist EVENT_APP_LOCK_DIALOG_CANCEL:Ljava/lang/String; = "ALK1004"

.field public static final blacklist EVENT_APP_LOCK_DIALOG_LOCK:Ljava/lang/String; = "ALK1005"

.field public static final blacklist EVENT_BUBBLE_TIPS_SETTINGS:Ljava/lang/String; = "ALK1011"

.field public static final blacklist EVENT_GALLERY_DIALOG_CANCEL:Ljava/lang/String; = "ALK1009"

.field public static final blacklist EVENT_GALLERY_DIALOG_CONTINUE:Ljava/lang/String; = "ALK1010"

.field public static final blacklist EVENT_GALLERY_DIALOG_VIEW_ALL:Ljava/lang/String; = "ALK1008"

.field public static final blacklist EVENT_SECURE_LOCK_FIRST_CANCEL:Ljava/lang/String; = "ALK1012"

.field public static final blacklist EVENT_SECURE_LOCK_FIRST_SETTINGS:Ljava/lang/String; = "ALK1013"

.field private static final blacklist KEY_FEATURE:Ljava/lang/String; = "feature"

.field private static final blacklist KEY_PACKAGE_NAME:Ljava/lang/String; = "pkg_name"

.field private static final blacklist KEY_SCREEN_ID:Ljava/lang/String; = "screen_id"

.field private static final blacklist KEY_TRACKING_ID:Ljava/lang/String; = "tracking_id"

.field private static final blacklist KEY_TYPE:Ljava/lang/String; = "type"

.field private static final blacklist PACKAGE_DIAGMON_AGENT:Ljava/lang/String; = "com.sec.android.diagmonagent"

.field public static final blacklist PAGE_APP_LOCK_DIALOG:Ljava/lang/String; = "ALK103"

.field public static final blacklist PAGE_BUBBLE_TIPS:Ljava/lang/String; = "ALK105"

.field public static final blacklist PAGE_GALLERY_DIALOG:Ljava/lang/String; = "ALK104"

.field public static final blacklist PAGE_SECURE_LOCK_FIRST:Ljava/lang/String; = "ALK106"

.field private static final blacklist TAG:Ljava/lang/String; = "SALogger"

.field private static final blacklist VALUE_PACKAGE_NAME_SYSTEM:Ljava/lang/String; = "System"

.field private static final blacklist VALUE_TRACKING_ID_PACKAGE_MANAGER:Ljava/lang/String; = "7IH-399-559998"

.field private static final blacklist VALUE_TYPE_EV:Ljava/lang/String; = "ev"


# direct methods
.method private constructor blacklist <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic blacklist lambda$sendEventLog$0(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 1

    .line 68
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 70
    new-instance p1, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "Failed to send SA log "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo p2, "SALogger"

    invoke-static {p2, p1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static blacklist sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 52
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 53
    const-string/jumbo v1, "tracking_id"

    const-string v2, "7IH-399-559998"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    const-string/jumbo v1, "pkg_name"

    const-string/jumbo v2, "System"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const-string/jumbo v1, "type"

    const-string/jumbo v2, "ev"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string/jumbo v1, "screen_id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string/jumbo v1, "feature"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.sec.android.diagmonagent.intent.USE_APP_FEATURE_SURVEY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.sec.android.diagmonagent"

    .line 60
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 61
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    .line 62
    sget-boolean v1, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v1, :cond_0

    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v1, "SALogger"

    invoke-static {v1, p1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 66
    invoke-static {}, Lcom/android/internal/os/BackgroundThread;->getHandler()Landroid/os/Handler;

    move-result-object p1

    new-instance v1, Lcom/samsung/android/core/pm/SALogger$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0, p2}, Lcom/samsung/android/core/pm/SALogger$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
