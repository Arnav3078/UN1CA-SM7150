.class public final enum Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;
.super Ljava/lang/Enum;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

.field public static final enum LOST:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

.field public static final enum PENDING:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

.field public static final enum READY:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    const-string/jumbo v1, "PENDING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->PENDING:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    new-instance v1, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    const-string/jumbo v2, "READY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->READY:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    new-instance v2, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    const-string v3, "LOST"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->LOST:Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    filled-new-array {v0, v1, v2}, [Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    move-result-object v0

    sput-object v0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->$VALUES:[Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;
    .locals 1

    const-class v0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    return-object p0
.end method

.method public static values()[Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;
    .locals 1

    sget-object v0, Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->$VALUES:[Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    invoke-virtual {v0}, [Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/server/wm/AppLockBiometricFocusController$SourceInputState;

    return-object v0
.end method
