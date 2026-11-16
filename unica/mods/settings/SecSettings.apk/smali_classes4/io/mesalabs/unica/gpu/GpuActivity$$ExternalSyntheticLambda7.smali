.class public final synthetic Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/gpu/GpuActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:I

.field public final synthetic f$3:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/app/AlertDialog;ILandroid/widget/EditText;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iput-object p2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$1:Landroid/app/AlertDialog;

    iput p3, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$2:I

    iput-object p4, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$3:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 6

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$1:Landroid/app/AlertDialog;

    iget v2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$2:I

    iget-object v3, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;->f$3:Landroid/widget/EditText;

    invoke-virtual {v0, v1, v2, v3, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->lambda$editFrequency$0$io-mesalabs-unica-gpu-GpuActivity(Landroid/app/AlertDialog;ILandroid/widget/EditText;Landroid/content/DialogInterface;)V

    return-void
.end method
