.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroidx/lifecycle/Observer;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 1

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda5;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    invoke-virtual {p0, p1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->onAppListLoaded(Ljava/util/List;)V

    return-void
.end method
