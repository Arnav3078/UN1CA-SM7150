.class final Lio/mesalabs/unica/gpu/KonaProfileImport$Node;
.super Ljava/lang/Object;
.source "KonaProfileImport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/mesalabs/unica/gpu/KonaProfileImport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Node"
.end annotation


# instance fields
.field final children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/mesalabs/unica/gpu/KonaProfileImport$Node;",
            ">;"
        }
    .end annotation
.end field

.field name:Ljava/lang/String;

.field final properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[J>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->properties:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->children:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lio/mesalabs/unica/gpu/KonaProfileImport$1;)V
    .registers 2

    .line 12
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;-><init>()V

    return-void
.end method
