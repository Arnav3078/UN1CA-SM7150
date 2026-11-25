.class public final synthetic Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic blacklist f$0:Lcom/android/internal/app/AppLockPolicy;

.field public final synthetic blacklist f$1:Ljava/util/List;


# direct methods
.method public synthetic constructor blacklist <init>(Lcom/android/internal/app/AppLockPolicy;Ljava/util/List;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda3;->f$0:Lcom/android/internal/app/AppLockPolicy;

    iput-object p2, p0, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final whitelist test-api test(Ljava/lang/Object;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda3;->f$0:Lcom/android/internal/app/AppLockPolicy;

    iget-object p0, p0, Lcom/android/internal/app/AppLockPolicy$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/android/internal/app/AppLockPolicy;->$r8$lambda$QlRBLRR7OZ-eJEPxzRCSGjsvIOY(Lcom/android/internal/app/AppLockPolicy;Ljava/util/List;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
