.class public final synthetic Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/gpu/GpuActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/gpu/GpuActivity;ILandroid/net/Uri;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iput p2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;->f$1:I

    iput-object p3, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;->f$2:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;->f$1:I

    iget-object v2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;->f$2:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->lambda$handleDocument$1$io-mesalabs-unica-gpu-GpuActivity(ILandroid/net/Uri;)V

    return-void
.end method
