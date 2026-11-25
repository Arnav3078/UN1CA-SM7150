.class public final Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;
.super Ljava/lang/Record;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# annotations
.annotation system Ldalvik/annotation/Record;
    componentAnnotationVisibilities = {
        {},
        {},
        {},
        {},
        {}
    }
    componentAnnotations = {
        {},
        {},
        {},
        {},
        {}
    }
    componentNames = {
        "userId",
        "packageName",
        "components",
        "tokens",
        "removedTimeMs"
    }
    componentSignatures = {
        null,
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
        .end subannotation,
        null
    }
    componentTypes = {
        I,
        Ljava/lang/String;,
        Landroid/util/ArraySet;,
        Landroid/util/ArraySet;,
        J
    }
.end annotation


# instance fields
.field public final components:Landroid/util/ArraySet;

.field public final packageName:Ljava/lang/String;

.field public final removedTimeMs:J

.field public final tokens:Landroid/util/ArraySet;

.field public final userId:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Landroid/util/ArraySet;Landroid/util/ArraySet;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Record;-><init>()V

    iput p1, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    iput-object p2, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    iput-object p4, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->tokens:Landroid/util/ArraySet;

    iput-wide p5, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->removedTimeMs:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    instance-of v0, p1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    iget v0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    iget v1, p1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    if-ne v0, v1, :cond_0

    iget-wide v0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->removedTimeMs:J

    iget-wide v2, p1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->removedTimeMs:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    iget-object v1, p1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->tokens:Landroid/util/ArraySet;

    iget-object p1, p1, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->tokens:Landroid/util/ArraySet;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .locals 6

    iget v0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    iget-wide v1, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->removedTimeMs:J

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->tokens:Landroid/util/ArraySet;

    const/16 v5, 0x1f

    mul-int/2addr v0, v5

    invoke-static {v0, v5, v1, v2}, Lcom/android/server/security/applock/AppLockOutlineActiveSvc;->m(IIJ)I

    move-result v0

    invoke-static {v0, v5, v3}, Lcom/android/server/security/applock/AppLockOutlineActiveSvc;->m(IILjava/lang/String;)I

    move-result v0

    invoke-static {v4}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v1, v0

    mul-int/2addr v1, v5

    invoke-static {p0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 6

    iget v0, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->userId:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->packageName:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->components:Landroid/util/ArraySet;

    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->tokens:Landroid/util/ArraySet;

    iget-wide v4, p0, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;->removedTimeMs:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v1, 0x2

    aput-object v2, v4, v1

    const/4 v1, 0x3

    aput-object v3, v4, v1

    const/4 v1, 0x4

    aput-object p0, v4, v1

    const-string/jumbo p0, "userId;packageName;components;tokens;removedTimeMs"

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    new-array p0, v5, [Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v1, ";"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-class v2, Lcom/android/server/am/AppLockLocalService$RecentlyRemovedCall;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    array-length v2, p0

    if-ge v5, v2, :cond_2

    aget-object v2, p0, v5

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v2, v4, v5

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    array-length v2, p0

    sub-int/2addr v2, v0

    if-eq v5, v2, :cond_1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    const-string/jumbo p0, "]"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
