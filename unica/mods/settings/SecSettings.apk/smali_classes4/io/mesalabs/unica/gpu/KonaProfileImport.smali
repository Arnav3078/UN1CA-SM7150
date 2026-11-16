.class final Lio/mesalabs/unica/gpu/KonaProfileImport;
.super Ljava/lang/Object;
.source "KonaProfileImport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/mesalabs/unica/gpu/KonaProfileImport$Node;
    }
.end annotation


# instance fields
.field private position:I

.field private final tokens:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .registers 6

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    .line 15
    const-string v0, "\\s+|0[xX][0-9a-fA-F]+|[0-9]+|[A-Za-z_#][A-Za-z0-9_,#@-]*|[{}=<>;]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const/4 v1, 0x0

    .line 16
    :goto_15
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_57

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    if-ne v2, v1, :cond_4f

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3c

    iget-object v2, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3c
    iget-object v2, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x2000

    if-gt v2, v3, :cond_47

    goto :goto_15

    :cond_47
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Too many device-tree tokens"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unsupported content in KonaBess device-tree data"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_57
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-ne v1, p1, :cond_5e

    .line 17
    return-void

    .line 16
    :cond_5e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid device-tree suffix"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static varargs allowed(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;[Ljava/lang/String;)V
    .registers 4

    .line 32
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object p0, p0, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->properties:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    goto :goto_13

    :cond_26
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unsupported GPU property: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3f
    return-void
.end method

.method private static cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J
    .registers 4

    .line 31
    iget-object p0, p0, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->properties:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [J

    if-eqz p0, :cond_12

    array-length v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    const/4 p1, 0x0

    aget-wide p0, p0, p1

    return-wide p0

    :cond_12
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing or malformed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private expect(Ljava/lang/String;)V
    .registers 5

    .line 19
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/KonaProfileImport;->next()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " in KonaBess table"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private next()Ljava/lang/String;
    .registers 4

    .line 18
    iget v0, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->position:I

    iget-object v1, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_19

    iget-object v0, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    iget v1, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->position:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Truncated KonaBess table"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private node(I)Lio/mesalabs/unica/gpu/KonaProfileImport$Node;
    .registers 12

    .line 21
    const/4 v0, 0x1

    if-gt p1, v0, :cond_115

    new-instance v1, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;-><init>(Lio/mesalabs/unica/gpu/KonaProfileImport$1;)V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/KonaProfileImport;->next()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->name:Ljava/lang/String;

    const-string v2, "{"

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/KonaProfileImport;->expect(Ljava/lang/String;)V

    .line 22
    :goto_14
    iget-object v3, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    iget v4, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->position:I

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "}"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v5, ";"

    if-nez v3, :cond_10e

    .line 23
    iget v3, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->position:I

    add-int/2addr v3, v0

    iget-object v4, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_106

    .line 24
    iget-object v3, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    iget v4, p0, Lio/mesalabs/unica/gpu/KonaProfileImport;->position:I

    add-int/2addr v4, v0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_62

    iget-object v3, v1, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->children:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0xf

    if-ge v3, v4, :cond_5a

    iget-object v3, v1, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->children:Ljava/util/List;

    add-int/lit8 v4, p1, 0x1

    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/KonaProfileImport;->node(I)Lio/mesalabs/unica/gpu/KonaProfileImport$Node;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_14

    :cond_5a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "GPU table exceeds 15 levels"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 25
    :cond_62
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/KonaProfileImport;->next()Ljava/lang/String;

    move-result-object v3

    const-string v4, "="

    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/KonaProfileImport;->expect(Ljava/lang/String;)V

    const-string v4, "<"

    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/KonaProfileImport;->expect(Ljava/lang/String;)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 26
    :goto_75
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/KonaProfileImport;->next()Ljava/lang/String;

    move-result-object v6

    const-string v7, ">"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d9

    .line 27
    const-string v7, "0[xX][0-9a-fA-F]+|[0-9]+"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v8, 0xc

    if-gt v7, v8, :cond_d1

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/16 v8, 0x10

    if-ge v7, v8, :cond_d1

    const-string v7, "0x"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_af

    const-string v7, "0X"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_aa

    goto :goto_af

    :cond_aa
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    goto :goto_b8

    :cond_af
    :goto_af
    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v6

    :goto_b8
    const-wide v8, 0xffffffffL

    cmp-long v8, v6, v8

    if-gtz v8, :cond_c9

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_75

    :cond_c9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Device-tree cell overflows u32"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_d1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid device-tree cell"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_d9
    invoke-direct {p0, v5}, Lio/mesalabs/unica/gpu/KonaProfileImport;->expect(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v6, v5, [J

    const/4 v7, 0x0

    :goto_e3
    if-ge v7, v5, :cond_f4

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    aput-wide v8, v6, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_e3

    :cond_f4
    iget-object v4, v1, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->properties:Ljava/util/Map;

    invoke-interface {v4, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_fe

    .line 29
    goto/16 :goto_14

    .line 28
    :cond_fe
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Duplicate GPU property"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 23
    :cond_106
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Truncated GPU property"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 29
    :cond_10e
    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/KonaProfileImport;->expect(Ljava/lang/String;)V

    invoke-direct {p0, v5}, Lio/mesalabs/unica/gpu/KonaProfileImport;->expect(Ljava/lang/String;)V

    return-object v1

    .line 21
    :cond_115
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unexpected nested GPU node"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static parse(Ljava/lang/String;)Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 34
    :try_start_0
    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v0

    const-string v1, "konabess://"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    move-object/from16 v2, p0

    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_14
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_14} :catch_2da

    .line 35
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v2, Ljava/util/zip/GZIPInputStream;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v2, v3}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 v0, 0x1000

    :try_start_25
    new-array v0, v0, [B

    :goto_27
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-eq v3, v4, :cond_45

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    add-int/2addr v4, v3

    const v6, 0x8000

    if-gt v4, v6, :cond_3d

    invoke-virtual {v1, v0, v5, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_27

    :cond_3d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expanded KonaBess profile exceeds 32 KiB"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_45
    .catchall {:try_start_25 .. :try_end_45} :catchall_2cf

    :cond_45
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 36
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-static {v0}, Lio/mesalabs/unica/gpu/GpuProfile;->decode([B)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/mesalabs/unica/gpu/GpuProfile;->object(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 37
    new-instance v1, Ljava/util/HashSet;

    const-string v17, "name"

    const-string v18, "board"

    const-string v6, "chip"

    const-string v7, "desc"

    const-string v8, "freq"

    const-string v9, "volt"

    const-string v10, "model"

    const-string v11, "brand"

    const-string v12, "id"

    const-string v13, "version"

    const-string v14, "fingerprint"

    const-string v15, "manufacturer"

    const-string v16, "device"

    filled-new-array/range {v6 .. v18}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :goto_7f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_98

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_90

    goto :goto_7f

    :cond_90
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown KonaBess export field"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_98
    const-string v1, "chip"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "kalama"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c7

    .line 39
    const-string v1, "volt"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c3

    const-string v2, ""

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bb

    goto :goto_c3

    :cond_bb
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Separate voltage/OPP tables are not supported for this Samsung firmware"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_c3
    :goto_c3
    const-string v1, "freq"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_2bf

    new-instance v2, Lio/mesalabs/unica/gpu/KonaProfileImport;

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v1}, Lio/mesalabs/unica/gpu/KonaProfileImport;-><init>(Ljava/lang/String;)V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 41
    move v3, v5

    :goto_da
    const/4 v4, 0x2

    if-ge v3, v4, :cond_292

    .line 42
    invoke-direct {v2, v5}, Lio/mesalabs/unica/gpu/KonaProfileImport;->node(I)Lio/mesalabs/unica/gpu/KonaProfileImport$Node;

    move-result-object v6

    iget-object v7, v6, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->name:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "qcom,gpu-pwrlevels-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_28a

    const-string v7, "qcom,initial-pwrlevel"

    const-string v8, "qcom,initial-min-pwrlevel"

    const-string v9, "qcom,sku-codes"

    const-string v10, "#size-cells"

    const-string v11, "#address-cells"

    filled-new-array {v7, v8, v9, v10, v11}, [Ljava/lang/String;

    move-result-object v12

    invoke-static {v6, v12}, Lio/mesalabs/unica/gpu/KonaProfileImport;->allowed(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;[Ljava/lang/String;)V

    .line 43
    const-wide/16 v12, 0x0

    const/4 v14, 0x1

    if-nez v3, :cond_150

    const/16 v15, 0xa

    new-array v15, v15, [J

    const-wide/16 v16, 0x3

    aput-wide v16, v15, v5

    const-wide/16 v16, 0x6

    aput-wide v16, v15, v14

    const-wide/32 v16, 0x300f1

    aput-wide v16, v15, v4

    const/4 v4, 0x3

    const-wide/32 v16, 0x300f3

    aput-wide v16, v15, v4

    const/4 v4, 0x4

    const-wide/32 v16, 0x500f1

    aput-wide v16, v15, v4

    const/4 v4, 0x5

    const-wide/32 v16, 0x500f3

    aput-wide v16, v15, v4

    const/4 v4, 0x6

    const-wide/32 v16, 0x700f1

    aput-wide v16, v15, v4

    const/4 v4, 0x7

    const-wide/32 v16, 0x700f2

    aput-wide v16, v15, v4

    const/16 v4, 0x8

    const-wide/32 v16, 0x700fe

    aput-wide v16, v15, v4

    const/16 v4, 0x9

    const-wide/32 v16, 0x700ff

    aput-wide v16, v15, v4

    goto :goto_154

    :cond_150
    new-array v15, v14, [J

    aput-wide v12, v15, v5

    .line 44
    :goto_154
    iget-object v4, v6, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->properties:Ljava/util/Map;

    invoke-interface {v4, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [J

    invoke-static {v4, v15}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v4

    if-eqz v4, :cond_282

    invoke-static {v6, v10}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v9

    cmp-long v4, v9, v12

    if-nez v4, :cond_282

    invoke-static {v6, v11}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v9

    const-wide/16 v11, 0x1

    cmp-long v4, v9, v11

    if-nez v4, :cond_282

    .line 45
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    move v9, v5

    :goto_17a
    iget-object v10, v6, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->children:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_242

    .line 46
    iget-object v10, v6, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->children:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;

    iget-object v11, v10, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->name:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "qcom,gpu-pwrlevel@"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_23a

    iget-object v11, v10, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->children:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_23a

    const-string v11, "reg"

    invoke-static {v10, v11}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v11

    move/from16 p0, v14

    int-to-long v14, v9

    cmp-long v11, v11, v14

    if-nez v11, :cond_23a

    const-string v17, "qcom,bus-max"

    const-string v18, "qcom,acd-level"

    const-string v12, "reg"

    const-string v13, "qcom,gpu-freq"

    const-string v14, "qcom,level"

    const-string v15, "qcom,bus-freq"

    const-string v16, "qcom,bus-min"

    filled-new-array/range {v12 .. v18}, [Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lio/mesalabs/unica/gpu/KonaProfileImport;->allowed(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;[Ljava/lang/String;)V

    .line 47
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "index"

    invoke-virtual {v11, v12, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "qcom,gpu-freq"

    invoke-static {v10, v12}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v12

    const-string v14, "frequency_hz"

    invoke-virtual {v11, v14, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "qcom,level"

    invoke-static {v10, v12}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v12

    const-string v14, "rpmh_level"

    invoke-virtual {v11, v14, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "qcom,bus-freq"

    invoke-static {v10, v12}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v12

    const-string v14, "bus_frequency"

    invoke-virtual {v11, v14, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "qcom,bus-min"

    invoke-static {v10, v12}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v12

    const-string v14, "bus_minimum"

    invoke-virtual {v11, v14, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "qcom,bus-max"

    invoke-static {v10, v12}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v12

    const-string v14, "bus_maximum"

    invoke-virtual {v11, v14, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v11

    iget-object v12, v10, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->properties:Ljava/util/Map;

    const-string v13, "qcom,acd-level"

    invoke-interface {v12, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_229

    invoke-static {v10, v13}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_22b

    :cond_229
    sget-object v10, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_22b
    const-string v12, "acd_level"

    invoke-virtual {v11, v12, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v4, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 45
    add-int/lit8 v9, v9, 0x1

    move/from16 v14, p0

    goto/16 :goto_17a

    .line 46
    :cond_23a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Non-contiguous KonaBess GPU index"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_242
    move/from16 p0, v14

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "id"

    invoke-virtual {v9, v10, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "initial_level"

    invoke-static {v6, v7}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v11

    invoke-virtual {v9, v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v7

    iget-object v9, v6, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->properties:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_266

    invoke-static {v6, v8}, Lio/mesalabs/unica/gpu/KonaProfileImport;->cell(Lio/mesalabs/unica/gpu/KonaProfileImport$Node;Ljava/lang/String;)J

    move-result-wide v8

    goto :goto_26f

    :cond_266
    iget-object v6, v6, Lio/mesalabs/unica/gpu/KonaProfileImport$Node;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    int-to-long v8, v6

    :goto_26f
    const-string v6, "minimum_level"

    invoke-virtual {v7, v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "power_levels"

    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 41
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_da

    .line 44
    :cond_282
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "KonaBess SKU selection differs from this Samsung firmware"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_28a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expected GPU tables 0 then 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_292
    iget v3, v2, Lio/mesalabs/unica/gpu/KonaProfileImport;->position:I

    iget-object v2, v2, Lio/mesalabs/unica/gpu/KonaProfileImport;->tokens:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v3, v2, :cond_2b7

    const-string v2, "desc"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_2af

    check-cast v0, Ljava/lang/String;

    const-string v2, "Unknown; imported upstream KonaBess export"

    invoke-static {v0, v2, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->fromTables(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    return-object v0

    :cond_2af
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid KonaBess description"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2b7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unexpected extra KonaBess data"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_2bf
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Missing KonaBess frequency table"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_2c7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "This KonaBess export is not for kalama"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :catchall_2cf
    move-exception v0

    move-object v1, v0

    :try_start_2d1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2d4
    .catchall {:try_start_2d1 .. :try_end_2d4} :catchall_2d5

    goto :goto_2d9

    :catchall_2d5
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2d9
    throw v1

    .line 34
    :catch_2da
    move-exception v0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid KonaBess Base64 data"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
