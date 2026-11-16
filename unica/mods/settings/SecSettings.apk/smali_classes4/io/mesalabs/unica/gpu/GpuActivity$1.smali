.class Lio/mesalabs/unica/gpu/GpuActivity$1;
.super Landroid/widget/ArrayAdapter;
.source "GpuActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mesalabs/unica/gpu/GpuActivity;->editLevel(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/mesalabs/unica/gpu/GpuActivity;


# direct methods
.method constructor <init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/content/Context;I[Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 166
    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$1;->this$0:Lio/mesalabs/unica/gpu/GpuActivity;

    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 166
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    # getter for: Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I
    invoke-static {}, Lio/mesalabs/unica/gpu/GpuActivity;->access$000()[I

    move-result-object p3

    aget p1, p3, p1

    invoke-static {p1}, Lio/mesalabs/unica/gpu/GpuProfile;->outsideStock(I)Z

    move-result p1

    if-eqz p1, :cond_19

    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$1;->this$0:Lio/mesalabs/unica/gpu/GpuActivity;

    # invokes: Lio/mesalabs/unica/gpu/GpuActivity;->warningColor()I
    invoke-static {p1}, Lio/mesalabs/unica/gpu/GpuActivity;->access$100(Lio/mesalabs/unica/gpu/GpuActivity;)I

    move-result p1

    goto :goto_25

    :cond_19
    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$1;->this$0:Lio/mesalabs/unica/gpu/GpuActivity;

    const p3, 0x1010036

    const v0, -0x111112

    # invokes: Lio/mesalabs/unica/gpu/GpuActivity;->themeColor(II)I
    invoke-static {p1, p3, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->access$200(Lio/mesalabs/unica/gpu/GpuActivity;II)I

    move-result p1

    :goto_25
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity$1;->this$0:Lio/mesalabs/unica/gpu/GpuActivity;

    const/16 p3, 0x40

    # invokes: Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I
    invoke-static {p1, p3}, Lio/mesalabs/unica/gpu/GpuActivity;->access$300(Lio/mesalabs/unica/gpu/GpuActivity;I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    return-object p2
.end method
