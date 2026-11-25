.class final Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# static fields
.field static final FORMAT_VERSION:I = 0x1

.field static final MAX_ENTRIES:I = 0x3e8


# instance fields
.field public final mCertDigest:[B

.field public final mPackageName:Ljava/lang/String;

.field public final mRestoredAtMillis:J


# direct methods
.method public constructor <init>(Ljava/lang/String;[BJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mPackageName:Ljava/lang/String;

    iput-object p2, p0, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mCertDigest:[B

    iput-wide p3, p0, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mRestoredAtMillis:J

    return-void
.end method

.method public static readEntries(Ljava/io/InputStream;)Ljava/util/List;
    .locals 10

    invoke-static {p0}, Landroid/util/Xml;->resolvePullParser(Ljava/io/InputStream;)Lcom/android/modules/utils/TypedXmlPullParser;

    move-result-object p0

    const-string/jumbo v0, "app-lock-backup"

    invoke-static {p0, v0}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    const/4 v0, 0x0

    const-string/jumbo v1, "version"

    const/4 v2, 0x1

    invoke-interface {p0, v0, v1, v2}, Lcom/android/modules/utils/TypedXmlPullParser;->getAttributeInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    if-lt v1, v2, :cond_6

    if-gt v1, v2, :cond_6

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Landroid/util/ArraySet;

    invoke-direct {v2}, Landroid/util/ArraySet;-><init>()V

    invoke-interface {p0}, Lcom/android/modules/utils/TypedXmlPullParser;->getDepth()I

    move-result v3

    :goto_0
    invoke-static {p0, v3}, Lcom/android/internal/util/XmlUtils;->nextElementWithin(Lorg/xmlpull/v1/XmlPullParser;I)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string/jumbo v4, "pkg"

    invoke-interface {p0}, Lcom/android/modules/utils/TypedXmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/16 v5, 0x3e8

    const-string v6, "AppLockPackageHelper"

    if-lt v4, v5, :cond_0

    const-string p0, "Ignoring App Lock backup entries over the limit of 1000"

    invoke-static {v6, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    const-string/jumbo v4, "name"

    invoke-interface {p0, v0, v4}, Lcom/android/modules/utils/TypedXmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "cert-digest"

    invoke-interface {p0, v0, v5, v0}, Lcom/android/modules/utils/TypedXmlPullParser;->getAttributeBytesHex(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object v5

    const-string/jumbo v7, "restored-at"

    const-wide/16 v8, 0x0

    invoke-interface {p0, v0, v7, v8, v9}, Lcom/android/modules/utils/TypedXmlPullParser;->getAttributeLong(Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v7

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    if-eqz v5, :cond_3

    array-length v9, v5

    if-nez v9, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v2, v4}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    const-string/jumbo v4, "Skipping duplicate App Lock backup entry"

    invoke-static {v6, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_2
    new-instance v6, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;

    invoke-direct {v6, v4, v5, v7, v8}, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;-><init>(Ljava/lang/String;[BJ)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    :goto_1
    const-string/jumbo v4, "Skipping malformed App Lock backup entry"

    invoke-static {v6, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_2
    invoke-static {p0}, Lcom/android/internal/util/XmlUtils;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    :cond_5
    return-object v1

    :cond_6
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string/jumbo v0, "Unsupported App Lock backup version: "

    invoke-static {v1, v0}, Landroid/frameworks/vibrator/VibrationParam$1$$ExternalSyntheticOutline0;->m(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static writeEntries(Ljava/io/OutputStream;Ljava/util/Collection;)V
    .locals 8

    invoke-static {}, Landroid/util/Xml;->newFastSerializer()Lcom/android/modules/utils/TypedXmlSerializer;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Lcom/android/modules/utils/TypedXmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p0}, Lcom/android/modules/utils/TypedXmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string/jumbo p0, "app-lock-backup"

    invoke-interface {v0, v1, p0}, Lcom/android/modules/utils/TypedXmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string/jumbo v2, "version"

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Lcom/android/modules/utils/TypedXmlSerializer;->attributeInt(Ljava/lang/String;Ljava/lang/String;I)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;

    const-string/jumbo v3, "pkg"

    invoke-interface {v0, v1, v3}, Lcom/android/modules/utils/TypedXmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string/jumbo v4, "name"

    iget-object v5, v2, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mPackageName:Ljava/lang/String;

    invoke-interface {v0, v1, v4, v5}, Lcom/android/modules/utils/TypedXmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string/jumbo v4, "cert-digest"

    iget-object v5, v2, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mCertDigest:[B

    invoke-interface {v0, v1, v4, v5}, Lcom/android/modules/utils/TypedXmlSerializer;->attributeBytesHex(Ljava/lang/String;Ljava/lang/String;[B)Lorg/xmlpull/v1/XmlSerializer;

    iget-wide v4, v2, Lcom/android/server/pm/AppLockPackageHelper$AppLockPackageBackupEntry;->mRestoredAtMillis:J

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_0

    const-string/jumbo v2, "restored-at"

    invoke-interface {v0, v1, v2, v4, v5}, Lcom/android/modules/utils/TypedXmlSerializer;->attributeLong(Ljava/lang/String;Ljava/lang/String;J)Lorg/xmlpull/v1/XmlSerializer;

    :cond_0
    invoke-interface {v0, v1, v3}, Lcom/android/modules/utils/TypedXmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0

    :cond_1
    invoke-interface {v0, v1, p0}, Lcom/android/modules/utils/TypedXmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0}, Lcom/android/modules/utils/TypedXmlSerializer;->endDocument()V

    invoke-interface {v0}, Lcom/android/modules/utils/TypedXmlSerializer;->flush()V

    return-void
.end method
