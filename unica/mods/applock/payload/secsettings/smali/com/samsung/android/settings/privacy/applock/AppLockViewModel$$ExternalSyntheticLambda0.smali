.class public final synthetic Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic f$0:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

.field public synthetic f$1:Landroid/util/IconDrawableFactory;


# virtual methods
.method public final run()V
    .locals 13

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$$ExternalSyntheticLambda0;->f$1:Landroid/util/IconDrawableFactory;

    iget-object v1, v0, Landroidx/lifecycle/AndroidViewModel;->application:Landroid/app/Application;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, v0, Landroidx/lifecycle/AndroidViewModel;->application:Landroid/app/Application;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lcom/samsung/android/settings/privacy/applock/AppLockUtils;->loadLockableApps(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v4, :cond_0

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Landroid/content/pm/ApplicationInfo;

    new-instance v8, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;

    iget-object v9, v7, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget v10, v7, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v7, v1}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v7}, Landroid/util/IconDrawableFactory;->getBadgedIcon(Landroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    iget-boolean v7, v7, Landroid/content/pm/ApplicationInfo;->isAppLockEnabled:Z

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    iput-object v9, v8, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->packageName:Ljava/lang/String;

    iput v10, v8, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->uid:I

    iput-object v11, v8, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->label:Ljava/lang/String;

    iput-object v12, v8, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->icon:Landroid/graphics/drawable/Drawable;

    iput-boolean v7, v8, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->locked:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mAppList:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p0, v2}, Landroidx/lifecycle/LiveData;->postValue(Ljava/lang/Object;)V

    iget-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mLoading:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method
