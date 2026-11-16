.class public final synthetic Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda35;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/gpu/GpuActivity;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda35;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iput p2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda35;->f$1:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda35;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda35;->f$1:I

    invoke-virtual {v0, v1, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->lambda$draw$17$io-mesalabs-unica-gpu-GpuActivity(ILandroid/view/View;)V

    return-void
.end method
