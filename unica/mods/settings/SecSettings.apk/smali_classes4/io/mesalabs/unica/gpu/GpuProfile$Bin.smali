.class final Lio/mesalabs/unica/gpu/GpuProfile$Bin;
.super Ljava/lang/Object;
.source "GpuProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mesalabs/unica/gpu/GpuProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Bin"
.end annotation


# instance fields
.field initial:I

.field minimum:I

.field final rows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/mesalabs/unica/gpu/GpuProfile$Row;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    return-void
.end method
