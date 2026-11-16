.class public final synthetic Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;

.field public final synthetic f$1:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;Ljava/lang/Exception;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda4;->f$0:Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;

    iput-object p2, p0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda4;->f$1:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda4;->f$0:Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;

    iget-object v1, p0, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment$$ExternalSyntheticLambda4;->f$1:Ljava/lang/Exception;

    invoke-virtual {v0, v1}, Lio/mesalabs/unica/settings/qwen/QwenSettingsFragment;->lambda$startBackgroundDownload$2$io-mesalabs-unica-settings-qwen-QwenSettingsFragment(Ljava/lang/Exception;)V

    return-void
.end method
