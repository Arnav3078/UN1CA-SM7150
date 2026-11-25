.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public synthetic f$0:Ljava/text/Collator;


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda9;->f$0:Ljava/text/Collator;

    check-cast p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;

    check-cast p2, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;

    iget-object p1, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->label:Ljava/lang/String;

    iget-object p2, p2, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->label:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method
