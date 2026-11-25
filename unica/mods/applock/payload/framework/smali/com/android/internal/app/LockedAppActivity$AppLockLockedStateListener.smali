.class Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;
.super Ljava/lang/Object;
.source "LockedAppActivity.java"

# interfaces
.implements Landroid/security/applock/AppLockManager$PackageLockedStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/LockedAppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AppLockLockedStateListener"
.end annotation


# instance fields
.field private final blacklist mActivity:Lcom/android/internal/app/LockedAppActivity;

.field private final blacklist mPackageName:Ljava/lang/String;

.field private final blacklist mTarget:Landroid/content/IntentSender;

.field private final blacklist mUserId:I


# direct methods
.method constructor blacklist <init>(Lcom/android/internal/app/LockedAppActivity;Ljava/lang/String;ILandroid/content/IntentSender;)V
    .locals 0

    .line 1644
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1645
    iput-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    .line 1646
    iput-object p2, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mPackageName:Ljava/lang/String;

    .line 1647
    iput p3, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mUserId:I

    .line 1648
    iput-object p4, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mTarget:Landroid/content/IntentSender;

    return-void
.end method


# virtual methods
.method public blacklist onPackageLockedStateChanged(Ljava/lang/String;IZ)V
    .locals 0

    if-nez p3, :cond_5

    .line 1654
    iget-object p3, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mPackageName:Ljava/lang/String;

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mUserId:I

    if-ne p1, p2, :cond_5

    .line 1655
    invoke-static {}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$sfgetDEBUG()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1656
    const-string/jumbo p1, "LockedAppActivity"

    const-string/jumbo p2, "onPackageLockedStateChanged: package was unlocked, so finishing"

    invoke-static {p1, p2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1658
    :cond_0
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmCancellationSignal(Lcom/android/internal/app/LockedAppActivity;)Landroid/os/CancellationSignal;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1659
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmCancellationSignal(Lcom/android/internal/app/LockedAppActivity;)Landroid/os/CancellationSignal;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/CancellationSignal;->cancel()V

    .line 1663
    :cond_1
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsPackageUnlocked(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 1665
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmIsWaitingForLockedTaskUnlockDraw(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1667
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fgetmShowLockedTaskUiInEmptyTask(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1669
    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1, p2}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$fputmIsLockedTaskUnlockStateUpdated(Lcom/android/internal/app/LockedAppActivity;Z)V

    .line 1670
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mcompleteLockedTaskUnlockIfReady(Lcom/android/internal/app/LockedAppActivity;)V

    return-void

    .line 1674
    :cond_2
    sget-boolean p1, Lcom/samsung/android/rune/CoreRune;->FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p1}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$misInterceptMode(Lcom/android/internal/app/LockedAppActivity;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    .line 1675
    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-virtual {p1}, Lcom/android/internal/app/LockedAppActivity;->isDestroyed()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1676
    :cond_3
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mcompleteUnlockAfterDestroyed(Lcom/android/internal/app/LockedAppActivity;)V

    return-void

    .line 1680
    :cond_4
    iget-object p0, p0, Lcom/android/internal/app/LockedAppActivity$AppLockLockedStateListener;->mActivity:Lcom/android/internal/app/LockedAppActivity;

    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->-$$Nest$mcompleteUnlockAndFinish(Lcom/android/internal/app/LockedAppActivity;)V

    :cond_5
    return-void
.end method
