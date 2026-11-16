.class final Lio/mesalabs/unica/gpu/GpuProfile;
.super Ljava/lang/Object;
.source "GpuProfile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mesalabs/unica/gpu/GpuProfile$Bin;,
        Lio/mesalabs/unica/gpu/GpuProfile$Row;
    }
.end annotation


# static fields
.field static final MAX_BYTES:I = 0x8000

.field static final STOCK_LEVELS:[I


# instance fields
.field firmware:Ljava/lang/String;

.field name:Ljava/lang/String;

.field final tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 12
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lio/mesalabs/unica/gpu/GpuProfile;->STOCK_LEVELS:[I

    return-void

    :array_a
    .array-data 4
        0x34
        0x38
        0x3c
        0x40
        0x50
        0x80
        0x90
        0xc0
        0xe0
    .end array-data
.end method

.method private constructor <init>()V
    .registers 4

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x2

    new-array v0, v0, [Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    new-instance v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    invoke-direct {v1}, Lio/mesalabs/unica/gpu/GpuProfile$Bin;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    invoke-direct {v1}, Lio/mesalabs/unica/gpu/GpuProfile$Bin;-><init>()V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    .line 17
    return-void
.end method

.method private static bounded(Lorg/json/JSONObject;Ljava/lang/String;II)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 67
    invoke-static {p0, p1}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    int-to-long v2, p2

    cmp-long p0, v0, v2

    if-ltz p0, :cond_10

    int-to-long v2, p3

    cmp-long p0, v0, v2

    if-gtz p0, :cond_10

    long-to-int p0, v0

    return p0

    :cond_10
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " must be "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\u2013"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static decode([B)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 63
    array-length v0, p0

    if-eqz v0, :cond_28

    array-length v0, p0

    const v1, 0x8000

    if-gt v0, v1, :cond_28

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_28
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Profile must be 1\u201332768 bytes"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static varargs fields(Lorg/json/JSONObject;[Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 65
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    goto :goto_d

    :cond_1e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unknown profile field"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_26
    array-length v0, p1

    const/4 v1, 0x0

    :goto_28
    if-ge v1, v0, :cond_4e

    aget-object v2, p1, v1

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_35

    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    :cond_35
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Missing profile field: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4e
    return-void
.end method

.method private static fromJson(Lorg/json/JSONObject;)Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    move-object/from16 v0, p0

    const-string v1, "version"

    invoke-static {v0, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v3, 0x1

    cmp-long v3, v1, v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_12

    move v6, v4

    goto :goto_13

    :cond_12
    move v6, v5

    .line 26
    :goto_13
    const-string v7, "tables"

    const-string v8, "power_levels"

    if-eqz v6, :cond_1c

    move-object/from16 v16, v8

    goto :goto_1e

    :cond_1c
    move-object/from16 v16, v7

    :goto_1e
    const-string v9, "format"

    const-string v10, "version"

    const-string v11, "device"

    const-string v12, "gpu"

    const-string v13, "table"

    const-string v14, "name"

    const-string v15, "source_firmware"

    filled-new-array/range {v9 .. v16}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lio/mesalabs/unica/gpu/GpuProfile;->fields(Lorg/json/JSONObject;[Ljava/lang/String;)V

    .line 27
    const-string v9, "device"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 28
    const-string v10, "dm1q"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_58

    const-string v10, "dm2q"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_58

    const-string v10, "dm3q"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_56

    goto :goto_58

    :cond_56
    move v9, v5

    goto :goto_59

    :cond_58
    :goto_58
    move v9, v4

    .line 29
    :goto_59
    const-string v10, "format"

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    const-string v11, "unica-konabess-profile"

    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_21f

    if-eqz v3, :cond_6f

    const-wide/16 v10, 0x2

    cmp-long v1, v1, v10

    if-nez v1, :cond_21f

    :cond_6f
    if-eqz v9, :cond_21f

    const-string v1, "gpu"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Adreno740v2"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21f

    if-eqz v6, :cond_84

    const-string v1, "kalama-v2-table0"

    goto :goto_86

    :cond_84
    const-string v1, "kalama-v2-bins"

    :goto_86
    const-string v2, "table"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21f

    .line 30
    const/16 v1, 0x1e0

    const/16 v2, 0x100

    const-string v3, "source_firmware"

    const/16 v9, 0x50

    const-string v10, "name"

    const-string v11, "rpmh_level"

    const-string v12, "frequency_hz"

    const-string v13, "index"

    if-eqz v6, :cond_112

    .line 31
    invoke-static {}, Lio/mesalabs/unica/gpu/GpuProfile;->stock()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v6

    invoke-static {v0, v10, v9}, Lio/mesalabs/unica/gpu/GpuProfile;->plain(Lorg/json/JSONObject;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lio/mesalabs/unica/gpu/GpuProfile;->name:Ljava/lang/String;

    invoke-static {v0, v3, v2}, Lio/mesalabs/unica/gpu/GpuProfile;->plain(Lorg/json/JSONObject;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lio/mesalabs/unica/gpu/GpuProfile;->firmware:Ljava/lang/String;

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_10a

    .line 32
    move v2, v5

    :goto_c1
    if-ge v2, v3, :cond_106

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    filled-new-array {v13, v12, v11}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lio/mesalabs/unica/gpu/GpuProfile;->fields(Lorg/json/JSONObject;[Ljava/lang/String;)V

    invoke-static {v7, v13}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v8

    int-to-long v14, v2

    cmp-long v8, v8, v14

    if-nez v8, :cond_fe

    iget-object v8, v6, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object v8, v8, v5

    iget-object v8, v8, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-static {v7, v12}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v9

    iput-wide v9, v8, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    iget-object v8, v6, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object v8, v8, v5

    iget-object v8, v8, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-static {v7, v11, v4, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->bounded(Lorg/json/JSONObject;Ljava/lang/String;II)I

    move-result v7

    iput v7, v8, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    add-int/lit8 v2, v2, 0x1

    goto :goto_c1

    :cond_fe
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad legacy index"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_106
    invoke-virtual {v6}, Lio/mesalabs/unica/gpu/GpuProfile;->validate()V

    return-object v6

    .line 31
    :cond_10a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Legacy profile needs ten levels"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_112
    new-instance v6, Lio/mesalabs/unica/gpu/GpuProfile;

    invoke-direct {v6}, Lio/mesalabs/unica/gpu/GpuProfile;-><init>()V

    invoke-static {v0, v10, v9}, Lio/mesalabs/unica/gpu/GpuProfile;->plain(Lorg/json/JSONObject;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v6, Lio/mesalabs/unica/gpu/GpuProfile;->name:Ljava/lang/String;

    invoke-static {v0, v3, v2}, Lio/mesalabs/unica/gpu/GpuProfile;->plain(Lorg/json/JSONObject;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lio/mesalabs/unica/gpu/GpuProfile;->firmware:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_217

    .line 35
    move v2, v5

    :goto_12f
    if-ge v2, v3, :cond_211

    .line 36
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v9, "id"

    const-string v10, "initial_level"

    const-string v14, "minimum_level"

    filled-new-array {v9, v10, v14, v8}, [Ljava/lang/String;

    move-result-object v15

    invoke-static {v7, v15}, Lio/mesalabs/unica/gpu/GpuProfile;->fields(Lorg/json/JSONObject;[Ljava/lang/String;)V

    invoke-static {v7, v9}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v15

    int-to-long v3, v2

    cmp-long v3, v15, v3

    if-nez v3, :cond_209

    iget-object v3, v6, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object v3, v3, v2

    const/16 v4, 0xe

    invoke-static {v7, v10, v5, v4}, Lio/mesalabs/unica/gpu/GpuProfile;->bounded(Lorg/json/JSONObject;Ljava/lang/String;II)I

    move-result v10

    iput v10, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    invoke-static {v7, v14, v5, v4}, Lio/mesalabs/unica/gpu/GpuProfile;->bounded(Lorg/json/JSONObject;Ljava/lang/String;II)I

    move-result v4

    iput v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    const/4 v10, 0x2

    if-lt v7, v10, :cond_201

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    const/16 v14, 0xf

    if-gt v7, v14, :cond_201

    .line 37
    move v7, v5

    :goto_171
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v7, v14, :cond_1f3

    .line 38
    invoke-virtual {v4, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    const-string v20, "bus_maximum"

    const-string v21, "acd_level"

    const-string v15, "index"

    const-string v16, "frequency_hz"

    const-string v17, "rpmh_level"

    const-string v18, "bus_frequency"

    const-string v19, "bus_minimum"

    filled-new-array/range {v15 .. v21}, [Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lio/mesalabs/unica/gpu/GpuProfile;->fields(Lorg/json/JSONObject;[Ljava/lang/String;)V

    invoke-static {v14, v13}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v15

    move-object/from16 v18, v6

    int-to-long v5, v7

    cmp-long v5, v15, v5

    if-nez v5, :cond_1eb

    new-instance v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-direct {v5}, Lio/mesalabs/unica/gpu/GpuProfile$Row;-><init>()V

    invoke-static {v14, v12}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v9

    iput-wide v9, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    const/4 v9, 0x1

    invoke-static {v14, v11, v9, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->bounded(Lorg/json/JSONObject;Ljava/lang/String;II)I

    move-result v10

    iput v10, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    const-string v10, "bus_frequency"

    move/from16 v16, v2

    invoke-static {v14, v10}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    const-string v1, "bus_minimum"

    invoke-static {v14, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    const-string v1, "bus_maximum"

    invoke-static {v14, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    const-string v1, "acd_level"

    invoke-virtual {v14, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    const/4 v9, 0x1

    xor-int/2addr v2, v9

    iput-boolean v2, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    iget-boolean v2, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v2, :cond_1db

    invoke-static {v14, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->integer(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    :cond_1db
    iget-object v1, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v7, v7, 0x1

    move/from16 v2, v16

    move-object/from16 v6, v18

    const/16 v1, 0x1e0

    const/4 v5, 0x0

    const/4 v10, 0x2

    goto :goto_171

    .line 38
    :cond_1eb
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "GPU row indices must be contiguous"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_1f3
    move/from16 v16, v2

    move-object/from16 v18, v6

    const/4 v9, 0x1

    add-int/lit8 v2, v16, 0x1

    move v4, v9

    const/16 v1, 0x1e0

    const/4 v3, 0x2

    const/4 v5, 0x0

    goto/16 :goto_12f

    .line 36
    :cond_201
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expected 2\u201315 power levels per table"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_209
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "GPU table IDs must be 0 then 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_211
    move-object/from16 v18, v6

    invoke-virtual/range {v18 .. v18}, Lio/mesalabs/unica/gpu/GpuProfile;->validate()V

    return-object v18

    .line 34
    :cond_217
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expected both Samsung GPU tables"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_21f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Profile format or target GPU does not match this device"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static fromTables(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "format"

    const-string v2, "unica-konabess-profile"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "version"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "device"

    const-string v2, "dm1q"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "gpu"

    const-string v2, "Adreno740v2"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "table"

    const-string v2, "kalama-v2-bins"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "source_firmware"

    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "tables"

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->fromJson(Lorg/json/JSONObject;)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p0

    return-object p0
.end method

.method static integer(Lorg/json/JSONObject;Ljava/lang/String;)J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 66
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_26

    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_d

    goto :goto_26

    :cond_d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Expected whole number: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_26
    :goto_26
    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method static object(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 59
    nop

    .line 60
    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    move v3, v2

    move v4, v3

    :goto_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_56

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x22

    const/4 v7, 0x1

    if-eqz v3, :cond_23

    if-eqz v4, :cond_19

    move v4, v0

    goto :goto_4b

    :cond_19
    const/16 v8, 0x5c

    if-ne v5, v8, :cond_1f

    move v4, v7

    goto :goto_4b

    :cond_1f
    if-ne v5, v6, :cond_4b

    move v3, v0

    goto :goto_4b

    :cond_23
    if-ne v5, v6, :cond_27

    move v3, v7

    goto :goto_4b

    :cond_27
    const/16 v6, 0x7b

    if-eq v5, v6, :cond_45

    const/16 v6, 0x5b

    if-ne v5, v6, :cond_30

    goto :goto_45

    :cond_30
    const/16 v6, 0x7d

    if-eq v5, v6, :cond_38

    const/16 v6, 0x5d

    if-ne v5, v6, :cond_4b

    :cond_38
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_3d

    goto :goto_4b

    :cond_3d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unbalanced profile JSON"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_45
    :goto_45
    add-int/lit8 v2, v2, 0x1

    const/16 v5, 0xc

    if-gt v2, v5, :cond_4e

    :cond_4b
    :goto_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_4e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Profile JSON is too deeply nested"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 61
    :cond_56
    if-nez v2, :cond_78

    if-nez v3, :cond_78

    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p0

    instance-of v1, p0, Lorg/json/JSONObject;

    if-eqz v1, :cond_70

    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextClean()C

    move-result v0

    if-nez v0, :cond_70

    check-cast p0, Lorg/json/JSONObject;

    return-object p0

    :cond_70
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Expected one JSON profile"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_78
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Truncated profile JSON"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static outsideStock(I)Z
    .registers 6

    .line 18
    sget-object v0, Lio/mesalabs/unica/gpu/GpuProfile;->STOCK_LEVELS:[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_5
    if-ge v3, v1, :cond_f

    aget v4, v0, v3

    if-ne p0, v4, :cond_c

    return v2

    :cond_c
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_f
    const/4 p0, 0x1

    return p0
.end method

.method static parse([B)Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 55
    invoke-static {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->decode([B)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "konabess://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-static {p0}, Lio/mesalabs/unica/gpu/KonaProfileImport;->parse(Ljava/lang/String;)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p0

    return-object p0

    .line 56
    :cond_15
    invoke-static {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->object(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->fromJson(Lorg/json/JSONObject;)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p0

    return-object p0
.end method

.method private static plain(Lorg/json/JSONObject;Ljava/lang/String;I)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_2d

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, p2, :cond_2d

    const/4 p1, 0x0

    :goto_11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-ge p1, p2, :cond_2c

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-static {p2}, Ljava/lang/Character;->isISOControl(C)Z

    move-result p2

    if-nez p2, :cond_24

    add-int/lit8 p1, p1, 0x1

    goto :goto_11

    :cond_24
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Control characters in profile text"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2c
    return-object p0

    :cond_2d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid profile text: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static stock()Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    new-instance v0, Lorg/json/JSONArray;

    const-string v1, "[{\"id\":0,\"initial_level\":8,\"minimum_level\":8,\"power_levels\":[{\"index\":0,\"frequency_hz\":719000000,\"rpmh_level\":224,\"bus_frequency\":9,\"bus_minimum\":9,\"bus_maximum\":9,\"acd_level\":2284740605},{\"index\":1,\"frequency_hz\":680000000,\"rpmh_level\":192,\"bus_frequency\":7,\"bus_minimum\":5,\"bus_maximum\":9,\"acd_level\":2284740605},{\"index\":2,\"frequency_hz\":615000000,\"rpmh_level\":144,\"bus_frequency\":6,\"bus_minimum\":3,\"bus_maximum\":7,\"acd_level\":2821677053},{\"index\":3,\"frequency_hz\":550000000,\"rpmh_level\":128,\"bus_frequency\":3,\"bus_minimum\":2,\"bus_maximum\":7,\"acd_level\":3760742397},{\"index\":4,\"frequency_hz\":475000000,\"rpmh_level\":80,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":5,\"acd_level\":3760742397},{\"index\":5,\"frequency_hz\":401000000,\"rpmh_level\":64,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":4,\"acd_level\":3224002557},{\"index\":6,\"frequency_hz\":348000000,\"rpmh_level\":60,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":3,\"acd_level\":3760939005},{\"index\":7,\"frequency_hz\":295000000,\"rpmh_level\":56,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":3,\"acd_level\":3761070077},{\"index\":8,\"frequency_hz\":220000000,\"rpmh_level\":52,\"bus_frequency\":1,\"bus_minimum\":1,\"bus_maximum\":3,\"acd_level\":3224330237},{\"index\":9,\"frequency_hz\":124800000,\"rpmh_level\":52,\"bus_frequency\":1,\"bus_minimum\":1,\"bus_maximum\":1,\"acd_level\":null}]},{\"id\":1,\"initial_level\":7,\"minimum_level\":7,\"power_levels\":[{\"index\":0,\"frequency_hz\":680000000,\"rpmh_level\":192,\"bus_frequency\":9,\"bus_minimum\":9,\"bus_maximum\":9,\"acd_level\":2284740605},{\"index\":1,\"frequency_hz\":615000000,\"rpmh_level\":144,\"bus_frequency\":6,\"bus_minimum\":3,\"bus_maximum\":9,\"acd_level\":2821677053},{\"index\":2,\"frequency_hz\":550000000,\"rpmh_level\":128,\"bus_frequency\":3,\"bus_minimum\":2,\"bus_maximum\":7,\"acd_level\":3760742397},{\"index\":3,\"frequency_hz\":475000000,\"rpmh_level\":80,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":5,\"acd_level\":3760742397},{\"index\":4,\"frequency_hz\":401000000,\"rpmh_level\":64,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":4,\"acd_level\":3224002557},{\"index\":5,\"frequency_hz\":348000000,\"rpmh_level\":60,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":3,\"acd_level\":3760939005},{\"index\":6,\"frequency_hz\":295000000,\"rpmh_level\":56,\"bus_frequency\":3,\"bus_minimum\":1,\"bus_maximum\":3,\"acd_level\":3761070077},{\"index\":7,\"frequency_hz\":220000000,\"rpmh_level\":52,\"bus_frequency\":1,\"bus_minimum\":1,\"bus_maximum\":3,\"acd_level\":3224330237},{\"index\":8,\"frequency_hz\":124800000,\"rpmh_level\":52,\"bus_frequency\":1,\"bus_minimum\":1,\"bus_maximum\":1,\"acd_level\":null}]}]"

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const-string v1, "My GPU profile"

    const-string v2, "Pinned Samsung S918BXXUAZZI8 table defaults"

    invoke-static {v1, v2, v0}, Lio/mesalabs/unica/gpu/GpuProfile;->fromTables(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    return-object v0
.end method

.method static stockFrequency(IJ)Z
    .registers 5

    .line 19
    :try_start_0
    invoke-static {}, Lio/mesalabs/unica/gpu/GpuProfile;->stock()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    iget-object v0, v0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object p0, v0, p0

    iget-object p0, p0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    iget-wide v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1c} :catch_24

    cmp-long v0, v0, p1

    if-nez v0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_22
    const/4 p0, 0x0

    return p0

    :catch_24
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method


# virtual methods
.method copy()Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 52
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->encode()[B

    move-result-object v0

    invoke-static {v0}, Lio/mesalabs/unica/gpu/GpuProfile;->parse([B)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    return-object v0
.end method

.method encode()[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->validate()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "format"

    const-string v2, "unica-konabess-profile"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "version"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "device"

    const-string v3, "dm1q"

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "gpu"

    const-string v3, "Adreno740v2"

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "table"

    const-string v3, "kalama-v2-bins"

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "name"

    iget-object v3, p0, Lio/mesalabs/unica/gpu/GpuProfile;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "source_firmware"

    iget-object v3, p0, Lio/mesalabs/unica/gpu/GpuProfile;->firmware:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "tables"

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->tablesJson()Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    return-object v0
.end method

.method payload(Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    .line 53
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuProfile;->validate()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    array-length v1, p1

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v1, :cond_96

    aget-object v3, p1, v2

    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v3, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_39
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_92

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v7, :cond_8c

    iget-wide v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    goto :goto_8e

    :cond_8c
    const-wide/16 v7, 0x0

    :goto_8e
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    goto :goto_39

    :cond_92
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_c

    :cond_96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method tablesJson()Lorg/json/JSONArray;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 50
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    const/4 v3, 0x2

    if-ge v2, v3, :cond_98

    iget-object v3, p0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object v3, v3, v2

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    move v5, v1

    :goto_14
    iget-object v6, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_70

    iget-object v6, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "index"

    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "frequency_hz"

    iget-wide v9, v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-virtual {v7, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "rpmh_level"

    iget v9, v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "bus_frequency"

    iget-wide v9, v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    invoke-virtual {v7, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "bus_minimum"

    iget-wide v9, v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    invoke-virtual {v7, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "bus_maximum"

    iget-wide v9, v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v7, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v7

    iget-boolean v8, v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v8, :cond_62

    iget-wide v8, v6, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    goto :goto_64

    :cond_62
    sget-object v6, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_64
    const-string v8, "acd_level"

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    :cond_70
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "id"

    invoke-virtual {v5, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "initial_level"

    iget v7, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "minimum_level"

    iget v3, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-virtual {v5, v6, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "power_levels"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7

    :cond_98
    return-object v0
.end method

.method validate()V
    .registers 20

    .line 43
    nop

    .line 44
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    array-length v1, v0

    const/16 v2, 0x168

    const/4 v4, 0x0

    :goto_9
    if-ge v4, v1, :cond_12e

    aget-object v5, v0, v4

    iget-object v6, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x2

    if-lt v6, v7, :cond_126

    iget-object v6, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/16 v7, 0xf

    if-gt v6, v7, :cond_126

    iget v6, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    if-ltz v6, :cond_126

    iget v6, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    if-ltz v6, :cond_126

    iget v6, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    iget-object v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_126

    iget v6, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    iget-object v7, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_126

    .line 45
    const-wide v6, 0x7fffffffffffffffL

    const/4 v8, 0x0

    :goto_42
    iget-object v9, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_121

    iget-object v9, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    add-int/lit8 v10, v8, 0x1

    iget-object v11, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ne v10, v11, :cond_86

    iget-wide v11, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    const-wide/16 v13, 0x9

    cmp-long v11, v11, v13

    if-gtz v11, :cond_65

    goto :goto_86

    :cond_65
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Final GPU row bypasses the driver bus clamp: bus maximum must be 0\u20139 (got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_86
    :goto_86
    iget-wide v11, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    const-wide/16 v13, 0x0

    cmp-long v11, v11, v13

    if-lez v11, :cond_108

    iget-wide v11, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    const-wide v15, 0xffffffffL

    cmp-long v11, v11, v15

    if-gtz v11, :cond_108

    iget-wide v11, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    cmp-long v6, v11, v6

    if-gez v6, :cond_108

    iget v6, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    const/4 v7, 0x1

    if-lt v6, v7, :cond_108

    iget v6, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    const/16 v11, 0x1e0

    if-gt v6, v11, :cond_108

    iget-wide v11, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    cmp-long v6, v11, v13

    if-ltz v6, :cond_108

    iget-wide v11, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    move v6, v4

    iget-wide v3, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    cmp-long v3, v11, v3

    if-gtz v3, :cond_108

    iget-wide v3, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    iget-wide v11, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    cmp-long v3, v3, v11

    if-gtz v3, :cond_108

    iget-wide v3, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    cmp-long v3, v3, v15

    if-gtz v3, :cond_108

    iget-wide v3, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    cmp-long v3, v3, v13

    if-ltz v3, :cond_108

    iget-wide v3, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    cmp-long v3, v3, v15

    if-gtz v3, :cond_108

    iget-wide v3, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "qcom,gpu-pwrlevel@"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v8, v7

    add-int/lit8 v8, v8, 0x3

    div-int/lit8 v8, v8, 0x4

    mul-int/lit8 v8, v8, 0x4

    add-int/lit8 v8, v8, 0x8

    iget-boolean v7, v9, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v7, :cond_fb

    const/4 v7, 0x7

    goto :goto_fc

    :cond_fb
    const/4 v7, 0x6

    :goto_fc
    mul-int/lit8 v7, v7, 0x10

    add-int/2addr v8, v7

    add-int/2addr v2, v8

    move-wide/from16 v17, v3

    move v4, v6

    move-wide/from16 v6, v17

    move v8, v10

    goto/16 :goto_42

    :cond_108
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid GPU frequency, RPMh request, bus ordering or ACD cell at level "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_121
    move v6, v4

    add-int/lit8 v4, v6, 0x1

    goto/16 :goto_9

    :cond_126
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Table count or initial/minimum index is invalid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_12e
    const/16 v0, 0xbac

    if-gt v2, v0, :cond_133

    .line 48
    return-void

    .line 47
    :cond_133
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Tables exceed the original FDT space. Remove a level before adding another."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
