.class public final Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;
.super Lcom/android/internal/app/AlertActivity;
.source "SamsungAppLockPermissionReviewActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;,
        Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;
    }
.end annotation


# static fields
.field private static final blacklist EXTRA_REVIEW_USER_ID:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_REVIEW_USER_ID"

.field private static final blacklist MAX_COLLAPSED_APP_COUNT:I = 0x3

.field private static final blacklist REVIEW_CONFIGS:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private blacklist mAppList:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

.field private final blacklist mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

.field private blacklist mCompleted:Z

.field private blacklist mLaunchingPermissionSettings:Z

.field private blacklist mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

.field private blacklist mScrollDividerBottom:Landroid/view/View;

.field private blacklist mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private blacklist mScrollDividerTop:Landroid/view/View;

.field private blacklist mScrollView:Landroid/widget/ScrollView;

.field private blacklist mViewAll:Landroid/widget/TextView;


# direct methods
.method public static synthetic blacklist $r8$lambda$HstIrBKdjkYzD0N-9gc8j_lbH0U(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->lambda$initialize$1(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$JR21PxFt4Boyy5GWbYzvptuEeW8(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finishCanceled()V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$JvtaCLbcJH-UzmhhvhFYNOBTJRU(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Ljava/lang/String;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->lambda$initialize$0(Ljava/lang/String;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$VYvxgxmihZrfvpHIwg2QMvRJHoM(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->lambda$updateApps$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$XNXiqRMXxLDc8RthDEdOZ3iKVYM(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Landroid/view/View;IIII)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->lambda$setupScrollDividers$0(Landroid/view/View;IIII)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$m8knGe6M_ZqdE8S9FS9lKco53OI(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->updateScrollDividers()V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$m8qdKqI7W_WJV0s2tqzy4JKowRg(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->updateScrollDividers()V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mapplySamsungAppRowStyle(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Landroid/view/View;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->applySamsungAppRowStyle(Landroid/view/View;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    return-void
.end method

.method static constructor blacklist <clinit>()V
    .locals 6

    .line 50
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->REVIEW_CONFIGS:Landroid/util/SparseArray;

    .line 53
    new-instance v1, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;

    const-string/jumbo v2, "android.permission.READ_MEDIA_VISUAL_USER_SELECTED"

    const-string/jumbo v3, "android.permission.MANAGE_EXTERNAL_STORAGE"

    const-string/jumbo v4, "android.permission.READ_MEDIA_IMAGES"

    const-string/jumbo v5, "android.permission.READ_MEDIA_VIDEO"

    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;-><init>([Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor blacklist <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    .line 62
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private blacklist applySamsungAppRowStyle(Landroid/view/View;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .locals 3

    const/16 v0, 0x34

    .line 227
    invoke-direct {p0, v0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->dpToPx(I)I

    move-result v0

    const/16 v1, 0x1c

    .line 228
    invoke-direct {p0, v1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->dpToPx(I)I

    move-result v1

    const/16 v2, 0x10

    .line 229
    invoke-direct {p0, v2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->dpToPx(I)I

    move-result p0

    .line 230
    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    const/4 v0, 0x0

    .line 231
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 233
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 234
    invoke-virtual {p1, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 235
    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 236
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 237
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 238
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    invoke-virtual {p3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 241
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 242
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 243
    invoke-virtual {p3, v0, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 p0, 0x2

    const/high16 p1, 0x41880000    # 17.0f

    .line 244
    invoke-virtual {p3, p0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 245
    const-string/jumbo p0, "sec"

    invoke-static {p0, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    return-void
.end method

.method static blacklist createIntent(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x1

    .line 75
    invoke-static {p0, p1, p2, v0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static blacklist createIntent(Landroid/content/Context;Ljava/lang/String;II)Landroid/content/Intent;
    .locals 0

    .line 90
    invoke-static {p0, p1, p2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.APP_LOCK_REVIEW_USER_ID"

    .line 91
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static blacklist createIntent(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;
    .locals 2

    .line 81
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo p0, "android.intent.extra.PACKAGE_NAME"

    .line 82
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "android.intent.extra.app_lock_permission_review_type"

    .line 83
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "android.intent.extra.app_lock_should_finish_with_affinity"

    .line 84
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const/high16 p1, 0x20000000

    .line 86
    invoke-virtual {p0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private blacklist dpToPx(I)I
    .locals 1

    int-to-float p1, p1

    .line 348
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x1

    .line 347
    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private blacklist finishCanceled()V
    .locals 4

    .line 429
    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mCompleted:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 432
    iput-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mCompleted:Z

    .line 433
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.app_lock_should_finish_with_affinity"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 436
    invoke-virtual {p0, v1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->setResult(I)V

    .line 437
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finishAffinity()V

    return-void

    .line 439
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 441
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 440
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 442
    invoke-virtual {p0, v1, v0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->setResult(ILandroid/content/Intent;)V

    .line 443
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finish()V

    return-void
.end method

.method private blacklist getAppLabel(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    if-nez p1, :cond_0

    .line 200
    const-string p0, ""

    return-object p0

    .line 203
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 204
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getReviewUserId()I

    move-result v1

    const/4 v2, 0x0

    .line 203
    invoke-virtual {v0, p1, v2, v1}, Landroid/content/pm/PackageManager;->getApplicationInfoAsUser(Ljava/lang/String;II)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 205
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    return-object p1
.end method

.method private blacklist getAppsWithPermissions(Ljava/lang/String;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;"
        }
    .end annotation

    .line 250
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 251
    new-instance v1, Landroid/util/ArraySet;

    invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V

    .line 252
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getReviewUsers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/UserHandle;

    const/4 v4, 0x0

    .line 253
    invoke-virtual {p0, v3, v4}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->createContextAsUser(Landroid/os/UserHandle;I)Landroid/content/Context;

    move-result-object v3

    .line 254
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 255
    iget-object v5, p2, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;->mPermissions:[Ljava/lang/String;

    invoke-virtual {v3, v5, v4}, Landroid/content/pm/PackageManager;->getPackagesHoldingPermissions([Ljava/lang/String;I)Ljava/util/List;

    move-result-object v4

    .line 257
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/PackageInfo;

    .line 258
    iget-object v6, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v6}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 259
    invoke-static {v3, p1, v5}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->shouldShowApp(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/pm/PackageInfo;)Z

    move-result v6

    if-nez v6, :cond_2

    goto :goto_0

    .line 262
    :cond_2
    iget-object v6, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v6, :cond_1

    .line 264
    iget-object v7, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v7}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 265
    new-instance v7, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;

    .line 266
    invoke-virtual {v3, v6}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v8

    .line 267
    invoke-virtual {v6, v3}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-direct {v7, v8, v6, v5}, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;-><init>(Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 265
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 272
    :cond_3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object p0

    const/4 p1, 0x1

    .line 273
    invoke-virtual {p0, p1}, Ljava/text/Collator;->setStrength(I)V

    .line 274
    new-instance p1, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda5;-><init>(Ljava/text/Collator;)V

    invoke-interface {v0, p1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    return-object v0
.end method

.method private blacklist getReviewUserId()I
    .locals 2

    .line 95
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_REVIEW_USER_ID"

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method private blacklist getReviewUsers()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation

    .line 280
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getReviewUserId()I

    move-result v0

    invoke-static {v0}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v0

    .line 281
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 282
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    const-class v2, Landroid/os/UserManager;

    invoke-virtual {p0, v2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/UserManager;

    .line 284
    invoke-virtual {p0, v0}, Landroid/os/UserManager;->getProfileParent(Landroid/os/UserHandle;)Landroid/os/UserHandle;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 285
    invoke-virtual {p0, v0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 286
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v1
.end method

.method private static blacklist hasLauncherEntry(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z
    .locals 2

    .line 306
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "android.intent.category.LAUNCHER"

    .line 307
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 308
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const/high16 v0, 0xc0000

    .line 309
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 311
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist initialize(Z)V
    .locals 4

    .line 119
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.app_lock_permission_review_type"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 122
    sget-object v1, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->REVIEW_CONFIGS:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;

    if-nez v0, :cond_0

    .line 124
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finish()V

    return-void

    .line 128
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 130
    invoke-direct {p0, v1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getAppLabel(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x1040f81

    .line 129
    invoke-virtual {p0, v3, v2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz p1, :cond_1

    .line 132
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object v2, p1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 133
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const v2, 0x1090174

    invoke-virtual {p1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const v2, 0x10205d8

    .line 135
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    iput-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAppList:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    const v2, 0x10205dd

    .line 136
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mViewAll:Landroid/widget/TextView;

    const v2, 0x10205dc

    .line 137
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ScrollView;

    iput-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    const v2, 0x10205db

    .line 139
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerTop:Landroid/view/View;

    const v2, 0x10205da

    .line 141
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerBottom:Landroid/view/View;

    .line 143
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->setupScrollDividers()V

    .line 144
    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object p1, v2, Lcom/android/internal/app/AlertController$AlertParams;->mView:Landroid/view/View;

    .line 145
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    const/high16 v2, 0x1040000

    invoke-virtual {p0, v2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 146
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object p0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 147
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    const v2, 0x1040237

    invoke-virtual {p0, v2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 149
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object p0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 150
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlert:Lcom/android/internal/app/AlertController;

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/android/internal/app/AlertController;->semSetBackgroundBlurEnabled(Z)V

    .line 151
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->setupAlert()V

    goto :goto_0

    .line 153
    :cond_1
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAlert:Lcom/android/internal/app/AlertController;

    invoke-virtual {p1, v2}, Lcom/android/internal/app/AlertController;->setTitle(Ljava/lang/CharSequence;)V

    .line 154
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mViewAll:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 155
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mViewAll:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->updateScrollDividers()V

    .line 159
    :goto_0
    new-instance p1, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;

    invoke-direct {p1, p0, v3}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$SamsungAppLockPermissionReviewAdapter;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity-IA;)V

    .line 161
    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAppList:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    invoke-virtual {v2, p1}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->setAdapter(Lcom/android/internal/widget/RecyclerView$Adapter;)V

    const/4 v2, 0x0

    .line 162
    iput-boolean v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mCompleted:Z

    .line 163
    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0, v1, v0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda6;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Ljava/lang/String;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic blacklist lambda$getAppsWithPermissions$0(Ljava/text/Collator;Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;)I
    .locals 0

    .line 274
    iget-object p1, p1, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppName:Ljava/lang/CharSequence;

    .line 275
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p2, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;->mAppName:Ljava/lang/CharSequence;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 274
    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private synthetic blacklist lambda$initialize$0(Ljava/lang/String;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V
    .locals 1

    .line 165
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getAppsWithPermissions(Ljava/lang/String;Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$ReviewTypeConfig;)Ljava/util/List;

    move-result-object p2

    .line 166
    new-instance v0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda2;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private synthetic blacklist lambda$initialize$1(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V
    .locals 0

    .line 166
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->updateApps(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic blacklist lambda$setupScrollDividers$0(Landroid/view/View;IIII)V
    .locals 0

    .line 334
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->updateScrollDividers()V

    return-void
.end method

.method private synthetic blacklist lambda$updateApps$0(Landroid/view/View;)V
    .locals 1

    .line 187
    const-string p1, "ALK104"

    const-string v0, "ALK1008"

    invoke-static {p0, p1, v0}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->openPhotosAndVideosPermissionSettings()V

    return-void
.end method

.method private blacklist openPhotosAndVideosPermissionSettings()V
    .locals 3

    .line 212
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.MANAGE_PERMISSION_APPS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "android.intent.extra.PERMISSION_GROUP_NAME"

    const-string/jumbo v2, "android.permission-group.READ_MEDIA_VISUAL"

    .line 213
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 216
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/pm/PackageManager;->getPermissionControllerPackageName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 218
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 220
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    .line 221
    iput-boolean v1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mLaunchingPermissionSettings:Z

    .line 222
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->startActivity(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method private blacklist setupScrollDividers()V
    .locals 2

    .line 333
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    new-instance v1, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda3;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    .line 335
    new-instance v0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda4;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V

    iput-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 336
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method private static blacklist shouldShowApp(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/pm/PackageInfo;)Z
    .locals 3

    .line 296
    iget-object v0, p2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 297
    iget-boolean v2, v0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-eqz v2, :cond_3

    iget-object v2, p2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 298
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_1

    .line 301
    :cond_0
    iget p1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v0, 0x1

    and-int/2addr p1, v0

    if-eqz p1, :cond_2

    .line 302
    iget-object p1, p2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->hasLauncherEntry(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method private blacklist updateApps(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;",
            "Lcom/android/internal/app/AppLockPermissionReviewAdapter;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mAppList:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    invoke-virtual {v0}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->getAdapter()Lcom/android/internal/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eq v0, p2, :cond_0

    goto :goto_1

    .line 175
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    .line 176
    iput-boolean p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mCompleted:Z

    .line 177
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 178
    const-string/jumbo p2, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p2, -0x1

    .line 179
    invoke-virtual {p0, p2, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->setResult(ILandroid/content/Intent;)V

    .line 180
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finish()V

    return-void

    .line 183
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p3

    const/4 v0, 0x3

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    const/4 v1, 0x0

    invoke-interface {p1, v1, p3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->updateData(Ljava/util/List;)V

    .line 184
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    .line 192
    iget-object p2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mViewAll:Landroid/widget/TextView;

    if-le p1, v0, :cond_2

    .line 185
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 186
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mViewAll:Landroid/widget/TextView;

    new-instance p2, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_2
    const/16 p1, 0x8

    .line 192
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 193
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mViewAll:Landroid/widget/TextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    :goto_0
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    new-instance p2, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda1;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V

    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    :cond_3
    :goto_1
    return-void
.end method

.method private blacklist updateScrollDividers()V
    .locals 4

    .line 340
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerTop:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 342
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerBottom:Landroid/view/View;

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public whitelist cancel()V
    .locals 0

    .line 394
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finishCanceled()V

    return-void
.end method

.method public whitelist finish()V
    .locals 0

    .line 373
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->finish()V

    .line 374
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    if-eqz p0, :cond_0

    .line 375
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->onActivityFinished()V

    :cond_0
    return-void
.end method

.method public whitelist finishAffinity()V
    .locals 0

    .line 381
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->finishAffinity()V

    .line 382
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    if-eqz p0, :cond_0

    .line 383
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->onActivityFinished()V

    :cond_0
    return-void
.end method

.method public whitelist onBackPressed()V
    .locals 0

    .line 389
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finishCanceled()V

    return-void
.end method

.method public whitelist onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 353
    const-string p1, "ALK104"

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 354
    const-string p2, "ALK1010"

    invoke-static {p0, p1, p2}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 356
    iput-boolean p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mCompleted:Z

    .line 357
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 359
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 358
    invoke-virtual {p1, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 360
    invoke-virtual {p0, v0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->setResult(ILandroid/content/Intent;)V

    .line 361
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finish()V

    return-void

    :cond_0
    const/4 v0, -0x2

    if-ne p2, v0, :cond_1

    .line 364
    const-string p2, "ALK1009"

    invoke-static {p0, p1, p2}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finishCanceled()V

    return-void
.end method

.method protected whitelist onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 100
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 101
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addSystemFlags(I)V

    .line 102
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Landroid/view/Window;->setGravity(I)V

    const/4 p1, 0x1

    .line 103
    invoke-direct {p0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->initialize(Z)V

    .line 107
    new-instance p1, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda7;

    invoke-direct {p1, p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity$$ExternalSyntheticLambda7;-><init>(Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;)V

    invoke-static {p0, p1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->attach(Landroid/app/Activity;Ljava/lang/Runnable;)Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    return-void
.end method

.method protected whitelist onDestroy()V
    .locals 3

    .line 413
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 414
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 415
    invoke-virtual {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->release()V

    .line 416
    iput-object v1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    .line 418
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v2, :cond_2

    .line 419
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 420
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 421
    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 423
    :cond_1
    iput-object v1, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 425
    :cond_2
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onDestroy()V

    return-void
.end method

.method protected whitelist onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 113
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 114
    invoke-virtual {p0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->setIntent(Landroid/content/Intent;)V

    const/4 p1, 0x0

    .line 115
    invoke-direct {p0, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->initialize(Z)V

    return-void
.end method

.method protected whitelist onResume()V
    .locals 1

    .line 399
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onResume()V

    const/4 v0, 0x0

    .line 400
    iput-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mLaunchingPermissionSettings:Z

    return-void
.end method

.method protected whitelist onStop()V
    .locals 1

    .line 405
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStop()V

    .line 406
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mCompleted:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->mLaunchingPermissionSettings:Z

    if-nez v0, :cond_0

    .line 407
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->finishCanceled()V

    :cond_0
    return-void
.end method
