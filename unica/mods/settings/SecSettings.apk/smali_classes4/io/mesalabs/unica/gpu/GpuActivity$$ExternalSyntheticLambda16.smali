.class public final synthetic Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Z

.field public final synthetic f$1:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(ZLandroid/view/View$OnClickListener;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda16;->f$0:Z

    iput-object p2, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda16;->f$1:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda16;->f$0:Z

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda16;->f$1:Landroid/view/View$OnClickListener;

    invoke-static {v0, v1, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->lambda$row$0(ZLandroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method
