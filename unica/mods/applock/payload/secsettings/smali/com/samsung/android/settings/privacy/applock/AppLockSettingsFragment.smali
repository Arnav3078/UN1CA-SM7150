.class public Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"

# interfaces
.implements Landroid/view/MenuItem$OnActionExpandListener;


# static fields
.field public static final STATUS_LOGGING_PROVIDER:Lcom/samsung/android/settings/logging/status/StatusLogger$StatusLoggingProvider;


# instance fields
.field public final mAppDataMap:Ljava/util/Map;

.field public mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

.field public mBottomSpaceView:Landroid/view/View;

.field public mCancellationSignal:Landroid/os/CancellationSignal;

.field public mContext:Landroid/content/Context;

.field public mDescriptionView:Landroid/view/View;

.field public mEmptyView:Landroid/widget/TextView;

.field public mFirstHeaderData:Landroidx/picker/model/appdata/GroupAppData;

.field public mGalleryConfirmDialog:Landroidx/appcompat/app/AlertDialog;

.field public mIsAuthed:Z

.field public mLastSpacingInsets:Landroidx/core/graphics/Insets;

.field public mLayoutNoLimitsCleared:Z

.field public mLoadingViewController:Lcom/android/settings/widget/LoadingViewController;

.field public final mOnBackPressedCallback:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;

.field public mOverlapChecker:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

.field public final mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

.field public mPackageMonitorRegistered:Z

.field public mPendingSearchExpanded:Z

.field public mPendingSearchQuery:Ljava/lang/String;

.field public mScreenLockDialog:Landroidx/appcompat/app/AlertDialog;

.field public mScreenLockDialogShown:Z

.field public mSearchExpanded:Z

.field public mSearchMenuItem:Landroid/view/MenuItem;

.field public mSearchView:Landroidx/appcompat/widget/SearchView;

.field public mSecondHeaderData:Landroidx/picker/model/appdata/GroupAppData;

.field public mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

.field public final mWindowFocusListener:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$7;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->STATUS_LOGGING_PROVIDER:Lcom/samsung/android/settings/logging/status/StatusLogger$StatusLoggingProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mWindowFocusListener:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$1;

    invoke-direct {v0, p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$1;-><init>(Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;)V

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;

    invoke-direct {v0, p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;-><init>(Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;)V

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOnBackPressedCallback:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;

    return-void
.end method


# virtual methods
.method public final applyAppLockChange(ILjava/lang/String;Z)V
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/picker/model/AppInfoData;

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, p2, p3, p1}, Landroid/content/pm/PackageManager;->setPackageAppLockEnabledAsUser(Ljava/lang/String;ZI)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v2, "AppLockUtils"

    const-string v4, "Failed to set app lock for "

    invoke-static {v4, p2, v2, p1}, Lcom/android/settings/appfunctions/DeviceStateProviderAggregator$aggregate$executorResults$1$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    move p1, v3

    :goto_0
    if-eqz p1, :cond_3

    if-eqz v1, :cond_1

    invoke-interface {v1, p3}, Landroidx/picker/model/AppInfoData;->setSelected(Z)V

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {p1, v1}, Landroidx/picker/widget/SeslAppPickerView;->updateItem(Landroidx/picker/model/AppInfoData;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v0, "PackageName"

    invoke-virtual {p1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_0

    const-string p2, "ALKST101"

    goto :goto_1

    :cond_0
    const-string p2, "ALKST102"

    :goto_1
    const-string p3, "ALKSET"

    invoke-static {p3, p2, v3, p1}, Lcom/samsung/android/settings/logging/SALogging;->insertSALog(Ljava/lang/String;Ljava/lang/String;ILjava/util/Map;)V

    :cond_1
    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    new-instance p2, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;

    invoke-direct {p2, v3}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;-><init>(B)V

    iput-object p0, p2, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda11;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    :cond_2
    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iget-object p1, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mAppList:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p1}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_4

    invoke-virtual {p0, p1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->onAppListLoaded(Ljava/util/List;)V

    goto :goto_2

    :cond_3
    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    const v1, 0x7f152be1

    invoke-static {p1, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "applyAppLockChange: pkg="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " failed="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AppLockSettingsFragment"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/picker/model/AppInfoData;

    if-eqz p1, :cond_4

    xor-int/lit8 p2, p3, 0x1

    invoke-interface {p1, p2}, Landroidx/picker/model/AppInfoData;->setSelected(Z)V

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {p0, p1}, Landroidx/picker/widget/SeslAppPickerView;->updateItem(Landroidx/picker/model/AppInfoData;)V

    :cond_4
    :goto_2
    return-void
.end method

.method public final applyBottomSpace$1(Landroidx/core/graphics/Insets;)V
    .locals 2

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLastSpacingInsets:Landroidx/core/graphics/Insets;

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mBottomSpaceView:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070fdc

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    if-eqz p1, :cond_1

    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    add-int/2addr v0, p1

    :cond_1
    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f070e30

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    add-int/2addr v0, p1

    :cond_2
    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mBottomSpaceView:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    return-void
.end method

.method public final applyListSpacing(Landroidx/core/graphics/Insets;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->applyListSpacing(Landroidx/core/graphics/Insets;)V

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/settings/Utils;->getListHorizontalPadding(Landroid/content/Context;Landroidx/core/graphics/Insets;)I

    move-result v0

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v0, v2}, Landroid/view/ViewGroup;->setPadding(IIII)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->applyBottomSpace$1(Landroidx/core/graphics/Insets;)V

    return-void
.end method

.method public final buildAppData(Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;Z)Landroidx/picker/model/AppInfoData;
    .locals 4

    new-instance v0, Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;

    iget-object v1, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->packageName:Ljava/lang/String;

    iget v2, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->uid:I

    sget-object v3, Landroidx/picker/model/AppInfo;->Companion:Landroidx/picker/model/AppInfo$Companion;

    const-string v3, ""

    invoke-static {v2, v1, v3}, Landroidx/picker/model/AppInfo$Companion;->obtain(ILjava/lang/String;Ljava/lang/String;)Landroidx/picker/model/AppInfo;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;-><init>(Landroidx/picker/model/AppInfo;)V

    iget-object v1, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;->setIcon(Landroid/graphics/drawable/Drawable;)Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;->setLabel(Ljava/lang/String;)Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;->setSelected(Z)Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/picker/model/AppData$ListSwitchAppDataBuilder;->build()Landroidx/picker/model/AppInfoData;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p1, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->packageName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Landroid/os/UserHandle;->getUserId(I)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method public final collapseSearch()V
    .locals 6

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOnBackPressedCallback:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;

    invoke-virtual {v1, v0}, Landroidx/activity/OnBackPressedCallback;->setEnabled(Z)V

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mDescriptionView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroidx/picker/widget/SeslAppPickerView;->addHeader(Landroid/view/View;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const v2, 0x7f0b0745

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/samsung/android/settings/widget/SecFloatingBottomLayout;

    if-eqz v2, :cond_2

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchMenuItem:Landroid/view/MenuItem;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLastSpacingInsets:Landroidx/core/graphics/Insets;

    invoke-virtual {p0, v3}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->applyBottomSpace$1(Landroidx/core/graphics/Insets;)V

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v4, Landroidx/core/view/SoftwareKeyboardControllerCompat;

    invoke-direct {v4, v3}, Landroidx/core/view/SoftwareKeyboardControllerCompat;-><init>(Landroid/view/View;)V

    new-instance v3, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;

    invoke-virtual {v1}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v5

    invoke-direct {v3, v5, v4}, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;-><init>(Landroid/view/WindowInsetsController;Landroidx/core/view/SoftwareKeyboardControllerCompat;)V

    iput-object v1, v3, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mWindow:Landroid/view/Window;

    const/16 v1, 0x8

    and-int v4, v1, v1

    if-eqz v4, :cond_1

    iget-object v4, v3, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mSoftwareKeyboardControllerCompat:Landroidx/core/view/SoftwareKeyboardControllerCompat;

    invoke-virtual {v4}, Landroidx/core/view/SoftwareKeyboardControllerCompat;->hide()V

    :cond_1
    iget-object v3, v3, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mInsetsController:Landroid/view/WindowInsetsController;

    and-int/lit8 v4, v1, -0x9

    invoke-interface {v3, v4}, Landroid/view/WindowInsetsController;->hide(I)V

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchMenuItem:Landroid/view/MenuItem;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOverlapChecker:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    if-eqz v0, :cond_2

    iget-object v1, v0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->scrollListener:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    iput-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOverlapChecker:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    :cond_2
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iget-object v0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mAppList:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_3

    invoke-virtual {p0, v0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->onAppListLoaded(Ljava/util/List;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public final expandSearch(Landroid/view/MenuItem;)V
    .locals 5

    const-string v0, "ALKSET"

    const-string v1, "ALKST103"

    invoke-static {v0, v1}, Lcom/samsung/android/settings/logging/SALogging;->insertSALog(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOnBackPressedCallback:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;

    invoke-virtual {v1, v0}, Landroidx/activity/OnBackPressedCallback;->setEnabled(Z)V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_4

    const v1, 0x7f0b0745

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/samsung/android/settings/widget/SecFloatingBottomLayout;

    if-eqz v1, :cond_4

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, v1, :cond_1

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_0

    :cond_1
    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {v2}, Landroidx/picker/widget/SeslAppPickerView;->clearHeaders()V

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    iget-object v2, v2, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {v2}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setSearchFilter$4(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLastSpacingInsets:Landroidx/core/graphics/Insets;

    invoke-virtual {p0, v2}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->applyBottomSpace$1(Landroidx/core/graphics/Insets;)V

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const v3, 0x7f0b1172

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-boolean v0, v1, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->showBackgroundAtFirst:Z

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getPaddingStart()I

    move-result v3

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getPaddingEnd()I

    move-result v4

    invoke-virtual {v1, v3, v0, v4, v0}, Landroid/widget/FrameLayout;->setPaddingRelative(IIII)V

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->setFloatingAware(Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout$FloatingGroupAware;)V

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->addBlurInvalidateTargetViews(Ljava/util/List;)V

    invoke-virtual {v1, v0, v0}, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->showFloatingItemBackground(ZZ)V

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const v3, 0x7f0b1174

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLastSpacingInsets:Landroidx/core/graphics/Insets;

    invoke-virtual {p0, v1, v3}, Lcom/android/settings/SettingsPreferenceFragment;->applyListSpacing(Landroid/view/View;Landroidx/core/graphics/Insets;)V

    :cond_2
    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const v3, 0x7f0b1175

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    new-instance v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p1, v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object v1, v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    :cond_3
    new-instance p1, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    new-instance v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object p0, v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    iput-object v2, v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;->f$1:Landroid/view/ViewGroup;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p1, v2, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;->this$0:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v2, p1, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->scrollListener:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;

    iput-object v0, p1, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->bottomNavContainer:Landroid/view/View;

    iput-object v1, p1, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v3, p1, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->onOverlapChanged:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda1;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOverlapChecker:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    :cond_4
    :goto_0
    return-void
.end method

.method public final getMetricsCategory()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final getMetricsTag()Ljava/lang/String;
    .locals 0

    const-string p0, "ALKSET"

    return-object p0
.end method

.method public final onActivityCreated(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    const v0, 0x7f0b0745

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v1, 0x7f0b125d

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingToolbarLayout;

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {p1, v1}, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->setRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingBottomLayout;

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {p1, v1}, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->setRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_1
    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPendingSearchExpanded:Z

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->expandSearch(Landroid/view/MenuItem;)V

    return-void

    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_5

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/samsung/android/settings/widget/SecFloatingBottomLayout;

    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p1, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    :cond_5
    :goto_0
    return-void
.end method

.method public final onAppListLoaded(Ljava/util/List;)V
    .locals 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v1}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/text/Collator;->setStrength(I)V

    new-instance v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda9;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v1, v3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda9;->f$0:Ljava/text/Collator;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    iput-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mFirstHeaderData:Landroidx/picker/model/appdata/GroupAppData;

    iput-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSecondHeaderData:Landroidx/picker/model/appdata/GroupAppData;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    if-ge v8, v6, :cond_2

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v9, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->packageName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v11, v9, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->uid:I

    invoke-static {v11}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast v11, Ljava/util/HashMap;

    invoke-virtual {v11, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/picker/model/AppInfoData;

    if-eqz v10, :cond_0

    invoke-interface {v10}, Landroidx/picker/model/AppInfoData;->getSelected()Z

    move-result v10

    goto :goto_1

    :cond_0
    iget-boolean v10, v9, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;->locked:Z

    :goto_1
    if-eqz v10, :cond_1

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppDataMap:Ljava/util/Map;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v8, v7

    :goto_2
    if-ge v8, v6, :cond_3

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;

    invoke-virtual {p0, v9, v2}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->buildAppData(Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;Z)Landroidx/picker/model/AppInfoData;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v6, v7

    :goto_3
    if-ge v6, v4, :cond_4

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    check-cast v8, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;

    invoke-virtual {p0, v8, v7}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->buildAppData(Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$AppItem;Z)Landroidx/picker/model/AppInfoData;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_4
    new-instance v4, Landroidx/picker/model/AppData$GroupAppDataBuilder;

    const-string/jumbo v5, "app_lock_header_first"

    invoke-direct {v4, v5}, Landroidx/picker/model/AppData$GroupAppDataBuilder;-><init>(Ljava/lang/String;)V

    const v5, 0x7f152be7

    invoke-virtual {p0, v5}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Landroidx/picker/model/AppData$GroupAppDataBuilder;->label:Ljava/lang/String;

    iput-object v0, v4, Landroidx/picker/model/AppData$GroupAppDataBuilder;->mAppInfoDataList:Ljava/util/List;

    invoke-virtual {v4}, Landroidx/picker/model/AppData$GroupAppDataBuilder;->build()Landroidx/picker/model/appdata/GroupAppData;

    move-result-object v4

    iput-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mFirstHeaderData:Landroidx/picker/model/appdata/GroupAppData;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mFirstHeaderData:Landroidx/picker/model/appdata/GroupAppData;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    new-instance v0, Landroidx/picker/model/AppData$GroupAppDataBuilder;

    const-string/jumbo v4, "app_lock_header_second"

    invoke-direct {v0, v4}, Landroidx/picker/model/AppData$GroupAppDataBuilder;-><init>(Ljava/lang/String;)V

    const v4, 0x7f152be6

    invoke-virtual {p0, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Landroidx/picker/model/AppData$GroupAppDataBuilder;->label:Ljava/lang/String;

    iput-object v2, v0, Landroidx/picker/model/AppData$GroupAppDataBuilder;->mAppInfoDataList:Ljava/util/List;

    invoke-virtual {v0}, Landroidx/picker/model/AppData$GroupAppDataBuilder;->build()Landroidx/picker/model/appdata/GroupAppData;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSecondHeaderData:Landroidx/picker/model/appdata/GroupAppData;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {v0, v1}, Landroidx/picker/widget/SeslAppPickerView;->submitList(Ljava/util/List;)V

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLoadingViewController:Lcom/android/settings/widget/LoadingViewController;

    if-eqz p1, :cond_6

    invoke-virtual {v0}, Lcom/android/settings/widget/LoadingViewController;->showEmpty()V

    goto :goto_4

    :cond_6
    invoke-virtual {v0, v7}, Lcom/android/settings/widget/LoadingViewController;->showContent(Z)V

    :goto_4
    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    if-eqz p1, :cond_7

    iget-object p1, p1, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v3

    :cond_7
    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz p1, :cond_9

    if-eqz v3, :cond_8

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_5

    :cond_8
    const-string p1, ""

    :goto_5
    invoke-virtual {p0, p1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setSearchFilter$4(Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onAttach(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroidx/activity/ComponentActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object p1

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOnBackPressedCallback:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;

    invoke-virtual {p1, p0}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/activity/OnBackPressedCallback;)V

    :cond_0
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 6

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/settings/privacy/applock/AppLockPreferenceController;->getAvailabilityStatus(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getUserId()I

    move-result v1

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "app_lock_settings_discovered"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4, v1}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    const/4 v5, -0x1

    if-ne v2, v5, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, v3, v5, v1}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    :goto_0
    invoke-virtual {p0, v4}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setLayoutNoLimits(Z)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    new-instance v1, Landroidx/lifecycle/ViewModelProvider;

    invoke-direct {v1, p0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v2, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    sget-object v0, Lkotlin/jvm/internal/Reflection;->factory:Lkotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, v2}, Lkotlin/jvm/internal/ReflectionFactory;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/lifecycle/ViewModelProvider;->get(Lkotlin/reflect/KClass;)Landroidx/lifecycle/ViewModel;

    move-result-object v1

    const/4 v0, 0x0

    check-cast v1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iput-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    if-eqz p1, :cond_1

    const-string/jumbo v0, "app_lock_is_authed"

    invoke-virtual {p1, v0, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mIsAuthed:Z

    const-string/jumbo v0, "app_lock_search_expanded"

    invoke-virtual {p1, v0, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPendingSearchExpanded:Z

    const-string/jumbo v0, "app_lock_search_query"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPendingSearchQuery:Ljava/lang/String;

    return-void

    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_3

    const-string/jumbo v1, "app_lock_pre_authed"

    invoke-virtual {p1, v1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mIsAuthed:Z

    return-void

    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_3
    return-void
.end method

.method public final onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const v0, 0x7f100019

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const p2, 0x7f0b0ca0

    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchMenuItem:Landroid/view/MenuItem;

    if-eqz p1, :cond_2

    const/16 p2, 0xa

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchMenuItem:Landroid/view/MenuItem;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchMenuItem:Landroid/view/MenuItem;

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPendingSearchExpanded:Z

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPendingSearchExpanded:Z

    iget-object p2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPendingSearchQuery:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPendingSearchQuery:Ljava/lang/String;

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->expandActionView()Z

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p0, p2, p1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9

    const v0, 0x7f0e07f5

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060ab1

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    const v4, 0x7f0b0164

    invoke-virtual {v0, v4}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/picker/widget/SeslAppPickerListView;

    iput-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {v4, v1}, Landroidx/picker/widget/SeslAppPickerView;->setAppListOrder(I)V

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView;->seslSetGoToTopEnabled(Z)V

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView;->seslSetFadingEdgeEnabled(Z)V

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    invoke-virtual {v4, v3}, Landroidx/recyclerview/widget/RecyclerView;->seslSetFadingEdgeColor(I)V

    new-instance v4, Landroid/view/View;

    iget-object v7, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-direct {v4, v7}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mBottomSpaceView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mBottomSpaceView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroidx/picker/widget/SeslAppPickerView;->addFooter(Landroid/view/View;)V

    const v3, 0x7f0e07f6

    invoke-virtual {p1, v3, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mDescriptionView:Landroid/view/View;

    const v4, 0x7f0b0568

    invoke-virtual {v3, v4}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v7, 0x7f152bef

    invoke-virtual {p0, v7}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\n\n"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v7, 0x7f152bf0

    invoke-virtual {p0, v7}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mDescriptionView:Landroid/view/View;

    const v4, 0x7f0b056b

    invoke-virtual {v3, v4}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "\u2022 "

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v7, 0x7f152bee

    invoke-virtual {p0, v7}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\n\u2022 "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v7, 0x7f152bed

    invoke-virtual {p0, v7}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mDescriptionView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroidx/picker/widget/SeslAppPickerView;->addHeader(Landroid/view/View;)V

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    new-instance v4, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$3;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object p0, v4, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$3;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v4, v3, Landroidx/picker/widget/SeslAppPickerView;->mOnStateChangeListener:Landroidx/picker/widget/AppPickerState$OnStateChangeListener;

    invoke-super {p0, p1, p2, p3}, Lcom/android/settings/SettingsPreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p2

    const p3, 0x7f0b105f

    invoke-virtual {p2, p3}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object p3

    const/4 v3, 0x2

    invoke-virtual {p3, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    const p3, 0x102003f

    invoke-virtual {p2, p3}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p3

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mWindowFocusListener:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;

    invoke-virtual {p3, v2}, Landroid/view/ViewTreeObserver;->addOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    const p3, 0x7f0b0c1a

    invoke-virtual {p2, p3}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object p3

    const v2, 0x1020004

    invoke-virtual {p2, v2}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mEmptyView:Landroid/widget/TextView;

    const v3, 0x7f152be8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    new-instance v2, Lcom/android/settings/widget/LoadingViewController;

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mEmptyView:Landroid/widget/TextView;

    invoke-direct {v2, p3, v0, v3}, Lcom/android/settings/widget/LoadingViewController;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    iput-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLoadingViewController:Lcom/android/settings/widget/LoadingViewController;

    invoke-virtual {p0, p3}, Lcom/android/settings/SettingsPreferenceFragment;->adjustViewHeightWithAppBar(Landroid/view/View;)V

    iget-object p3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {p0, p3}, Lcom/android/settings/SettingsPreferenceFragment;->adjustViewHeightWithAppBar(Landroid/view/View;)V

    iget-object p3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingStart()I

    move-result v0

    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingEnd()I

    move-result v3

    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v4

    new-instance v7, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda3;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput v0, v7, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda3;->f$0:I

    iput v2, v7, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda3;->f$1:I

    iput v3, v7, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda3;->f$2:I

    iput v4, v7, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda3;->f$3:I

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    invoke-static {p3, v7}, Landroidx/core/view/ViewCompat$Api21Impl;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    invoke-static {p3}, Landroidx/core/view/ViewCompat$Api20Impl;->requestApplyInsets(Landroid/view/View;)V

    const p3, 0x7f0e07fb

    invoke-virtual {p1, p3, v5, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SearchView;

    iput-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1}, Landroidx/appcompat/widget/SearchView;->onSearchClicked()V

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance p3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$3;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    iput-object p0, p3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$3;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object p3, p1, Landroidx/appcompat/widget/SearchView;->mOnQueryChangeListener:Landroidx/appcompat/widget/SearchView$OnQueryTextListener;

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const p3, 0x7f0b116b

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_4

    goto :goto_4

    :cond_4
    new-instance p3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda7;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    iput-object p0, p3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda7;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_4
    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    new-instance p3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$5;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    iput-object p0, p3, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$5;->this$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    return-object p2
.end method

.method public final onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroy()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setLayoutNoLimits(Z)V

    :cond_0
    return-void
.end method

.method public final onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroyView()V

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOverlapChecker:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->scrollListener:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    :cond_0
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mGalleryConfirmDialog:Landroidx/appcompat/app/AlertDialog;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDialog;->dismiss()V

    iput-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mGalleryConfirmDialog:Landroidx/appcompat/app/AlertDialog;

    :cond_1
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mScreenLockDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_2

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mScreenLockDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDialog;->dismiss()V

    iput-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mScreenLockDialog:Landroidx/appcompat/app/AlertDialog;

    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mWindowFocusListener:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda6;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    :cond_3
    return-void
.end method

.method public final onDetach()V
    .locals 1

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mOnBackPressedCallback:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$2;

    invoke-virtual {v0}, Landroidx/activity/OnBackPressedCallback;->remove()V

    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDetach()V

    return-void
.end method

.method public final onMenuItemActionCollapse(Landroid/view/MenuItem;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final onMenuItemActionExpand(Landroid/view/MenuItem;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->expandSearch(Landroid/view/MenuItem;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final onPause()V
    .locals 1

    invoke-super {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onPause()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mIsAuthed:Z

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mScreenLockDialogShown:Z

    invoke-virtual {p0, v0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setContentVisible$2(Z)V

    :cond_0
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mGalleryConfirmDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mGalleryConfirmDialog:Landroidx/appcompat/app/AlertDialog;

    :cond_1
    return-void
.end method

.method public final onResume()V
    .locals 3

    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->updateAuthState$1()V

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iget-object v0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mAppList:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLoadingViewController:Lcom/android/settings/widget/LoadingViewController;

    invoke-virtual {v0, v1, v1, v1}, Lcom/android/settings/widget/LoadingViewController;->handleLoadingContainer(ZZZ)V

    :cond_0
    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mLoading:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Landroidx/lifecycle/AndroidViewModel;->application:Landroid/app/Application;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Landroid/util/IconDrawableFactory;->newInstance(Landroid/content/Context;)Landroid/util/IconDrawableFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iput-object v0, v2, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel$$ExternalSyntheticLambda0;->f$1:Landroid/util/IconDrawableFactory;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mIsAuthed:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string/jumbo v0, "app_lock_is_authed"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    iget-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz v0, :cond_2

    const-string/jumbo v0, "app_lock_search_expanded"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    if-eqz p0, :cond_1

    iget-object p0, p0, Landroidx/appcompat/widget/SearchView;->mSearchSrcTextView:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "app_lock_search_query"

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public final onStart()V
    .locals 5

    invoke-super {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onStart()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRecentsScreenshotEnabled(Z)V

    :cond_0
    iget-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPackageMonitorRegistered:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v4

    invoke-static {v4}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/android/internal/content/PackageMonitor;->register(Landroid/content/Context;Landroid/os/Looper;Landroid/os/UserHandle;Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPackageMonitorRegistered:Z

    :cond_1
    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->updateAuthState$1()V

    return-void
.end method

.method public final onStop()V
    .locals 1

    invoke-super {p0}, Lcom/android/settings/core/ObservablePreferenceFragment;->onStop()V

    iget-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPackageMonitorRegistered:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPackageMonitor:Lcom/android/internal/content/PackageMonitor;

    invoke-virtual {v0}, Lcom/android/internal/content/PackageMonitor;->unregister()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mPackageMonitorRegistered:Z

    :cond_0
    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mCancellationSignal:Landroid/os/CancellationSignal;

    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setRecentsScreenshotEnabled(Z)V

    :cond_2
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/android/settings/SettingsPreferenceFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mViewModel:Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;

    iget-object p1, p1, Lcom/samsung/android/settings/privacy/applock/AppLockViewModel;->mAppList:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object p2

    new-instance v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda5;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, p2, v0}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    return-void
.end method

.method public final setContentVisible$2(Z)V
    .locals 5

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_1
    iget-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchExpanded:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v3, 0x7f0b0745

    invoke-virtual {v0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/samsung/android/settings/widget/SecFloatingBottomLayout;

    if-eqz v0, :cond_3

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x4

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :cond_3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    if-nez v2, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v3, Landroidx/core/view/SoftwareKeyboardControllerCompat;

    invoke-direct {v3, v2}, Landroidx/core/view/SoftwareKeyboardControllerCompat;-><init>(Landroid/view/View;)V

    new-instance v2, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;

    invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v4

    invoke-direct {v2, v4, v3}, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;-><init>(Landroid/view/WindowInsetsController;Landroidx/core/view/SoftwareKeyboardControllerCompat;)V

    iput-object v0, v2, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mWindow:Landroid/view/Window;

    iget-object v0, v2, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mSoftwareKeyboardControllerCompat:Landroidx/core/view/SoftwareKeyboardControllerCompat;

    if-eqz p1, :cond_7

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSearchView:Landroidx/appcompat/widget/SearchView;

    const p1, 0x7f0b1175

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/EditText;

    if-eqz p0, :cond_5

    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    :cond_5
    and-int p0, v1, v1

    if-eqz p0, :cond_6

    invoke-virtual {v0}, Landroidx/core/view/SoftwareKeyboardControllerCompat;->show()V

    :cond_6
    iget-object p0, v2, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mInsetsController:Landroid/view/WindowInsetsController;

    and-int/lit8 p1, v1, -0x9

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->show(I)V

    return-void

    :cond_7
    and-int p0, v1, v1

    if-eqz p0, :cond_8

    invoke-virtual {v0}, Landroidx/core/view/SoftwareKeyboardControllerCompat;->hide()V

    :cond_8
    iget-object p0, v2, Landroidx/core/view/WindowInsetsControllerCompat$Impl35;->mInsetsController:Landroid/view/WindowInsetsController;

    and-int/lit8 p1, v1, -0x9

    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->hide(I)V

    :cond_9
    :goto_2
    return-void
.end method

.method public final setLayoutNoLimits(Z)V
    .locals 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x200

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLayoutNoLimitsCleared:Z

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLayoutNoLimitsCleared:Z

    return-void

    :cond_2
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/2addr p1, v1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->clearFlags(I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mLayoutNoLimitsCleared:Z

    :cond_4
    :goto_0
    return-void
.end method

.method public final setSearchFilter$4(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    new-instance v1, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda8;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda8;->f$0:Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;

    iput-object p1, v1, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda8;->f$1:Ljava/lang/String;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, p1, v1}, Landroidx/picker/widget/SeslAppPickerView;->setSearchFilter(Ljava/lang/String;Landroidx/picker/widget/SeslAppPickerView$OnSearchFilterListener;)V

    return-void
.end method

.method public final updateAuthState$1()V
    .locals 6

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    const-class v1, Landroid/app/KeyguardManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    iget-boolean v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mIsAuthed:Z

    if-eqz v3, :cond_1

    invoke-virtual {p0, v2}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setContentVisible$2(Z)V

    return-void

    :cond_1
    invoke-virtual {p0, v1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->setContentVisible$2(Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Landroid/view/View;->hasWindowFocus()Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v2

    goto :goto_1

    :cond_2
    move v3, v1

    :goto_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v4

    if-eqz v4, :cond_6

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mCancellationSignal:Landroid/os/CancellationSignal;

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    if-eqz v0, :cond_4

    new-instance v0, Landroid/os/CancellationSignal;

    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mCancellationSignal:Landroid/os/CancellationSignal;

    iget-object v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$6;

    invoke-direct {v4, p0}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$6;-><init>(Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;)V

    new-instance p0, Landroid/hardware/biometrics/BiometricPrompt$Builder;

    invoke-direct {p0, v2}, Landroid/hardware/biometrics/BiometricPrompt$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f152bf4

    invoke-virtual {v2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setUseDefaultSubtitle()Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setConfirmationRequired(Z)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p0

    const v1, 0x80ff

    invoke-virtual {p0, v1}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->setAllowedAuthenticators(I)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/hardware/biometrics/BiometricPrompt$Builder;->build()Landroid/hardware/biometrics/BiometricPrompt;

    move-result-object p0

    invoke-virtual {p0, v0, v3, v4}, Landroid/hardware/biometrics/BiometricPrompt;->authenticate(Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;)V

    return-void

    :cond_4
    iget-boolean v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mScreenLockDialogShown:Z

    if-nez v0, :cond_6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_2

    :cond_5
    iput-boolean v2, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mScreenLockDialogShown:Z

    new-instance v2, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda4;

    invoke-direct {v2, v1}, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda4;-><init>(B)V

    iput-object v0, v2, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-static {v0, v2}, Lcom/samsung/android/settings/privacy/applock/AppLockAuthHelper;->showSetScreenLockDialog(Landroid/app/Activity;Ljava/lang/Runnable;)Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mScreenLockDialog:Landroidx/appcompat/app/AlertDialog;

    :cond_6
    :goto_2
    return-void
.end method

.method public final updateSearchResultHeaders()I
    .locals 7

    iget-object v0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    iget-object v0, v0, Landroidx/picker/widget/SeslAppPickerView;->mAdapter:Landroidx/picker/adapter/HeaderFooterAdapter;

    iget-object v0, v0, Landroidx/picker/adapter/HeaderFooterAdapter;->wrappedAdapter:Landroidx/picker/adapter/AbsAdapter;

    iget-object v0, v0, Landroidx/picker/adapter/AbsAdapter;->mDataSetFiltered:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :cond_0
    :goto_0
    if-ge v4, v3, :cond_2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Landroidx/picker/model/viewdata/ViewData;

    instance-of v6, v5, Landroidx/picker/model/viewdata/AppInfoViewData;

    if-eqz v6, :cond_0

    check-cast v5, Landroidx/picker/model/viewdata/AppInfoViewData;

    iget-object v6, v5, Landroidx/picker/model/viewdata/AppInfoViewData;->appInfoData:Landroidx/picker/model/AppInfoData;

    invoke-interface {v6}, Landroidx/picker/model/AppInfoData;->getSelected()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v3, Landroidx/picker/model/viewdata/GroupTitleViewData;

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mFirstHeaderData:Landroidx/picker/model/appdata/GroupAppData;

    invoke-direct {v3, v4}, Landroidx/picker/model/viewdata/GroupTitleViewData;-><init>(Landroidx/picker/model/appdata/GroupAppData;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    new-instance v3, Landroidx/picker/model/viewdata/GroupTitleViewData;

    iget-object v4, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mSecondHeaderData:Landroidx/picker/model/appdata/GroupAppData;

    invoke-direct {v3, v4}, Landroidx/picker/model/viewdata/GroupTitleViewData;-><init>(Landroidx/picker/model/appdata/GroupAppData;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_4
    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;->mAppPickerListView:Landroidx/picker/widget/SeslAppPickerListView;

    iget-object p0, p0, Landroidx/picker/widget/SeslAppPickerView;->mAdapter:Landroidx/picker/adapter/HeaderFooterAdapter;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method
