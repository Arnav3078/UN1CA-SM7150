.class public final Lio/mesalabs/unica/gpu/GpuActivity;
.super Landroid/app/Activity;
.source "GpuActivity.java"


# static fields
.field private static final EXPORT:I = 0x33

.field private static final LEVELS:[I

.field private static final NAMES:[Ljava/lang/String;

.field private static final PROFILE_EXPORT:I = 0x34

.field private static final PROFILE_IMPORT:I = 0x35


# instance fields
.field private busy:Z

.field private final cards:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/LinearLayout;",
            ">;"
        }
    .end annotation
.end field

.field private content:Landroid/widget/LinearLayout;

.field private documentQueued:Z

.field private draft:Lio/mesalabs/unica/gpu/GpuProfile;

.field private hasDraft:Z

.field private invalidSavedProfile:Z

.field private message:Ljava/lang/String;

.field private page:Landroid/widget/LinearLayout;

.field private promptedImage:Ljava/lang/String;

.field private scroller:Landroid/widget/ScrollView;

.field private selectedTable:I

.field private state:Lorg/json/JSONObject;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 26

    .line 20
    const/16 v0, 0x19

    new-array v0, v0, [I

    fill-array-data v0, :array_42

    sput-object v0, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    .line 21
    const-string v24, "SUPER_TURBO"

    const-string v25, "SUPER_TURBO_NO_CPR"

    const-string v1, "RAW EXPERIMENTAL"

    const-string v2, "RETENTION"

    const-string v3, "MIN_SVS"

    const-string v4, "LOW_SVS_D2"

    const-string v5, "LOW_SVS_D1"

    const-string v6, "LOW_SVS_D0"

    const-string v7, "LOW_SVS"

    const-string v8, "LOW_SVS_P1"

    const-string v9, "LOW_SVS_L1"

    const-string v10, "LOW_SVS_L2"

    const-string v11, "SVS"

    const-string v12, "SVS_L0"

    const-string v13, "SVS_L1"

    const-string v14, "SVS_L2"

    const-string v15, "NOM"

    const-string v16, "NOM_L0"

    const-string v17, "NOM_L1"

    const-string v18, "NOM_L2"

    const-string v19, "TURBO"

    const-string v20, "TURBO_L0"

    const-string v21, "TURBO_L1"

    const-string v22, "TURBO_L2"

    const-string v23, "TURBO_L3"

    filled-new-array/range {v1 .. v25}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/mesalabs/unica/gpu/GpuActivity;->NAMES:[Ljava/lang/String;

    return-void

    :array_42
    .array-data 4
        0x1
        0x10
        0x30
        0x34
        0x38
        0x3c
        0x40
        0x48
        0x50
        0x60
        0x80
        0x90
        0xc0
        0xe0
        0x100
        0x120
        0x140
        0x150
        0x180
        0x190
        0x1a0
        0x1b0
        0x1c0
        0x1d0
        0x1e0
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 22
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->worker:Ljava/util/concurrent/ExecutorService;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->promptedImage:Ljava/lang/String;

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->cards:Ljava/util/List;

    .line 32
    const-string v0, "Checking firmware compatibility\u2026"

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()[I
    .registers 1

    .line 18
    sget-object v0, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    return-object v0
.end method

.method static synthetic access$100(Lio/mesalabs/unica/gpu/GpuActivity;)I
    .registers 1

    .line 18
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->warningColor()I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lio/mesalabs/unica/gpu/GpuActivity;II)I
    .registers 3

    .line 18
    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->themeColor(II)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lio/mesalabs/unica/gpu/GpuActivity;I)I
    .registers 2

    .line 18
    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result p0

    return p0
.end method

.method private addLevel()V
    .registers 9

    .line 175
    :try_start_0
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object v1, v1, v2

    iget-object v2, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    iget-object v3, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    new-instance v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-direct {v3}, Lio/mesalabs/unica/gpu/GpuProfile$Row;-><init>()V

    iget-wide v4, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    const-wide/16 v6, 0x2

    div-long/2addr v4, v6

    iput-wide v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    iget v4, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    iput v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    iget-wide v4, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    iput-wide v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    iget-wide v4, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    iput-wide v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    iget-wide v4, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    iput-wide v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    iget-boolean v4, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    iput-boolean v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    iget-wide v4, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    iput-wide v4, v3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    iget-object v1, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    const-string v0, "Draft level added"

    const-string v1, "Review its frequency, RPMh, bus and ACD values. These draft values are not a stability recommendation."

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_50} :catch_51

    goto :goto_5b

    :catch_51
    move-exception v0

    const-string v1, "Cannot add level"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :goto_5b
    return-void
.end method

.method private alert(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 219
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "OK"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private apply()V
    .registers 6

    .line 227
    :try_start_0
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->imageProfile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v1

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lio/mesalabs/unica/gpu/GpuProfile;->payload(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lio/mesalabs/unica/gpu/GpuProfile;->tablesJson()Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lio/mesalabs/unica/gpu/GpuProfile;->tablesJson()Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4f

    .line 228
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "Write both GPU tables to vendor_boot?"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->applyReview(Lio/mesalabs/unica/gpu/GpuProfile;Lio/mesalabs/unica/gpu/GpuProfile;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Apply trial"

    new-instance v3, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda8;

    invoke-direct {v3, p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda8;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 229
    goto :goto_61

    .line 227
    :cond_4f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No GPU changes selected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_57} :catch_57

    .line 229
    :catch_57
    move-exception v0

    const-string v1, "Cannot apply"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    :goto_61
    return-void
.end method

.method private applyBackground()V
    .registers 12

    .line 46
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v1, 0x20

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_14

    move v0, v2

    goto :goto_15

    :cond_14
    move v0, v3

    .line 47
    :goto_15
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "unica_settings_bg_transparency_enabled"

    invoke-static {v1, v4, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_22

    goto :goto_23

    :cond_22
    move v2, v3

    .line 48
    :goto_23
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "unica_settings_bg_transparency_level"

    const/16 v5, 0x46

    invoke-static {v1, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    const/16 v4, 0x64

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 49
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sesl_background_color_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "dark"

    const-string v7, "light"

    if-eqz v0, :cond_4c

    move-object v8, v6

    goto :goto_4d

    :cond_4c
    move-object v8, v7

    :goto_4d
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, -0x1

    if-eqz v0, :cond_5c

    const v9, -0xe8e8e6

    goto :goto_5d

    :cond_5c
    move v9, v8

    :goto_5d
    invoke-direct {p0, v5, v9}, Lio/mesalabs/unica/gpu/GpuActivity;->romColor(Ljava/lang/String;I)I

    move-result v5

    .line 50
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "sesl_round_and_bgcolor_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-eqz v0, :cond_6f

    goto :goto_70

    :cond_6f
    move-object v6, v7

    :goto_70
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    if-eqz v0, :cond_7d

    const/high16 v0, -0x1000000

    goto :goto_80

    :cond_7d
    const v0, -0xd0d0e

    :goto_80
    invoke-direct {p0, v6, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->romColor(Ljava/lang/String;I)I

    move-result v0

    .line 51
    const/high16 v6, 0x100000

    if-eqz v2, :cond_9d

    const v0, 0xffffff

    and-int/2addr v0, v5

    mul-int/lit16 v1, v1, 0xff

    div-int/2addr v1, v4

    rsub-int v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int v5, v0, v1

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/Window;->addFlags(I)V

    goto :goto_a5

    .line 52
    :cond_9d
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/Window;->clearFlags(I)V

    move v3, v0

    .line 53
    :goto_a5
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v2, :cond_ac

    const/4 v8, -0x3

    :cond_ac
    invoke-virtual {v0, v8}, Landroid/view/Window;->setFormat(I)V

    .line 54
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->cards:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_e3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c1

    .line 56
    :cond_e3
    return-void
.end method

.method private applyReview(Lio/mesalabs/unica/gpu/GpuProfile;Lio/mesalabs/unica/gpu/GpuProfile;)Ljava/lang/CharSequence;
    .registers 23

    .line 221
    move-object/from16 v0, p0

    new-instance v1, Landroid/text/SpannableStringBuilder;

    const-string v2, "Changes from the current image:\n"

    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 222
    const/4 v3, 0x0

    :goto_a
    const/4 v4, 0x2

    if-ge v3, v4, :cond_245

    move-object/from16 v4, p2

    iget-object v5, v4, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object v5, v5, v3

    move-object/from16 v6, p1

    iget-object v7, v6, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object v7, v7, v3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\nTable "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v10, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " \u2192 "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v11, v7, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, " levels; initial "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v11, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v11, v7, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, "; minimum "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v11, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v11, v7, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, "\n"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 223
    const/4 v8, 0x0

    :goto_82
    iget-object v12, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    iget-object v13, v7, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    if-ge v8, v12, :cond_23d

    iget-object v12, v7, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    const-string v13, "Level "

    if-lt v8, v12, :cond_c0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ": removed\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    :goto_b5
    invoke-virtual {v1, v12}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move v2, v3

    move-object/from16 v16, v5

    move-object v15, v7

    move-object v7, v1

    move-object v1, v0

    goto/16 :goto_22f

    :cond_c0
    iget-object v12, v7, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    iget-object v14, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    const/4 v15, 0x1

    if-lt v8, v14, :cond_ed

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ": added\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v0, v12, v15}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v12

    goto :goto_b5

    :cond_ed
    iget-object v14, v5, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v14, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v5

    iget-wide v4, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    move-wide/from16 v17, v4

    iget-wide v4, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    cmp-long v4, v17, v4

    const-string v5, "; "

    if-eqz v4, :cond_13a

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v17, v15

    const-string v15, "MHz "

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v15, v7

    iget-wide v6, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-direct {v0, v6, v7}, Lio/mesalabs/unica/gpu/GpuActivity;->mhz(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v6, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-direct {v0, v6, v7}, Lio/mesalabs/unica/gpu/GpuActivity;->mhz(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_13d

    :cond_13a
    move/from16 v17, v15

    move-object v15, v7

    :goto_13d
    iget v4, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    iget v6, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    if-eq v4, v6, :cond_169

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "RPMh "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v6, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v6, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_169
    iget-wide v6, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    move-wide/from16 v18, v6

    iget-wide v6, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    cmp-long v4, v18, v6

    if-nez v4, :cond_18b

    iget-wide v6, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    move-wide/from16 v18, v6

    iget-wide v6, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    cmp-long v4, v18, v6

    if-nez v4, :cond_18b

    iget-wide v6, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    move-wide/from16 v18, v6

    iget-wide v6, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    cmp-long v4, v18, v6

    if-eqz v4, :cond_188

    goto :goto_18b

    :cond_188
    move-object v7, v1

    move v1, v3

    goto :goto_1dd

    :cond_18b
    :goto_18b
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bus "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v6, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "/"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v7, v1

    iget-wide v0, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move v1, v3

    iget-wide v3, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v3, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1dd
    iget-boolean v0, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    iget-boolean v3, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-ne v0, v3, :cond_1ef

    iget-boolean v0, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v0, :cond_1f4

    iget-wide v3, v12, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    iget-wide v5, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    cmp-long v0, v3, v5

    if-eqz v0, :cond_1f4

    :cond_1ef
    const-string v0, "ACD changed; "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1f4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_22c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move v2, v1

    move-object/from16 v1, p0

    invoke-direct {v1, v2, v8, v12}, Lio/mesalabs/unica/gpu/GpuActivity;->warning(IILio/mesalabs/unica/gpu/GpuProfile$Row;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-direct {v1, v0, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_22f

    :cond_22c
    move v2, v1

    move-object/from16 v1, p0

    :goto_22f
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v6, p1

    move-object/from16 v4, p2

    move-object v0, v1

    move v3, v2

    move-object v1, v7

    move-object v7, v15

    move-object/from16 v5, v16

    goto/16 :goto_82

    .line 222
    :cond_23d
    move-object v7, v1

    move v2, v3

    move-object v1, v0

    add-int/lit8 v3, v2, 0x1

    move-object v1, v7

    goto/16 :goto_a

    .line 224
    :cond_245
    move-object v7, v1

    move-object v1, v0

    const-string v0, "\nComplete values to write:\n"

    invoke-virtual {v7, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p1}, Lio/mesalabs/unica/gpu/GpuActivity;->review(Lio/mesalabs/unica/gpu/GpuProfile;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    return-object v7
.end method

.method private bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;
    .registers 3

    .line 107
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->draft:Lio/mesalabs/unica/gpu/GpuProfile;

    iget-object v0, v0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method private button(Ljava/lang/String;ZLandroid/view/View$OnClickListener;)V
    .registers 10

    .line 86
    const/4 v2, 0x0

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    return-void
.end method

.method private card()V
    .registers 6

    .line 64
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3, v4, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 65
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x10

    invoke-direct {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->content:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->cards:Ljava/util/List;

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    return-void
.end method

.method private chooseProfile(I)V
    .registers 5

    .line 119
    new-instance v0, Landroid/content/Intent;

    const/16 v1, 0x34

    if-ne p1, v1, :cond_9

    const-string v2, "android.intent.action.CREATE_DOCUMENT"

    goto :goto_b

    :cond_9
    const-string v2, "android.intent.action.OPEN_DOCUMENT"

    :goto_b
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    if-ne p1, v1, :cond_18

    const-string v2, "application/json"

    goto :goto_1a

    :cond_18
    const-string v2, "*/*"

    :goto_1a
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 120
    if-ne p1, v1, :cond_26

    const-string v1, "android.intent.extra.TITLE"

    const-string v2, "UN1CA-dm1q-GPU-profile.json"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 121
    :cond_26
    :try_start_26
    invoke-virtual {p0, v0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_29
    .catch Landroid/content/ActivityNotFoundException; {:try_start_26 .. :try_end_29} :catch_2a

    goto :goto_34

    :catch_2a
    move-exception p1

    const-string v0, "File picker unavailable"

    invoke-virtual {p1}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    :goto_34
    return-void
.end method

.method private createBackup()V
    .registers 8

    .line 124
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 125
    :cond_7
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v1, "canRestart"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "Cancel"

    const-string v3, "baselineHash"

    if-eqz v0, :cond_4c

    .line 126
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v5, "refreshHash"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 127
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v6, "Restart backup for this ROM?"

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const-string v6, "The previous backup refresh belongs to a different image. Preserve and verify its rollback, journal and staged files in protected /data storage before freeing their cache space. Then create this ROM\'s clean backup. Save the NEW rollback ZIP to PC or USB before Apply. Your tuning profile stays saved. This does not flash any image."

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    new-instance v6, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda24;

    invoke-direct {v6, p0, v0, v3, v4}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda24;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Restart backup"

    invoke-virtual {v5, v0, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 128
    goto :goto_9a

    :cond_4c
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v4, "canRenew"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_91

    .line 129
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 130
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v5, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v6, "renewing"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_72

    const-string v5, "Resume backup refresh?"

    goto :goto_74

    :cond_72
    const-string v5, "Create backup for current ROM?"

    :goto_74
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "The current image differs from the saved original. Copy and verify the old rollback in protected /data storage before freeing its /cache space. Then back up this ROM\'s clean vendor_boot and save the new rollback ZIP to PC or USB. Your tuning profile stays saved. This does not flash either image."

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda25;

    invoke-direct {v5, p0, v0, v3}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda25;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Create backup"

    invoke-virtual {v4, v0, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 131
    goto :goto_9a

    :cond_91
    const-string v0, "backup"

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->run(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :goto_9a
    return-void
.end method

.method private customVoltage(I)V
    .registers 7

    .line 163
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v0

    iget-object v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    iget v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->numberInput(Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v0

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->dialogBody()Landroid/widget/LinearLayout;

    move-result-object v1

    const-string v2, "Raw RPMh request, 1\u2013480. This is not millivolts or a hardware-supported range. Request 1 and values outside stock are experimental."

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v2

    const/16 v4, 0xe

    invoke-direct {p0, v2, v4, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Custom voltage request"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Save"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, v1, v0, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda2;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;I)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private description(Ljava/lang/String;Ljava/lang/CharSequence;)V
    .registers 9

    .line 68
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x10

    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 69
    const/16 v2, 0x14

    const/4 v3, 0x0

    invoke-direct {p0, p1, v2, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 70
    if-eqz p2, :cond_47

    const/16 p1, 0xe

    invoke-direct {p0, p2, p1, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object p1

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v1

    iput v1, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_47
    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 71
    return-void
.end method

.method private dialogBody()Landroid/widget/LinearLayout;
    .registers 6

    .line 160
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x18

    invoke-direct {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    const/16 v3, 0xc

    invoke-direct {p0, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-object v0
.end method

.method private divider()V
    .registers 6

    .line 73
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v1, 0x1010038

    const v2, -0x777778

    invoke-direct {p0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->themeColor(II)I

    move-result v1

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v2, 0x26000000

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 74
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    return-void
.end method

.method private dp(I)I
    .registers 3

    .line 34
    int-to-float p1, p1

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private draw()V
    .registers 21

    .line 177
    move-object/from16 v0, p0

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->scroller:Landroid/widget/ScrollView;

    const/4 v6, 0x0

    if-nez v1, :cond_9

    move v7, v6

    goto :goto_10

    :cond_9
    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->scroller:Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v1

    move v7, v1

    :goto_10
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->syncDraft()V

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->cards:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 178
    invoke-virtual {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V

    .line 179
    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda29;

    invoke-direct {v2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda29;-><init>()V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 180
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v9, 0x8

    invoke-direct {v0, v9}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    const/4 v4, 0x4

    invoke-direct {v0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v5

    const/16 v10, 0x14

    invoke-direct {v0, v10}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v11

    invoke-direct {v0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-virtual {v2, v3, v5, v11, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/16 v3, 0x38

    invoke-direct {v0, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 181
    const-string v3, "\u2039"

    const/16 v4, 0x24

    invoke-direct {v0, v3, v4, v6}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v4, 0x30

    invoke-direct {v0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setMinHeight(I)V

    const-string v5, "Navigate up"

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda40;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda40;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setFocusable(Z)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    const/4 v11, -0x2

    invoke-direct {v5, v4, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    const-string v3, "Advanced GPU Tuning"

    invoke-direct {v0, v3, v10, v6}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v6, v11, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 183
    new-instance v10, Landroid/widget/ScrollView;

    invoke-direct {v10, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v10, v0, Lio/mesalabs/unica/gpu/GpuActivity;->scroller:Landroid/widget/ScrollView;

    invoke-virtual {v10, v8}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {v10, v6}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->content:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->content:Landroid/widget/LinearLayout;

    const/16 v11, 0xc

    invoke-direct {v0, v11}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    invoke-direct {v0, v11}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-direct {v0, v11}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v12

    const/16 v13, 0x18

    invoke-direct {v0, v13}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v14

    invoke-virtual {v2, v3, v4, v12, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 184
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v10, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->setContentView(Landroid/view/View;)V

    .line 185
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    const-string v1, "KonaBess"

    const-string v2, "GPU frequency and voltage tuning for Galaxy S23 (Adreno 740)."

    invoke-direct {v0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->description(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 186
    const-string v1, "Trial changes"

    const-string v2, "Changes take effect after reboot. Unsuitable values can cause freezes or prevent booting. Keep your recovery rollback available."

    invoke-direct {v0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->description(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 187
    const-string v1, "Device status"

    invoke-direct {v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->section(Ljava/lang/String;)V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    iget-boolean v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-eqz v1, :cond_108

    const-string v1, "Working\u2026"

    goto :goto_10a

    :cond_108
    const-string v1, "GPU image"

    :goto_10a
    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->description(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 188
    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda43;

    invoke-direct {v1, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda43;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v2, "Refresh image and compatibility"

    invoke-direct {v0, v2, v8, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->button(Ljava/lang/String;ZLandroid/view/View$OnClickListener;)V

    .line 189
    const-string v1, "Tuning profile"

    invoke-direct {v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->section(Ljava/lang/String;)V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    .line 190
    iget-boolean v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->hasDraft:Z

    if-eqz v1, :cond_12a

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->draft:Lio/mesalabs/unica/gpu/GpuProfile;

    iget-object v1, v1, Lio/mesalabs/unica/gpu/GpuProfile;->name:Ljava/lang/String;

    goto :goto_12c

    :cond_12a
    const-string v1, "No saved profile"

    :goto_12c
    const-string v2, "Values are saved automatically and retained across ROM updates that preserve Settings data. Imported values are never applied automatically."

    invoke-direct {v0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->description(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 191
    iget-boolean v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->hasDraft:Z

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda44;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda44;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Back up profile"

    const-string v2, "Export a shareable JSON file with frequencies and voltage levels"

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 192
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda45;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda45;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Import profile"

    const-string v2, "UN1CA JSON or original konabess:// export \u00b7 review both tables"

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 193
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v3

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda46;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda46;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Load current image values"

    const-string v2, "Replace the saved draft with the current image\'s table"

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 194
    const-string v1, "Recovery rollback"

    invoke-direct {v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->section(Ljava/lang/String;)V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    .line 195
    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v2, "canRestart"

    const-string v3, "staleBackup"

    const-string v12, "renewing"

    if-eqz v1, :cond_17a

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17a

    const-string v1, "Restart backup for current ROM"

    goto :goto_19a

    :cond_17a
    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    if-eqz v1, :cond_189

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_189

    const-string v1, "Resume backup refresh"

    goto :goto_19a

    :cond_189
    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    if-eqz v1, :cond_198

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_198

    const-string v1, "Create backup for current ROM"

    goto :goto_19a

    :cond_198
    const-string v1, "Create or verify original backup"

    :goto_19a
    iget-object v4, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v14, "backup"

    if-eqz v4, :cond_1ab

    iget-object v4, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1ab

    const-string v4, "Verify old rollback in /data, free its cache space and back up this ROM; profile stays saved"

    goto :goto_1bc

    :cond_1ab
    iget-object v4, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    if-eqz v4, :cond_1ba

    iget-object v4, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1ba

    const-string v4, "Original image saved"

    goto :goto_1bc

    :cond_1ba
    const-string v4, "Save the original before making changes"

    :goto_1bc
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v5

    const-string v15, "interrupted"

    if-eqz v5, :cond_202

    iget-object v5, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_200

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v5, "canRenew"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_200

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_202

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_202

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v2, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_202

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_200

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v3, "original"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_202

    :cond_200
    move v3, v8

    goto :goto_203

    :cond_202
    move v3, v6

    :goto_203
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda47;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda47;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    move-object v2, v4

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 196
    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v2, "exported"

    if-eqz v1, :cond_21e

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21e

    const-string v1, "Saved copy verified"

    goto :goto_220

    :cond_21e
    const-string v1, "Required before Apply \u00b7 choose PC or USB storage"

    :goto_220
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v3

    const-string v4, "canRestore"

    if-eqz v3, :cond_24a

    iget-object v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v3, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_24a

    iget-object v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_24a

    iget-object v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_24a

    iget-object v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_24a

    move v3, v8

    goto :goto_24b

    :cond_24a
    move v3, v6

    :goto_24b
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda48;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda48;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    move-object v14, v2

    move-object v2, v1

    const-string v1, "Save rollback ZIP"

    move-object/from16 v16, v4

    const/4 v4, 0x0

    move-object/from16 v6, v16

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 197
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda49;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda49;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Recovery instructions"

    const-string v2, "Restore through OrangeFox if Android cannot start"

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 198
    const-string v1, "GPU tables"

    invoke-direct {v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->section(Ljava/lang/String;)V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    .line 199
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda50;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda50;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "About GPU tuning"

    const-string v2, "Full-Hz frequencies \u00b7 RPMh requests \u00b7 bus and ACD"

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 200
    iget-boolean v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->hasDraft:Z

    if-eqz v1, :cond_499

    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Table "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " \u00b7 "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v3

    iget-object v3, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " power levels"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda30;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda30;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    move-object v3, v2

    move-object v2, v1

    const-string v1, "Edit table"

    move-object v4, v3

    const/4 v3, 0x1

    move-object/from16 v17, v4

    const/4 v4, 0x0

    move-object/from16 v9, v17

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 202
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v1

    iget v1, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v3

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda31;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda31;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Initial power level"

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v1

    iget v1, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v3

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda32;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda32;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Initial minimum level"

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 203
    const-string v1, "Red values are outside stock or change bus/ACD behavior. They may map to different corners, freeze the GPU or prevent booting. Request 1 is experimental and is not 1 mV."

    invoke-direct {v0, v1, v8}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "Experimental settings"

    invoke-direct {v0, v2, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->description(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 204
    const/4 v1, 0x0

    :goto_2ff
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v2

    iget-object v2, v2, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_46d

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v2

    iget-object v2, v2, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v3

    if-eqz v3, :cond_32f

    iget-object v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_32f

    iget-object v3, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_32f

    move v3, v8

    goto :goto_330

    :cond_32f
    const/4 v3, 0x0

    :goto_330
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \u00b7 Power level "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->section(Ljava/lang/String;)V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    .line 205
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v17, v8

    move-object/from16 v18, v9

    iget-wide v8, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-direct {v0, v8, v9}, Lio/mesalabs/unica/gpu/GpuActivity;->mhz(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " MHz"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    iget-wide v8, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-static {v5, v8, v9}, Lio/mesalabs/unica/gpu/GpuProfile;->stockFrequency(IJ)Z

    move-result v5

    const-string v8, ""

    const-string v9, " \u00b7 outside stock"

    if-eqz v5, :cond_37c

    move-object v5, v8

    goto :goto_37d

    :cond_37c
    move-object v5, v9

    :goto_37d
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget v5, v0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    move-object/from16 v19, v14

    iget-wide v13, v2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-static {v5, v13, v14}, Lio/mesalabs/unica/gpu/GpuProfile;->stockFrequency(IJ)Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    invoke-direct {v0, v4, v5}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v4

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda33;

    invoke-direct {v5, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda33;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V

    move v13, v1

    const-string v1, "GPU frequency"

    move-object v14, v2

    move-object v2, v4

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 206
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-direct {v0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->levelName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-static {v2}, Lio/mesalabs/unica/gpu/GpuProfile;->outsideStock(I)Z

    move-result v2

    if-eqz v2, :cond_3bb

    move-object v8, v9

    :cond_3bb
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-static {v2}, Lio/mesalabs/unica/gpu/GpuProfile;->outsideStock(I)Z

    move-result v2

    invoke-direct {v0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v2

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda34;

    invoke-direct {v5, v0, v13}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda34;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V

    const-string v1, "Voltage request"

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bus "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 ACD "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v2, :cond_41c

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-wide v4, v14, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "0x%08x"

    invoke-static {v2, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_41e

    :cond_41c
    const-string v2, "none"

    :goto_41e
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    invoke-direct {v0, v2, v13, v14}, Lio/mesalabs/unica/gpu/GpuActivity;->warning(IILio/mesalabs/unica/gpu/GpuProfile$Row;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v2

    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda35;

    invoke-direct {v5, v0, v13}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda35;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V

    const-string v1, "Bus and ACD"

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 208
    if-eqz v3, :cond_453

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v1

    iget-object v1, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_453

    move/from16 v3, v17

    goto :goto_454

    :cond_453
    const/4 v3, 0x0

    :goto_454
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda36;

    invoke-direct {v5, v0, v13}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda36;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V

    const-string v1, "Remove power level"

    const-string v2, "Renumber remaining levels and adjust references"

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 204
    add-int/lit8 v1, v13, 0x1

    move/from16 v8, v17

    move-object/from16 v9, v18

    move-object/from16 v14, v19

    const/16 v13, 0x18

    goto/16 :goto_2ff

    .line 210
    :cond_46d
    move/from16 v17, v8

    move-object/from16 v19, v14

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v1

    if-eqz v1, :cond_48d

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_48d

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_48d

    move/from16 v1, v17

    goto :goto_48e

    :cond_48d
    const/4 v1, 0x0

    :goto_48e
    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda37;

    invoke-direct {v2, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda37;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v3, "Add power level"

    invoke-direct {v0, v3, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->button(Ljava/lang/String;ZLandroid/view/View$OnClickListener;)V

    goto :goto_49d

    .line 200
    :cond_499
    move/from16 v17, v8

    move-object/from16 v19, v14

    .line 212
    :goto_49d
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    iget-boolean v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->hasDraft:Z

    if-eqz v1, :cond_4c7

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v1

    if-eqz v1, :cond_4c7

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    move-object/from16 v14, v19

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4c7

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4c7

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4c7

    move/from16 v1, v17

    goto :goto_4c8

    :cond_4c7
    const/4 v1, 0x0

    :goto_4c8
    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda38;

    invoke-direct {v2, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda38;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v3, "Apply GPU table"

    invoke-direct {v0, v3, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->button(Ljava/lang/String;ZLandroid/view/View$OnClickListener;)V

    .line 213
    const-string v1, "Restore and restart"

    invoke-direct {v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->section(Ljava/lang/String;)V

    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->card()V

    .line 214
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v1

    if-eqz v1, :cond_4eb

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4eb

    move/from16 v3, v17

    goto :goto_4ec

    :cond_4eb
    const/4 v3, 0x0

    :goto_4ec
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda39;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda39;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Restore original vendor_boot"

    const-string v2, "Restore the pre-trial image, then reboot"

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 215
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v1

    if-eqz v1, :cond_512

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_512

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_512

    move/from16 v3, v17

    goto :goto_513

    :cond_512
    const/4 v3, 0x0

    :goto_513
    new-instance v5, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda41;

    invoke-direct {v5, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda41;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Reboot now"

    const-string v2, "Only after Apply or Restore reports success"

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Lio/mesalabs/unica/gpu/GpuActivity;->row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V

    .line 216
    const-string v1, "Inspired by libxzr/KonaBess. Both Samsung GPU tables, within the inspected FDT space. Nothing applies or reboots automatically."

    move/from16 v2, v17

    invoke-direct {v0, v1, v11, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v1

    const/16 v2, 0x18

    invoke-direct {v0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x8

    invoke-direct {v0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v5

    invoke-direct {v0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    invoke-direct {v0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-virtual {v1, v3, v5, v2, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v2, v0, Lio/mesalabs/unica/gpu/GpuActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 217
    invoke-direct {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->applyBackground()V

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda42;

    invoke-direct {v0, v10, v7}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda42;-><init>(Landroid/widget/ScrollView;I)V

    invoke-virtual {v10, v0}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 218
    return-void
.end method

.method private editBus(I)V
    .registers 12

    .line 170
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v0

    iget-object v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->dialogBody()Landroid/widget/LinearLayout;

    move-result-object v1

    const-string v2, "Bus maximum index"

    const-string v3, "ACD cell (decimal/0x hex, or none)"

    const-string v4, "Bus frequency index"

    const-string v5, "Bus minimum index"

    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v5, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v6, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-boolean v6, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v6, :cond_6e

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-wide v7, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v7, "0x%08x"

    invoke-static {v6, v7, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_70

    :cond_6e
    const-string v0, "none"

    :goto_70
    filled-new-array {v3, v5, v4, v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x4

    new-array v4, v3, [Landroid/widget/EditText;

    const-string v5, "Advanced: raw u32 bus requests must satisfy min \u2264 frequency \u2264 max. This driver clamps requests above 9 on active rows; the final row must use 0\u20139. ACD is a raw bitfield. Changes can prevent booting."

    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v5

    const/16 v7, 0xe

    invoke-direct {p0, v5, v7, v6}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v5, 0x0

    move v8, v5

    :goto_89
    if-ge v8, v3, :cond_a4

    aget-object v9, v2, v8

    invoke-direct {p0, v9, v7, v6}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    aget-object v9, v0, v8

    invoke-direct {p0, v9, v5}, Lio/mesalabs/unica/gpu/GpuActivity;->numberInput(Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v9

    aput-object v9, v4, v8

    aget-object v9, v4, v8

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_89

    :cond_a4
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 171
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bus and ACD \u00b7 level "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Save"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0, v0, p1, v4}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda12;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/app/AlertDialog;I[Landroid/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 172
    return-void
.end method

.method private editFrequency(I)V
    .registers 7

    .line 155
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v0

    iget-object v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    iget-wide v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->mhz(J)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->numberInput(Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v0

    .line 156
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->dialogBody()Landroid/widget/LinearLayout;

    move-result-object v2

    const-string v3, "GPU frequency (MHz)"

    const/16 v4, 0xe

    invoke-direct {p0, v3, v4, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v3, "Up to six decimal places (1 Hz). Positive u32 Hz input only; this is a storage limit, not a supported clock range. Non-stock frequencies appear in red and can prevent booting."

    invoke-direct {p0, v3, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-direct {p0, v3, v4, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 157
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Power level "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Save"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 158
    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, v1, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda7;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/app/AlertDialog;ILandroid/widget/EditText;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 159
    return-void
.end method

.method private editInitial(Z)V
    .registers 7

    .line 173
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v0

    if-eqz p1, :cond_9

    iget v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    goto :goto_b

    :cond_9
    iget v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    :goto_b
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->numberInput(Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v0

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->dialogBody()Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Index from 0 to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->bin()Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    move-result-object v3

    iget-object v3, v3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe

    invoke-direct {p0, v2, v3, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz p1, :cond_4d

    const-string v3, "Initial minimum level"

    goto :goto_4f

    :cond_4d
    const-string v3, "Initial power level"

    :goto_4f
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Save"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda27;

    invoke-direct {v2, p0, v1, v0, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda27;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;Z)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private editLevel(I)V
    .registers 6

    .line 165
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    sget-object v0, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_d
    sget-object v2, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    array-length v2, v2

    if-ge v1, v2, :cond_3f

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    aget v3, v3, v1

    invoke-direct {p0, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->levelName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    aget v3, v3, v1

    invoke-static {v3}, Lio/mesalabs/unica/gpu/GpuProfile;->outsideStock(I)Z

    move-result v3

    if-eqz v3, :cond_30

    const-string v3, " \u00b7 outside stock"

    goto :goto_32

    :cond_30
    const-string v3, ""

    :goto_32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 166
    :cond_3f
    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$1;

    const v2, 0x1090003

    invoke-direct {v1, p0, p0, v2, v0}, Lio/mesalabs/unica/gpu/GpuActivity$1;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/content/Context;I[Ljava/lang/String;)V

    .line 167
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Voltage request \u00b7 table "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " level "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda9;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda10;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V

    const-string p1, "Custom request"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 168
    return-void
.end method

.method private handleDocument(ILandroid/net/Uri;)V
    .registers 6

    .line 241
    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    iput-boolean v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->documentQueued:Z

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda5;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;ILandroid/net/Uri;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->documentQueued:Z

    .line 242
    const/16 v0, 0x34

    if-eq p1, v0, :cond_51

    const/16 v0, 0x35

    if-ne p1, v0, :cond_1e

    goto :goto_51

    :cond_1e
    const/16 v0, 0x33

    if-eq p1, v0, :cond_23

    return-void

    .line 243
    :cond_23
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result p1

    if-nez p1, :cond_31

    const-string p1, "Rollback unavailable"

    const-string p2, "Refresh compatibility before exporting the rollback ZIP."

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_31
    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v0, "rollbackHash"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object v0

    iput-boolean v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    const-string v1, "Saving and verifying recovery rollback ZIP\u2026"

    iput-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    .line 244
    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0, p2, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda6;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 250
    return-void

    .line 242
    :cond_51
    :goto_51
    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->profileDocument(ILandroid/net/Uri;)V

    return-void
.end method

.method private hash()Ljava/lang/String;
    .registers 3

    .line 88
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    if-nez v0, :cond_7

    const-string v0, ""

    goto :goto_f

    :cond_7
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v1, "currentHash"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_f
    return-object v0
.end method

.method private static hex([B)Ljava/lang/String;
    .registers 7

    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_23

    aget-byte v3, p0, v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v5, "%02x"

    invoke-static {v4, v5, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private imageProfile()Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 105
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v2, "tables"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const-string v2, "My GPU profile"

    invoke-static {v2, v0, v1}, Lio/mesalabs/unica/gpu/GpuProfile;->fromTables(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    return-object v0
.end method

.method private label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;
    .registers 5

    .line 58
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 59
    if-eqz p3, :cond_16

    const p1, 0x1010038

    goto :goto_19

    :cond_16
    const p1, 0x1010036

    :goto_19
    if-eqz p3, :cond_1f

    const p2, -0x666667

    goto :goto_22

    :cond_1f
    const p2, -0x111112

    :goto_22
    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->themeColor(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result p2

    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result p1

    const/4 p3, 0x0

    invoke-virtual {v0, p3, p2, p3, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method static synthetic lambda$draw$0(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 6

    .line 179
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v0

    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    move-result v1

    or-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v0

    iget v1, v0, Landroid/graphics/Insets;->left:I

    iget v2, v0, Landroid/graphics/Insets;->top:I

    iget v3, v0, Landroid/graphics/Insets;->right:I

    iget v0, v0, Landroid/graphics/Insets;->bottom:I

    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    return-object p1
.end method

.method static synthetic lambda$draw$25(Landroid/widget/ScrollView;I)V
    .registers 3

    .line 217
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method static synthetic lambda$row$0(ZLandroid/view/View$OnClickListener;Landroid/view/View;)V
    .registers 3

    .line 84
    if-eqz p0, :cond_5

    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_5
    return-void
.end method

.method private levelName(I)Ljava/lang/String;
    .registers 4

    .line 90
    const/4 v0, 0x0

    :goto_1
    sget-object v1, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    array-length v1, v1

    if-ge v0, v1, :cond_2b

    sget-object v1, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_28

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " \u00b7 "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget-object v1, Lio/mesalabs/unica/gpu/GpuActivity;->NAMES:[Ljava/lang/String;

    aget-object v0, v1, v0

    :goto_1f
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " \u00b7 custom raw request"

    goto :goto_1f
.end method

.method private loadSavedProfile()V
    .registers 4

    .line 101
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profileStore()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "profile"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e

    return-void

    .line 102
    :cond_e
    :try_start_e
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-static {v0}, Lio/mesalabs/unica/gpu/GpuProfile;->parse([B)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->setProfile(Lio/mesalabs/unica/gpu/GpuProfile;Z)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_1c} :catch_1d

    goto :goto_3d

    :catch_1d
    move-exception v0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->invalidSavedProfile:Z

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The saved data was kept for recovery. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Saved profile unavailable"

    invoke-direct {p0, v1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    :goto_3d
    return-void
.end method

.method private mhz(J)Ljava/lang/String;
    .registers 3

    .line 89
    invoke-static {p1, p2}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object p1

    const/4 p2, 0x6

    invoke-virtual {p1, p2}, Ljava/math/BigDecimal;->movePointLeft(I)Ljava/math/BigDecimal;

    move-result-object p1

    invoke-virtual {p1}, Ljava/math/BigDecimal;->stripTrailingZeros()Ljava/math/BigDecimal;

    move-result-object p1

    invoke-virtual {p1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private numberInput(Ljava/lang/String;Z)Landroid/widget/EditText;
    .registers 9

    .line 161
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextSize(F)V

    const/16 v2, 0x40

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setMinHeight(I)V

    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    if-eqz p2, :cond_31

    const/16 p2, 0x2002

    goto :goto_34

    :cond_31
    const p2, 0x80001

    :goto_34
    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setInputType(I)V

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    return-object v0
.end method

.method private profile()Lio/mesalabs/unica/gpu/GpuProfile;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->draft:Lio/mesalabs/unica/gpu/GpuProfile;

    invoke-virtual {v0}, Lio/mesalabs/unica/gpu/GpuProfile;->copy()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    return-object v0
.end method

.method private profileDocument(ILandroid/net/Uri;)V
    .registers 6

    .line 137
    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-eqz v0, :cond_5

    return-void

    .line 138
    :cond_5
    const/16 v0, 0x34

    if-ne p1, v0, :cond_1d

    :try_start_9
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v1

    invoke-virtual {v1}, Lio/mesalabs/unica/gpu/GpuProfile;->encode()[B

    move-result-object v1
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_11} :catch_12

    goto :goto_1e

    :catch_12
    move-exception p1

    const-string p2, "Profile unavailable"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1d
    const/4 v1, 0x0

    .line 139
    :goto_1e
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-ne p1, v0, :cond_26

    const-string p1, "Saving tuning profile\u2026"

    goto :goto_28

    :cond_26
    const-string p1, "Reading tuning profile\u2026"

    :goto_28
    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    .line 140
    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda15;

    invoke-direct {v0, p0, v1, p2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda15;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;[BLandroid/net/Uri;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 147
    return-void
.end method

.method private profileStore()Landroid/content/SharedPreferences;
    .registers 4

    .line 93
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->createDeviceProtectedStorageContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "unica_gpu_profile"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private promptBackup()V
    .registers 3

    .line 134
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->ready()Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v1, "canRenew"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string v1, "canRestart"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_31

    :cond_1a
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->promptedImage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    goto :goto_31

    :cond_27
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->promptedImage:Ljava/lang/String;

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->createBackup()V

    .line 135
    return-void

    .line 134
    :cond_31
    :goto_31
    return-void
.end method

.method private static readProfile(Ljava/io/InputStream;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 149
    if-eqz p0, :cond_2e

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x1000

    new-array v1, v1, [B

    :goto_b
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_29

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    const v4, 0x8000

    if-gt v3, v4, :cond_21

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_b

    :cond_21
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Profile exceeds 32 KiB"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_29
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    :cond_2e
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Cannot read profile"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private ready()Z
    .registers 2

    .line 87
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method private removeLevel(I)V
    .registers 5

    .line 174
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Remove power level "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "This changes the saved table structure. Remaining levels are renumbered and initial/minimum references adjusted. Keep at least two levels. Apply is a separate action."

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda17;

    invoke-direct {v1, p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda17;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I)V

    const-string p1, "Remove"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private review(Lio/mesalabs/unica/gpu/GpuProfile;)Ljava/lang/CharSequence;
    .registers 15

    .line 114
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iget-object v1, p1, Lio/mesalabs/unica/gpu/GpuProfile;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 115
    const/4 v1, 0x0

    move v3, v1

    :goto_12
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ge v3, v4, :cond_10f

    iget-object v4, p1, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object v4, v4, v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\nTable "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u00b7 "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " levels \u00b7 initial "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v4, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u00b7 minimum "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v4, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move v6, v1

    :goto_5d
    iget-object v7, v4, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_10b

    iget-object v7, v4, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    invoke-direct {p0, v3, v6, v7}, Lio/mesalabs/unica/gpu/GpuActivity;->warning(IILio/mesalabs/unica/gpu/GpuProfile$Row;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Level "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v10, v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-direct {p0, v10, v11}, Lio/mesalabs/unica/gpu/GpuActivity;->mhz(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " MHz; RPMh "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; bus "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v10, v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v11, v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    invoke-virtual {v9, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v10, v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; ACD "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v10, :cond_db

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-wide v11, v7, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const-string v11, "0x%08x"

    invoke-static {v10, v11, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_dd

    :cond_db
    const-string v7, "none"

    :goto_dd
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_f2

    const-string v9, ""

    goto :goto_f3

    :cond_f2
    move-object v9, v2

    :goto_f3
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    xor-int/2addr v8, v5

    invoke-direct {p0, v7, v8}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_5d

    :cond_10b
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_12

    .line 116
    :cond_10f
    const-string p1, "\nExperimental values can freeze the GPU or prevent booting. Requests are not millivolts; the driver rounds to available corners. Raw request 1 is not a standard named corner. Neither stock nor red values guarantee stability. Keep the matching recovery rollback available."

    invoke-direct {p0, p1, v5}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    return-object v0
.end method

.method private reviewProfile(Lio/mesalabs/unica/gpu/GpuProfile;)V
    .registers 4

    .line 152
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Load imported tuning profile?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->review(Lio/mesalabs/unica/gpu/GpuProfile;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda4;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Lio/mesalabs/unica/gpu/GpuProfile;)V

    const-string p1, "Load profile"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 153
    return-void
.end method

.method private riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;
    .registers 6

    .line 92
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    if-eqz p2, :cond_1a

    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->warningColor()I

    move-result p2

    invoke-direct {p1, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result p2

    const/16 v1, 0x21

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, p2, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    :cond_1a
    return-object v0
.end method

.method private romColor(Ljava/lang/String;I)I
    .registers 6

    .line 44
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "color"

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_11

    goto :goto_15

    :cond_11
    invoke-virtual {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->getColor(I)I

    move-result p2

    :goto_15
    return p2
.end method

.method private row(Ljava/lang/String;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;)V
    .registers 14

    .line 77
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->divider()V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v1, 0x4c

    invoke-direct {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    const/16 v1, 0x18

    invoke-direct {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v1

    const/16 v2, 0xe

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 78
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v4, 0x12

    const/4 v5, 0x0

    invoke-direct {p0, p1, v4, v5}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v4

    .line 79
    if-eqz p4, :cond_4e

    const p4, 0x1010435

    const v6, -0x754b08

    invoke-direct {p0, p4, v6}, Lio/mesalabs/unica/gpu/GpuActivity;->themeColor(II)I

    move-result p4

    invoke-virtual {v4, p4}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_4e
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 80
    const/4 p4, -0x1

    const/4 v4, -0x2

    if-eqz p2, :cond_68

    invoke-direct {p0, p2, v2, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v2

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, p4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v7, 0x3

    invoke-direct {p0, v7}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v7

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    :cond_68
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v1, "\u203a"

    const/16 v2, 0x1a

    invoke-direct {p0, v1, v2, v3}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object v1

    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v1, v2, v5, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    if-eqz p3, :cond_96

    iget-boolean p3, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-nez p3, :cond_96

    move v5, v3

    :cond_96
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    if-eqz v5, :cond_9c

    goto :goto_9f

    :cond_9c
    const v6, 0x3ee66666    # 0.45f

    :goto_9f
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setAlpha(F)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 83
    new-instance p3, Landroid/util/TypedValue;

    invoke-direct {p3}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x101030e

    invoke-virtual {v1, v2, p3, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_bf

    iget p3, p3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 84
    :cond_bf
    new-instance p3, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda16;

    invoke-direct {p3, v5, p5}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda16;-><init>(ZLandroid/view/View$OnClickListener;)V

    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    if-nez p2, :cond_d5

    const-string p2, ""

    goto :goto_e8

    :cond_d5
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, ", "

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_e8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->page:Landroid/widget/LinearLayout;

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p2, p4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    return-void
.end method

.method private run(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 231
    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Working: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". Keep the device powered\u2026"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    .line 232
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda28;

    invoke-direct {v1, p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda28;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 235
    return-void
.end method

.method private saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 106
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    iput-object v0, p1, Lio/mesalabs/unica/gpu/GpuProfile;->firmware:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->setProfile(Lio/mesalabs/unica/gpu/GpuProfile;Z)V

    return-void
.end method

.method private saveVoltage(II)V
    .registers 6

    .line 162
    :try_start_0
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    iput p2, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-direct {p0, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1a} :catch_1b

    goto :goto_25

    :catch_1b
    move-exception p1

    const-string p2, "Cannot save voltage request"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :goto_25
    return-void
.end method

.method private section(Ljava/lang/String;)V
    .registers 7

    .line 62
    const/16 v0, 0xe

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->label(Ljava/lang/CharSequence;IZ)Landroid/widget/TextView;

    move-result-object p1

    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v0

    invoke-direct {p0, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v2

    const/16 v4, 0x8

    invoke-direct {p0, v4}, Lio/mesalabs/unica/gpu/GpuActivity;->dp(I)I

    move-result v4

    invoke-virtual {p1, v3, v0, v2, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setAccessibilityHeading(Z)V

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private setProfile(Lio/mesalabs/unica/gpu/GpuProfile;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    invoke-virtual {p1}, Lio/mesalabs/unica/gpu/GpuProfile;->encode()[B

    move-result-object p1

    invoke-static {p1}, Lio/mesalabs/unica/gpu/GpuProfile;->parse([B)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p1

    .line 97
    if-eqz p2, :cond_32

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profileStore()Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    new-instance v0, Ljava/lang/String;

    invoke-virtual {p1}, Lio/mesalabs/unica/gpu/GpuProfile;->encode()[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const-string v1, "profile"

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p2

    if-eqz p2, :cond_2a

    goto :goto_32

    :cond_2a
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Cannot save tuning profile"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 98
    :cond_32
    :goto_32
    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->draft:Lio/mesalabs/unica/gpu/GpuProfile;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->hasDraft:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->invalidSavedProfile:Z

    .line 99
    return-void
.end method

.method private syncDraft()V
    .registers 4

    .line 104
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    if-eqz v0, :cond_30

    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->hasDraft:Z

    if-nez v0, :cond_30

    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->invalidSavedProfile:Z

    if-eqz v0, :cond_d

    goto :goto_30

    :cond_d
    :try_start_d
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->imageProfile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->setProfile(Lio/mesalabs/unica/gpu/GpuProfile;Z)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_15} :catch_16

    goto :goto_30

    :catch_16
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot initialize tuning profile: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    :cond_30
    :goto_30
    return-void
.end method

.method private themeColor(II)I
    .registers 4

    .line 41
    filled-new-array {p1}, [I

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 42
    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return p2
.end method

.method private warning(IILio/mesalabs/unica/gpu/GpuProfile$Row;)Ljava/lang/String;
    .registers 9

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    const-wide/16 v3, 0x9

    cmp-long v1, v1, v3

    if-lez v1, :cond_12

    const-string v1, "This driver clamps active-row DDR requests above 9 to 9. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_12
    iget v1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-static {v1}, Lio/mesalabs/unica/gpu/GpuProfile;->outsideStock(I)Z

    move-result v1

    if-eqz v1, :cond_1f

    const-string v1, "Outside stock RPMh requests. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1f
    iget-wide v1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-static {p1, v1, v2}, Lio/mesalabs/unica/gpu/GpuProfile;->stockFrequency(IJ)Z

    move-result v1

    if-nez v1, :cond_2c

    const-string v1, "Outside stock frequency table. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    :cond_2c
    :try_start_2c
    invoke-static {}, Lio/mesalabs/unica/gpu/GpuProfile;->stock()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v1

    iget-object v1, v1, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    aget-object p1, v1, p1

    iget-object v1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_42

    const-string p1, "Added power level. "

    :goto_3e
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7d

    :cond_42
    iget-object p1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    iget-wide v1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    iget-wide v3, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    cmp-long p2, v1, v3

    if-nez p2, :cond_74

    iget-wide v1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    iget-wide v3, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    cmp-long p2, v1, v3

    if-nez p2, :cond_74

    iget-wide v1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    iget-wide v3, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    cmp-long p2, v1, v3

    if-nez p2, :cond_74

    iget-boolean p2, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    iget-boolean v1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-ne p2, v1, :cond_74

    iget-boolean p2, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz p2, :cond_7d

    iget-wide p2, p3, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    iget-wide v1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    cmp-long p1, p2, v1

    if-eqz p1, :cond_7d

    :cond_74
    const-string p1, "Bus/ACD differs from stock. "
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_76} :catch_77

    goto :goto_3e

    :catch_77
    move-exception p1

    const-string p1, "Stock comparison unavailable. "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_7d
    :goto_7d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private warningColor()I
    .registers 3

    .line 91
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v1, 0x20

    if-ne v0, v1, :cond_13

    const/16 v0, -0x7580

    goto :goto_16

    :cond_13
    const v0, -0x4fffe0

    :goto_16
    return v0
.end method


# virtual methods
.method synthetic lambda$apply$0$io-mesalabs-unica-gpu-GpuActivity(Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 228
    const-string p2, "apply2"

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->run(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createBackup$0$io-mesalabs-unica-gpu-GpuActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 127
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p4, " "

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "restart"

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->run(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createBackup$1$io-mesalabs-unica-gpu-GpuActivity(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 130
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "renew"

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->run(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$customVoltage$0$io-mesalabs-unica-gpu-GpuActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;ILandroid/content/DialogInterface;)V
    .registers 6

    .line 163
    const/4 p4, -0x1

    invoke-virtual {p1, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0, p2, p3, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda18;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/widget/EditText;ILandroid/app/AlertDialog;)V

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$customVoltage$1$io-mesalabs-unica-gpu-GpuActivity(Landroid/widget/EditText;ILandroid/app/AlertDialog;Landroid/view/View;)V
    .registers 8

    .line 163
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p4

    invoke-interface {p4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p4

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    iput p4, p2, Lio/mesalabs/unica/gpu/GpuProfile$Row;->voltage:I

    invoke-direct {p0, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_29} :catch_2a

    goto :goto_32

    :catch_2a
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_32
    return-void
.end method

.method synthetic lambda$draw$1$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 181
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$draw$10$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 3

    .line 199
    const-string p1, "GPU tuning"

    const-string v0, "Both tables are stored in firmware. The driver chooses the active table by chip/SKU; choosing a table here only chooses which draft to edit. Up to 15 entries per table, within the original FDT space. RPMh requests are mapped to available command-DB corners, not millivolts. Red marks values outside stock. None of these settings are a stability guarantee."

    invoke-direct {p0, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$draw$11$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 5

    .line 201
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Edit GPU table"

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Table 0 \u00b7 SKU-specific"

    const-string v1, "Table 1 \u00b7 fallback"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda21;

    invoke-direct {v2, p0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda21;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$draw$12$io-mesalabs-unica-gpu-GpuActivity(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 201
    iput p2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    return-void
.end method

.method synthetic lambda$draw$13$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 202
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->editInitial(Z)V

    return-void
.end method

.method synthetic lambda$draw$14$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 202
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->editInitial(Z)V

    return-void
.end method

.method synthetic lambda$draw$15$io-mesalabs-unica-gpu-GpuActivity(ILandroid/view/View;)V
    .registers 3

    .line 205
    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->editFrequency(I)V

    return-void
.end method

.method synthetic lambda$draw$16$io-mesalabs-unica-gpu-GpuActivity(ILandroid/view/View;)V
    .registers 3

    .line 206
    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->editLevel(I)V

    return-void
.end method

.method synthetic lambda$draw$17$io-mesalabs-unica-gpu-GpuActivity(ILandroid/view/View;)V
    .registers 3

    .line 207
    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->editBus(I)V

    return-void
.end method

.method synthetic lambda$draw$18$io-mesalabs-unica-gpu-GpuActivity(ILandroid/view/View;)V
    .registers 3

    .line 208
    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->removeLevel(I)V

    return-void
.end method

.method synthetic lambda$draw$19$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 210
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->addLevel()V

    return-void
.end method

.method synthetic lambda$draw$2$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 3

    .line 188
    const-string p1, "status"

    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->run(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$draw$20$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 212
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->apply()V

    return-void
.end method

.method synthetic lambda$draw$21$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 4

    .line 214
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Restore original GPU image?"

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "This restores the full vendor_boot image captured before this trial, including its original GPU table. Reboot after restoration succeeds."

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda1;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Restore"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$draw$22$io-mesalabs-unica-gpu-GpuActivity(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 214
    const-string p1, "restore"

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->hash()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->run(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$draw$23$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 4

    .line 215
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Reboot device?"

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Keep the rollback ZIP and recovery available. Only reboot after Apply or Restore reports success."

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda23;

    invoke-direct {v0, p0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda23;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Reboot"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$draw$24$io-mesalabs-unica-gpu-GpuActivity(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 215
    const-string p1, "power"

    invoke-virtual {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$draw$3$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 191
    const/16 p1, 0x34

    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->chooseProfile(I)V

    return-void
.end method

.method synthetic lambda$draw$4$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 192
    const/16 p1, 0x35

    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->chooseProfile(I)V

    return-void
.end method

.method synthetic lambda$draw$5$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 4

    .line 193
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Replace saved profile values?"

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "This replaces the saved draft. Back up your profile first if you want to keep it."

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda3;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;)V

    const-string v1, "Load values"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Cancel"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$draw$6$io-mesalabs-unica-gpu-GpuActivity(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 193
    :try_start_0
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->imageProfile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->setProfile(Lio/mesalabs/unica/gpu/GpuProfile;Z)V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_c

    goto :goto_16

    :catch_c
    move-exception p1

    const-string p2, "Cannot load values"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :goto_16
    return-void
.end method

.method synthetic lambda$draw$7$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 2

    .line 195
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->createBackup()V

    return-void
.end method

.method synthetic lambda$draw$8$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 4

    .line 196
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "application/zip"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "android.intent.extra.TITLE"

    const-string v1, "UN1CA-dm1q-GPU-rollback.zip"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0x33

    :try_start_1a
    invoke-virtual {p0, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1d
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1a .. :try_end_1d} :catch_1e

    goto :goto_28

    :catch_1e
    move-exception p1

    const-string v0, "File picker unavailable"

    invoke-virtual {p1}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :goto_28
    return-void
.end method

.method synthetic lambda$draw$9$io-mesalabs-unica-gpu-GpuActivity(Landroid/view/View;)V
    .registers 3

    .line 197
    const-string p1, "If Android cannot start"

    const-string v0, "Boot into OrangeFox using the device\'s recovery procedure. Mount Cache. Flash /cache/unica-gpu/rollback.zip, or flash the saved rollback ZIP from USB/PC storage. It verifies and restores the exact pre-trial vendor_boot image. Reboot manually after success. Keep a matching full ROM available if recovery restoration fails. Never use this ZIP after changing firmware."

    invoke-direct {p0, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$editBus$0$io-mesalabs-unica-gpu-GpuActivity(Landroid/app/AlertDialog;I[Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .registers 6

    .line 171
    const/4 p4, -0x1

    invoke-virtual {p1, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda13;

    invoke-direct {v0, p0, p2, p3, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda13;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;I[Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$editBus$1$io-mesalabs-unica-gpu-GpuActivity(I[Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 10

    .line 171
    const/4 p4, 0x0

    :try_start_1
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object v0

    iget-object v1, v0, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    aget-object v1, p2, p4

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->bus:J

    const/4 v1, 0x1

    aget-object v2, p2, v1

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->minimum:J

    const/4 v2, 0x2

    aget-object v3, p2, v2

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->maximum:J

    const/4 v3, 0x3

    aget-object v3, p2, v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "none"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5d

    goto :goto_5e

    :cond_5d
    move v1, p4

    :goto_5e
    iput-boolean v1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    iget-boolean v1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->hasAcd:Z

    if-eqz v1, :cond_7c

    const-string v1, "0x"

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_77

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v1

    goto :goto_7e

    :cond_77
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_7e

    :cond_7c
    const-wide/16 v1, 0x0

    :goto_7e
    iput-wide v1, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->acd:J

    invoke-direct {p0, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_89} :catch_8a

    goto :goto_94

    :catch_8a
    move-exception p1

    aget-object p2, p2, p4

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_94
    return-void
.end method

.method synthetic lambda$editFrequency$0$io-mesalabs-unica-gpu-GpuActivity(Landroid/app/AlertDialog;ILandroid/widget/EditText;Landroid/content/DialogInterface;)V
    .registers 6

    .line 158
    const/4 p4, -0x1

    invoke-virtual {p1, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2, p3, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda0;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;ILandroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$editFrequency$1$io-mesalabs-unica-gpu-GpuActivity(ILandroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 7

    .line 158
    :try_start_0
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p4

    iget-object v0, p4, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object v0, v0, v1

    iget-object v0, v0, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;

    new-instance v0, Ljava/math/BigDecimal;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->movePointRight(I)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->longValueExact()J

    move-result-wide v0

    iput-wide v0, p1, Lio/mesalabs/unica/gpu/GpuProfile$Row;->frequency:J

    invoke-direct {p0, p4}, Lio/mesalabs/unica/gpu/GpuActivity;->saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_33} :catch_34

    goto :goto_3c

    :catch_34
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_3c
    return-void
.end method

.method synthetic lambda$editInitial$0$io-mesalabs-unica-gpu-GpuActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;ZLandroid/content/DialogInterface;)V
    .registers 6

    .line 173
    const/4 p4, -0x1

    invoke-virtual {p1, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;

    invoke-direct {v0, p0, p2, p3, p1}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda26;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Landroid/widget/EditText;ZLandroid/app/AlertDialog;)V

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$editInitial$1$io-mesalabs-unica-gpu-GpuActivity(Landroid/widget/EditText;ZLandroid/app/AlertDialog;Landroid/view/View;)V
    .registers 7

    .line 173
    :try_start_0
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p4

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-eqz p2, :cond_1b

    iget-object p2, p4, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object p2, p2, v1

    iput v0, p2, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    goto :goto_23

    :cond_1b
    iget-object p2, p4, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object p2, p2, v1

    iput v0, p2, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    :goto_23
    invoke-direct {p0, p4}, Lio/mesalabs/unica/gpu/GpuActivity;->saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2c} :catch_2d

    goto :goto_35

    :catch_2d
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_35
    return-void
.end method

.method synthetic lambda$editLevel$0$io-mesalabs-unica-gpu-GpuActivity(ILandroid/content/DialogInterface;I)V
    .registers 6

    .line 167
    sget-object p2, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    aget p2, p2, p3

    invoke-static {p2}, Lio/mesalabs/unica/gpu/GpuProfile;->outsideStock(I)Z

    move-result p2

    if-eqz p2, :cond_4f

    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Use experimental RPMh request?"

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    aget v1, v1, p3

    invoke-direct {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->levelName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " is outside this firmware\'s stock request set. The driver can map it to a different corner. It can cause instability or prevent booting. This saves the draft only."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->riskText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0, p1, p3}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda11;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;II)V

    const-string p1, "Use request"

    invoke-virtual {p2, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "Cancel"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_56

    :cond_4f
    sget-object p2, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    aget p2, p2, p3

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->saveVoltage(II)V

    :goto_56
    return-void
.end method

.method synthetic lambda$editLevel$1$io-mesalabs-unica-gpu-GpuActivity(IILandroid/content/DialogInterface;I)V
    .registers 5

    .line 167
    sget-object p3, Lio/mesalabs/unica/gpu/GpuActivity;->LEVELS:[I

    aget p2, p3, p2

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->saveVoltage(II)V

    return-void
.end method

.method synthetic lambda$editLevel$2$io-mesalabs-unica-gpu-GpuActivity(ILandroid/content/DialogInterface;I)V
    .registers 4

    .line 167
    invoke-direct {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->customVoltage(I)V

    return-void
.end method

.method synthetic lambda$handleDocument$0$io-mesalabs-unica-gpu-GpuActivity(ILandroid/net/Uri;)V
    .registers 4

    .line 241
    new-instance v0, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;

    invoke-direct {v0, p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda20;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;ILandroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$handleDocument$1$io-mesalabs-unica-gpu-GpuActivity(ILandroid/net/Uri;)V
    .registers 4

    .line 241
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_9

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->handleDocument(ILandroid/net/Uri;)V

    :cond_9
    return-void
.end method

.method synthetic lambda$handleDocument$2$io-mesalabs-unica-gpu-GpuActivity(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .registers 23

    .line 244
    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    .line 245
    :try_start_6
    const-string v4, "SHA-256"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    new-instance v5, Ljava/io/FileInputStream;

    sget-object v6, Lio/mesalabs/unica/gpu/GpuTransport;->ROLLBACK:Ljava/io/File;

    invoke-direct {v5, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_13} :catch_108

    :try_start_13
    invoke-virtual {v1}, Lio/mesalabs/unica/gpu/GpuActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "wt"

    invoke-virtual {v6, v0, v7}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v6
    :try_end_1d
    .catchall {:try_start_13 .. :try_end_1d} :catchall_fd

    if-eqz v6, :cond_e9

    const/high16 v7, 0x10000

    :try_start_21
    new-array v8, v7, [B

    const-wide/16 v10, 0x0

    :goto_25
    invoke-virtual {v5, v8}, Ljava/io/InputStream;->read([B)I

    move-result v12

    const/4 v3, -0x1

    const/4 v9, 0x0

    if-eq v12, v3, :cond_45

    const-wide/32 v17, 0x7800000

    int-to-long v13, v12

    add-long/2addr v10, v13

    cmp-long v3, v10, v17

    if-gtz v3, :cond_3d

    invoke-virtual {v6, v8, v9, v12}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {v4, v8, v9, v12}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_25

    :cond_3d
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Oversized rollback ZIP"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_44
    throw v0
    :try_end_45
    .catchall {:try_start_21 .. :try_end_45} :catchall_e6

    :cond_45
    const-wide/32 v17, 0x7800000

    if-eqz v6, :cond_4d

    :try_start_4a
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_4d
    .catchall {:try_start_4a .. :try_end_4d} :catchall_fd

    :cond_4d
    :try_start_4d
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 246
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    invoke-static {v5}, Lio/mesalabs/unica/gpu/GpuActivity;->hex([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_de

    invoke-virtual {v4}, Ljava/security/MessageDigest;->reset()V

    .line 247
    invoke-virtual {v1}, Lio/mesalabs/unica/gpu/GpuActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_69} :catch_108

    if-eqz v5, :cond_cb

    :try_start_6b
    new-array v0, v7, [B

    const-wide/16 v15, 0x0

    :goto_6f
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-eq v6, v3, :cond_87

    int-to-long v7, v6

    add-long/2addr v15, v7

    cmp-long v7, v15, v17

    if-gtz v7, :cond_7f

    invoke-virtual {v4, v0, v9, v6}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_6f

    :cond_7f
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Oversized saved ZIP"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_86
    throw v0
    :try_end_87
    .catchall {:try_start_6b .. :try_end_87} :catchall_c8

    :cond_87
    if-eqz v5, :cond_8c

    :try_start_89
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 248
    :cond_8c
    cmp-long v0, v15, v10

    if-nez v0, :cond_c0

    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lio/mesalabs/unica/gpu/GpuActivity;->hex([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c0

    const-string v0, "exported"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v4, p3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lio/mesalabs/unica/gpu/GpuTransport;->request(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 249
    move-object v3, v0

    const/4 v0, 0x0

    goto :goto_10e

    .line 248
    :cond_c0
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Saved rollback ZIP verification failed"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_c8} :catch_108

    .line 247
    :catchall_c8
    move-exception v0

    move-object v2, v0

    goto :goto_d3

    :cond_cb
    :try_start_cb
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Cannot verify saved ZIP"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_d2
    .catchall {:try_start_cb .. :try_end_d2} :catchall_c8

    goto :goto_86

    :goto_d3
    if-eqz v5, :cond_dd

    :try_start_d5
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_d8
    .catchall {:try_start_d5 .. :try_end_d8} :catchall_d9

    goto :goto_dd

    :catchall_d9
    move-exception v0

    :try_start_da
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_dd
    :goto_dd
    throw v2

    .line 246
    :cond_de
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Source rollback checksum mismatch"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_e6
    .catch Ljava/lang/Exception; {:try_start_da .. :try_end_e6} :catch_108

    .line 245
    :catchall_e6
    move-exception v0

    move-object v2, v0

    goto :goto_f2

    :cond_e9
    :try_start_e9
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Cannot open destination"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_f0
    .catchall {:try_start_e9 .. :try_end_f0} :catchall_e6

    goto/16 :goto_44

    :goto_f2
    if-eqz v6, :cond_fc

    :try_start_f4
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_f7
    .catchall {:try_start_f4 .. :try_end_f7} :catchall_f8

    goto :goto_fc

    :catchall_f8
    move-exception v0

    :try_start_f9
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_fc
    :goto_fc
    throw v2
    :try_end_fd
    .catchall {:try_start_f9 .. :try_end_fd} :catchall_fd

    :catchall_fd
    move-exception v0

    move-object v2, v0

    :try_start_ff
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_102
    .catchall {:try_start_ff .. :try_end_102} :catchall_103

    goto :goto_107

    :catchall_103
    move-exception v0

    :try_start_104
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_107
    throw v2
    :try_end_108
    .catch Ljava/lang/Exception; {:try_start_104 .. :try_end_108} :catch_108

    .line 249
    :catch_108
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    :goto_10e
    new-instance v2, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda19;

    invoke-direct {v2, v1, v3, v0}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda19;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lio/mesalabs/unica/gpu/GpuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$handleDocument$3$io-mesalabs-unica-gpu-GpuActivity(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 4

    .line 249
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-eqz p1, :cond_13

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string p1, "Rollback ZIP saved and verified. Keep it accessible from recovery."

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    goto :goto_2f

    :cond_13
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Rollback export failed: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    const-string p1, "Rollback export failed"

    iget-object p2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2f
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    return-void
.end method

.method synthetic lambda$profileDocument$0$io-mesalabs-unica-gpu-GpuActivity([BLandroid/net/Uri;)V
    .registers 6

    .line 140
    nop

    .line 141
    const/4 v0, 0x0

    if-eqz p1, :cond_5a

    .line 142
    :try_start_4
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wt"

    invoke-virtual {v1, p2, v2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_e} :catch_80

    if-eqz v1, :cond_47

    :try_start_10
    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_45

    if-eqz v1, :cond_18

    :try_start_15
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 143
    :cond_18
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_20} :catch_80

    :try_start_20
    invoke-static {p2}, Lio/mesalabs/unica/gpu/GpuActivity;->readProfile(Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-static {p1, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p1
    :try_end_28
    .catchall {:try_start_20 .. :try_end_28} :catchall_39

    if-eqz p1, :cond_31

    if-eqz p2, :cond_2f

    :try_start_2c
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2f} :catch_80

    :cond_2f
    move-object p2, v0

    goto :goto_73

    :cond_31
    :try_start_31
    new-instance p1, Ljava/io/IOException;

    const-string v1, "Saved profile verification failed"

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_39
    .catchall {:try_start_31 .. :try_end_39} :catchall_39

    :catchall_39
    move-exception p1

    if-eqz p2, :cond_44

    :try_start_3c
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_40

    goto :goto_44

    :catchall_40
    move-exception p2

    :try_start_41
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_44
    :goto_44
    throw p1
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_45} :catch_80

    .line 142
    :catchall_45
    move-exception p1

    goto :goto_4f

    :cond_47
    :try_start_47
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Cannot open destination"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4f
    .catchall {:try_start_47 .. :try_end_4f} :catchall_45

    :goto_4f
    if-eqz v1, :cond_59

    :try_start_51
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_54
    .catchall {:try_start_51 .. :try_end_54} :catchall_55

    goto :goto_59

    :catchall_55
    move-exception p2

    :try_start_56
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_59
    :goto_59
    throw p1

    .line 144
    :cond_5a
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_62} :catch_80

    :try_start_62
    invoke-static {p1}, Lio/mesalabs/unica/gpu/GpuActivity;->readProfile(Ljava/io/InputStream;)[B

    move-result-object p2

    invoke-static {p2}, Lio/mesalabs/unica/gpu/GpuProfile;->parse([B)Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p2
    :try_end_6a
    .catchall {:try_start_62 .. :try_end_6a} :catchall_74

    if-eqz p1, :cond_73

    :try_start_6c
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6f} :catch_70

    goto :goto_73

    .line 145
    :catch_70
    move-exception p1

    move-object v0, p2

    goto :goto_81

    :cond_73
    :goto_73
    goto :goto_87

    .line 144
    :catchall_74
    move-exception p2

    if-eqz p1, :cond_7f

    :try_start_77
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_7a
    .catchall {:try_start_77 .. :try_end_7a} :catchall_7b

    goto :goto_7f

    :catchall_7b
    move-exception p1

    :try_start_7c
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7f
    :goto_7f
    throw p2
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_80} :catch_80

    .line 145
    :catch_80
    move-exception p1

    :goto_81
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    move-object p2, v0

    move-object v0, p1

    .line 146
    :goto_87
    new-instance p1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda14;

    invoke-direct {p1, p0, v0, p2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda14;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Ljava/lang/String;Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-virtual {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$profileDocument$1$io-mesalabs-unica-gpu-GpuActivity(Ljava/lang/String;Lio/mesalabs/unica/gpu/GpuProfile;)V
    .registers 4

    .line 146
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-eqz p1, :cond_29

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Profile operation failed: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    const-string p1, "Profile operation failed"

    iget-object p2, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_37

    :cond_29
    if-eqz p2, :cond_33

    const-string p1, "Profile validated. Review before loading."

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->reviewProfile(Lio/mesalabs/unica/gpu/GpuProfile;)V

    goto :goto_37

    :cond_33
    const-string p1, "Tuning profile saved and verified. Share this JSON file; keep your recovery rollback ZIP separately."

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    :goto_37
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    return-void
.end method

.method synthetic lambda$removeLevel$0$io-mesalabs-unica-gpu-GpuActivity(ILandroid/content/DialogInterface;I)V
    .registers 6

    .line 174
    :try_start_0
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->profile()Lio/mesalabs/unica/gpu/GpuProfile;

    move-result-object p2

    iget-object p3, p2, Lio/mesalabs/unica/gpu/GpuProfile;->tables:[Lio/mesalabs/unica/gpu/GpuProfile$Bin;

    iget v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->selectedTable:I

    aget-object p3, p3, v0

    iget-object v0, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget v0, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    if-le v0, p1, :cond_18

    iget v0, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_1a

    :cond_18
    iget v0, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    :goto_1a
    iget-object v1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->initial:I

    iget v0, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    if-le v0, p1, :cond_31

    iget p1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    add-int/lit8 p1, p1, -0x1

    goto :goto_33

    :cond_31
    iget p1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    :goto_33
    iget-object v0, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p3, Lio/mesalabs/unica/gpu/GpuProfile$Bin;->minimum:I

    invoke-direct {p0, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->saveDraft(Lio/mesalabs/unica/gpu/GpuProfile;)V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_47} :catch_48

    goto :goto_52

    :catch_48
    move-exception p1

    const-string p2, "Cannot remove level"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :goto_52
    return-void
.end method

.method synthetic lambda$reviewProfile$0$io-mesalabs-unica-gpu-GpuActivity(Lio/mesalabs/unica/gpu/GpuProfile;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 152
    const/4 p2, 0x1

    :try_start_1
    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->setProfile(Lio/mesalabs/unica/gpu/GpuProfile;Z)V

    const-string p1, "Imported profile saved. Loading did not write vendor_boot. Review before Apply."

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_c

    goto :goto_16

    :catch_c
    move-exception p1

    const-string p2, "Cannot save profile"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :goto_16
    return-void
.end method

.method synthetic lambda$run$0$io-mesalabs-unica-gpu-GpuActivity(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 232
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p1, p2}, Lio/mesalabs/unica/gpu/GpuTransport;->request(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_5} :catch_9

    move-object v2, v0

    move-object v0, p2

    move-object p2, v2

    goto :goto_e

    :catch_9
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    .line 233
    :goto_e
    new-instance v1, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda22;

    invoke-direct {v1, p0, v0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity$$ExternalSyntheticLambda22;-><init>(Lio/mesalabs/unica/gpu/GpuActivity;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lio/mesalabs/unica/gpu/GpuActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 234
    return-void
.end method

.method synthetic lambda$run$1$io-mesalabs-unica-gpu-GpuActivity(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 233
    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-eqz p1, :cond_89

    iput-object p1, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    const-string p3, "apply"

    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_19

    const-string p3, "GPU table written and verified. Reboot when ready."

    goto :goto_61

    :cond_19
    const-string p3, "restore"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_24

    const-string p3, "Original vendor_boot restored and verified. Reboot when ready."

    goto :goto_61

    :cond_24
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Compatible firmware. Backup: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "backup"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a

    const-string v0, "saved"

    goto :goto_3c

    :cond_3a
    const-string v0, "not created"

    :goto_3c
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, ". Rollback export: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "exported"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_51

    const-string v0, "verified"

    goto :goto_53

    :cond_51
    const-string v0, "required before Apply"

    :goto_53
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "."

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    :goto_61
    iput-object p3, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    const-string p3, "blockReason"

    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_ae

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, ". Your tuning profile stays saved."

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    goto :goto_ae

    :cond_89
    const/4 v0, 0x0

    iput-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->state:Lorg/json/JSONObject;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Operation failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, ". Refresh status before any further action."

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    const-string p3, "GPU operation failed"

    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->message:Ljava/lang/String;

    invoke-direct {p0, p3, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->alert(Ljava/lang/String;Ljava/lang/String;)V

    :cond_ae
    :goto_ae
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    iget-boolean p3, p0, Lio/mesalabs/unica/gpu/GpuActivity;->documentQueued:Z

    if-nez p3, :cond_c2

    if-eqz p1, :cond_c2

    const-string p1, "status"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c2

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->promptBackup()V

    :cond_c2
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    .line 237
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, -0x1

    if-ne p2, v0, :cond_16

    if-eqz p3, :cond_16

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_f

    goto :goto_16

    :cond_f
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lio/mesalabs/unica/gpu/GpuActivity;->handleDocument(ILandroid/net/Uri;)V

    :cond_16
    :goto_16
    return-void
.end method

.method public onBackPressed()V
    .registers 3

    .line 37
    iget-boolean v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->busy:Z

    if-eqz v0, :cond_f

    const-string v0, "Wait for the GPU operation to finish"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_f
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "Advanced GPU Tuning (Konabess)"

    invoke-virtual {p0, p1}, Lio/mesalabs/unica/gpu/GpuActivity;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/ActionBar;->hide()V

    :cond_15
    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->loadSavedProfile()V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->draw()V

    const-string p1, "status"

    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lio/mesalabs/unica/gpu/GpuActivity;->run(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onDestroy()V
    .registers 2

    .line 38
    iget-object v0, p0, Lio/mesalabs/unica/gpu/GpuActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4

    .line 36
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_e

    invoke-virtual {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->onBackPressed()V

    const/4 p1, 0x1

    return p1

    :cond_e
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method protected onResume()V
    .registers 1

    .line 39
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    invoke-direct {p0}, Lio/mesalabs/unica/gpu/GpuActivity;->applyBackground()V

    return-void
.end method
