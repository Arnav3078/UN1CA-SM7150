.class public Lcom/android/internal/app/AppLockPermissionReviewActivity;
.super Landroid/app/Activity;
.source "AppLockPermissionReviewActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;,
        Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;,
        Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewType;
    }
.end annotation


# static fields
.field private static final blacklist DEBUG:Z

.field public static final blacklist EXTRA_PERMISSION_REVIEW_TYPE:Ljava/lang/String; = "android.intent.extra.app_lock_permission_review_type"

.field public static final blacklist EXTRA_SHOULD_FINISH_WITH_AFFINITY:Ljava/lang/String; = "android.intent.extra.app_lock_should_finish_with_affinity"

.field private static final blacklist REVIEW_CONFIGS:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final blacklist REVIEW_TYPE_FILES:I = 0x1

.field public static final blacklist REVIEW_TYPE_INVALID:I = -0x1

.field public static final blacklist REVIEW_TYPE_MESSAGES:I = 0x2

.field public static final blacklist REVIEW_TYPE_PHOTOS:I = 0x0

.field private static final blacklist SYSTEM_PACKAGE_NAME:Ljava/lang/String; = "android"

.field private static final blacklist TAG:Ljava/lang/String; = "AppLockPermissionReview"


# instance fields
.field private blacklist mAppsWithPermissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final blacklist mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

.field private blacklist mBottomSheetDivider:Landroid/view/View;

.field private blacklist mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private blacklist mIsAppListExpanded:Z

.field private blacklist mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

.field private blacklist mScrollView:Landroid/widget/ScrollView;


# direct methods
.method public static synthetic blacklist $r8$lambda$2RedLf5XKZVhn_5Qjvz8OoyXHlU(Lcom/android/internal/app/AppLockPermissionReviewActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->lambda$initialize$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$2ZGUOfSL9dqfVCiE5T8LjgnOAPE(Lcom/android/internal/app/AppLockPermissionReviewActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->lambda$initialize$2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$HUR6SI6C-90NuGinC0ptNRg_YUE(Lcom/android/internal/app/AppLockPermissionReviewActivity;Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->lambda$populateAppsList$0(Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$Hxx9Cubxcw-b7kY61XA5estTXao(Lcom/android/internal/app/AppLockPermissionReviewActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->lambda$initialize$1()V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$InJakqsfRa0eEJcljbEucVK8AkI(Lcom/android/internal/app/AppLockPermissionReviewActivity;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->lambda$initialize$3(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$YkJZ8Wf--mh2zij8_vSsQCNrT5w(Lcom/android/internal/app/AppLockPermissionReviewActivity;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/util/List;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->lambda$updateUiWithAppList$0(Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/util/List;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$bgXfVEdtOxYFIACIyGlQc70cIPE(Lcom/android/internal/app/AppLockPermissionReviewActivity;Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->lambda$populateAppsList$1(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V

    return-void
.end method

.method static constructor blacklist <clinit>()V
    .locals 8

    .line 73
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const-string v0, "AppLockPermissionReview"

    const/4 v3, 0x3

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    sput-boolean v0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->DEBUG:Z

    .line 93
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->REVIEW_CONFIGS:Landroid/util/SparseArray;

    .line 95
    new-instance v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;

    const-string/jumbo v4, "android.permission.READ_MEDIA_VIDEO"

    const-string/jumbo v5, "android.permission.READ_MEDIA_VISUAL_USER_SELECTED"

    const-string/jumbo v6, "android.permission.READ_MEDIA_IMAGES"

    const-string/jumbo v7, "android.permission.MANAGE_EXTERNAL_STORAGE"

    filled-new-array {v6, v4, v5, v7}, [Ljava/lang/String;

    move-result-object v4

    const v5, 0x104023d

    const v6, 0x104023a

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;-><init>([Ljava/lang/String;II)V

    invoke-virtual {v0, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 106
    new-instance v2, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v3

    const v4, 0x104023b

    const v5, 0x1040238

    invoke-direct {v2, v3, v4, v5}, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;-><init>([Ljava/lang/String;II)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 112
    new-instance v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;

    const-string/jumbo v2, "android.permission.RECEIVE_MMS"

    const-string/jumbo v3, "android.permission.RECEIVE_WAP_PUSH"

    const-string/jumbo v4, "android.permission.READ_SMS"

    const-string/jumbo v5, "android.permission.RECEIVE_SMS"

    const-string/jumbo v6, "android.permission.SEND_SMS"

    filled-new-array {v4, v5, v6, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const v3, 0x104023c

    const v4, 0x1040239

    invoke-direct {v1, v2, v3, v4}, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;-><init>([Ljava/lang/String;II)V

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor blacklist <init>()V
    .locals 1

    .line 70
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 125
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private blacklist cleanupLayoutListeners()V
    .locals 3

    .line 322
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz v0, :cond_1

    .line 323
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 324
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 325
    iget-object v2, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 327
    :cond_0
    iput-object v1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 329
    :cond_1
    iput-object v1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    return-void
.end method

.method public static blacklist createIntent(Ljava/lang/String;I)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x1

    .line 143
    invoke-static {p0, p1, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->createIntent(Ljava/lang/String;IZ)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createIntent(Ljava/lang/String;IZ)Landroid/content/Intent;
    .locals 3

    .line 161
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->enforceSystemOrRootUid()V

    .line 163
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 164
    const-class v1, Lcom/android/internal/app/AppLockPermissionReviewActivity;

    .line 165
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 164
    const-string/jumbo v2, "android"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 166
    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 167
    const-string/jumbo p0, "android.intent.extra.app_lock_permission_review_type"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 168
    const-string/jumbo p0, "android.intent.extra.app_lock_should_finish_with_affinity"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/high16 p0, 0x20000000

    .line 170
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    return-object v0
.end method

.method private blacklist initialize()V
    .locals 5

    .line 209
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->cleanupLayoutListeners()V

    .line 211
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.app_lock_permission_review_type"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 213
    sget-object v1, Lcom/android/internal/app/AppLockPermissionReviewActivity;->REVIEW_CONFIGS:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;

    .line 215
    const-string v2, "AppLockPermissionReview"

    if-nez v1, :cond_1

    .line 216
    sget-boolean v1, Lcom/android/internal/app/AppLockPermissionReviewActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 217
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Invalid review type or no config found for: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->finish()V

    return-void

    :cond_1
    const v0, 0x102024c

    .line 224
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v3, v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;->mTitleResId:I

    .line 225
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x102024b

    .line 226
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v3, v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;->mSubtitleResId:I

    .line 227
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x1020234

    .line 231
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 232
    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->applyWindowInsetsToDialogRoot(Landroid/view/View;)V

    .line 235
    instance-of v3, v0, Lcom/android/internal/widget/ResolverDrawerLayout;

    if-eqz v3, :cond_2

    .line 236
    check-cast v0, Lcom/android/internal/widget/ResolverDrawerLayout;

    new-instance v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda1;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;)V

    invoke-virtual {v0, v3}, Lcom/android/internal/widget/ResolverDrawerLayout;->setOnDismissListener(Lcom/android/internal/widget/DismissableView$OnDismissListener;)V

    goto :goto_0

    :cond_2
    if-eqz v0, :cond_3

    .line 238
    new-instance v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda2;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3
    :goto_0
    const v0, 0x1020246

    .line 242
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    iput-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    .line 243
    new-instance v0, Lcom/android/internal/app/AppLockPermissionReviewAdapter;

    invoke-direct {v0}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;-><init>()V

    .line 245
    iget-object v3, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    invoke-virtual {v3, v0}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->setAdapter(Lcom/android/internal/widget/RecyclerView$Adapter;)V

    const v3, 0x102024f

    .line 248
    invoke-virtual {p0, v3}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ScrollView;

    iput-object v3, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    const v3, 0x1020247

    .line 249
    invoke-virtual {p0, v3}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mBottomSheetDivider:Landroid/view/View;

    .line 250
    iget-object v4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    if-eqz v4, :cond_4

    if-eqz v3, :cond_4

    .line 251
    new-instance v2, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda3;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;)V

    iput-object v2, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 263
    iget-object v2, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_1

    .line 265
    :cond_4
    const-string/jumbo v3, "mScrollView, mRecyclerView, or mBottomSheetDivider is null, cannot toggle divider visibility."

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const v2, 0x1020248

    .line 269
    invoke-virtual {p0, v2}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda4;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const v3, 0x1020249

    .line 274
    invoke-virtual {p0, v3}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda5;

    invoke-direct {v4, p0, v2}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda5;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 280
    iget-object v3, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mAppsWithPermissions:Ljava/util/List;

    if-eqz v3, :cond_5

    .line 281
    invoke-virtual {p0, v3, v0, v2}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->updateUiWithAppList(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V

    return-void

    .line 283
    :cond_5
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->populateAppsList(Lcom/android/internal/app/AppLockPermissionReviewAdapter;Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;)V

    return-void
.end method

.method private blacklist isUserFacingApp(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 p0, 0x0

    if-eqz p3, :cond_0

    .line 426
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    return p0

    .line 431
    :cond_0
    new-instance p3, Landroid/content/Intent;

    const-string/jumbo v0, "android.intent.action.MAIN"

    invoke-direct {p3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 432
    const-string/jumbo v0, "android.intent.category.LAUNCHER"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 433
    invoke-virtual {p3, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 434
    invoke-virtual {p1, p3, p0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 436
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    const/4 p0, 0x1

    :cond_1
    return p0
.end method

.method private synthetic blacklist lambda$initialize$0(Landroid/view/View;)V
    .locals 0

    .line 238
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->onBackPressed()V

    return-void
.end method

.method private synthetic blacklist lambda$initialize$1()V
    .locals 5

    .line 252
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result v0

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    .line 253
    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    .line 254
    :goto_1
    iget-object v4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    .line 255
    invoke-virtual {v4, v1}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->canScrollVertically(I)Z

    move-result v4

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    .line 256
    invoke-virtual {v4, v2}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    move v2, v3

    goto :goto_3

    :cond_3
    :goto_2
    move v2, v1

    .line 258
    :goto_3
    iget-object v4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mScrollView:Landroid/widget/ScrollView;

    invoke-virtual {v4, v0}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 259
    iget-object v4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    if-eqz v2, :cond_4

    if-nez v0, :cond_4

    goto :goto_4

    :cond_4
    move v1, v3

    :goto_4
    invoke-virtual {v4, v1}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->setVerticalScrollBarEnabled(Z)V

    .line 260
    iget-object p0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mBottomSheetDivider:Landroid/view/View;

    if-nez v0, :cond_6

    if-eqz v2, :cond_5

    goto :goto_5

    :cond_5
    const/16 v3, 0x8

    :cond_6
    :goto_5
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private synthetic blacklist lambda$initialize$2(Landroid/view/View;)V
    .locals 0

    .line 270
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->onBackPressed()V

    return-void
.end method

.method private synthetic blacklist lambda$initialize$3(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 275
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 276
    const-string/jumbo v0, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, -0x1

    .line 277
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->setResult(ILandroid/content/Intent;)V

    .line 278
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->finish()V

    return-void
.end method

.method private synthetic blacklist lambda$populateAppsList$0(Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V
    .locals 1

    .line 337
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->getAppsWithPermissions(Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 338
    new-instance v0, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, p1, p3, p2}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda7;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private synthetic blacklist lambda$populateAppsList$1(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V
    .locals 0

    .line 338
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->updateUiWithAppList(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic blacklist lambda$updateUiWithAppList$0(Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/util/List;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    const/4 p4, 0x1

    .line 412
    iput-boolean p4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mIsAppListExpanded:Z

    .line 414
    iget-object p4, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object p4

    instance-of p4, p4, Landroid/view/ViewGroup;

    if-eqz p4, :cond_0

    .line 415
    iget-object p0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {p0}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;)V

    .line 417
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->updateData(Ljava/util/List;)V

    const/16 p0, 0x8

    .line 418
    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method protected blacklist getAppsWithPermissions(Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;",
            ">;"
        }
    .end annotation

    .line 346
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 347
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 349
    iget-object p1, p1, Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;->mPermissions:[Ljava/lang/String;

    const/4 v2, 0x0

    .line 350
    invoke-virtual {v0, p1, v2}, Landroid/content/pm/PackageManager;->getPackagesHoldingPermissions([Ljava/lang/String;I)Ljava/util/List;

    move-result-object p1

    .line 351
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageInfo;

    .line 352
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v0, v3, p2}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->isUserFacingApp(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 356
    :cond_1
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v3, :cond_0

    .line 358
    invoke-virtual {v0, v3}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 359
    invoke-virtual {v3, v0}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 360
    new-instance v5, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-direct {v5, v4, v3, v2}, Lcom/android/internal/app/AppLockPermissionReviewActivity$AppWithPermissionInfo;-><init>(Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public whitelist onBackPressed()V
    .locals 4

    .line 299
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.app_lock_should_finish_with_affinity"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 303
    invoke-virtual {p0, v1}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->setResult(I)V

    .line 304
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->finishAffinity()V

    return-void

    .line 306
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 308
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 307
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 309
    invoke-virtual {p0, v1, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->setResult(ILandroid/content/Intent;)V

    .line 310
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->finish()V

    return-void
.end method

.method public whitelist onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 189
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 190
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->cleanupLayoutListeners()V

    const p1, 0x109004e

    .line 191
    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->setContentView(I)V

    .line 192
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->initialize()V

    return-void
.end method

.method protected whitelist onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 176
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 177
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addSystemFlags(I)V

    if-eqz p1, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->finish()V

    return-void

    :cond_0
    const p1, 0x109004e

    .line 183
    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->setContentView(I)V

    .line 184
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->initialize()V

    return-void
.end method

.method protected whitelist onDestroy()V
    .locals 1

    .line 316
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 317
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 318
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->cleanupLayoutListeners()V

    return-void
.end method

.method protected whitelist onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 201
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 202
    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->setIntent(Landroid/content/Intent;)V

    const/4 p1, 0x0

    .line 203
    iput-object p1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mAppsWithPermissions:Ljava/util/List;

    const/4 p1, 0x0

    .line 204
    iput-boolean p1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mIsAppListExpanded:Z

    .line 205
    invoke-direct {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->initialize()V

    return-void
.end method

.method protected whitelist onStop()V
    .locals 1

    .line 289
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 292
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    .line 293
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->finish()V

    :cond_0
    return-void
.end method

.method protected blacklist populateAppsList(Lcom/android/internal/app/AppLockPermissionReviewAdapter;Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;)V
    .locals 2

    .line 335
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mBackgroundExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;Lcom/android/internal/app/AppLockPermissionReviewActivity$ReviewTypeConfig;Ljava/lang/String;Lcom/android/internal/app/AppLockPermissionReviewAdapter;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected blacklist updateUiWithAppList(Ljava/util/List;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/lang/String;)V
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

    .line 371
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 375
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    if-nez v0, :cond_1

    const v0, 0x1020246

    .line 376
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    iput-object v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mRecyclerView:Lcom/android/internal/app/AppLockMaxHeightRecyclerView;

    .line 381
    :cond_1
    const-string v1, "AppLockPermissionReview"

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lcom/android/internal/app/AppLockMaxHeightRecyclerView;->getAdapter()Lcom/android/internal/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eq v0, p2, :cond_2

    goto :goto_1

    .line 390
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 391
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 392
    const-string/jumbo p2, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p2, -0x1

    .line 393
    invoke-virtual {p0, p2, p1}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->setResult(ILandroid/content/Intent;)V

    .line 394
    sget-boolean p1, Lcom/android/internal/app/AppLockPermissionReviewActivity;->DEBUG:Z

    if-eqz p1, :cond_3

    .line 395
    const-string/jumbo p1, "No app found holding the permission, skipping the permission review."

    invoke-static {v1, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->finish()V

    return-void

    .line 400
    :cond_4
    iput-object p1, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mAppsWithPermissions:Ljava/util/List;

    const p3, 0x102024a

    .line 401
    invoke-virtual {p0, p3}, Lcom/android/internal/app/AppLockPermissionReviewActivity;->findViewById(I)Landroid/view/View;

    move-result-object p3

    .line 404
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_6

    iget-boolean v0, p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->mIsAppListExpanded:Z

    if-eqz v0, :cond_5

    goto :goto_0

    :cond_5
    const/4 v0, 0x0

    .line 409
    invoke-interface {p1, v0, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->updateData(Ljava/util/List;)V

    .line 410
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 411
    new-instance v0, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0, p2, p1, p3}, Lcom/android/internal/app/AppLockPermissionReviewActivity$$ExternalSyntheticLambda6;-><init>(Lcom/android/internal/app/AppLockPermissionReviewActivity;Lcom/android/internal/app/AppLockPermissionReviewAdapter;Ljava/util/List;Landroid/view/View;)V

    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 405
    :cond_6
    :goto_0
    invoke-virtual {p2, p1}, Lcom/android/internal/app/AppLockPermissionReviewAdapter;->updateData(Ljava/util/List;)V

    const/16 p0, 0x8

    .line 406
    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 382
    :cond_7
    :goto_1
    sget-boolean p0, Lcom/android/internal/app/AppLockPermissionReviewActivity;->DEBUG:Z

    if-eqz p0, :cond_8

    .line 383
    const-string/jumbo p0, "Ignoring stale app list result for previous review."

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    :goto_2
    return-void
.end method
