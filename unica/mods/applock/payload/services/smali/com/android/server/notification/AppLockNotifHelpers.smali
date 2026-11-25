.class public final Lcom/android/server/notification/AppLockNotifHelpers;
.super Ljava/lang/Object;


# direct methods
.method public static getA11yRedactedNotification(Landroid/content/Context;Lcom/android/server/notification/NotificationRecord;Landroid/app/Notification;)Landroid/app/Notification;
    .locals 2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    iget-boolean p1, p1, Lcom/android/server/notification/NotificationRecord;->mAppLockRedacted:Z

    if-eqz p1, :cond_2

    const-class p1, Landroid/app/Notification$MessagingStyle;

    invoke-virtual {p2, p1}, Landroid/app/Notification;->isStyle(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, 0x1040242

    goto :goto_0

    :cond_0
    const p1, 0x1040241

    :goto_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Landroid/app/Notification$Builder;

    invoke-virtual {p2}, Landroid/app/Notification;->getChannelId()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p0, p2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const p0, 0x1080093

    invoke-virtual {v0, p0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    return-object p0

    :cond_2
    return-object p2
.end method

.method public static getHistoryNotificationForAppLock(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)Landroid/app/Notification;
    .locals 2

    iget-object v0, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v1, p0, Lcom/android/server/notification/NotificationManagerService;->mListeners:Lcom/android/server/notification/NotificationManagerService$NotificationListeners;

    invoke-virtual {v1, v0}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->shouldCreateAppLockRedactedSbn(Landroid/service/notification/StatusBarNotification;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService;->mListeners:Lcom/android/server/notification/NotificationManagerService$NotificationListeners;

    invoke-virtual {p0, v0}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForAppLock(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;

    move-result-object p0

    invoke-virtual {p0}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {v0}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object p0

    return-object p0
.end method

.method public static initNms(Lcom/android/server/notification/NotificationManagerService;)V
    .locals 1

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/notification/NotificationManagerService;->mAppLockLockedPackages:Landroid/util/SparseArray;

    new-instance v0, Lcom/android/server/notification/NotificationManagerService$26;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/server/notification/NotificationManagerService$26;->this$0:Lcom/android/server/notification/NotificationManagerService;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v0, p0, Lcom/android/server/notification/NotificationManagerService;->mPackageLockedStateListener:Lcom/android/server/notification/NotificationManagerService$26;

    return-void
.end method

.method public static markAppLockRedactedOnReconsider(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)V
    .locals 1

    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService;->mListeners:Lcom/android/server/notification/NotificationManagerService$NotificationListeners;

    iget-object v0, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {p0, v0}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->shouldCreateAppLockRedactedSbn(Landroid/service/notification/StatusBarNotification;)Z

    move-result p0

    iput-boolean p0, p1, Lcom/android/server/notification/NotificationRecord;->mAppLockRedacted:Z

    return-void
.end method

.method public static maybeRedactSbnForAppLock(Lcom/android/server/notification/NotificationManagerService;Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;
    .locals 1

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/server/notification/NotificationManagerService;->mListeners:Lcom/android/server/notification/NotificationManagerService$NotificationListeners;

    invoke-virtual {v0, p1}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->shouldCreateAppLockRedactedSbn(Landroid/service/notification/StatusBarNotification;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService;->mListeners:Lcom/android/server/notification/NotificationManagerService$NotificationListeners;

    invoke-virtual {p0, p1}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForAppLock(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p1
.end method

.method public static onNmsBootPhaseAmReady(Lcom/android/server/notification/NotificationManagerService;)V
    .locals 6

    const-string/jumbo v0, "NotificationService.onBootPhase_AMReady_appLock"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    const-class v0, Landroid/app/AppLockInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppLockInternal;

    iput-object v0, p0, Lcom/android/server/notification/NotificationManagerService;->mAppLockInternal:Landroid/app/AppLockInternal;

    if-nez v0, :cond_0

    const-string/jumbo p0, "NotificationService"

    const-string v0, "AppLockInternal is null"

    invoke-static {p0, v0}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_0
    iget-object v1, p0, Lcom/android/server/notification/NotificationManagerService;->mNotificationLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/notification/NotificationManagerService;->mAppLockInternal:Landroid/app/AppLockInternal;

    invoke-interface {v0}, Landroid/app/AppLockInternal;->getAppLockEnabledPackages()Landroid/util/SparseArray;

    move-result-object v0

    iget-object v2, p0, Lcom/android/server/notification/NotificationManagerService;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    if-eqz v4, :cond_1

    new-instance v5, Landroid/util/ArraySet;

    invoke-direct {v5, v4}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    iget-object v4, p0, Lcom/android/server/notification/NotificationManagerService;->mAppLockLockedPackages:Landroid/util/SparseArray;

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_4

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/server/notification/NotificationManagerService;->mAppLockInternal:Landroid/app/AppLockInternal;

    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService;->mPackageLockedStateListener:Lcom/android/server/notification/NotificationManagerService$26;

    invoke-interface {v0, p0}, Landroid/app/AppLockInternal;->registerPackageLockedStateListener(Landroid/app/AppLockInternal$PackageLockedStateListener;)V

    :goto_3
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :goto_4
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static redactShortcutForAppLock(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;Lcom/android/server/notification/ManagedServices$ManagedServiceInfo;Landroid/content/pm/ShortcutInfo;)Landroid/content/pm/ShortcutInfo;
    .locals 3

    if-nez p3, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object v0, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {v0}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/service/notification/StatusBarNotification;->getNormalizedUserId()I

    move-result v2

    invoke-virtual {p0, v2, v1}, Lcom/android/server/notification/NotificationManagerService;->isPackageLockedByAppLockLocked(ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v0

    const-class v1, Landroid/app/Notification$CallStyle;

    invoke-virtual {v0, v1}, Landroid/app/Notification;->isStyle(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_1

    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService;->mAssistants:Lcom/android/server/notification/NotificationManagerService$NotificationAssistants;

    iget-object p2, p2, Lcom/android/server/notification/ManagedServices$ManagedServiceInfo;->service:Landroid/os/IInterface;

    invoke-virtual {p0, p2}, Lcom/android/server/notification/ManagedServices;->isServiceTokenValidLocked(Landroid/os/IInterface;)Z

    move-result p0

    if-nez p0, :cond_2

    :cond_1
    const/4 p0, 0x0

    return-object p0

    :cond_2
    return-object p3
.end method

.method public static redactOrKeepForPosted(Lcom/android/server/notification/NotificationManagerService$NotificationListeners;Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->shouldCreateAppLockRedactedSbn(Landroid/service/notification/StatusBarNotification;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForAppLock(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForOtp(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;

    move-result-object p0

    return-object p0
.end method

.method public static shouldAllowAiNudgeForAppLock(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)Z
    .locals 0

    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService;->mListeners:Lcom/android/server/notification/NotificationManagerService$NotificationListeners;

    iget-object p1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {p0, p1}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->shouldCreateAppLockRedactedSbn(Landroid/service/notification/StatusBarNotification;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
