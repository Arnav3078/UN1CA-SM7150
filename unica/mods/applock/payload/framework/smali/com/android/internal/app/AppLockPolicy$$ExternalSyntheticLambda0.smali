.class public final synthetic Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field public final synthetic blacklist f$0:Lcom/android/internal/app/AppLockPolicy;


# direct methods
.method public synthetic constructor blacklist <init>(Lcom/android/internal/app/AppLockPolicy;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda0;->f$0:Lcom/android/internal/app/AppLockPolicy;

    return-void
.end method


# virtual methods
.method public final whitelist binderDied()V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda0;->f$0:Lcom/android/internal/app/AppLockPolicy;

    invoke-static {p0}, Lcom/android/internal/app/AppLockPolicy;->$r8$lambda$SoMI5Qo6tx3HkcZp_y4S0VfkxtY(Lcom/android/internal/app/AppLockPolicy;)V

    return-void
.end method
