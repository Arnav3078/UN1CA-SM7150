.class public final Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;
.super Lcom/android/settings/dashboard/DashboardFragment;
.source "QwenSettingsFragment.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# static fields
.field private static final DOWNLOAD_URL:Ljava/lang/String; = "https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF/resolve/main/qwen2.5-0.5b-instruct-q4_k_m.gguf"

.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

.field private static volatile downloadProgress:I

.field private static volatile isDownloading:Z


# instance fields
.field private final mHandler:Landroid/os/Handler;


# direct methods
.method public static synthetic $r8$lambda$kXtTipsoOzidbLkqm3leSbf29lY(Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;)V
    .registers 1

    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->updateStatus()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 21
    new-instance v0, Lcom/android/settings/search/BaseSearchIndexProvider;

    .line 22
    const-string v1, "xml"

    const-string v2, "carbon_qwen_settings"

    invoke-static {v1, v2}, Lio/mesalabs/unica/utils/Utils;->getResourceId(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lcom/android/settings/search/BaseSearchIndexProvider;-><init>(I)V

    sput-object v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    .line 25
    const/4 v0, 0x0

    sput-boolean v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->isDownloading:Z

    .line 26
    sput v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->downloadProgress:I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 20
    invoke-direct {p0}, Lcom/android/settings/dashboard/DashboardFragment;-><init>()V

    .line 28
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private getModelDirectory()Ljava/io/File;
    .registers 4

    .line 45
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 46
    new-instance v1, Ljava/io/File;

    const-string v2, "Qwen"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 47
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_16

    .line 48
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 50
    :cond_16
    return-object v1
.end method

.method private getModelFile()Ljava/io/File;
    .registers 4

    .line 54
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getModelDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "qwen2.5-0.5b-instruct-q4_k_m.gguf"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private promptDownload()V
    .registers 4

    .line 148
    invoke-virtual {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 149
    if-nez v0, :cond_7

    return-void

    .line 151
    :cond_7
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    const-string v0, "carbon_qwen_download_confirm_title"

    invoke-direct {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 153
    const-string v1, "carbon_qwen_download_confirm_msg"

    invoke-direct {p0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 154
    const-string v1, "carbon_qwen_download_btn"

    invoke-direct {p0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda0;-><init>(Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 155
    const-string v1, "carbon_qwen_cancel_btn"

    invoke-direct {p0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 156
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 157
    return-void
.end method

.method private runInferenceTest()V
    .registers 5

    .line 228
    invoke-virtual {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 229
    if-nez v0, :cond_7

    return-void

    .line 231
    :cond_7
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getModelFile()Ljava/io/File;

    move-result-object v1

    .line 232
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    const-string v3, "OK"

    if-nez v1, :cond_35

    .line 233
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 234
    const-string v0, "carbon_qwen_test_missing_title"

    invoke-direct {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 235
    const-string v1, "carbon_qwen_test_missing_msg"

    invoke-direct {p0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 236
    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 237
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 238
    return-void

    .line 241
    :cond_35
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 242
    const-string v0, "carbon_qwen_test_success_title"

    invoke-direct {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 243
    const-string v1, "carbon_qwen_test_success_msg"

    invoke-direct {p0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 244
    invoke-virtual {v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 245
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 246
    return-void
.end method

.method private setupListeners()V
    .registers 2

    .line 86
    const-string v0, "carbon_qwen_download"

    invoke-virtual {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 87
    if-eqz v0, :cond_b

    .line 88
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 90
    :cond_b
    const-string v0, "carbon_qwen_test_prompt"

    invoke-virtual {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 91
    if-eqz v0, :cond_16

    .line 92
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 94
    :cond_16
    return-void
.end method

.method private startBackgroundDownload()V
    .registers 4

    .line 160
    sget-boolean v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->isDownloading:Z

    if-eqz v0, :cond_5

    return-void

    .line 161
    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->isDownloading:Z

    .line 162
    const/4 v0, 0x0

    sput v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->downloadProgress:I

    .line 163
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->updateStatus()V

    .line 165
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda1;-><init>(Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;)V

    const-string v2, "QwenModelDownloader"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 224
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 225
    return-void
.end method

.method private str(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 31
    invoke-virtual {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 32
    if-nez v0, :cond_9

    const-string p1, ""

    return-object p1

    .line 33
    :cond_9
    const-string v1, "string"

    invoke-static {v1, p1}, Lio/mesalabs/unica/utils/Utils;->getResourceId(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 34
    if-eqz v1, :cond_15

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :cond_15
    return-object p1
.end method

.method private varargs str(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 5

    .line 38
    invoke-virtual {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 39
    if-nez v0, :cond_9

    const-string p1, ""

    return-object p1

    .line 40
    :cond_9
    const-string v1, "string"

    invoke-static {v1, p1}, Lio/mesalabs/unica/utils/Utils;->getResourceId(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 41
    if-eqz v1, :cond_15

    invoke-virtual {v0, v1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :cond_15
    return-object p1
.end method

.method private updateStatus()V
    .registers 11

    .line 97
    const-string v0, "carbon_qwen_engine_state"

    invoke-virtual {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 98
    const-string v1, "carbon_qwen_download"

    invoke-virtual {p0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    .line 99
    const-string v2, "carbon_qwen_model_path"

    invoke-virtual {p0, v2}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v2

    .line 100
    if-nez v0, :cond_15

    return-void

    .line 102
    :cond_15
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getModelFile()Ljava/io/File;

    move-result-object v3

    .line 103
    if-eqz v2, :cond_22

    .line 104
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 107
    :cond_22
    sget-boolean v2, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->isDownloading:Z

    if-eqz v2, :cond_53

    .line 108
    sget v2, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->downloadProgress:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "carbon_qwen_status_downloading"

    invoke-direct {p0, v3, v2}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 109
    if-eqz v1, :cond_52

    .line 110
    sget v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->downloadProgress:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "carbon_qwen_status_download_in_progress"

    invoke-direct {p0, v2, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 111
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 113
    :cond_52
    return-void

    .line 116
    :cond_53
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    const/4 v4, 0x1

    const-string v5, "carbon_qwen_download_title"

    if-eqz v2, :cond_96

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/32 v8, 0x15000000

    cmp-long v2, v6, v8

    if-lez v2, :cond_96

    .line 117
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/32 v6, 0x100000

    div-long/2addr v2, v6

    .line 118
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "carbon_qwen_status_ready"

    invoke-direct {p0, v3, v2}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 119
    if-eqz v1, :cond_95

    .line 120
    invoke-direct {p0, v5}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 121
    const-string v0, "carbon_qwen_status_verified"

    invoke-direct {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 122
    invoke-virtual {v1, v4}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 124
    :cond_95
    goto :goto_b4

    .line 125
    :cond_96
    const-string v2, "carbon_qwen_status_not_downloaded"

    invoke-direct {p0, v2}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 126
    if-eqz v1, :cond_b4

    .line 127
    invoke-direct {p0, v5}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 128
    const-string v0, "carbon_qwen_download_summary"

    invoke-direct {p0, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 129
    invoke-virtual {v1, v4}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 132
    :cond_b4
    :goto_b4
    return-void
.end method


# virtual methods
.method public getLogTag()Ljava/lang/String;
    .registers 2

    .line 59
    const-string v0, "QwenSettingsFragment"

    return-object v0
.end method

.method public getMetricsCategory()I
    .registers 2

    .line 64
    const/16 v0, 0x2e8

    return v0
.end method

.method public getPreferenceScreenResId()I
    .registers 3

    .line 69
    const-string v0, "xml"

    const-string v1, "carbon_qwen_settings"

    invoke-static {v0, v1}, Lio/mesalabs/unica/utils/Utils;->getResourceId(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method synthetic lambda$promptDownload$0$io-mesalabs-unica-settings-qwen-QwenSettingsFragment(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 154
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->startBackgroundDownload()V

    return-void
.end method

.method synthetic lambda$startBackgroundDownload$0$io-mesalabs-unica-settings-qwen-QwenSettingsFragment()V
    .registers 21

    .line 167
    move-object/from16 v1, p0

    :try_start_2
    invoke-direct {v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getModelDirectory()Ljava/io/File;

    move-result-object v0

    .line 168
    invoke-direct {v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getModelFile()Ljava/io/File;

    move-result-object v2

    .line 169
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".part"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 171
    new-instance v0, Ljava/net/URL;

    const-string v4, "https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF/resolve/main/qwen2.5-0.5b-instruct-q4_k_m.gguf"

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 172
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 173
    const/16 v4, 0x3a98

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 174
    const/16 v4, 0x7530

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 175
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 177
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    .line 178
    const/16 v5, 0x12d

    if-eq v4, v5, :cond_4c

    const/16 v5, 0x12e

    if-ne v4, v5, :cond_63

    .line 179
    :cond_4c
    const-string v4, "Location"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 180
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 181
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 182
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 185
    :cond_63
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v4

    .line 186
    nop

    .line 188
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_6c} :catch_e4

    .line 189
    :try_start_6c
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_71
    .catchall {:try_start_6c .. :try_end_71} :catchall_d7

    .line 190
    const/high16 v0, 0x10000

    :try_start_73
    new-array v0, v0, [B

    .line 192
    const-wide/16 v8, 0x0

    move-wide v10, v8

    move-wide v12, v10

    .line 193
    :goto_79
    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I

    move-result v14

    const/4 v15, -0x1

    if-eq v14, v15, :cond_aa

    .line 194
    const/4 v15, 0x0

    invoke-virtual {v7, v0, v15, v14}, Ljava/io/FileOutputStream;->write([BII)V

    .line 195
    int-to-long v14, v14

    add-long/2addr v10, v14

    .line 196
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 197
    cmp-long v16, v4, v8

    if-lez v16, :cond_a9

    sub-long v16, v14, v12

    const-wide/16 v18, 0x3e8

    cmp-long v16, v16, v18

    if-lez v16, :cond_a9

    .line 198
    nop

    .line 199
    const-wide/16 v12, 0x64

    mul-long/2addr v12, v10

    div-long/2addr v12, v4

    long-to-int v12, v12

    sput v12, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->downloadProgress:I

    .line 200
    iget-object v12, v1, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->mHandler:Landroid/os/Handler;

    new-instance v13, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda2;

    invoke-direct {v13, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda2;-><init>(Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;)V

    invoke-virtual {v12, v13}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-wide v12, v14

    .line 202
    :cond_a9
    goto :goto_79

    .line 203
    :cond_aa
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->flush()V
    :try_end_ad
    .catchall {:try_start_73 .. :try_end_ad} :catchall_cc

    .line 204
    :try_start_ad
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_b0
    .catchall {:try_start_ad .. :try_end_b0} :catchall_d7

    if-eqz v6, :cond_b5

    :try_start_b2
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 206
    :cond_b5
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_be

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 207
    :cond_be
    invoke-virtual {v3, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 209
    iget-object v0, v1, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->mHandler:Landroid/os/Handler;

    new-instance v2, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda3;

    invoke-direct {v2, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda3;-><init>(Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_cb
    .catch Ljava/lang/Exception; {:try_start_b2 .. :try_end_cb} :catch_e4

    .line 223
    goto :goto_ef

    .line 188
    :catchall_cc
    move-exception v0

    move-object v2, v0

    :try_start_ce
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_d1
    .catchall {:try_start_ce .. :try_end_d1} :catchall_d2

    goto :goto_d6

    :catchall_d2
    move-exception v0

    :try_start_d3
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_d6
    throw v2
    :try_end_d7
    .catchall {:try_start_d3 .. :try_end_d7} :catchall_d7

    :catchall_d7
    move-exception v0

    move-object v2, v0

    if-eqz v6, :cond_e3

    :try_start_db
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_de
    .catchall {:try_start_db .. :try_end_de} :catchall_df

    goto :goto_e3

    :catchall_df
    move-exception v0

    :try_start_e0
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_e3
    :goto_e3
    throw v2
    :try_end_e4
    .catch Ljava/lang/Exception; {:try_start_e0 .. :try_end_e4} :catch_e4

    .line 216
    :catch_e4
    move-exception v0

    .line 217
    iget-object v2, v1, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->mHandler:Landroid/os/Handler;

    new-instance v3, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda4;

    invoke-direct {v3, v1, v0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda4;-><init>(Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;Ljava/lang/Exception;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 224
    :goto_ef
    return-void
.end method

.method synthetic lambda$startBackgroundDownload$1$io-mesalabs-unica-settings-qwen-QwenSettingsFragment()V
    .registers 4

    .line 210
    const/4 v0, 0x0

    sput-boolean v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->isDownloading:Z

    .line 211
    const/16 v0, 0x64

    sput v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->downloadProgress:I

    .line 212
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->updateStatus()V

    .line 213
    invoke-virtual {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 214
    if-eqz v0, :cond_1e

    const-string v1, "carbon_qwen_download_success"

    invoke-direct {p0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 215
    :cond_1e
    return-void
.end method

.method synthetic lambda$startBackgroundDownload$2$io-mesalabs-unica-settings-qwen-QwenSettingsFragment(Ljava/lang/Exception;)V
    .registers 4

    .line 218
    const/4 v0, 0x0

    sput-boolean v0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->isDownloading:Z

    .line 219
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->updateStatus()V

    .line 220
    invoke-virtual {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 221
    if-eqz v0, :cond_22

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v1, "carbon_qwen_download_failed"

    invoke-direct {p0, v1, p1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->str(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 222
    :cond_22
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 74
    invoke-super {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->onCreate(Landroid/os/Bundle;)V

    .line 75
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->updateStatus()V

    .line 76
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->setupListeners()V

    .line 77
    return-void
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .registers 4

    .line 136
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    .line 137
    const-string v0, "carbon_qwen_download"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_11

    .line 138
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->promptDownload()V

    .line 139
    return v1

    .line 140
    :cond_11
    const-string v0, "carbon_qwen_test_prompt"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1d

    .line 141
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->runInferenceTest()V

    .line 142
    return v1

    .line 144
    :cond_1d
    const/4 p1, 0x0

    return p1
.end method

.method public onResume()V
    .registers 1

    .line 81
    invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onResume()V

    .line 82
    invoke-direct {p0}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->updateStatus()V

    .line 83
    return-void
.end method
