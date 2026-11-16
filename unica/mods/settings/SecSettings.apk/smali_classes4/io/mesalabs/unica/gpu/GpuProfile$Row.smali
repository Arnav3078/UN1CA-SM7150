.class final Lio/mesalabs/unica/gpu/GpuProfile$Row;
.super Ljava/lang/Object;
.source "GpuProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mesalabs/unica/gpu/GpuProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Row"
.end annotation


# instance fields
.field acd:J

.field bus:J

.field frequency:J

.field hasAcd:Z

.field maximum:J

.field minimum:J

.field voltage:I


# direct methods
.method constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
