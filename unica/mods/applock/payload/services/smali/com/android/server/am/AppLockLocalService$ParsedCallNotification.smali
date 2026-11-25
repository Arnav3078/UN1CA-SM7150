.class public final Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;
.super Ljava/lang/Record;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# annotations
.annotation system Ldalvik/annotation/Record;
    componentAnnotationVisibilities = {
        {},
        {},
        {}
    }
    componentAnnotations = {
        {},
        {},
        {}
    }
    componentNames = {
        "callType",
        "components",
        "tokens"
    }
    componentSignatures = {
        null,
        .subannotation Ldalvik/annotation/Signature;
            value = {
                "Landroid/util/ArraySet<",
                "Landroid/content/ComponentName;",
                ">;"
            }
        .end subannotation,
        .subannotation Ldalvik/annotation/Signature;
            value = {
                "Landroid/util/ArraySet<",
                "Landroid/os/IBinder;",
                ">;"
            }
        .end subannotation
    }
    componentTypes = {
        I,
        Landroid/util/ArraySet;,
        Landroid/util/ArraySet;
    }
.end annotation


# instance fields
.field public final callType:I

.field public final components:Landroid/util/ArraySet;

.field public final tokens:Landroid/util/ArraySet;


# direct methods
.method public constructor <init>(ILandroid/util/ArraySet;Landroid/util/ArraySet;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Record;-><init>()V

    iput p1, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->callType:I

    iput-object p2, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->components:Landroid/util/ArraySet;

    iput-object p3, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->tokens:Landroid/util/ArraySet;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;

    iget v0, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->callType:I

    iget v1, p1, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->callType:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->components:Landroid/util/ArraySet;

    iget-object v1, p1, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->components:Landroid/util/ArraySet;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->tokens:Landroid/util/ArraySet;

    iget-object p1, p1, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->tokens:Landroid/util/ArraySet;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .locals 2

    iget v0, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->callType:I

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->components:Landroid/util/ArraySet;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->tokens:Landroid/util/ArraySet;

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    iget v0, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->callType:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->components:Landroid/util/ArraySet;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->tokens:Landroid/util/ArraySet;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v1, 0x2

    aput-object p0, v2, v1

    const-string/jumbo p0, "callType;components;tokens"

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    new-array p0, v3, [Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v1, ";"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-class v4, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    array-length v4, p0

    if-ge v3, v4, :cond_2

    aget-object v4, p0, v3

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v2, v3

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    array-length v4, p0

    sub-int/2addr v4, v0

    if-eq v3, v4, :cond_1

    const-string v4, ", "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    const-string/jumbo p0, "]"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
