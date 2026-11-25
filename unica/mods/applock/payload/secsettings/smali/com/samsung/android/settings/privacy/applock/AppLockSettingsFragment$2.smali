.class public final Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;
.super Landroidx/activity/OnBackPressedCallback;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# instance fields
.field public final synthetic this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;


# direct methods
.method public constructor <init>(Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public final handleOnBackPressed()V
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->collapseSearch()V

    return-void
.end method
