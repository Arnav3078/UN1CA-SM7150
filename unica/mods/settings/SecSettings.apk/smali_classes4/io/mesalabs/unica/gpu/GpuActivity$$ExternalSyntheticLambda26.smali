.class public final synthetic Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/gpu/GpuActivity;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/widget/EditText;ZLandroid/app/AlertDialog;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iput-object p2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$1:Landroid/widget/EditText;

    iput-boolean p3, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$2:Z

    iput-object p4, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$3:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$0:Lio/mesalabs/unica/gpu/GpuActivity;

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$1:Landroid/widget/EditText;

    iget-boolean v2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$2:Z

    iget-object v3, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;->f$3:Landroid/app/AlertDialog;

    invoke-virtual {v0, v1, v2, v3, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->lambda$editInitial$1$io-mesalabs-unica-gpu-GpuActivity(Landroid/widget/EditText;ZLandroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
