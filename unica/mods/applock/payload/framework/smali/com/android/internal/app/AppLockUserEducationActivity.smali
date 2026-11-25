.class public Lcom/android/internal/app/AppLockUserEducationActivity;
.super Landroid/app/Activity;
.source "AppLockUserEducationActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/AppLockUserEducationActivity$Injector;
    }
.end annotation


# static fields
.field private static final blacklist DEBUG:Z

.field private static final blacklist TAG:Ljava/lang/String; = "AppLockUserEducation"

.field private static blacklist sInjector:Lcom/android/internal/app/AppLockUserEducationActivity$Injector;


# instance fields
.field private blacklist mAppLockLayout:Landroid/view/View;

.field private blacklist mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private final blacklist mInjector:Lcom/android/internal/app/AppLockUserEducationActivity$Injector;

.field private blacklist mScrollView:Landroid/widget/ScrollView;

.field private final blacklist mUserId:I


# direct methods
.method public static synthetic blacklist $r8$lambda$2U0ZWnQjXQCk8Ie3iMrrk8eHyAA(Lcom/android/internal/app/AppLockUserEducationActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->lambda$setupUiAndShowDialog$2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$IZguSaVa3MZqSaavnWPOsfHVaUU(Lcom/android/internal/app/AppLockUserEducationActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->lambda$setupUiAndShowDialog$0()V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$_m0elGPRQ3LnNizJ6m14varhVQo(Lcom/android/internal/app/AppLockUserEducationActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->lambda$setupUiAndShowDialog$1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic blacklist $r8$lambda$uMdJuWezCy0_J_JrNDooaaoRqrY(Lcom/android/internal/app/AppLockUserEducationActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->lambda$setupUiAndShowDialog$3(Landroid/view/View;)V

    return-void
.end method

.method static constructor blacklist <clinit>()V
    .locals 2

    .line 64
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    const-string v0, "AppLockUserEducation"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/android/internal/app/AppLockUserEducationActivity;->DEBUG:Z

    return-void
.end method

.method public constructor blacklist <init>()V
    .locals 1

    .line 62
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 66
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    iput v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mUserId:I

    .line 71
    sget-object v0, Lcom/android/internal/app/AppLockUserEducationActivity;->sInjector:Lcom/android/internal/app/AppLockUserEducationActivity$Injector;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/internal/app/AppLockUserEducationActivity$Injector;

    invoke-direct {v0}, Lcom/android/internal/app/AppLockUserEducationActivity$Injector;-><init>()V

    :cond_0
    iput-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mInjector:Lcom/android/internal/app/AppLockUserEducationActivity$Injector;

    return-void
.end method

.method static blacklist createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;
    .locals 2

    .line 82
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/internal/app/AppLockUserEducationActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 83
    const-string/jumbo p0, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    const-string/jumbo p0, "android.intent.extra.TITLE"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    return-object v0
.end method

.method private blacklist getDescriptionResId(IZZ)I
    .locals 0

    const/4 p0, 0x1

    if-eq p1, p0, :cond_8

    const/4 p0, 0x3

    if-eq p1, p0, :cond_4

    const/4 p0, 0x4

    if-eq p1, p0, :cond_0

    .line 304
    new-instance p0, Ljava/lang/StringBuilder;

    const-string/jumbo p2, "Unexpected credential type: "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "AppLockUserEducation"

    invoke-static {p1, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0

    :cond_0
    if-eqz p2, :cond_2

    if-eqz p3, :cond_1

    const p0, 0x1040228

    return p0

    :cond_1
    const p0, 0x104022b

    return p0

    :cond_2
    if-eqz p3, :cond_3

    const p0, 0x1040225

    return p0

    :cond_3
    const p0, 0x104022e

    return p0

    :cond_4
    if-eqz p2, :cond_6

    if-eqz p3, :cond_5

    const p0, 0x104022a

    return p0

    :cond_5
    const p0, 0x104022d

    return p0

    :cond_6
    if-eqz p3, :cond_7

    const p0, 0x1040227

    return p0

    :cond_7
    const p0, 0x1040230

    return p0

    :cond_8
    if-eqz p2, :cond_a

    if-eqz p3, :cond_9

    const p0, 0x1040229

    return p0

    :cond_9
    const p0, 0x104022c

    return p0

    :cond_a
    if-eqz p3, :cond_b

    const p0, 0x1040226

    return p0

    :cond_b
    const p0, 0x104022f

    return p0
.end method

.method private synthetic blacklist lambda$setupUiAndShowDialog$0()V
    .locals 2

    .line 181
    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mScrollView:Landroid/widget/ScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    move-result v0

    .line 182
    iget-object p0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mAppLockLayout:Landroid/view/View;

    const v1, 0x102023d

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    .line 183
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private synthetic blacklist lambda$setupUiAndShowDialog$1(Landroid/view/View;)V
    .locals 0

    const/4 p1, -0x1

    .line 244
    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->setResult(I)V

    .line 245
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->finish()V

    return-void
.end method

.method private synthetic blacklist lambda$setupUiAndShowDialog$2(Landroid/view/View;)V
    .locals 0

    .line 251
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->onBackPressed()V

    return-void
.end method

.method private synthetic blacklist lambda$setupUiAndShowDialog$3(Landroid/view/View;)V
    .locals 0

    .line 263
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->onBackPressed()V

    return-void
.end method

.method public static blacklist setInjectorForTesting(Lcom/android/internal/app/AppLockUserEducationActivity$Injector;)V
    .locals 1

    .line 96
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    .line 99
    sput-object p0, Lcom/android/internal/app/AppLockUserEducationActivity;->sInjector:Lcom/android/internal/app/AppLockUserEducationActivity$Injector;

    return-void

    .line 97
    :cond_0
    new-instance p0, Ljava/lang/SecurityException;

    const-string/jumbo v0, "Injector should only be set in debuggable builds."

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private blacklist setupUiAndShowDialog(Ljava/lang/CharSequence;)V
    .locals 9

    .line 162
    sget-boolean v0, Lcom/android/internal/app/AppLockUserEducationActivity;->DEBUG:Z

    const-string v1, "AppLockUserEducation"

    if-eqz v0, :cond_0

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "setupUiAndShowDialog called with label: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const v0, 0x109004b

    .line 165
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockUserEducationActivity;->setContentView(I)V

    const v0, 0x102023e

    .line 166
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockUserEducationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mAppLockLayout:Landroid/view/View;

    const v2, 0x1020243

    .line 167
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x1040231

    .line 168
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/app/AppLockUserEducationActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz v0, :cond_1

    .line 173
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 174
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 175
    iget-object v2, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 178
    :cond_1
    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mAppLockLayout:Landroid/view/View;

    const v2, 0x1020245

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz v0, :cond_2

    .line 180
    new-instance v0, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/internal/app/AppLockUserEducationActivity;)V

    iput-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 185
    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mScrollView:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v2, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_0

    .line 187
    :cond_2
    const-string/jumbo v0, "mScrollView is null, cannot toggle divider visibility."

    invoke-static {v1, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    :goto_0
    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mAppLockLayout:Landroid/view/View;

    const v2, 0x1020241

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 192
    iget-object v2, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mInjector:Lcom/android/internal/app/AppLockUserEducationActivity$Injector;

    invoke-virtual {v2, p0}, Lcom/android/internal/app/AppLockUserEducationActivity$Injector;->getLockPatternUtils(Landroid/content/Context;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mUserId:I

    invoke-virtual {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;->getCredentialTypeForUser(I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_3

    .line 195
    const-string p1, "Credential type is none, finishing."

    invoke-static {v1, p1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->finish()V

    return-void

    :cond_3
    const/4 v3, 0x0

    .line 204
    :try_start_0
    iget-object v4, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mInjector:Lcom/android/internal/app/AppLockUserEducationActivity$Injector;

    invoke-virtual {v4, p0}, Lcom/android/internal/app/AppLockUserEducationActivity$Injector;->getBiometricManager(Landroid/content/Context;)Landroid/hardware/biometrics/BiometricManager;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 207
    invoke-virtual {v4}, Landroid/hardware/biometrics/BiometricManager;->getEnrollmentStatus()Ljava/util/Map;

    move-result-object v4

    const/4 v5, 0x2

    .line 210
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 209
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/biometrics/BiometricEnrollmentStatus;

    const/4 v6, 0x1

    const/16 v7, 0xf

    if-eqz v5, :cond_4

    .line 212
    invoke-virtual {v5}, Landroid/hardware/biometrics/BiometricEnrollmentStatus;->getStrength()I

    move-result v8

    if-ne v8, v7, :cond_4

    .line 214
    invoke-virtual {v5}, Landroid/hardware/biometrics/BiometricEnrollmentStatus;->getEnrollmentCount()I

    move-result v5
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    if-lez v5, :cond_4

    move v5, v6

    goto :goto_1

    :cond_4
    move v5, v3

    :goto_1
    const/16 v8, 0x8

    .line 217
    :try_start_1
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 216
    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/biometrics/BiometricEnrollmentStatus;

    if-eqz v4, :cond_6

    .line 219
    invoke-virtual {v4}, Landroid/hardware/biometrics/BiometricEnrollmentStatus;->getStrength()I

    move-result v8

    if-ne v8, v7, :cond_6

    .line 221
    invoke-virtual {v4}, Landroid/hardware/biometrics/BiometricEnrollmentStatus;->getEnrollmentCount()I

    move-result v1
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    if-lez v1, :cond_6

    move v3, v6

    goto :goto_3

    :catch_0
    move-exception v4

    goto :goto_2

    :cond_5
    move v1, v3

    goto :goto_4

    :catch_1
    move-exception v4

    move v5, v3

    .line 224
    :goto_2
    const-string/jumbo v6, "Exception while checking enrollment status"

    invoke-static {v1, v6, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    :goto_3
    move v1, v3

    move v3, v5

    .line 227
    :goto_4
    invoke-direct {p0, v2, v3, v1}, Lcom/android/internal/app/AppLockUserEducationActivity;->getDescriptionResId(IZZ)I

    move-result v1

    if-nez v1, :cond_7

    .line 229
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->finish()V

    return-void

    .line 232
    :cond_7
    invoke-virtual {p0, v1}, Lcom/android/internal/app/AppLockUserEducationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mAppLockLayout:Landroid/view/View;

    const v1, 0x1020242

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_8

    const v1, 0x1040232

    .line 237
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    :cond_8
    iget-object p1, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mAppLockLayout:Landroid/view/View;

    const v0, 0x1020240

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 243
    new-instance v0, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda1;-><init>(Lcom/android/internal/app/AppLockUserEducationActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 248
    iget-object p1, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mAppLockLayout:Landroid/view/View;

    const v0, 0x102023f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 250
    new-instance v0, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda2;-><init>(Lcom/android/internal/app/AppLockUserEducationActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x1020244

    .line 256
    invoke-virtual {p0, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 257
    invoke-static {p1}, Lcom/android/internal/app/AppLockActivity;->applyWindowInsetsToDialogRoot(Landroid/view/View;)V

    .line 260
    instance-of v0, p1, Lcom/android/internal/widget/ResolverDrawerLayout;

    if-eqz v0, :cond_9

    .line 261
    check-cast p1, Lcom/android/internal/widget/ResolverDrawerLayout;

    new-instance v0, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda3;-><init>(Lcom/android/internal/app/AppLockUserEducationActivity;)V

    invoke-virtual {p1, v0}, Lcom/android/internal/widget/ResolverDrawerLayout;->setOnDismissListener(Lcom/android/internal/widget/DismissableView$OnDismissListener;)V

    goto :goto_5

    :cond_9
    if-eqz p1, :cond_a

    .line 263
    new-instance v0, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/android/internal/app/AppLockUserEducationActivity$$ExternalSyntheticLambda4;-><init>(Lcom/android/internal/app/AppLockUserEducationActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_a
    :goto_5
    return-void
.end method


# virtual methods
.method public whitelist onBackPressed()V
    .locals 1

    const/4 v0, 0x0

    .line 139
    invoke-virtual {p0, v0}, Lcom/android/internal/app/AppLockUserEducationActivity;->setResult(I)V

    .line 144
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->finishAffinity()V

    return-void
.end method

.method public whitelist onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 122
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 123
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string/jumbo v0, "android.intent.extra.TITLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 124
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->setupUiAndShowDialog(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public whitelist onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 104
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 105
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addSystemFlags(I)V

    .line 107
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 108
    const-string/jumbo v0, "android.intent.extra.PACKAGE_NAME"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 109
    const-string/jumbo v1, "android.intent.extra.TITLE"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 112
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/internal/app/AppLockUserEducationActivity;->setupUiAndShowDialog(Ljava/lang/CharSequence;)V

    return-void

    .line 113
    :cond_1
    :goto_0
    const-string p1, "AppLockUserEducation"

    const-string/jumbo v0, "Missing package name or label, finishing."

    invoke-static {p1, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->finish()V

    return-void
.end method

.method protected whitelist onDestroy()V
    .locals 2

    .line 149
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 150
    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mScrollView:Landroid/widget/ScrollView;

    if-eqz v0, :cond_1

    .line 151
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 152
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 153
    iget-object v1, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_0
    const/4 v0, 0x0

    .line 155
    iput-object v0, p0, Lcom/android/internal/app/AppLockUserEducationActivity;->mGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    :cond_1
    return-void
.end method

.method protected whitelist onStop()V
    .locals 1

    .line 129
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 132
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    invoke-virtual {p0}, Lcom/android/internal/app/AppLockUserEducationActivity;->finish()V

    :cond_0
    return-void
.end method
