.class public final synthetic Lcom/android/server/pm/ShortcutService$$AppLockHandleLambda;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic $r8$classId:B


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/pm/ShortcutService$$AppLockHandleLambda;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-byte p0, p0, Lcom/android/server/pm/ShortcutService$$AppLockHandleLambda;->$r8$classId:B

    packed-switch p0, :pswitch_data_0

    check-cast p1, Lcom/android/server/pm/ShortcutUser;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutUser;->detectLocaleChange()V

    return-void

    :pswitch_0
    check-cast p1, Lcom/android/server/pm/ShortcutPackageItem;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutPackageItem;->verifyStates()V

    return-void

    :pswitch_1
    check-cast p1, Lcom/android/server/pm/ShortcutPackageItem;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutPackageItem;->waitForBitmapSaves()V

    return-void

    :pswitch_2
    check-cast p1, Lcom/android/server/pm/ShortcutLauncher;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutLauncher;->ensurePackageInfo()V

    return-void

    :pswitch_3
    check-cast p1, Lcom/android/server/pm/ShortcutPackage;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p0, 0x0

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Lcom/android/server/pm/ShortcutPackage;->rescanPackageIfNeeded(ZZ)Z

    return-void

    :pswitch_4
    check-cast p1, Lcom/android/server/pm/ShortcutPackageItem;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutPackageItem;->refreshPackageSignatureAndSave()V

    return-void

    :pswitch_5
    check-cast p1, Lcom/android/server/pm/ShortcutUser;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance p0, Lcom/android/server/pm/ShortcutService$$AppLockHandleLambda;

    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/android/server/pm/ShortcutService$$AppLockHandleLambda;-><init>(B)V

    invoke-virtual {p1, p0}, Lcom/android/server/pm/ShortcutUser;->forAllPackageItems(Ljava/util/function/Consumer;)V

    return-void

    :pswitch_6
    check-cast p1, Lcom/android/server/pm/ShortcutLauncher;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutLauncher;->ensurePackageInfo()V

    return-void

    :pswitch_7
    check-cast p1, Lcom/android/server/pm/ShortcutPackageItem;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutPackageItem;->refreshPackageSignatureAndSave()V

    return-void

    :pswitch_8
    check-cast p1, Lcom/android/server/pm/ShortcutPackage;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutPackage;->refreshPinnedFlags()V

    return-void

    :pswitch_9
    check-cast p1, Lcom/android/server/pm/ShortcutLauncher;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void

    :pswitch_a
    check-cast p1, Lcom/android/server/pm/ShortcutUser;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance p0, Lcom/android/server/pm/ShortcutService$$AppLockHandleLambda;

    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lcom/android/server/pm/ShortcutService$$AppLockHandleLambda;-><init>(B)V

    invoke-virtual {p1, p0}, Lcom/android/server/pm/ShortcutUser;->forAllPackageItems(Ljava/util/function/Consumer;)V

    return-void

    :pswitch_b
    check-cast p1, Lcom/android/server/pm/ShortcutPackage;

    sget-object p0, Lcom/android/server/pm/ShortcutService;->sIsEmergencyMode:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Lcom/android/server/pm/ShortcutPackage;->refreshPinnedFlags()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
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
