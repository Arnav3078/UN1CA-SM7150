.class Lcom/android/internal/app/LockedAppActivity$2;
.super Ljava/lang/Object;
.source "LockedAppActivity.java"

# interfaces
.implements Landroid/hardware/display/DisplayManager$DisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/LockedAppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/LockedAppActivity;


# direct methods
.method constructor blacklist <init>(Lcom/android/internal/app/LockedAppActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 406
    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity$2;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public whitelist onDisplayAdded(I)V
    .locals 0

    return-void
.end method

.method public whitelist onDisplayChanged(I)V
    .locals 1

    .line 415
    iget-object v0, p0, Lcom/android/internal/app/LockedAppActivity$2;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {v0}, Lcom/android/internal/app/LockedAppActivity;->getDisplayId()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 416
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$2;->this$0:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mresumePendingAuthenticationIfNeeded(Lcom/android/internal/app/LockedAppActivity;)V

    :cond_0
    return-void
.end method

.method public whitelist onDisplayRemoved(I)V
    .locals 0

    return-void
.end method
