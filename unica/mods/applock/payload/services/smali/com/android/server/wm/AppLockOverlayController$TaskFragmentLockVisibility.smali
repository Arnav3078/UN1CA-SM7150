.class public final enum Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;
.super Ljava/lang/Enum;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

.field public static final enum NONE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

.field public static final enum OCCLUDED:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

.field public static final enum OVERLAY:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

.field public static final enum VISIBLE_EXEMPT:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

.field public static final enum VISIBLE_SENSITIVE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    const-string/jumbo v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->NONE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    new-instance v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    const-string/jumbo v2, "VISIBLE_SENSITIVE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->VISIBLE_SENSITIVE:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    new-instance v2, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    const-string/jumbo v3, "VISIBLE_EXEMPT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->VISIBLE_EXEMPT:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    new-instance v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    const-string/jumbo v4, "OCCLUDED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->OCCLUDED:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    new-instance v4, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    const-string/jumbo v5, "OVERLAY"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->OVERLAY:Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    move-result-object v0

    sput-object v0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->$VALUES:[Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;
    .locals 1

    const-class v0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    return-object p0
.end method

.method public static values()[Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;
    .locals 1

    sget-object v0, Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->$VALUES:[Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    invoke-virtual {v0}, [Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/server/wm/AppLockOverlayController$TaskFragmentLockVisibility;

    return-object v0
.end method
