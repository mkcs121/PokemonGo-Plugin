.class Lcom/upsight/android/analytics/internal/provider/LocationTracker$2;
.super Ljava/lang/Object;
.source "LocationTracker.java"

# interfaces
.implements Lcom/upsight/android/persistence/UpsightDataStoreListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/upsight/android/analytics/internal/provider/LocationTracker;->purge()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/upsight/android/persistence/UpsightDataStoreListener",
        "<",
        "Ljava/util/Set",
        "<",
        "Lcom/upsight/android/analytics/provider/UpsightLocationTracker$Data;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/upsight/android/analytics/internal/provider/LocationTracker;


# direct methods
.method constructor <init>(Lcom/upsight/android/analytics/internal/provider/LocationTracker;)V
    .registers 2

    .prologue
    .line 67
    iput-object p1, p0, Lcom/upsight/android/analytics/internal/provider/LocationTracker$2;->this$0:Lcom/upsight/android/analytics/internal/provider/LocationTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lcom/upsight/android/UpsightException;)V
    .registers 7
    .param p1, "exception"    # Lcom/upsight/android/UpsightException;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/upsight/android/analytics/internal/provider/LocationTracker$2;->this$0:Lcom/upsight/android/analytics/internal/provider/LocationTracker;

    # getter for: Lcom/upsight/android/analytics/internal/provider/LocationTracker;->mLogger:Lcom/upsight/android/logger/UpsightLogger;
    invoke-static {v0}, Lcom/upsight/android/analytics/internal/provider/LocationTracker;->access$200(Lcom/upsight/android/analytics/internal/provider/LocationTracker;)Lcom/upsight/android/logger/UpsightLogger;

    move-result-object v0

    const-string v1, "Upsight"

    const-string v2, "Failed to remove stale location data."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-interface {v0, v1, v2, v3}, Lcom/upsight/android/logger/UpsightLogger;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 78
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 67
    check-cast p1, Ljava/util/Set;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/upsight/android/analytics/internal/provider/LocationTracker$2;->onSuccess(Ljava/util/Set;)V

    return-void
.end method

.method public onSuccess(Ljava/util/Set;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/upsight/android/analytics/provider/UpsightLocationTracker$Data;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "result":Ljava/util/Set;, "Ljava/util/Set<Lcom/upsight/android/analytics/provider/UpsightLocationTracker$Data;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/upsight/android/analytics/provider/UpsightLocationTracker$Data;

    .line 71
    .local v0, "data":Lcom/upsight/android/analytics/provider/UpsightLocationTracker$Data;
    iget-object v2, p0, Lcom/upsight/android/analytics/internal/provider/LocationTracker$2;->this$0:Lcom/upsight/android/analytics/internal/provider/LocationTracker;

    # getter for: Lcom/upsight/android/analytics/internal/provider/LocationTracker;->mDataStore:Lcom/upsight/android/persistence/UpsightDataStore;
    invoke-static {v2}, Lcom/upsight/android/analytics/internal/provider/LocationTracker;->access$000(Lcom/upsight/android/analytics/internal/provider/LocationTracker;)Lcom/upsight/android/persistence/UpsightDataStore;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/upsight/android/persistence/UpsightDataStore;->remove(Ljava/lang/Object;)Lcom/upsight/android/persistence/UpsightSubscription;

    goto :goto_4

    .line 73
    .end local v0    # "data":Lcom/upsight/android/analytics/provider/UpsightLocationTracker$Data;
    :cond_1a
    return-void
.end method