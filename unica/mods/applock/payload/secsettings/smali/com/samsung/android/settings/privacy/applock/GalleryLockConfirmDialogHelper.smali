.class public abstract Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper;
.super Ljava/lang/Object;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# static fields
.field public static final READ_MEDIA_VISUAL_PERMISSIONS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string/jumbo v0, "android.permission.ACCESS_MEDIA_LOCATION"

    const-string/jumbo v1, "android.permission.READ_MEDIA_VISUAL_USER_SELECTED"

    const-string/jumbo v2, "android.permission.READ_MEDIA_IMAGES"

    const-string/jumbo v3, "android.permission.READ_MEDIA_VIDEO"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/settings/privacy/applock/GalleryLockConfirmDialogHelper;->READ_MEDIA_VISUAL_PERMISSIONS:[Ljava/lang/String;

    return-void
.end method
