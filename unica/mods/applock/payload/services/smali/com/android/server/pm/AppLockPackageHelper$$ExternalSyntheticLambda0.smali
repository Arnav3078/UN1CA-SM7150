.class public final synthetic Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:B

.field public synthetic f$0:Ljava/lang/Object;

.field public synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(B)V
    .locals 0

    iput-byte p1, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->$r8$classId:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-byte v0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->$r8$classId:B

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/pm/AppLockPackageHelper$1;

    iget p0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    iget-object v0, v0, Lcom/android/server/pm/AppLockPackageHelper$1;->this$0:Lcom/android/server/pm/AppLockPackageHelper;

    iget-object v1, v0, Lcom/android/server/pm/AppLockPackageHelper;->mPms:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v1}, Lcom/android/server/pm/PackageManagerService;->snapshotComputer()Lcom/android/server/pm/Computer;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/android/server/pm/AppLockPackageHelper;->onSupervisionEnabled(Lcom/android/server/pm/Computer;I)V

    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/pm/AppLockPackageHelper;

    iget p0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    sget-boolean v1, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    invoke-virtual {v0, p0}, Lcom/android/server/pm/AppLockPackageHelper;->onSpcStateChanged(I)V

    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/pm/AppLockPackageHelper;

    iget p0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    sget-boolean v1, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    iget-object v0, v0, Lcom/android/server/pm/AppLockPackageHelper;->mSpcCleanupCompleted:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseBooleanArray;->delete(I)V

    return-void

    :pswitch_2
    iget-object v0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/pm/AppLockPackageHelper;

    iget p0, p0, Lcom/android/server/pm/AppLockPackageHelper$$ExternalSyntheticLambda0;->f$1:I

    sget-boolean v1, Lcom/android/server/pm/AppLockPackageHelper;->DEBUG:Z

    iget-object v1, v0, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesPendingAppLockRestore:Landroid/util/SparseArray;

    monitor-enter v1

    :try_start_0
    invoke-virtual {v0, p0}, Lcom/android/server/pm/AppLockPackageHelper;->writePendingBackupRestoreEntriesLocked(I)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
