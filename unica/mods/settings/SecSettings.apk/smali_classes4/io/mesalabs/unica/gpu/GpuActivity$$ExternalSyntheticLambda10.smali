.class public final synthetic Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/gpu/GpuActivity;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda10;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iput p2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda10;->f$1:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda10;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda10;->f$1:I

    invoke-virtual {v0, v1, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->lambda$editLevel$2$io-mesalabs-unica-gpu-GpuActivity(ILandroid/content/DialogInterface;I)V

    return-void
.end method
