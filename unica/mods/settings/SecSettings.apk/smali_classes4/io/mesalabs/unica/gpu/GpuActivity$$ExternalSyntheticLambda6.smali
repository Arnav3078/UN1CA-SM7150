.class public final synthetic Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/gpu/GpuActivity;

.field public final synthetic f$1:Landroid/net/Uri;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iput-object p2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$1:Landroid/net/Uri;

    iput-object p3, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$1:Landroid/net/Uri;

    iget-object v2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;->f$3:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->lambda$handleDocument$2$io-mesalabs-unica-gpu-GpuActivity(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
