.class Landroid/security/applock/AppLockManager$1;
.super Landroid/security/applock/IPackageLockedStateListener$Stub;
.source "AppLockManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/security/applock/AppLockManager;->registerPackageLockedStateListener(Ljava/util/concurrent/Executor;Landroid/security/applock/AppLockManager$PackageLockedStateListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final blacklist mListenerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/security/applock/AppLockManager$PackageLockedStateListener;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic blacklist val$executor:Ljava/util/concurrent/Executor;

.field final synthetic blacklist val$listener:Landroid/security/applock/AppLockManager$PackageLockedStateListener;


# direct methods
.method public static synthetic blacklist $r8$lambda$WrWqkRXmNFHzaxxladGwJL0aM1Q(Landroid/security/applock/AppLockManager$1;Ljava/lang/String;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/security/applock/AppLockManager$1;->lambda$onPackageLockedStateChanged$0(Ljava/lang/String;IZ)V

    return-void
.end method

.method constructor blacklist <init>(Landroid/security/applock/AppLockManager;Landroid/security/applock/AppLockManager$PackageLockedStateListener;Ljava/util/concurrent/Executor;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 117
    iput-object p2, p0, Landroid/security/applock/AppLockManager$1;->val$listener:Landroid/security/applock/AppLockManager$PackageLockedStateListener;

    iput-object p3, p0, Landroid/security/applock/AppLockManager$1;->val$executor:Ljava/util/concurrent/Executor;

    invoke-direct {p0}, Landroid/security/applock/IPackageLockedStateListener$Stub;-><init>()V

    .line 118
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Landroid/security/applock/AppLockManager$1;->mListenerRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private synthetic blacklist lambda$onPackageLockedStateChanged$0(Ljava/lang/String;IZ)V
    .locals 2

    .line 124
    iget-object p0, p0, Landroid/security/applock/AppLockManager$1;->mListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/security/applock/AppLockManager$PackageLockedStateListener;

    if-nez p0, :cond_0

    return-void

    .line 128
    :cond_0
    invoke-static {}, Landroid/security/applock/AppLockManager;->-$$Nest$sfgetDEBUG()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "onPackageLockedStateChanged (IPC): packageName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", userId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", locked="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppLockManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    :cond_1
    invoke-interface {p0, p1, p2, p3}, Landroid/security/applock/AppLockManager$PackageLockedStateListener;->onPackageLockedStateChanged(Ljava/lang/String;IZ)V

    return-void
.end method


# virtual methods
.method public blacklist onPackageLockedStateChanged(Ljava/lang/String;IZ)V
    .locals 2

    .line 123
    iget-object v0, p0, Landroid/security/applock/AppLockManager$1;->val$executor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2, p3}, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;-><init>(Landroid/security/applock/AppLockManager$1;Ljava/lang/String;IZ)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
