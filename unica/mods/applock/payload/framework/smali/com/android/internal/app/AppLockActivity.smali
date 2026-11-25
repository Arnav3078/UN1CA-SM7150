.class public Lcom/android/internal/app/AppLockActivity;
.super Landroid/app/Activity;
.source "AppLockActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/AppLockActivity$Injector;
    }
.end annotation


# static fields
.field private static final blacklist APP_LOCK_FOLDER_FLOW_NONE:I = -0x1

.field private static final blacklist APP_LOCK_STATE_CHANGE_RESULT_TOAST_DURATION:I = 0x0

.field private static final blacklist DEBUG:Z

.field private static final blacklist DEFAULT_INJECTOR:Lcom/android/internal/app/AppLockActivity$Injector;

.field public static final blacklist EXTRA_CHANGED_USER_IDS:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_CHANGED_USER_IDS"

.field private static final blacklist EXTRA_ELIGIBLE_PACKAGES:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_PACKAGES"

.field private static final blacklist EXTRA_ELIGIBLE_USER_IDS:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_USER_IDS"

.field public static final blacklist EXTRA_FAILED_USER_IDS:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_FAILED_USER_IDS"

.field private static final blacklist EXTRA_FOLDER_NAME:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_FOLDER_NAME"

.field private static final blacklist EXTRA_FOLDER_RES:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_FOLDER_RES"

.field private static final blacklist EXTRA_SETTINGS_FROM_SEC_NON_BIOMETRICS:Ljava/lang/String; = "from_sec_non_biometrics"

.field private static final blacklist EXTRA_SETTINGS_SHOW_CREDENTIAL_TYPE_ONLY:Ljava/lang/String; = "hide_biometrics_menu"

.field private static final blacklist EXTRA_TARGET_USER_ID:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_TARGET_USER_ID"

.field private static final blacklist KEY_SUB_ACTIVITY_PENDING:Ljava/lang/String; = "sub_activity_pending"

.field private static final blacklist PROMOTION_EXHAUSTED_COUNT:I = 0x3

.field private static final blacklist PROMOTION_FIRST_COUNT:I = 0x1

.field private static final blacklist REQUEST_CODE_APP_PERMISSION_REVIEW_DIALOG:I = 0x3

.field private static final blacklist REQUEST_CODE_SET_SCREEN_LOCK:I = 0x1

.field private static final blacklist REQUEST_CODE_USER_EDUCATION_DIALOG:I = 0x2

.field private static final blacklist ROLE_SYSTEM_GALLERY:Ljava/lang/String; = "android.app.role.SYSTEM_GALLERY"

.field private static final blacklist SYSTEM_PACKAGE_NAME:Ljava/lang/String; = "android"

.field private static final blacklist TAG:Ljava/lang/String; = "AppLockActivity"

.field private static blacklist sInjector:Lcom/android/internal/app/AppLockActivity$Injector;


# instance fields
.field private blacklist mButtonLayout:Landroid/widget/LinearLayout;

.field private blacklist mButtonLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private blacklist mEligiblePackageNames:[Ljava/lang/String;

.field private blacklist mEligibleUserIds:[I

.field private blacklist mFolderFlow:I

.field private blacklist mFolderId:I

.field private blacklist mFolderName:Ljava/lang/String;

.field private blacklist mFolderRes:Landroid/graphics/Bitmap;

.field private blacklist mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private blacklist mInitialFailedPackages:[Ljava/lang/String;

.field private blacklist mInitialFailedUserIds:[I

.field private final blacklist mInjector:Lcom/android/internal/app/AppLockActivity$Injector;

.field private blacklist mIsPromoDialogShowing:Z

.field private blacklist mIsPromptPending:Z

.field private blacklist mIsSubActivityPending:Z

.field private blacklist mKeyguardManager:Landroid/app/KeyguardManager;

.field private blacklist mPackageLabel:Ljava/lang/CharSequence;

.field private blacklist mPackageLogo:Landroid/graphics/drawable/Drawable;

.field private blacklist mRequestedPackageNames:[Ljava/lang/String;

.field private blacklist mScreenLockDialog:Landroid/app/AlertDialog;

.field private blacklist mScrollView:Landroid/widget/ScrollView;


# direct methods
.method public static synthetic blacklist $r8$lambda$-nXEiT2_XM2uz86QyTnLHgXcaqw(Lcom/android/internal/app/AppLockActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->lambda$showSettingsPromoDialog$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$6hWCO84tHcsWL4n_FGehQtd5Nyk(Lcom/android/internal/app/AppLockActivity;Landroid/content/DialogInterface;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->lambda$showSamsungSetupScreenLockDialog$3(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$AdV9x1yg7gvWPWZDNoETl4dakTg(Lcom/android/internal/app/AppLockActivity;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->lambda$showSamsungSetupScreenLockDialog$2(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$IsDOZi98J3tFwv8sdftrXlAPz9g(Lcom/android/internal/app/AppLockActivity;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->lambda$showSamsungSetupScreenLockDialog$1(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$OaQpvnR5JMP9w7VOUaEgE3eUpDc(Lcom/android/internal/app/AppLockActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->lambda$showSettingsPromoDialog$2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$pmlOwvZ10lNgkbQqDg76mo2qnVY(Lcom/android/internal/app/AppLockActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->lambda$showSettingsPromoDialog$1()V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$rSA9c5Om47zDBIisXloVSxKOszQ(Lcom/android/internal/app/AppLockActivity;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->lambda$showSamsungSetupScreenLockDialog$0(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$ruxQOIu1oxCiee1ThBzHca-ajEw(Lcom/android/internal/app/AppLockActivity;Landroid/content/Intent;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->lambda$showSettingsPromoDialog$3(Landroid/content/Intent;Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mButtonLayout:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmEligiblePackageNames(Lcom/android/internal/app/AppLockActivity;)[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmEligibleUserIds(Lcom/android/internal/app/AppLockActivity;)[I
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fgetmInjector(Lcom/android/internal/app/AppLockActivity;)Lcom/android/internal/app/AppLockActivity$Injector;
    .locals 0

    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mInjector:Lcom/android/internal/app/AppLockActivity$Injector;

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$fputmButtonLayoutListener(Lcom/android/internal/app/AppLockActivity;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mButtonLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mcreateAuthenticationCanceledResult(Lcom/android/internal/app/AppLockActivity;)Landroid/os/Bundle;
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->createAuthenticationCanceledResult()Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$mhasFolderFlow(Lcom/android/internal/app/AppLockActivity;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$misAppLockCrossUserTarget(Lcom/android/internal/app/AppLockActivity;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isAppLockCrossUserTarget()Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$mmergeFailures(Lcom/android/internal/app/AppLockActivity;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->mergeFailures(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic blacklist -$$Nest$msendAppLockResultBroadcast(Lcom/android/internal/app/AppLockActivity;Landroid/os/Bundle;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->sendAppLockResultBroadcast(Landroid/os/Bundle;Z)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$msetAppLockEnabledForTargetUser(Lcom/android/internal/app/AppLockActivity;Ljava/lang/String;Z)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->setAppLockEnabledForTargetUser(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$mshowFolderResultToast(Lcom/android/internal/app/AppLockActivity;Landroid/os/Bundle;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->showFolderResultToast(Landroid/os/Bundle;Z)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mshowResultToast(Lcom/android/internal/app/AppLockActivity;ZLjava/lang/String;Ljava/lang/CharSequence;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/app/AppLockActivity;->showResultToast(ZLjava/lang/String;Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mshowResultToast(Lcom/android/internal/app/AppLockActivity;Z[Ljava/lang/String;Ljava/lang/CharSequence;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/app/AppLockActivity;->showResultToast(Z[Ljava/lang/String;Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method static bridge synthetic blacklist -$$Nest$mshowSettingsPromoIfNeeded(Lcom/android/internal/app/AppLockActivity;ZZLjava/lang/CharSequence;)Z
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/AppLockActivity;->showSettingsPromoIfNeeded(ZZLjava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic blacklist -$$Nest$sfgetDEBUG()Z
    .locals 1

    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    return v0
.end method

.method static constructor blacklist <clinit>()V
    .locals 2

    .line 189
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockActivity"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    .line 201
    new-instance v0, Lcom/android/internal/app/AppLockActivity$Injector;

    invoke-direct {v0}, Lcom/android/internal/app/AppLockActivity$Injector;-><init>()V

    sput-object v0, Lcom/android/internal/app/AppLockActivity;->DEFAULT_INJECTOR:Lcom/android/internal/app/AppLockActivity$Injector;

    return-void
.end method

.method public constructor blacklist <init>()V
    .locals 2

    .line 151
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 173
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mRequestedPackageNames:[Ljava/lang/String;

    .line 174
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    .line 175
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    .line 176
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedPackages:[Ljava/lang/String;

    .line 177
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedUserIds:[I

    const/4 v0, -0x1

    .line 179
    iput v0, p0, Lcom/android/internal/app/AppLockActivity;->mFolderId:I

    .line 181
    iput v0, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    .line 209
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->getInjector()Lcom/android/internal/app/AppLockActivity$Injector;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mInjector:Lcom/android/internal/app/AppLockActivity$Injector;

    return-void
.end method

.method private blacklist applyFolderFlowState(Landroid/content/Intent;I[Ljava/lang/String;)V
    .locals 1

    .line 566
    iput p2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    .line 567
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 568
    const-string/jumbo p2, "com.android.internal.app.extra.APP_LOCK_FOLDER_NAME"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderName:Ljava/lang/String;

    .line 569
    const-string/jumbo p2, "android.content.pm.extra.APP_LOCK_FOLDER_ID"

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    iput p2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderId:I

    .line 571
    const-string/jumbo p2, "com.android.internal.app.extra.APP_LOCK_FOLDER_RES"

    const-class v0, Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderRes:Landroid/graphics/Bitmap;

    .line 573
    :cond_0
    iput-object p3, p0, Lcom/android/internal/app/AppLockActivity;->mRequestedPackageNames:[Ljava/lang/String;

    .line 574
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->readValidationResult(Landroid/content/Intent;)V

    return-void
.end method

.method public static blacklist applyWindowInsetsToDialogRoot(Landroid/view/View;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    .line 237
    :cond_0
    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda5;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-void
.end method

.method private static blacklist calculateResultCode(II)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-lez p0, :cond_1

    .line 1740
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Reporting failure for a partial App Lock change: changed="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ", failed="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "AppLockActivity"

    invoke-static {p1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    const/4 p0, 0x3

    return p0
.end method

.method private blacklist cleanupLayoutListeners()V
    .locals 3

    .line 1334
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScrollView:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v2, :cond_1

    .line 1335
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1336
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1337
    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1339
    :cond_0
    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 1341
    :cond_1
    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mScrollView:Landroid/widget/ScrollView;

    .line 1342
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mButtonLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity;->mButtonLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v2, :cond_3

    .line 1343
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1344
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1345
    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity;->mButtonLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1347
    :cond_2
    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mButtonLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 1349
    :cond_3
    iput-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mButtonLayout:Landroid/widget/LinearLayout;

    return-void
.end method

.method private static blacklist concat([I[I)[I
    .locals 3

    .line 609
    array-length v0, p0

    array-length v1, p1

    add-int/2addr v0, v1

    new-array v0, v0, [I

    .line 610
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 611
    array-length p0, p0

    array-length v1, p1

    invoke-static {p1, v2, v0, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method private static blacklist concat([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    .line 601
    array-length v0, p0

    array-length v1, p1

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/String;

    .line 602
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 603
    array-length p0, p0

    array-length v1, p1

    invoke-static {p1, v2, v0, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method private blacklist contextForAppLockUser(I)Landroid/content/Context;
    .locals 1

    .line 1519
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    if-ne p1, v0, :cond_0

    return-object p0

    .line 1520
    :cond_0
    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/app/AppLockActivity;->createContextAsUser(Landroid/os/UserHandle;I)Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createAppLockActivityIntent(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[I[Ljava/lang/String;[IZ)Landroid/content/Intent;
    .locals 3

    .line 298
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    invoke-static {p5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    invoke-static {p6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    invoke-static {p7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.content.pm.action.SET_APP_LOCK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v1, Lcom/android/internal/app/AppLockActivity;

    .line 305
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "android"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.PACKAGES"

    .line 306
    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p3

    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    .line 307
    invoke-virtual {p3, v0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p3

    if-eqz p2, :cond_0

    goto :goto_0

    .line 308
    :cond_0
    const-string p2, ""

    :goto_0
    const-string/jumbo p8, "com.android.internal.app.extra.APP_LOCK_FOLDER_NAME"

    invoke-virtual {p3, p8, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const-string/jumbo p3, "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"

    const/4 p8, 0x0

    .line 309
    invoke-virtual {p2, p3, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p2

    const-string/jumbo p3, "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_PACKAGES"

    .line 311
    invoke-virtual {p2, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const-string/jumbo p3, "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_USER_IDS"

    .line 312
    invoke-virtual {p2, p3, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object p2

    const-string/jumbo p3, "android.content.pm.extra.APP_LOCK_FAILED_PACKAGES"

    .line 313
    invoke-virtual {p2, p3, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const-string/jumbo p3, "com.android.internal.app.extra.APP_LOCK_FAILED_USER_IDS"

    .line 314
    invoke-virtual {p2, p3, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object p2

    const p3, 0x10818000

    .line 315
    invoke-virtual {p2, p3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object p2

    const/4 p3, -0x1

    if-eq p0, p3, :cond_1

    .line 320
    const-string/jumbo p3, "android.content.pm.extra.APP_LOCK_FOLDER_ID"

    invoke-virtual {p2, p3, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_1
    if-eqz p1, :cond_2

    .line 323
    const-string/jumbo p0, "com.android.internal.app.extra.APP_LOCK_FOLDER_RES"

    invoke-virtual {p2, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_2
    return-object p2
.end method

.method public static blacklist createAppLockActivityIntent(Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 3

    .line 259
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.content.pm.action.SET_APP_LOCK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v1, Lcom/android/internal/app/AppLockActivity;

    .line 262
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "android"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.PACKAGE_NAME"

    .line 263
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    .line 264
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const p1, 0x10818000

    .line 265
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createAppLockActivityIntentForUser(Ljava/lang/String;ZI)Landroid/content/Intent;
    .locals 0

    .line 274
    invoke-static {p0, p1}, Lcom/android/internal/app/AppLockActivity;->createAppLockActivityIntent(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.APP_LOCK_TARGET_USER_ID"

    .line 275
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private blacklist createAuthenticationCanceledResult()Landroid/os/Bundle;
    .locals 7

    const/4 v0, 0x0

    .line 1716
    new-array v2, v0, [Ljava/lang/String;

    new-array v3, v0, [I

    iget-object v4, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedPackages:[Ljava/lang/String;

    iget-object v5, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedUserIds:[I

    const/4 v6, 0x4

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/internal/app/AppLockActivity;->createResultBundle([Ljava/lang/String;[I[Ljava/lang/String;[II)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public static blacklist createFolderItemsAddedActivityIntent([Ljava/lang/String;[Ljava/lang/String;[I[Ljava/lang/String;[I)Landroid/content/Intent;
    .locals 3

    .line 332
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.content.pm.action.SET_APP_LOCK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v1, Lcom/android/internal/app/AppLockActivity;

    .line 339
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "android"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.PACKAGES"

    .line 340
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 341
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"

    .line 342
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_PACKAGES"

    .line 344
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_USER_IDS"

    .line 345
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "android.content.pm.extra.APP_LOCK_FAILED_PACKAGES"

    .line 346
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.APP_LOCK_FAILED_USER_IDS"

    .line 347
    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object p0

    const p1, 0x10818000

    .line 348
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private blacklist createResultBundle([Ljava/lang/String;[I[Ljava/lang/String;[II)Landroid/os/Bundle;
    .locals 2

    .line 1724
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1725
    const-string/jumbo v1, "android.intent.extra.PACKAGES"

    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mRequestedPackageNames:[Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1726
    const-string/jumbo p0, "android.content.pm.extra.APP_LOCK_CHANGED_PACKAGES"

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1727
    const-string/jumbo p0, "com.android.internal.app.extra.APP_LOCK_CHANGED_USER_IDS"

    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 1728
    const-string/jumbo p0, "android.content.pm.extra.APP_LOCK_FAILED_PACKAGES"

    invoke-virtual {v0, p0, p3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1729
    const-string/jumbo p0, "com.android.internal.app.extra.APP_LOCK_FAILED_USER_IDS"

    invoke-virtual {v0, p0, p4}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 1730
    const-string/jumbo p0, "android.content.pm.extra.APP_LOCK_RESULT_CODE"

    invoke-virtual {v0, p0, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method private blacklist createStateChangeFailureResult(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 7

    const/4 v0, 0x0

    .line 1708
    new-array v2, v0, [Ljava/lang/String;

    new-array v3, v0, [I

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedPackages:[Ljava/lang/String;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    .line 1709
    invoke-static {v1, p1}, Lcom/android/internal/app/AppLockActivity;->concat([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedUserIds:[I

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    aget v0, v1, v0

    filled-new-array {v0}, [I

    move-result-object v0

    .line 1710
    invoke-static {p1, v0}, Lcom/android/internal/app/AppLockActivity;->concat([I[I)[I

    move-result-object v5

    const/4 v6, 0x3

    move-object v1, p0

    .line 1708
    invoke-direct/range {v1 .. v6}, Lcom/android/internal/app/AppLockActivity;->createResultBundle([Ljava/lang/String;[I[Ljava/lang/String;[II)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method private blacklist createValidationFailureResult()Landroid/os/Bundle;
    .locals 7

    const/4 v0, 0x0

    .line 1689
    new-array v2, v0, [Ljava/lang/String;

    new-array v3, v0, [I

    iget-object v4, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedPackages:[Ljava/lang/String;

    iget-object v5, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedUserIds:[I

    array-length v1, v4

    .line 1691
    invoke-static {v0, v1}, Lcom/android/internal/app/AppLockActivity;->calculateResultCode(II)I

    move-result v6

    move-object v1, p0

    .line 1689
    invoke-direct/range {v1 .. v6}, Lcom/android/internal/app/AppLockActivity;->createResultBundle([Ljava/lang/String;[I[Ljava/lang/String;[II)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method private static blacklist declaresCategory(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1678
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1679
    invoke-virtual {v0, p2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1680
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1682
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-wide/16 p1, 0x0

    .line 1683
    invoke-static {p1, p2}, Landroid/content/pm/PackageManager$ResolveInfoFlags;->of(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;

    move-result-object p1

    .line 1682
    invoke-virtual {p0, v0, p1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;)Landroid/content/pm/ResolveInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static blacklist enforceSystemOrRootUid()V
    .locals 2

    .line 748
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->getCallingUid()I

    move-result v0

    const/16 v1, 0x3e8

    .line 749
    invoke-static {v0, v1}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    .line 750
    invoke-static {v0, v1}, Landroid/os/UserHandle;->isSameApp(II)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 751
    :cond_0
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "AppLockActivity APIs can only be called by the system"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method

.method private blacklist finishAfterCanceledFlow()V
    .locals 3

    .line 947
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 948
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 950
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->createAuthenticationCanceledResult()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/android/internal/app/AppLockActivity;->sendAppLockResultBroadcast(Landroid/os/Bundle;Z)V

    .line 952
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method private blacklist finishSamsungSetupScreenLockDialogCanceled()V
    .locals 1

    .line 939
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 940
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 943
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method private blacklist getAppLockSettingsIntent()Landroid/content/Intent;
    .locals 3

    .line 1322
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.settings.APP_LOCK_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    .line 1323
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 1324
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-wide/32 v1, 0x110000

    .line 1325
    invoke-static {v1, v2}, Landroid/content/pm/PackageManager$ResolveInfoFlags;->of(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;

    move-result-object v1

    .line 1324
    invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;)Landroid/content/pm/ResolveInfo;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 1327
    iget-object v1, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-nez v1, :cond_0

    goto :goto_0

    .line 1330
    :cond_0
    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private blacklist getAppLockTargetUserId()I
    .locals 2

    .line 1507
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_TARGET_USER_ID"

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method static blacklist getCallingUid()I
    .locals 1

    .line 756
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->getInjector()Lcom/android/internal/app/AppLockActivity$Injector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/app/AppLockActivity$Injector;->getCallingUid()I

    move-result v0

    return v0
.end method

.method private blacklist getFirstAppLockTargetUserId()I
    .locals 1

    .line 1515
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    const/4 v0, 0x0

    aget p0, p0, v0

    return p0

    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result p0

    return p0
.end method

.method private blacklist getFolderItemsDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 3

    .line 622
    iget v0, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length v2, v0

    if-gt v2, v1, :cond_0

    goto :goto_0

    .line 626
    :cond_0
    array-length v0, v0

    sub-int/2addr v0, v1

    .line 627
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 628
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {p1, v1}, [Ljava/lang/Object;

    move-result-object p1

    const v1, 0x1150010

    .line 627
    invoke-virtual {p0, v1, v0, p1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    return-object p1
.end method

.method private static blacklist getInjector()Lcom/android/internal/app/AppLockActivity$Injector;
    .locals 1

    .line 206
    sget-object v0, Lcom/android/internal/app/AppLockActivity;->sInjector:Lcom/android/internal/app/AppLockActivity$Injector;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lcom/android/internal/app/AppLockActivity;->DEFAULT_INJECTOR:Lcom/android/internal/app/AppLockActivity$Injector;

    return-object v0
.end method

.method private blacklist getPackageLabel(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1494
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mPackageLabel:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    .line 1495
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-wide/16 v1, 0x0

    .line 1496
    invoke-static {v1, v2}, Landroid/content/pm/PackageManager$ApplicationInfoFlags;->of(J)Landroid/content/pm/PackageManager$ApplicationInfoFlags;

    move-result-object v1

    .line 1495
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;Landroid/content/pm/PackageManager$ApplicationInfoFlags;)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 1496
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mPackageLabel:Ljava/lang/CharSequence;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v0

    :catch_0
    move-exception p0

    .line 1500
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Package "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "AppLockActivity"

    invoke-static {v0, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private blacklist getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;
    .locals 6

    .line 1536
    invoke-direct {p0, p2}, Lcom/android/internal/app/AppLockActivity;->contextForAppLockUser(I)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 1537
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "android.intent.category.LAUNCHER"

    .line 1538
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 1539
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-wide/16 v2, 0x0

    .line 1541
    invoke-static {v2, v3}, Landroid/content/pm/PackageManager$ResolveInfoFlags;->of(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;

    move-result-object v4

    .line 1540
    invoke-virtual {v0, v1, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;)Ljava/util/List;

    move-result-object v1

    .line 1542
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    iget-object v5, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v5, :cond_0

    .line 1543
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {v1, v0}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 1544
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    .line 1549
    :cond_0
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    if-ne p2, v0, :cond_1

    .line 1550
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    .line 1553
    :cond_1
    :try_start_0
    invoke-direct {p0, p2}, Lcom/android/internal/app/AppLockActivity;->contextForAppLockUser(I)Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 1554
    invoke-static {v2, v3}, Landroid/content/pm/PackageManager$ApplicationInfoFlags;->of(J)Landroid/content/pm/PackageManager$ApplicationInfoFlags;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;Landroid/content/pm/PackageManager$ApplicationInfoFlags;)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 1556
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Package "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found for user "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AppLockActivity"

    invoke-static {p2, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private blacklist getPackageLogoAsDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1578
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mPackageLogo:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 1579
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mPackageLogo:Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v0

    :catch_0
    move-exception p0

    .line 1583
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Package "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "AppLockActivity"

    invoke-static {v0, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private blacklist getPackageLogoAsDrawable(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1562
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 1563
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->getPackageLogoAsDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 1566
    :cond_0
    :try_start_0
    invoke-direct {p0, p2}, Lcom/android/internal/app/AppLockActivity;->contextForAppLockUser(I)Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 1567
    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 1569
    new-instance p1, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "Package icon missing for user "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AppLockActivity"

    invoke-static {p2, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public static blacklist getPermissionReviewType(Landroid/content/Context;Ljava/lang/String;)I
    .locals 1

    .line 1592
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->enforceSystemOrRootUid()V

    .line 1593
    const-string/jumbo v0, "packageName cannot be null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1594
    invoke-static {p0, p1}, Lcom/android/internal/app/AppLockActivity;->isSystemApp(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    .line 1596
    invoke-static {p0, p1, v0}, Lcom/android/internal/app/AppLockActivity;->isPhotoApp(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method private blacklist handleFolderActivityResult(II)V
    .locals 5

    .line 1441
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    const-string v1, "AppLockActivity"

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v3, :cond_0

    const/4 v4, -0x1

    if-eq p2, v4, :cond_0

    .line 1442
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "Folder App Lock activity result failed for request code: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", result code: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1444
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    .line 1446
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->createAuthenticationCanceledResult()Landroid/os/Bundle;

    move-result-object p2

    invoke-direct {p0, p2, p1}, Lcom/android/internal/app/AppLockActivity;->sendAppLockResultBroadcast(Landroid/os/Bundle;Z)V

    .line 1448
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 1452
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    .line 1454
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length v4, v0

    if-nez v4, :cond_1

    .line 1455
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 1459
    :cond_1
    aget-object v0, v0, v2

    .line 1460
    iget-object v4, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    aget v2, v4, v2

    invoke-direct {p0, v0, v2}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 1461
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1462
    iget-object v4, p0, Lcom/android/internal/app/AppLockActivity;->mFolderName:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/android/internal/app/AppLockActivity;->resolveFolderDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    goto :goto_0

    .line 1463
    :cond_2
    invoke-direct {p0, v2}, Lcom/android/internal/app/AppLockActivity;->getFolderItemsDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    :goto_0
    if-eq p1, v3, :cond_5

    const/4 v0, 0x2

    if-eq p1, v0, :cond_4

    const/4 p2, 0x3

    if-eq p1, p2, :cond_3

    .line 1486
    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo p2, "Received unknown request code: "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1485
    :cond_3
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->requestShowBiometricPrompt()V

    return-void

    .line 1481
    :cond_4
    invoke-direct {p0, v4, p2}, Lcom/android/internal/app/AppLockActivity;->showFirstPermissionReviewOrAuthenticate(Ljava/lang/CharSequence;Z)V

    return-void

    .line 1466
    :cond_5
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1467
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 1469
    :cond_6
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-eqz p1, :cond_8

    .line 1470
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/app/KeyguardManager;->isDeviceSecure(I)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 1472
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result p1

    if-eqz p1, :cond_7

    move-object v2, v4

    .line 1471
    :cond_7
    invoke-direct {p0, v0, v2}, Lcom/android/internal/app/AppLockActivity;->showUserEducationDialog(Ljava/lang/String;Ljava/lang/CharSequence;)V

    return-void

    .line 1474
    :cond_8
    sget-boolean p1, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz p1, :cond_9

    .line 1475
    const-string/jumbo p1, "Screen lock not set after setup attempt, finishing."

    invoke-static {v1, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1477
    :cond_9
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void
.end method

.method private blacklist handleFolderAppLockFlow(Landroid/content/Intent;Z)V
    .locals 7

    .line 495
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    .line 497
    const-string v2, "AppLockActivity"

    if-eqz v0, :cond_0

    if-eq v0, v1, :cond_0

    .line 499
    new-instance p1, Ljava/lang/StringBuilder;

    const-string/jumbo p2, "Invalid App Lock folder flow: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 500
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 504
    :cond_0
    const-string/jumbo v3, "android.intent.extra.PACKAGES"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_b

    .line 505
    array-length v4, v3

    if-nez v4, :cond_1

    goto/16 :goto_2

    :cond_1
    if-ne v0, v1, :cond_2

    if-nez p2, :cond_2

    .line 512
    const-string/jumbo p1, "Folder items flow requires target state enabled"

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 517
    :cond_2
    invoke-direct {p0, p1, v0, v3}, Lcom/android/internal/app/AppLockActivity;->applyFolderFlowState(Landroid/content/Intent;I[Ljava/lang/String;)V

    .line 519
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length v0, p1

    if-nez v0, :cond_3

    .line 520
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->createValidationFailureResult()Landroid/os/Bundle;

    move-result-object p1

    .line 521
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->sendAppLockResultBroadcast(Landroid/os/Bundle;Z)V

    .line 522
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->showFolderResultToast(Landroid/os/Bundle;Z)V

    .line 523
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    :cond_3
    const/4 v0, 0x0

    .line 527
    aget-object p1, p1, v0

    .line 528
    iget-object v3, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    aget v3, v3, v0

    invoke-direct {p0, p1, v3}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 529
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 530
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->createStateChangeFailureResult(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 531
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->sendAppLockResultBroadcast(Landroid/os/Bundle;Z)V

    .line 532
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->showFolderResultToast(Landroid/os/Bundle;Z)V

    .line 533
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 536
    :cond_4
    iget-object v4, p0, Lcom/android/internal/app/AppLockActivity;->mFolderName:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/android/internal/app/AppLockActivity;->resolveFolderDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 537
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result v5

    if-eqz v5, :cond_5

    goto :goto_0

    .line 538
    :cond_5
    invoke-direct {p0, v3}, Lcom/android/internal/app/AppLockActivity;->getFolderItemsDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 540
    :goto_0
    iget-object v5, p0, Lcom/android/internal/app/AppLockActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-eqz v5, :cond_6

    .line 541
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v6

    .line 540
    invoke-virtual {v5, v6}, Landroid/app/KeyguardManager;->isDeviceSecure(I)Z

    move-result v5

    if-eqz v5, :cond_6

    goto :goto_1

    :cond_6
    move v1, v0

    :goto_1
    if-nez p2, :cond_8

    if-eqz v1, :cond_7

    .line 545
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->requestShowBiometricPrompt()V

    return-void

    .line 547
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Device is not secure, cannot disable App Lock for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->createStateChangeFailureResult(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 550
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->sendAppLockResultBroadcast(Landroid/os/Bundle;Z)V

    .line 551
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->showFolderResultToast(Landroid/os/Bundle;Z)V

    .line 552
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    :cond_8
    if-nez v1, :cond_9

    .line 556
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->showSetupScreenLockDialog(Ljava/lang/String;)V

    return-void

    .line 559
    :cond_9
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result p2

    if-eqz p2, :cond_a

    move-object v3, v4

    .line 558
    :cond_a
    invoke-direct {p0, p1, v3}, Lcom/android/internal/app/AppLockActivity;->showUserEducationDialog(Ljava/lang/String;Ljava/lang/CharSequence;)V

    return-void

    .line 506
    :cond_b
    :goto_2
    const-string/jumbo p1, "Folder App Lock flow requires a non-empty package list"

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method private blacklist hasFolderFlow()Z
    .locals 1

    .line 582
    iget p0, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist isAppLockCrossUserTarget()Z
    .locals 1

    .line 1511
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result p0

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static blacklist isFilesApp(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 0

    if-eqz p2, :cond_0

    .line 1622
    const-string/jumbo p2, "android.intent.category.APP_FILES"

    invoke-static {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->declaresCategory(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private blacklist isFolderLockFlow()Z
    .locals 0

    .line 578
    iget p0, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static blacklist isMessagesApp(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 2

    .line 1636
    const-string/jumbo v0, "android.app.role.SMS"

    invoke-static {p0, v0, p1}, Lcom/android/internal/app/AppLockActivity;->isRoleHolder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    if-eqz p2, :cond_1

    .line 1639
    const-string/jumbo p2, "android.intent.category.APP_MESSAGING"

    invoke-static {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->declaresCategory(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static blacklist isPhotoApp(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 2

    .line 1654
    const-string/jumbo v0, "android.app.role.SYSTEM_GALLERY"

    invoke-static {p0, v0, p1}, Lcom/android/internal/app/AppLockActivity;->isRoleHolder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    if-eqz p2, :cond_1

    .line 1657
    const-string/jumbo p2, "android.intent.category.APP_GALLERY"

    invoke-static {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->declaresCategory(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static blacklist isRoleHolder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1661
    invoke-static {}, Lcom/android/internal/app/AppLockActivity;->getInjector()Lcom/android/internal/app/AppLockActivity$Injector;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/android/internal/app/AppLockActivity$Injector;->getRoleHolders(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static blacklist isSystemApp(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    .line 1666
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-wide/16 v1, 0x0

    .line 1667
    invoke-static {v1, v2}, Landroid/content/pm/PackageManager$ApplicationInfoFlags;->of(J)Landroid/content/pm/PackageManager$ApplicationInfoFlags;

    move-result-object v1

    .line 1666
    invoke-virtual {p0, p1, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;Landroid/content/pm/PackageManager$ApplicationInfoFlags;)Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 1670
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit16 p0, p0, 0x81

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v0

    :catch_0
    move-exception p0

    .line 1672
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Package "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found when checking system app"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "AppLockActivity"

    invoke-static {v1, p1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method static synthetic blacklist lambda$applyWindowInsetsToDialogRoot$0(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 5

    .line 239
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v0

    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    move-result v1

    or-int/2addr v0, v1

    .line 238
    invoke-virtual {p1, v0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v0

    .line 240
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1050075

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 242
    iget v2, v0, Landroid/graphics/Insets;->top:I

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 247
    iget v2, v0, Landroid/graphics/Insets;->left:I

    iget v3, v0, Landroid/graphics/Insets;->right:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {p0, v2, v1, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 248
    iget p0, v0, Landroid/graphics/Insets;->left:I

    iget v1, v0, Landroid/graphics/Insets;->top:I

    iget v0, v0, Landroid/graphics/Insets;->right:I

    const/4 v2, 0x0

    invoke-virtual {p1, p0, v1, v0, v2}, Landroid/view/WindowInsets;->inset(IIII)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method private synthetic blacklist lambda$showSamsungSetupScreenLockDialog$0(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 893
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishSamsungSetupScreenLockDialogCanceled()V

    return-void
.end method

.method private synthetic blacklist lambda$showSamsungSetupScreenLockDialog$1(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 897
    const-string p1, "ALK106"

    const-string p2, "ALK1012"

    invoke-static {p0, p1, p2}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 899
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishSamsungSetupScreenLockDialogCanceled()V

    return-void
.end method

.method private synthetic blacklist lambda$showSamsungSetupScreenLockDialog$2(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 903
    const-string p1, "ALK106"

    const-string p2, "ALK1013"

    invoke-static {p0, p1, p2}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    new-instance p1, Landroid/content/Intent;

    const-string/jumbo p2, "android.app.action.SET_NEW_PASSWORD"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 907
    const-string/jumbo p2, "hide_biometrics_menu"

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 909
    const-string/jumbo p2, "from_sec_non_biometrics"

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 912
    :try_start_0
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 913
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/app/AppLockActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 916
    const-string p2, "AppLockActivity"

    const-string v0, "ACTION_SET_NEW_PASSWORD not found"

    invoke-static {p2, v0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    .line 917
    iput-boolean p1, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 918
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishSamsungSetupScreenLockDialogCanceled()V

    return-void
.end method

.method private synthetic blacklist lambda$showSamsungSetupScreenLockDialog$3(Landroid/content/DialogInterface;)V
    .locals 0

    .line 923
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishSamsungSetupScreenLockDialogCanceled()V

    return-void
.end method

.method private synthetic blacklist lambda$showSettingsPromoDialog$0(Landroid/view/View;)V
    .locals 0

    .line 1290
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->onBackPressed()V

    return-void
.end method

.method private synthetic blacklist lambda$showSettingsPromoDialog$1()V
    .locals 2

    .line 1297
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScrollView:Landroid/widget/ScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result v0

    const v1, 0x1020252

    .line 1298
    invoke-virtual {p0, v1}, Lcom/android/internal/app/AppLockActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    .line 1299
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private synthetic blacklist lambda$showSettingsPromoDialog$2(Landroid/view/View;)V
    .locals 0

    .line 1308
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method private synthetic blacklist lambda$showSettingsPromoDialog$3(Landroid/content/Intent;Landroid/view/View;)V
    .locals 1

    .line 1312
    sget-boolean p2, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz p2, :cond_0

    .line 1313
    const-string p2, "AppLockActivity"

    const-string/jumbo v0, "Launching App Lock settings page."

    invoke-static {p2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1315
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockActivity;->startActivity(Landroid/content/Intent;)V

    .line 1316
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method private synthetic blacklist lambda$showSetupScreenLockDialog$0(Landroid/view/View;)V
    .locals 1

    .line 785
    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mScrollView:Landroid/widget/ScrollView;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result p0

    const v0, 0x1020235

    .line 786
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/16 p0, 0x8

    .line 787
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private synthetic blacklist lambda$showSetupScreenLockDialog$1(Landroid/view/View;)V
    .locals 3

    .line 838
    new-instance p1, Landroid/content/Intent;

    const-string/jumbo v0, "android.settings.BIOMETRIC_ENROLL"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 839
    const-string/jumbo v0, "android.provider.extra.BIOMETRIC_AUTHENTICATORS_ALLOWED"

    const v1, 0x8000

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 843
    :try_start_0
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 844
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/app/AppLockActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 846
    const-string v1, "AppLockActivity"

    const-string v2, "ACTION_BIOMETRIC_ENROLL not found, falling back to ACTION_SET_NEW_PASSWORD"

    invoke-static {v1, v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 848
    new-instance p1, Landroid/content/Intent;

    const-string/jumbo v1, "android.app.action.SET_NEW_PASSWORD"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 850
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 851
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/app/AppLockActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private synthetic blacklist lambda$showSetupScreenLockDialog$2(Landroid/view/View;)V
    .locals 0

    .line 857
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_0

    .line 858
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 860
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 861
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 864
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method private synthetic blacklist lambda$showSetupScreenLockDialog$3(Landroid/content/DialogInterface;)V
    .locals 0

    .line 869
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 870
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 873
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method private blacklist maybeShowBiometricPrompt()V
    .locals 5

    .line 1076
    iget-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromptPending:Z

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->hasWindowFocus()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 1079
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromptPending:Z

    .line 1080
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 1081
    const-string/jumbo v2, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 1083
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v3

    const-string v4, "AppLockActivity"

    if-eqz v3, :cond_4

    .line 1084
    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length v3, v1

    if-nez v3, :cond_1

    .line 1085
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 1088
    :cond_1
    aget-object v1, v1, v0

    iget-object v3, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    aget v0, v3, v0

    invoke-direct {p0, v1, v0}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_2

    .line 1091
    const-string/jumbo v0, "Package label unavailable before folder authentication, finishing"

    invoke-static {v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1092
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 1095
    :cond_2
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1096
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mFolderName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/internal/app/AppLockActivity;->resolveFolderDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    :cond_3
    invoke-direct {p0, v0}, Lcom/android/internal/app/AppLockActivity;->getFolderItemsDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 1097
    :goto_0
    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    invoke-virtual {p0, v1, v0, v2}, Lcom/android/internal/app/AppLockActivity;->showBiometricPrompt([Ljava/lang/String;Ljava/lang/CharSequence;Z)V

    return-void

    .line 1100
    :cond_4
    const-string/jumbo v0, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1102
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v1

    if-nez v1, :cond_5

    .line 1105
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Package label unavailable before authentication for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", finishing"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1107
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 1110
    :cond_5
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/app/AppLockActivity;->showBiometricPrompt(Ljava/lang/String;Ljava/lang/CharSequence;Z)V

    :cond_6
    :goto_1
    return-void
.end method

.method private blacklist mergeFailures(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 7

    .line 1696
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_CHANGED_PACKAGES"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->nonNullArray([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 1698
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_FAILED_PACKAGES"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->nonNullArray([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedPackages:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/android/internal/app/AppLockActivity;->concat([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 1700
    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_CHANGED_USER_IDS"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v3

    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_FAILED_USER_IDS"

    .line 1702
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object p1

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedUserIds:[I

    invoke-static {p1, v0}, Lcom/android/internal/app/AppLockActivity;->concat([I[I)[I

    move-result-object v5

    array-length p1, v2

    array-length v0, v4

    .line 1703
    invoke-static {p1, v0}, Lcom/android/internal/app/AppLockActivity;->calculateResultCode(II)I

    move-result v6

    move-object v1, p0

    .line 1700
    invoke-direct/range {v1 .. v6}, Lcom/android/internal/app/AppLockActivity;->createResultBundle([Ljava/lang/String;[I[Ljava/lang/String;[II)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method private static blacklist nonNullArray([Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    .line 596
    new-array p0, p0, [Ljava/lang/String;

    :cond_0
    return-object p0
.end method

.method private blacklist readValidationResult(Landroid/content/Intent;)V
    .locals 1

    .line 586
    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_PACKAGES"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->nonNullArray([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    .line 588
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_FAILED_PACKAGES"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->nonNullArray([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedPackages:[Ljava/lang/String;

    .line 590
    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_ELIGIBLE_USER_IDS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    .line 591
    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_FAILED_USER_IDS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mInitialFailedUserIds:[I

    return-void
.end method

.method private blacklist requestShowBiometricPrompt()V
    .locals 1

    const/4 v0, 0x1

    .line 1071
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromptPending:Z

    .line 1072
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->maybeShowBiometricPrompt()V

    return-void
.end method

.method private blacklist resolveAndValidatePackages([Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 9

    .line 637
    const-string v0, "AppLockActivity"

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 638
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 639
    array-length v2, p1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_4

    aget-object v5, p1, v4

    if-eqz v5, :cond_3

    .line 640
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    :cond_0
    const-wide v6, 0x800000000L

    .line 645
    :try_start_0
    invoke-static {v6, v7}, Landroid/content/pm/PackageManager$ApplicationInfoFlags;->of(J)Landroid/content/pm/PackageManager$ApplicationInfoFlags;

    move-result-object v6

    .line 644
    invoke-virtual {p0, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;Landroid/content/pm/PackageManager$ApplicationInfoFlags;)Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    .line 646
    iget-boolean v7, v6, Landroid/content/pm/ApplicationInfo;->isAppLockSupported:Z

    if-nez v7, :cond_1

    .line 647
    sget-boolean v6, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz v6, :cond_3

    .line 648
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " does not support App Lock, skipping"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 652
    :cond_1
    iget-boolean v6, v6, Landroid/content/pm/ApplicationInfo;->isAppLockEnabled:Z

    if-ne v6, p2, :cond_2

    .line 653
    sget-boolean v6, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz v6, :cond_3

    .line 654
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "App Lock for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " already "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 658
    :cond_2
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v6

    .line 660
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "Package "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " not found"

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 663
    :cond_4
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_5

    const/4 p0, 0x0

    goto :goto_2

    :cond_5
    new-array p0, v3, [Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    :goto_2
    return-object p0
.end method

.method private blacklist resolveFolderDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 617
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const p1, 0x10409bd

    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p1
.end method

.method private blacklist sendAppLockResultBroadcast(Landroid/os/Bundle;Z)V
    .locals 2

    .line 1748
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.content.pm.action.APP_LOCK_RESULT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1749
    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1750
    const-string/jumbo v1, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1751
    const-string/jumbo p2, "android.content.pm.extra.APP_LOCK_RESULT_CODE"

    const/4 v1, 0x3

    invoke-virtual {p1, p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1753
    :goto_0
    const-string/jumbo p2, "android.content.pm.extra.APP_LOCK_SUCCESS"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1755
    iget p1, p0, Lcom/android/internal/app/AppLockActivity;->mFolderId:I

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    .line 1756
    const-string/jumbo p2, "android.content.pm.extra.APP_LOCK_FOLDER_ID"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1758
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1759
    const-string/jumbo p1, "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"

    iget p2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1761
    :cond_2
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p1

    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object p1

    const-string/jumbo p2, "android.permission.LOCK_APPS"

    invoke-virtual {p0, v0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;)V

    return-void
.end method

.method private blacklist setAppLockEnabledForTargetUser(Ljava/lang/String;Z)Z
    .locals 1

    .line 1525
    :try_start_0
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v0

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    .line 1526
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result p0

    filled-new-array {p0}, [I

    move-result-object p0

    .line 1525
    invoke-interface {v0, p1, p0, p2}, Landroid/content/pm/IPackageManager;->setPackagesAppLockEnabledAsUsers([Ljava/lang/String;[IZ)Landroid/os/Bundle;

    move-result-object p0

    .line 1527
    const-string/jumbo p1, "android.content.pm.extra.APP_LOCK_RESULT_CODE"

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :catch_0
    move-exception p0

    .line 1530
    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static blacklist setInjectorForTesting(Lcom/android/internal/app/AppLockActivity$Injector;)V
    .locals 1

    .line 363
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    .line 366
    sput-object p0, Lcom/android/internal/app/AppLockActivity;->sInjector:Lcom/android/internal/app/AppLockActivity$Injector;

    return-void

    .line 364
    :cond_0
    new-instance p0, Ljava/lang/SecurityException;

    const-string/jumbo v0, "Injector should only be set in debuggable builds."

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private blacklist showFirstPermissionReviewOrAuthenticate(Ljava/lang/CharSequence;Z)V
    .locals 2

    const/4 p1, 0x0

    .line 1426
    :goto_0
    iget-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length p2, p2

    if-ge p1, p2, :cond_1

    .line 1427
    iget-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    aget p2, p2, p1

    .line 1428
    invoke-direct {p0, p2}, Lcom/android/internal/app/AppLockActivity;->contextForAppLockUser(I)Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    .line 1427
    invoke-static {p2, v0}, Lcom/android/internal/app/AppLockActivity;->getPermissionReviewType(Landroid/content/Context;Ljava/lang/String;)I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    const/4 v0, 0x1

    .line 1430
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 1431
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    aget p1, v1, p1

    invoke-static {p0, v0, p2, p1}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;II)Landroid/content/Intent;

    move-result-object p1

    const/4 p2, 0x3

    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 1437
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->requestShowBiometricPrompt()V

    return-void
.end method

.method private blacklist showFolderResultToast(Landroid/os/Bundle;Z)V
    .locals 3

    .line 1767
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_RESULT_CODE"

    const/4 v1, 0x3

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-eqz p1, :cond_0

    .line 1770
    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "No folder result toast for result code "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", newAppLockEnabled="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "AppLockActivity"

    invoke-static {p1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1775
    :cond_0
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length v0, p1

    const/4 v1, 0x0

    if-lez v0, :cond_1

    .line 1776
    aget-object p1, p1, v1

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligibleUserIds:[I

    aget v0, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 1779
    :goto_0
    iget v0, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_3

    if-eqz p2, :cond_3

    .line 1781
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1782
    iget-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length p2, p2

    sub-int/2addr p2, v2

    if-nez p2, :cond_2

    const p2, 0x10405ed

    .line 1784
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/android/internal/app/AppLockActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 1785
    :cond_2
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 1786
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {p1, v2}, [Ljava/lang/Object;

    move-result-object p1

    const v2, 0x1150012

    .line 1785
    invoke-virtual {v0, v2, p2, p1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_3
    if-eqz p2, :cond_4

    const p1, 0x1040f85

    goto :goto_1

    :cond_4
    const p1, 0x1040f84

    .line 1790
    :goto_1
    iget-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderName:Ljava/lang/String;

    .line 1791
    invoke-direct {p0, p2}, Lcom/android/internal/app/AppLockActivity;->resolveFolderDisplayLabel(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    .line 1788
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1793
    :goto_2
    invoke-virtual {p0, p1, v1}, Lcom/android/internal/app/AppLockActivity;->showToast(Ljava/lang/CharSequence;I)V

    return-void
.end method

.method private blacklist showPermissionReviewDialog(Ljava/lang/String;I)V
    .locals 2

    .line 1139
    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 1140
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "showPermissionReviewDialog called for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppLockActivity"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1144
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const/4 p2, 0x1

    .line 1148
    iput-boolean p2, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    const/4 p2, 0x3

    .line 1149
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private blacklist showResultToast(ZLjava/lang/String;Ljava/lang/CharSequence;Z)V
    .locals 0

    .line 1799
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/app/AppLockActivity;->showResultToast(Z[Ljava/lang/String;Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method private blacklist showResultToast(Z[Ljava/lang/String;Ljava/lang/CharSequence;Z)V
    .locals 3

    .line 1806
    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    const-string v1, "AppLockActivity"

    if-eqz v0, :cond_0

    .line 1807
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "showResultToast called for "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length p2, p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " packages, success: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    if-nez p4, :cond_3

    if-nez p1, :cond_2

    .line 1814
    const-string/jumbo p0, "Failed to disable App Lock, which should not be possible."

    invoke-static {v1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    const p1, 0x1040f83

    goto :goto_0

    :cond_3
    if-eqz p1, :cond_4

    const p1, 0x10405ed

    goto :goto_0

    :cond_4
    const p1, 0x10405ec

    .line 1824
    :goto_0
    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->showToast(Ljava/lang/CharSequence;I)V

    return-void
.end method

.method private blacklist showSamsungSettingsPromoIfNeeded(ZZLjava/lang/CharSequence;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-eqz p2, :cond_5

    .line 1225
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_2

    .line 1229
    :cond_0
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p1

    .line 1230
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    .line 1231
    const-string/jumbo v1, "app_lock_settings_discovered"

    invoke-static {p2, v1, v0, p1}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    const/4 v3, -0x1

    .line 1234
    const-string v4, "AppLockActivity"

    if-eq v2, v3, :cond_4

    const/4 v3, 0x3

    if-lt v2, v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v5, 0x1

    add-int/2addr v2, v5

    .line 1240
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1242
    invoke-static {p2, v1, v2, p1}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    if-lt v2, v5, :cond_3

    if-lt v2, v3, :cond_2

    goto :goto_0

    .line 1251
    :cond_2
    :try_start_0
    invoke-static {p0, p3}, Lcom/android/internal/app/SamsungAppLockSettingsPromotionActivity;->createIntent(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockActivity;->startActivity(Landroid/content/Intent;)V

    .line 1253
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return v5

    :catch_0
    move-exception p0

    .line 1256
    const-string/jumbo p1, "Unable to show App Lock settings promotion"

    invoke-static {v4, p1, p0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0

    .line 1246
    :cond_3
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo p1, "Incrementing APP_LOCK_SETTINGS_DISCOVERED state to "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", not showing promo dialog."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 1236
    :cond_4
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "App Lock settings already discovered, not showing promo dialog. discoveredState="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_2
    return v0
.end method

.method private blacklist showSamsungSetupScreenLockDialog()V
    .locals 4

    .line 881
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getDisplay()Landroid/view/Display;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 883
    invoke-virtual {v0}, Landroid/view/Display;->getFlags()I

    move-result v0

    const/high16 v1, 0x20000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 884
    :goto_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x1040f8e

    .line 885
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 886
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result v2

    if-eqz v2, :cond_1

    const v2, 0x1040f8d

    goto :goto_1

    :cond_1
    const v2, 0x1040f8c

    :goto_1
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    if-eqz v0, :cond_2

    .line 892
    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda6;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    const v2, 0x104000a

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 895
    :cond_2
    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda7;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda8;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    const v3, 0x1040f8b

    .line 901
    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 922
    :goto_2
    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda9;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 924
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    .line 925
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_3

    const/16 v1, 0x50

    .line 927
    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    .line 929
    :cond_3
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 932
    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    const v0, 0x1020219

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_4

    const v0, 0x102023c

    .line 934
    invoke-virtual {p0, v0}, Landroid/view/View;->setId(I)V

    :cond_4
    return-void
.end method

.method private blacklist showSettingsPromoDialog(Landroid/content/Intent;Ljava/lang/CharSequence;)V
    .locals 3

    .line 1266
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->cleanupLayoutListeners()V

    .line 1270
    iget-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromoDialogShowing:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/app/ActivityManager;->isRunningInTestHarness()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1271
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 1272
    new-instance v1, Landroid/transition/Slide;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Landroid/transition/Slide;-><init>(I)V

    invoke-static {v0, v1}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroid/transition/Transition;)V

    :cond_0
    const v0, 0x109004f

    .line 1275
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockActivity;->setContentView(I)V

    const/4 v0, 0x1

    .line 1276
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromoDialogShowing:Z

    const v0, 0x1020251

    .line 1277
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x104023f

    .line 1278
    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/app/AppLockActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p2, 0x1020250

    .line 1283
    invoke-virtual {p0, p2}, Lcom/android/internal/app/AppLockActivity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 1284
    invoke-static {p2}, Lcom/android/internal/app/AppLockActivity;->applyWindowInsetsToDialogRoot(Landroid/view/View;)V

    .line 1287
    instance-of v0, p2, Lcom/android/internal/widget/ResolverDrawerLayout;

    if-eqz v0, :cond_1

    .line 1288
    check-cast p2, Lcom/android/internal/widget/ResolverDrawerLayout;

    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    invoke-virtual {p2, v0}, Lcom/android/internal/widget/ResolverDrawerLayout;->setOnDismissListener(Lcom/android/internal/widget/DismissableView$OnDismissListener;)V

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 1290
    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda1;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    :goto_0
    const p2, 0x1020253

    .line 1294
    invoke-virtual {p0, p2}, Lcom/android/internal/app/AppLockActivity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ScrollView;

    iput-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz p2, :cond_3

    .line 1296
    new-instance p2, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda2;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    iput-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 1301
    iget-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mScrollView:Landroid/widget/ScrollView;

    invoke-virtual {p2}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p2, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_1

    .line 1303
    :cond_3
    const-string p2, "AppLockActivity"

    const-string/jumbo v0, "mScrollView for promo dialog is null, cannot toggle divider visibility."

    invoke-static {p2, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const p2, 0x1020255

    .line 1306
    invoke-virtual {p0, p2}, Lcom/android/internal/app/AppLockActivity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda3;-><init>(Lcom/android/internal/app/AppLockActivity;)V

    .line 1307
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x1020256

    .line 1310
    invoke-virtual {p0, p2}, Lcom/android/internal/app/AppLockActivity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance v0, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/app/AppLockActivity$$ExternalSyntheticLambda4;-><init>(Lcom/android/internal/app/AppLockActivity;Landroid/content/Intent;)V

    .line 1311
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private blacklist showSettingsPromoIfNeeded(ZZLjava/lang/CharSequence;)Z
    .locals 4

    .line 1165
    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    const-string v1, ", newAppLockEnabled="

    const-string v2, "AppLockActivity"

    if-eqz v0, :cond_0

    .line 1166
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "showSettingsPromoIfNeeded() called with success="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1170
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "showSettingsPromoIfNeeded() called with values: success="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", packageLabel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1172
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/AppLockActivity;->showSamsungSettingsPromoIfNeeded(ZZLjava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method private blacklist showSetupScreenLockDialog(Ljava/lang/String;)V
    .locals 2

    .line 761
    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 762
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "showSetupScreenLockDialog called for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "AppLockActivity"

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->cleanupLayoutListeners()V

    .line 766
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->showSamsungSetupScreenLockDialog()V

    return-void
.end method

.method private blacklist showUserEducationDialog(Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 3

    .line 1115
    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 1116
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "showUserEducationDialog called for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppLockActivity"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1118
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length v0, v0

    goto :goto_0

    :cond_1
    move v0, v1

    .line 1119
    :goto_0
    iget v2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderFlow:I

    .line 1120
    invoke-static {p0, p1, p2, v0, v2}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;II)Landroid/content/Intent;

    move-result-object p1

    .line 1124
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isFolderLockFlow()Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/android/internal/app/AppLockActivity;->mFolderRes:Landroid/graphics/Bitmap;

    if-eqz p2, :cond_2

    .line 1125
    const-string/jumbo v0, "com.android.internal.app.extra.APP_LOCK_FOLDER_ICON"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_1

    .line 1128
    :cond_2
    const-string/jumbo p2, "android.intent.extra.user_handle"

    .line 1129
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getFirstAppLockTargetUserId()I

    move-result v0

    .line 1128
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1132
    :goto_1
    iput-boolean v1, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    const/4 p2, 0x2

    .line 1133
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method protected whitelist onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 1355
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p3, 0x0

    .line 1356
    iput-boolean p3, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 1358
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 1359
    invoke-direct {p0, p1, p2}, Lcom/android/internal/app/AppLockActivity;->handleFolderActivityResult(II)V

    return-void

    :cond_0
    const/4 p3, -0x1

    .line 1367
    const-string v0, "AppLockActivity"

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    if-eq p2, p3, :cond_1

    .line 1368
    new-instance p3, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "onActivityResult failed for request code: "

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", result code: "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1370
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 1374
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    .line 1375
    const-string/jumbo v2, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_2

    .line 1377
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 1381
    :cond_2
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result v2

    invoke-direct {p0, p2, v2}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v2

    if-eq p1, v1, :cond_7

    const/4 v2, 0x2

    const/4 v3, 0x3

    if-eq p1, v2, :cond_4

    if-eq p1, v3, :cond_3

    .line 1418
    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo p2, "Received unknown request code: "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 1415
    :cond_3
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->requestShowBiometricPrompt()V

    return-void

    .line 1400
    :cond_4
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->contextForAppLockUser(I)Landroid/content/Context;

    move-result-object p1

    .line 1399
    invoke-static {p1, p2}, Lcom/android/internal/app/AppLockActivity;->getPermissionReviewType(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-eq p1, p3, :cond_6

    .line 1402
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isAppLockCrossUserTarget()Z

    move-result p3

    if-eqz p3, :cond_5

    .line 1403
    iput-boolean v1, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 1405
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result p3

    .line 1404
    invoke-static {p0, p2, p1, p3}, Lcom/android/internal/app/SamsungAppLockPermissionReviewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;II)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1, v3}, Lcom/android/internal/app/AppLockActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 1408
    :cond_5
    invoke-direct {p0, p2, p1}, Lcom/android/internal/app/AppLockActivity;->showPermissionReviewDialog(Ljava/lang/String;I)V

    return-void

    .line 1411
    :cond_6
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->requestShowBiometricPrompt()V

    return-void

    .line 1385
    :cond_7
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 1386
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 1388
    :cond_8
    iget-object p1, p0, Lcom/android/internal/app/AppLockActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-eqz p1, :cond_9

    .line 1389
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/app/KeyguardManager;->isDeviceSecure(I)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 1390
    invoke-direct {p0, p2, v2}, Lcom/android/internal/app/AppLockActivity;->showUserEducationDialog(Ljava/lang/String;Ljava/lang/CharSequence;)V

    return-void

    .line 1392
    :cond_9
    sget-boolean p1, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz p1, :cond_a

    .line 1393
    const-string/jumbo p1, "Screen lock not set after setup attempt, finishing."

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1395
    :cond_a
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method public whitelist onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 676
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 677
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string/jumbo v0, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 678
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mEligiblePackageNames:[Ljava/lang/String;

    array-length v1, v0

    if-lez v1, :cond_0

    const/4 p1, 0x0

    .line 679
    aget-object p1, v0, p1

    :cond_0
    if-nez p1, :cond_2

    .line 682
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 683
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 685
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 689
    :cond_2
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 690
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->cleanupLayoutListeners()V

    .line 691
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 692
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->showSetupScreenLockDialog(Ljava/lang/String;)V

    return-void

    .line 693
    :cond_3
    iget-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromoDialogShowing:Z

    if-eqz v0, :cond_5

    .line 694
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockSettingsIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 696
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/android/internal/app/AppLockActivity;->showSettingsPromoDialog(Landroid/content/Intent;Ljava/lang/CharSequence;)V

    return-void

    .line 698
    :cond_4
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->cleanupLayoutListeners()V

    .line 699
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    :cond_5
    return-void
.end method

.method public whitelist onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 371
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 372
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addSystemFlags(I)V

    .line 374
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 375
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v0

    const/16 v2, 0x10

    invoke-interface {v0, v1, v2}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 377
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 381
    invoke-static {}, Lcom/android/internal/hidden_from_bootclasspath/android/security/Flags;->appLockApis()Z

    move-result v0

    const-string v2, "AppLockActivity"

    if-eqz v0, :cond_f

    invoke-static {}, Lcom/android/internal/hidden_from_bootclasspath/android/security/Flags;->appLockCore()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 387
    :cond_0
    const-class v0, Landroid/app/KeyguardManager;

    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    iput-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 388
    const-string/jumbo v0, "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"

    if-eqz p1, :cond_4

    .line 389
    const-string/jumbo v2, "sub_activity_pending"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    .line 392
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 393
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 394
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 396
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.PACKAGES"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/app/AppLockActivity;->nonNullArray([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 393
    invoke-direct {p0, p1, v0, v1}, Lcom/android/internal/app/AppLockActivity;->applyFolderFlowState(Landroid/content/Intent;I[Ljava/lang/String;)V

    .line 398
    :cond_1
    iget-boolean p1, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    if-nez p1, :cond_3

    .line 399
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 400
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 402
    :cond_2
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    :cond_3
    return-void

    .line 409
    :cond_4
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 410
    const-string/jumbo v3, "android.content.pm.extra.APP_LOCK_NEW_STATE"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 411
    const-string/jumbo p1, "No new App Lock state, finishing"

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 415
    :cond_5
    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    .line 418
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 419
    invoke-direct {p0, p1, v3}, Lcom/android/internal/app/AppLockActivity;->handleFolderAppLockFlow(Landroid/content/Intent;Z)V

    return-void

    .line 423
    :cond_6
    const-string/jumbo v0, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_7

    .line 425
    const-string/jumbo p1, "Package name is null, finishing"

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 430
    :cond_7
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 431
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->isAppLockCrossUserTarget()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 432
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/app/AppLockActivity;->contextForAppLockUser(I)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    :cond_8
    const-wide v4, 0x800000000L

    .line 437
    :try_start_0
    invoke-static {v4, v5}, Landroid/content/pm/PackageManager$ApplicationInfoFlags;->of(J)Landroid/content/pm/PackageManager$ApplicationInfoFlags;

    move-result-object v4

    .line 436
    invoke-virtual {v0, p1, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;Landroid/content/pm/PackageManager$ApplicationInfoFlags;)Landroid/content/pm/ApplicationInfo;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    iget-boolean v4, v0, Landroid/content/pm/ApplicationInfo;->isAppLockSupported:Z

    if-nez v4, :cond_9

    .line 445
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not support App Lock, finishing"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 450
    :cond_9
    iget-boolean v4, v0, Landroid/content/pm/ApplicationInfo;->isAppLockEnabled:Z

    if-ne v4, v3, :cond_a

    .line 451
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "The App Lock state for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is already "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", finishing"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 458
    :cond_a
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getAppLockTargetUserId()I

    move-result v3

    invoke-direct {p0, p1, v3}, Lcom/android/internal/app/AppLockActivity;->getPackageLabel(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 461
    iget-object v4, p0, Lcom/android/internal/app/AppLockActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-eqz v4, :cond_b

    .line 462
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v5

    .line 461
    invoke-virtual {v4, v5}, Landroid/app/KeyguardManager;->isDeviceSecure(I)Z

    move-result v4

    if-eqz v4, :cond_b

    const/4 v1, 0x1

    .line 463
    :cond_b
    iget-boolean v0, v0, Landroid/content/pm/ApplicationInfo;->isAppLockEnabled:Z

    if-eqz v0, :cond_d

    if-eqz v1, :cond_c

    .line 465
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->requestShowBiometricPrompt()V

    return-void

    .line 467
    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Device is not secure, cannot disable App Lock for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    :cond_d
    if-nez v1, :cond_e

    .line 472
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockActivity;->showSetupScreenLockDialog(Ljava/lang/String;)V

    return-void

    .line 474
    :cond_e
    invoke-direct {p0, p1, v3}, Lcom/android/internal/app/AppLockActivity;->showUserEducationDialog(Ljava/lang/String;Ljava/lang/CharSequence;)V

    return-void

    :catch_0
    move-exception v0

    .line 439
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Package "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 440
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void

    .line 382
    :cond_f
    :goto_0
    const-string p1, "App Lock implementation is not enabled, finishing"

    invoke-static {v2, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    return-void
.end method

.method protected whitelist onDestroy()V
    .locals 1

    .line 735
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 736
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->cleanupLayoutListeners()V

    .line 737
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 738
    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method protected whitelist onResume()V
    .locals 0

    .line 481
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 482
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->maybeShowBiometricPrompt()V

    return-void
.end method

.method protected whitelist onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 670
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 671
    const-string/jumbo v0, "sub_activity_pending"

    iget-boolean p0, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method protected whitelist onStop()V
    .locals 1

    .line 706
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 707
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 708
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->cleanupLayoutListeners()V

    .line 709
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity;->mScreenLockDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 711
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsSubActivityPending:Z

    if-nez v0, :cond_1

    .line 712
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 713
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    goto :goto_0

    .line 715
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    .line 719
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromoDialogShowing:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_2

    .line 720
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->cleanupLayoutListeners()V

    .line 721
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    .line 723
    :cond_2
    iget-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromptPending:Z

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    .line 724
    iput-boolean v0, p0, Lcom/android/internal/app/AppLockActivity;->mIsPromptPending:Z

    .line 725
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->hasFolderFlow()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 726
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->finishAfterCanceledFlow()V

    return-void

    .line 728
    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->finish()V

    :cond_4
    return-void
.end method

.method public whitelist onWindowFocusChanged(Z)V
    .locals 0

    .line 487
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_0

    .line 489
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->maybeShowBiometricPrompt()V

    :cond_0
    return-void
.end method

.method protected blacklist showBiometricPrompt(Ljava/lang/String;Ljava/lang/CharSequence;Z)V
    .locals 0

    .line 960
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/internal/app/AppLockActivity;->showBiometricPrompt([Ljava/lang/String;Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method protected blacklist showBiometricPrompt([Ljava/lang/String;Ljava/lang/CharSequence;Z)V
    .locals 3

    .line 971
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 973
    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 974
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "showBiometricPrompt called for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " packages"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppLockActivity"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 976
    :cond_0
    new-instance v0, Lcom/android/internal/app/AppLockActivity$2;

    invoke-direct {v0, p0, p3, p1, p2}, Lcom/android/internal/app/AppLockActivity$2;-><init>(Lcom/android/internal/app/AppLockActivity;Z[Ljava/lang/String;Ljava/lang/CharSequence;)V

    const/4 p3, 0x0

    .line 1031
    aget-object p1, p1, p3

    .line 1040
    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity;->mInjector:Lcom/android/internal/app/AppLockActivity$Injector;

    .line 1041
    invoke-virtual {v1, p0}, Lcom/android/internal/app/AppLockActivity$Injector;->getBiometricPromptBuilder(Landroid/app/Activity;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v1

    const v2, 0x10402af

    .line 1042
    invoke-virtual {p0, v2}, Lcom/android/internal/app/AppLockActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v1

    .line 1043
    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setDescription(Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v1

    .line 1044
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setLogoDescription(Ljava/lang/String;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p2

    const v1, 0x80ff

    .line 1045
    invoke-virtual {p2, v1}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setAllowedAuthenticators(I)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p2

    .line 1050
    invoke-virtual {p2, p3}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setConfirmationRequired(Z)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 1053
    iget-object p3, p0, Lcom/android/internal/app/AppLockActivity;->mFolderRes:Landroid/graphics/Bitmap;

    if-eqz p3, :cond_1

    .line 1054
    invoke-virtual {p2, p3}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setLogoBitmap(Landroid/graphics/Bitmap;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    goto :goto_0

    .line 1057
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/AppLockActivity;->getFirstAppLockTargetUserId()I

    move-result p3

    invoke-direct {p0, p1, p3}, Lcom/android/internal/app/AppLockActivity;->getPackageLogoAsDrawable(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 1056
    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->convertDrawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 1060
    invoke-virtual {p2, p1}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setLogoBitmap(Landroid/graphics/Bitmap;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 1064
    :cond_2
    :goto_0
    invoke-virtual {p2}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->build()Landroid/hardware/biometrics/BiometricPrompt;

    move-result-object p1

    .line 1065
    new-instance p2, Landroid/os/CancellationSignal;

    invoke-direct {p2}, Landroid/os/CancellationSignal;-><init>()V

    invoke-virtual {p0}, Lcom/android/internal/app/AppLockActivity;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object p0

    invoke-virtual {p1, p2, p0, v0}, Landroid/hardware/biometrics/BiometricPrompt;->authenticate(Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;)V

    return-void
.end method

.method protected blacklist showToast(Ljava/lang/CharSequence;I)V
    .locals 2

    .line 1831
    sget-boolean v0, Lcom/android/internal/app/AppLockActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 1832
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "showToast called with text: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppLockActivity"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1834
    :cond_0
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method
