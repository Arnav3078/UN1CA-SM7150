.class public final Lcom/android/internal/app/SamsungAppLockUserEducationActivity;
.super Lcom/android/internal/app/AlertActivity;
.source "SamsungAppLockUserEducationActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field private static final blacklist APP_LOCK_FOLDER_FLOW_NONE:I = -0x1

.field private static final blacklist BULLET_PREFIX:Ljava/lang/String; = "\u2022 "

.field static final blacklist EXTRA_FOLDER_ICON:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_FOLDER_ICON"

.field private static final blacklist EXTRA_PACKAGE_COUNT:Ljava/lang/String; = "com.android.internal.app.extra.APP_LOCK_PACKAGE_COUNT"


# instance fields
.field private blacklist mCompleted:Z

.field private blacklist mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

.field private blacklist mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private blacklist mScrollView:Landroid/widget/ScrollView;


# direct methods
.method public static synthetic blacklist $r8$lambda$GPqiET__C7AKm2PnDWQBxgj068U(Lcom/android/internal/app/SamsungAppLockUserEducationActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finishCanceled()V

    return-void
.end method

.method public constructor blacklist <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    return-void
.end method

.method private blacklist createContentView(ZZZ)Landroid/view/View;
    .locals 3

    .line 163
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x1090176

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    if-eqz p3, :cond_0

    const p1, 0x1040f7e

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    const p1, 0x1040f7d

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    const p1, 0x1040f7c

    goto :goto_0

    :cond_2
    const p1, 0x1040f7f

    :goto_0
    const p3, 0x10205e2

    .line 171
    invoke-virtual {v0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 172
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(I)V

    const p1, 0x10205e7

    .line 173
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    if-eqz p2, :cond_3

    const/16 p2, 0x8

    .line 176
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_3
    const p2, 0x1040f82

    .line 178
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    :goto_1
    const p1, 0x10205e8

    .line 180
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string/jumbo p3, "\u2022 "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v1, 0x1040f7b

    .line 181
    invoke-virtual {p0, v1}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x10205e3

    .line 182
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const p3, 0x1040f7a

    .line 184
    invoke-virtual {p0, p3}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 183
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x10205e1

    .line 185
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 187
    invoke-direct {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->setupScrollDividers(Landroid/view/View;)V

    return-object v0
.end method

.method private blacklist createIconTitleView(Landroid/graphics/drawable/Drawable;)Landroid/view/View;
    .locals 5

    .line 130
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x1090177

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x1020243

    .line 132
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 133
    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iget-object v2, v2, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->fontScale:F

    const v3, 0x3fa66666    # 1.3f

    cmpl-float v4, v2, v3

    if-lez v4, :cond_0

    .line 138
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v4, 0x10504c4

    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p0

    div-float/2addr p0, v2

    mul-float/2addr p0, v3

    const/4 v2, 0x0

    .line 137
    invoke-virtual {v1, v2, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_0
    const p0, 0x10205e0

    .line 142
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    .line 143
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method static blacklist createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;II)Landroid/content/Intent;
    .locals 2

    .line 53
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo p0, "android.intent.extra.PACKAGE_NAME"

    .line 54
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "android.intent.extra.TITLE"

    .line 55
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "com.android.internal.app.extra.APP_LOCK_PACKAGE_COUNT"

    .line 56
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string/jumbo p1, "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"

    .line 57
    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private blacklist finishCanceled()V
    .locals 1

    .line 281
    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mCompleted:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 284
    iput-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mCompleted:Z

    const/4 v0, 0x0

    .line 285
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->setResult(I)V

    .line 286
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finishAffinity()V

    return-void
.end method

.method static synthetic blacklist lambda$setupScrollDividers$0(Landroid/view/View;Landroid/widget/ScrollView;Landroid/view/View;)V
    .locals 3

    const/4 v0, -0x1

    .line 199
    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 p0, 0x1

    .line 201
    invoke-virtual {p1, p0}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method static synthetic blacklist lambda$setupScrollDividers$1(Ljava/lang/Runnable;Landroid/view/View;IIII)V
    .locals 0

    .line 205
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private blacklist loadAppIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 148
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.user_handle"

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 149
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 150
    :cond_0
    invoke-static {v0}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->createContextAsUser(Landroid/os/UserHandle;I)Landroid/content/Context;

    move-result-object p0

    .line 151
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 v0, 0x1

    .line 153
    :try_start_0
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->semGetApplicationIconForIconTray(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 156
    :catch_0
    invoke-virtual {p0}, Landroid/content/pm/PackageManager;->getDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method private blacklist retagTitleViewForPlatformTests()V
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iget-object v0, v0, Lcom/android/internal/app/AlertController$AlertParams;->mCustomTitleView:Landroid/view/View;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 122
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getWindow()Landroid/view/Window;

    move-result-object p0

    const v0, 0x1020219

    invoke-virtual {p0, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_1

    const v0, 0x1020243

    .line 124
    invoke-virtual {p0, v0}, Landroid/view/View;->setId(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private blacklist setupScrollDividers(Landroid/view/View;)V
    .locals 3

    const v0, 0x10205e6

    .line 192
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    const v1, 0x10205e5

    .line 194
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x10205e4

    .line 196
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 198
    new-instance v2, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1, v0, p1}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda1;-><init>(Landroid/view/View;Landroid/widget/ScrollView;Landroid/view/View;)V

    .line 204
    new-instance p1, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda2;

    invoke-direct {p1, v2}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/ScrollView;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    .line 206
    iput-object v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mScrollView:Landroid/widget/ScrollView;

    .line 207
    new-instance p1, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda3;

    invoke-direct {p1, v2}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 208
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method


# virtual methods
.method public whitelist cancel()V
    .locals 0

    .line 251
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finishCanceled()V

    return-void
.end method

.method public whitelist finish()V
    .locals 0

    .line 230
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->finish()V

    .line 231
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    if-eqz p0, :cond_0

    .line 232
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->onActivityFinished()V

    :cond_0
    return-void
.end method

.method public whitelist finishAffinity()V
    .locals 0

    .line 238
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->finishAffinity()V

    .line 239
    iget-object p0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    if-eqz p0, :cond_0

    .line 240
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->onActivityFinished()V

    :cond_0
    return-void
.end method

.method public whitelist onBackPressed()V
    .locals 0

    .line 246
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finishCanceled()V

    return-void
.end method

.method public whitelist onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 213
    const-string p1, "ALK103"

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 214
    const-string p2, "ALK1005"

    invoke-static {p0, p1, p2}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 216
    iput-boolean p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mCompleted:Z

    .line 217
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->setResult(I)V

    .line 218
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finish()V

    return-void

    :cond_0
    const/4 v0, -0x2

    if-ne p2, v0, :cond_1

    .line 221
    const-string p2, "ALK1004"

    invoke-static {p0, p1, p2}, Lcom/samsung/android/core/pm/SALogger;->sendEventLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finishCanceled()V

    return-void
.end method

.method protected whitelist onCreate(Landroid/os/Bundle;)V
    .locals 10

    .line 62
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addSystemFlags(I)V

    .line 64
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Landroid/view/Window;->setGravity(I)V

    .line 66
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 67
    const-string/jumbo v0, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    const-string/jumbo v1, "android.intent.extra.TITLE"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 69
    const-string/jumbo v2, "com.android.internal.app.extra.APP_LOCK_PACKAGE_COUNT"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 70
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    if-gtz v2, :cond_0

    goto/16 :goto_6

    .line 76
    :cond_0
    const-string/jumbo v4, "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"

    const/4 v5, -0x1

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_1

    move v6, v5

    goto :goto_0

    :cond_1
    move v6, v3

    :goto_0
    if-ne v4, v5, :cond_2

    move v4, v5

    goto :goto_1

    :cond_2
    move v4, v3

    :goto_1
    if-eqz v4, :cond_3

    if-le v2, v5, :cond_3

    move v3, v5

    .line 83
    :cond_3
    iget-object v7, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    if-eqz v3, :cond_4

    .line 84
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sub-int/2addr v2, v5

    .line 86
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v1, v9}, [Ljava/lang/Object;

    move-result-object v1

    const v9, 0x1150011

    .line 84
    invoke-virtual {v8, v9, v2, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_4
    if-eqz v4, :cond_5

    const v2, 0x1040f80

    .line 88
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_5
    const v2, 0x1040f81

    .line 89
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_2
    iput-object v1, v7, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    if-eqz v6, :cond_6

    .line 91
    const-string/jumbo v1, "com.android.internal.app.extra.APP_LOCK_FOLDER_ICON"

    const-class v2, Landroid/graphics/Bitmap;

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    goto :goto_3

    :cond_6
    const/4 p1, 0x0

    :goto_3
    if-nez v6, :cond_7

    if-nez v4, :cond_7

    .line 93
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    invoke-direct {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->loadAppIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->createIconTitleView(Landroid/graphics/drawable/Drawable;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mCustomTitleView:Landroid/view/View;

    goto :goto_4

    :cond_7
    if-eqz p1, :cond_8

    .line 95
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    .line 96
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 95
    invoke-direct {p0, v1}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->createIconTitleView(Landroid/graphics/drawable/Drawable;)Landroid/view/View;

    move-result-object p1

    iput-object p1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mCustomTitleView:Landroid/view/View;

    .line 98
    :cond_8
    :goto_4
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    invoke-direct {p0, v6, v4, v3}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->createContentView(ZZZ)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mView:Landroid/view/View;

    .line 100
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    const/high16 v0, 0x1040000

    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 101
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object p0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 102
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    if-eqz v4, :cond_9

    const v0, 0x1040f77

    goto :goto_5

    :cond_9
    const v0, 0x1040f78

    :goto_5
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 105
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    iput-object p0, p1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 106
    iget-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mAlert:Lcom/android/internal/app/AlertController;

    invoke-virtual {p1, v5}, Lcom/android/internal/app/AlertController;->semSetBackgroundBlurEnabled(Z)V

    .line 107
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->setupAlert()V

    .line 108
    invoke-direct {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->retagTitleViewForPlatformTests()V

    .line 112
    new-instance p1, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/SamsungAppLockUserEducationActivity;)V

    invoke-static {p0, p1}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->attach(Landroid/app/Activity;Ljava/lang/Runnable;)Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    move-result-object p1

    iput-object p1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    return-void

    .line 72
    :cond_a
    :goto_6
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finish()V

    return-void
.end method

.method protected whitelist onDestroy()V
    .locals 3

    .line 266
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 267
    invoke-virtual {v0}, Lcom/android/internal/app/SamsungAppLockPredictiveBackController;->release()V

    .line 268
    iput-object v1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mPredictiveBackController:Lcom/android/internal/app/SamsungAppLockPredictiveBackController;

    .line 270
    :cond_0
    iget-object v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v2, :cond_2

    .line 271
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 272
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 273
    iget-object v2, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 275
    :cond_1
    iput-object v1, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mScrollDividerLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 277
    :cond_2
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onDestroy()V

    return-void
.end method

.method protected whitelist onStop()V
    .locals 1

    .line 256
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStop()V

    .line 257
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mCompleted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 258
    iput-boolean v0, p0, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->mCompleted:Z

    const/4 v0, 0x0

    .line 259
    invoke-virtual {p0, v0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->setResult(I)V

    .line 260
    invoke-virtual {p0}, Lcom/android/internal/app/SamsungAppLockUserEducationActivity;->finish()V

    :cond_0
    return-void
.end method
