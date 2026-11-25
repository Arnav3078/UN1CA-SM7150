.class public final synthetic Lcom/android/internal/app/LockedAppActivity$Injector$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/app/Activity$TranslucentConversionListener;


# instance fields
.field public final synthetic blacklist f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor blacklist <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity$Injector$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final whitelist onTranslucentConversionComplete(Z)V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$Injector$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Runnable;

    invoke-static {p0, p1}, Lcom/android/internal/app/LockedAppActivity$Injector;->lambda$convertToTranslucent$0(Ljava/lang/Runnable;Z)V

    return-void
.end method
