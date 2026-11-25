.class public final Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# instance fields
.field public synthetic this$0:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;


# virtual methods
.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    if-nez p2, :cond_0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;->this$0:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->checkOverlap()V

    :cond_0
    return-void
.end method

.method public final onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker$1;->this$0:Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;

    invoke-virtual {p0}, Lcom/samsung/android/settings/privacy/applock/BottomOverlapChecker;->checkOverlap()V

    return-void
.end method
