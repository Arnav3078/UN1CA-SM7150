.class final Lcom/android/server/am/AppLockLocalService$NotificationListener;
.super Landroid/service/notification/NotificationListenerService;
.source "qb/117478588 8afe535c4e063f98098afe00b0e890d3155666a3526125e89992ed108689d060"


# instance fields
.field public final synthetic this$0:Lcom/android/server/am/AppLockLocalService;


# direct methods
.method public constructor <init>(Lcom/android/server/am/AppLockLocalService;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-direct {p0}, Landroid/service/notification/NotificationListenerService;-><init>()V

    return-void
.end method


# virtual methods
.method public final onNotificationPosted(Landroid/service/notification/StatusBarNotification;)V
    .locals 13

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    iget-object v4, v1, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    if-eqz v4, :cond_2

    const-class v4, Landroid/app/Notification$CallStyle;

    invoke-virtual {v1, v4}, Landroid/app/Notification;->isStyle(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v3

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getNormalizedUserId()I

    move-result v5

    if-eqz v1, :cond_18

    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v1, v0, v5}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-nez v1, :cond_3

    goto/16 :goto_d

    :cond_3
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v1

    const/4 v6, 0x2

    const/4 v7, 0x0

    if-eqz v1, :cond_8

    iget-object v8, v1, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    if-eqz v8, :cond_8

    const-class v8, Landroid/app/Notification$CallStyle;

    invoke-virtual {v1, v8}, Landroid/app/Notification;->isStyle(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_4

    goto :goto_3

    :cond_4
    iget-object v8, v1, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    const-string/jumbo v9, "android.callType"

    const/4 v10, -0x1

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v9

    if-eq v9, v3, :cond_5

    const/4 v10, 0x3

    if-eq v9, v10, :cond_5

    if-ne v9, v6, :cond_8

    :cond_5
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object p1

    new-instance v7, Landroid/util/ArraySet;

    invoke-direct {v7}, Landroid/util/ArraySet;-><init>()V

    new-instance v10, Landroid/util/ArraySet;

    invoke-direct {v10}, Landroid/util/ArraySet;-><init>()V

    const-string/jumbo v11, "android.answerIntent"

    const-class v12, Landroid/app/PendingIntent;

    invoke-virtual {v8, v11, v12}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/PendingIntent;

    invoke-static {v7, v10, p1, v8}, Lcom/android/server/am/AppLockLocalService;->addPendingIntent(Landroid/util/ArraySet;Landroid/util/ArraySet;Ljava/lang/String;Landroid/app/PendingIntent;)V

    iget-object v8, v1, Landroid/app/Notification;->fullScreenIntent:Landroid/app/PendingIntent;

    invoke-static {v7, v10, p1, v8}, Lcom/android/server/am/AppLockLocalService;->addPendingIntent(Landroid/util/ArraySet;Landroid/util/ArraySet;Ljava/lang/String;Landroid/app/PendingIntent;)V

    iget-object v8, v1, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    invoke-static {v7, v10, p1, v8}, Lcom/android/server/am/AppLockLocalService;->addPendingIntent(Landroid/util/ArraySet;Landroid/util/ArraySet;Ljava/lang/String;Landroid/app/PendingIntent;)V

    iget-object v1, v1, Landroid/app/Notification;->actions:[Landroid/app/Notification$Action;

    if-eqz v1, :cond_7

    array-length v8, v1

    move v11, v2

    :goto_2
    if-ge v11, v8, :cond_7

    aget-object v12, v1, v11

    if-eqz v12, :cond_6

    iget-object v12, v12, Landroid/app/Notification$Action;->actionIntent:Landroid/app/PendingIntent;

    invoke-static {v7, v10, p1, v12}, Lcom/android/server/am/AppLockLocalService;->addPendingIntent(Landroid/util/ArraySet;Landroid/util/ArraySet;Ljava/lang/String;Landroid/app/PendingIntent;)V

    :cond_6
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    :cond_7
    new-instance p1, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;

    invoke-direct {p1, v9, v7, v10}, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;-><init>(ILandroid/util/ArraySet;Landroid/util/ArraySet;)V

    move-object v7, p1

    :cond_8
    :goto_3
    if-eqz v7, :cond_16

    iget-object p1, v7, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->components:Landroid/util/ArraySet;

    invoke-virtual {p1}, Landroid/util/ArraySet;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_9

    goto/16 :goto_a

    :cond_9
    iget p1, v7, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->callType:I

    iget-object v1, v7, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->components:Landroid/util/ArraySet;

    iget-object v7, v7, Lcom/android/server/am/AppLockLocalService$ParsedCallNotification;->tokens:Landroid/util/ArraySet;

    iget-object v8, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v8, v8, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v8

    :try_start_0
    iget-object v9, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v9, v9, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v9, v4}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    iget-object v10, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v10, v5, v0}, Lcom/android/server/am/AppLockLocalService;->isPackageAppLockEnabledLocked(ILjava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_b

    if-eqz v9, :cond_a

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, v9, v3}, Lcom/android/server/am/AppLockLocalService;->cleanupTrackedCallNotificationLocked(Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;Z)V

    goto :goto_4

    :catchall_0
    move-exception p0

    goto/16 :goto_9

    :cond_a
    :goto_4
    monitor-exit v8

    return-void

    :cond_b
    if-eqz v9, :cond_10

    iget v10, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mCallType:I

    if-ne v10, p1, :cond_e

    iget-object v10, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_e

    iget v10, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    if-eq v10, v5, :cond_c

    goto :goto_6

    :cond_c
    move v10, v2

    :goto_5
    iget-object v11, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-virtual {v11}, Landroid/util/ArraySet;->size()I

    move-result v11

    if-ge v10, v11, :cond_10

    iget-object v11, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    invoke-virtual {v11, v10}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/ComponentName;

    invoke-virtual {v1, v11}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_d

    iget-object v12, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {v12, v5, v11, v4, v0}, Lcom/android/server/am/AppLockLocalService;->isComponentReferencedByOtherNotificationLocked(ILandroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_d

    iget-object v12, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v12, v12, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-static {v12, v5, v0, v11}, Lcom/android/server/am/AppLockLocalService;->removeCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V

    :cond_d
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    :cond_e
    :goto_6
    iget-object v10, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget v11, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mCallType:I

    if-ne v11, v6, :cond_f

    move v11, v3

    goto :goto_7

    :cond_f
    move v11, v2

    :goto_7
    invoke-virtual {v10, v9, v11}, Lcom/android/server/am/AppLockLocalService;->cleanupTrackedCallNotificationLocked(Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;Z)V

    :cond_10
    if-ne p1, v6, :cond_11

    move v10, v2

    :goto_8
    invoke-virtual {v1}, Landroid/util/ArraySet;->size()I

    move-result v11

    if-ge v10, v11, :cond_11

    invoke-virtual {v1, v10}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/ComponentName;

    iget-object v12, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v12, v12, Lcom/android/server/am/AppLockLocalService;->mAnsweredIncomingCalls:Landroid/util/SparseArray;

    invoke-static {v12, v5, v0, v11}, Lcom/android/server/am/AppLockLocalService;->addCallComponentLocked(Landroid/util/SparseArray;ILjava/lang/String;Landroid/content/ComponentName;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_8

    :cond_11
    if-eqz v9, :cond_12

    iget-boolean v9, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mIsAccepted:Z

    if-nez v9, :cond_13

    :cond_12
    if-ne p1, v6, :cond_14

    :cond_13
    move v2, v3

    :cond_14
    iget-object v3, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v3, v3, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    new-instance v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    iput-object v4, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mKey:Ljava/lang/String;

    iput v5, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mUserId:I

    iput-object v0, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mPackageName:Ljava/lang/String;

    iput p1, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mCallType:I

    iput-object v1, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mComponents:Landroid/util/ArraySet;

    iput-object v7, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mTokens:Landroid/util/ArraySet;

    iput-boolean v2, v9, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mIsAccepted:Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v3, v4, v9}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-ne p1, v6, :cond_15

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, v5, v0}, Lcom/android/server/am/AppLockLocalService;->pruneRecentlyRemovedCallsForPackageLocked(ILjava/lang/String;)V

    :cond_15
    monitor-exit v8

    return-void

    :goto_9
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_16
    :goto_a
    iget-object p1, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object p1, p1, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_1
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v0, v0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v0, v4}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    if-eqz v0, :cond_17

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, v0, v3}, Lcom/android/server/am/AppLockLocalService;->cleanupTrackedCallNotificationLocked(Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;Z)V

    goto :goto_b

    :catchall_1
    move-exception p0

    goto :goto_c

    :cond_17
    :goto_b
    monitor-exit p1

    return-void

    :goto_c
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p0

    :cond_18
    :goto_d
    iget-object p1, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object p1, p1, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_2
    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v0, v0, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v0, v4}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    if-eqz v0, :cond_19

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    invoke-virtual {p0, v0, v3}, Lcom/android/server/am/AppLockLocalService;->cleanupTrackedCallNotificationLocked(Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;Z)V

    goto :goto_e

    :catchall_2
    move-exception p0

    goto :goto_f

    :cond_19
    :goto_e
    monitor-exit p1

    return-void

    :goto_f
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw p0
.end method

.method public final onNotificationRemoved(Landroid/service/notification/StatusBarNotification;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getKey()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v0, v0, Lcom/android/server/am/AppLockLocalService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget-object v1, v1, Lcom/android/server/am/AppLockLocalService;->mTrackedCallNotifications:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;

    if-eqz p1, :cond_2

    iget-object p0, p0, Lcom/android/server/am/AppLockLocalService$NotificationListener;->this$0:Lcom/android/server/am/AppLockLocalService;

    iget v1, p1, Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;->mCallType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/android/server/am/AppLockLocalService;->cleanupTrackedCallNotificationLocked(Lcom/android/server/am/AppLockLocalService$TrackedCallNotification;Z)V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_2
    :goto_1
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
