.class public final synthetic Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic blacklist f$0:Lcom/android/internal/app/LockedAppActivity;

.field public final synthetic blacklist f$1:Landroid/os/CancellationSignal;


# direct methods
.method public synthetic constructor blacklist <init>(Lcom/android/internal/app/LockedAppActivity;Landroid/os/CancellationSignal;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda2;->f$0:Lcom/android/internal/app/LockedAppActivity;

    iput-object p2, p0, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda2;->f$1:Landroid/os/CancellationSignal;

    return-void
.end method


# virtual methods
.method public final whitelist test-api run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda2;->f$0:Lcom/android/internal/app/LockedAppActivity;

    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$$ExternalSyntheticLambda2;->f$1:Landroid/os/CancellationSignal;

    invoke-static {v0, p0}, Lcom/android/internal/app/LockedAppActivity;->$r8$lambda$uBBzlTSkJxu64ztNb8WUVdZxB6Y(Lcom/android/internal/app/LockedAppActivity;Landroid/os/CancellationSignal;)V

    return-void
.end method
