.class final Lio/mesalabs/unica/gpu/GpuTransport;
.super Ljava/lang/Object;
.source "GpuTransport.java"


# static fields
.field private static final BASE:Ljava/io/File;

.field static final ROLLBACK:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 10
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/misc/unica_gpu"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lio/mesalabs/unica/gpu/GpuTransport;->BASE:Ljava/io/File;

    .line 11
    new-instance v0, Ljava/io/File;

    const-string v1, "/cache/unica-gpu/rollback.zip"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lio/mesalabs/unica/gpu/GpuTransport;->ROLLBACK:Ljava/io/File;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static read(Ljava/io/File;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :try_start_5
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_41

    .line 14
    const/16 v1, 0x1000

    :try_start_c
    new-array v1, v1, [B

    :goto_e
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2a

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    const/16 v3, 0x4000

    if-gt v2, v3, :cond_22

    goto :goto_e

    :cond_22
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Oversized GPU response"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2a
    const-string v1, "UTF-8"

    invoke-virtual {p0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_30
    .catchall {:try_start_c .. :try_end_30} :catchall_37

    .line 15
    :try_start_30
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_33
    .catchall {:try_start_30 .. :try_end_33} :catchall_41

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 14
    return-object v1

    .line 13
    :catchall_37
    move-exception v1

    :try_start_38
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_3c

    goto :goto_40

    :catchall_3c
    move-exception p0

    :try_start_3d
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_40
    throw v1
    :try_end_41
    .catchall {:try_start_3d .. :try_end_41} :catchall_41

    :catchall_41
    move-exception p0

    :try_start_42
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_46

    goto :goto_4a

    :catchall_46
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4a
    throw p0
.end method

.method static declared-synchronized request(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v1, Lio/mesalabs/unica/gpu/GpuTransport;

    monitor-enter v1

    .line 18
    :try_start_3
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v0

    const/16 v2, 0x3e8

    if-ne v0, v2, :cond_190

    .line 19
    const-string v3, "status"

    const-string v4, "backup"

    const-string v5, "renew"

    const-string v6, "restart"

    const-string v7, "exported"

    const-string v8, "apply"

    const-string v9, "apply2"

    const-string v10, "restore"

    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_188

    .line 20
    const-string v0, "[0-9a-f ]{0,4096}"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_180

    .line 21
    new-instance v0, Ljava/io/File;

    sget-object v2, Lio/mesalabs/unica/gpu/GpuTransport;->BASE:Ljava/io/File;

    const-string v3, "requests"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    const-string v3, "request"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    sget-object v4, Lio/mesalabs/unica/gpu/GpuTransport;->BASE:Ljava/io/File;

    const-string v5, "responses/response.json"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 22
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_53

    .line 23
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 25
    :cond_53
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_178

    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v4

    if-eqz v4, :cond_178

    .line 26
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/io/File;

    const-string v6, "request.tmp"

    invoke-direct {v5, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 27
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_73
    .catchall {:try_start_3 .. :try_end_73} :catchall_198

    :try_start_73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, " "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "UTF-8"

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v6, p0}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_aa
    .catchall {:try_start_73 .. :try_end_aa} :catchall_16c

    :try_start_aa
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_ad
    .catchall {:try_start_aa .. :try_end_ad} :catchall_198

    .line 28
    :try_start_ad
    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x1b6

    invoke-static {p0, p1}, Landroid/system/Os;->chmod(Ljava/lang/String;I)V
    :try_end_b6
    .catch Ljava/lang/Exception; {:try_start_ad .. :try_end_b6} :catch_b7
    .catchall {:try_start_ad .. :try_end_b6} :catchall_198

    goto :goto_b8

    :catch_b7
    move-exception v0

    .line 29
    :goto_b8
    :try_start_b8
    invoke-virtual {v5}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object p0

    invoke-virtual {v2}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object p1

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/nio/file/CopyOption;

    sget-object v2, Ljava/nio/file/StandardCopyOption;->ATOMIC_MOVE:Ljava/nio/file/StandardCopyOption;

    const/4 v5, 0x0

    aput-object v2, v0, v5

    sget-object v2, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    const/4 v6, 0x1

    aput-object v2, v0, v6

    invoke-static {p0, p1, v0}, Ljava/nio/file/Files;->move(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 30
    const-string p0, "android.os.SystemProperties"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string p1, "set"

    const-class v0, Ljava/lang/String;

    const-class v2, Ljava/lang/String;

    filled-new-array {v0, v2}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    .line 31
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    const-wide/16 v8, 0xfa0

    add-long/2addr v6, v8

    const-wide/16 v8, 0x0

    .line 32
    :goto_ed
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    cmp-long p1, v10, v6

    if-gez p1, :cond_164

    .line 33
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p1
    :try_end_f9
    .catchall {:try_start_b8 .. :try_end_f9} :catchall_198

    if-eqz p1, :cond_12e

    .line 35
    :try_start_fb
    new-instance p1, Lorg/json/JSONObject;

    invoke-static {v3}, Lio/mesalabs/unica/gpu/GpuTransport;->read(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 36
    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12d

    .line 37
    const-string v0, "result"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 38
    const-string v0, "error"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0
    :try_end_11c
    .catch Ljava/lang/Exception; {:try_start_fb .. :try_end_11c} :catch_12c
    .catchall {:try_start_fb .. :try_end_11c} :catchall_198

    if-nez v0, :cond_120

    .line 39
    monitor-exit v1

    return-object p1

    .line 38
    :cond_120
    :try_start_120
    new-instance v0, Ljava/io/IOException;

    const-string v2, "error"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_120 .. :try_end_12c} :catch_12c
    .catchall {:try_start_120 .. :try_end_12c} :catchall_198

    .line 41
    :catch_12c
    move-exception v0

    :cond_12d
    nop

    .line 43
    :cond_12e
    :try_start_12e
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    .line 44
    cmp-long p1, v10, v8

    if-ltz p1, :cond_15e

    .line 45
    const-string p1, "sys.unica.gpu.request"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v2, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-wide/16 v8, 0x3e8

    add-long/2addr v10, v8

    move v5, v2

    move-wide v8, v10

    .line 48
    :cond_15e
    const-wide/16 v10, 0x96

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    .line 49
    goto :goto_ed

    .line 50
    :cond_164
    new-instance p0, Ljava/io/IOException;

    const-string p1, "GPU worker not responding. Tap \'Refresh\' or verify daemon service."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_16c
    .catchall {:try_start_12e .. :try_end_16c} :catchall_198

    .line 27
    :catchall_16c
    move-exception v0

    move-object p0, v0

    :try_start_16e
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_171
    .catchall {:try_start_16e .. :try_end_171} :catchall_172

    goto :goto_177

    :catchall_172
    move-exception v0

    move-object p1, v0

    :try_start_174
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_177
    throw p0

    .line 25
    :cond_178
    new-instance p0, Ljava/io/IOException;

    const-string p1, "GPU service directory is not accessible. Run with root or update ROM."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 20
    :cond_180
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid GPU request"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 19
    :cond_188
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid operation"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 18
    :cond_190
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Available to the device owner\'s Settings only"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 17
    :catchall_198
    move-exception v0

    move-object p0, v0

    monitor-exit v1
    :try_end_19b
    .catchall {:try_start_174 .. :try_end_19b} :catchall_198

    throw p0
.end method
