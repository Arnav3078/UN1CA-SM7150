.class public final synthetic Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic blacklist f$0:Landroid/security/applock/AppLockManager$1;

.field public final synthetic blacklist f$1:Ljava/lang/String;

.field public final synthetic blacklist f$2:I

.field public final synthetic blacklist f$3:Z


# direct methods
.method public synthetic constructor blacklist <init>(Landroid/security/applock/AppLockManager$1;Ljava/lang/String;IZ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$0:Landroid/security/applock/AppLockManager$1;

    iput-object p2, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput p3, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$2:I

    iput-boolean p4, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$3:Z

    return-void
.end method


# virtual methods
.method public final whitelist test-api run()V
    .locals 3

    .line 0
    iget-object v0, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$0:Landroid/security/applock/AppLockManager$1;

    iget-object v1, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget v2, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$2:I

    iget-boolean p0, p0, Landroid/security/applock/AppLockManager$1$$ExternalSyntheticLambda0;->f$3:Z

    invoke-static {v0, v1, v2, p0}, Landroid/security/applock/AppLockManager$1;->$r8$lambda$WrWqkRXmNFHzaxxladGwJL0aM1Q(Landroid/security/applock/AppLockManager$1;Ljava/lang/String;IZ)V

    return-void
.end method
