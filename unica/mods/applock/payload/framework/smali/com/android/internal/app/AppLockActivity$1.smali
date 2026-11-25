.class Lcom/android/internal/app/AppLockActivity$1;
.super Ljava/lang/Object;
.source "AppLockActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/app/AppLockActivity;->showSetupScreenLockDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic blacklist this$0:Lcom/android/internal/app/AppLockActivity;

.field final synthetic blacklist val$addScreenLockButton:Landroid/widget/Button;

.field final synthetic blacklist val$cancelButton:Landroid/widget/Button;


# direct methods
.method constructor blacklist <init>(Lcom/android/internal/app/AppLockActivity;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 796
    iput-object p2, p0, Lcom/android/internal/app/AppLockActivity$1;->val$addScreenLockButton:Landroid/widget/Button;

    iput-object p3, p0, Lcom/android/internal/app/AppLockActivity$1;->val$cancelButton:Landroid/widget/Button;

    iput-object p1, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public whitelist onGlobalLayout()V
    .locals 5

    .line 799
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmInjector(Lcom/android/internal/app/AppLockActivity;)Lcom/android/internal/app/AppLockActivity$Injector;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$1;->val$addScreenLockButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Lcom/android/internal/app/AppLockActivity$Injector;->getButtonLineCount(Landroid/widget/Button;)I

    move-result v0

    .line 800
    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v1}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmInjector(Lcom/android/internal/app/AppLockActivity;)Lcom/android/internal/app/AppLockActivity$Injector;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity$1;->val$cancelButton:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Lcom/android/internal/app/AppLockActivity$Injector;->getButtonLineCount(Landroid/widget/Button;)I

    move-result v1

    if-eqz v0, :cond_2

    if-nez v1, :cond_0

    goto/16 :goto_0

    .line 807
    :cond_0
    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v2}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 808
    iget-object v2, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fputmButtonLayoutListener(Lcom/android/internal/app/AppLockActivity;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 v2, 0x1

    if-gt v0, v2, :cond_1

    if-le v1, v2, :cond_2

    .line 812
    :cond_1
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 813
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 814
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$1;->val$addScreenLockButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 815
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$1;->val$cancelButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 817
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 820
    iget-object v3, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-virtual {v3}, Lcom/android/internal/app/AppLockActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x105007a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 822
    iget-object v3, p0, Lcom/android/internal/app/AppLockActivity$1;->val$addScreenLockButton:Landroid/widget/Button;

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 824
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 827
    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$1;->val$cancelButton:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 829
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/AppLockActivity$1;->val$addScreenLockButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 830
    iget-object v0, p0, Lcom/android/internal/app/AppLockActivity$1;->this$0:Lcom/android/internal/app/AppLockActivity;

    invoke-static {v0}, Lcom/android/internal/app/AppLockActivity;->-$$Nest$fgetmButtonLayout(Lcom/android/internal/app/AppLockActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object p0, p0, Lcom/android/internal/app/AppLockActivity$1;->val$cancelButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_2
    :goto_0
    return-void
.end method
