.class public final Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;
.super Ljava/lang/Object;
.source "UxmModule_ProvideUxmSchemaRawStringFactory.java"

# interfaces
.implements Ldagger/internal/Factory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ldagger/internal/Factory",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final module:Lcom/upsight/android/managedvariables/internal/type/UxmModule;

.field private final upsightProvider:Ljavax/inject/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/UpsightContext;",
            ">;"
        }
    .end annotation
.end field

.field private final uxmSchemaResProvider:Ljavax/inject/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/inject/Provider",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const-class v0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/upsight/android/managedvariables/internal/type/UxmModule;Ljavax/inject/Provider;Ljavax/inject/Provider;)V
    .registers 5
    .param p1, "module"    # Lcom/upsight/android/managedvariables/internal/type/UxmModule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/upsight/android/managedvariables/internal/type/UxmModule;",
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/UpsightContext;",
            ">;",
            "Ljavax/inject/Provider",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p2, "upsightProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Lcom/upsight/android/UpsightContext;>;"
    .local p3, "uxmSchemaResProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    sget-boolean v0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 25
    :cond_f
    iput-object p1, p0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->module:Lcom/upsight/android/managedvariables/internal/type/UxmModule;

    .line 26
    sget-boolean v0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->$assertionsDisabled:Z

    if-nez v0, :cond_1d

    if-nez p2, :cond_1d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 27
    :cond_1d
    iput-object p2, p0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->upsightProvider:Ljavax/inject/Provider;

    .line 28
    sget-boolean v0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->$assertionsDisabled:Z

    if-nez v0, :cond_2b

    if-nez p3, :cond_2b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 29
    :cond_2b
    iput-object p3, p0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->uxmSchemaResProvider:Ljavax/inject/Provider;

    .line 30
    return-void
.end method

.method public static create(Lcom/upsight/android/managedvariables/internal/type/UxmModule;Ljavax/inject/Provider;Ljavax/inject/Provider;)Ldagger/internal/Factory;
    .registers 4
    .param p0, "module"    # Lcom/upsight/android/managedvariables/internal/type/UxmModule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/upsight/android/managedvariables/internal/type/UxmModule;",
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/UpsightContext;",
            ">;",
            "Ljavax/inject/Provider",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ldagger/internal/Factory",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "upsightProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Lcom/upsight/android/UpsightContext;>;"
    .local p2, "uxmSchemaResProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Ljava/lang/Integer;>;"
    new-instance v0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;

    invoke-direct {v0, p0, p1, p2}, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;-><init>(Lcom/upsight/android/managedvariables/internal/type/UxmModule;Ljavax/inject/Provider;Ljavax/inject/Provider;)V

    return-object v0
.end method


# virtual methods
.method public bridge synthetic get()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 9
    invoke-virtual {p0}, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->get()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public get()Ljava/lang/String;
    .registers 4

    .prologue
    .line 34
    iget-object v2, p0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->module:Lcom/upsight/android/managedvariables/internal/type/UxmModule;

    iget-object v0, p0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->upsightProvider:Ljavax/inject/Provider;

    .line 35
    invoke-interface {v0}, Ljavax/inject/Provider;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/upsight/android/UpsightContext;

    iget-object v1, p0, Lcom/upsight/android/managedvariables/internal/type/UxmModule_ProvideUxmSchemaRawStringFactory;->uxmSchemaResProvider:Ljavax/inject/Provider;

    invoke-interface {v1}, Ljavax/inject/Provider;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v2, v0, v1}, Lcom/upsight/android/managedvariables/internal/type/UxmModule;->provideUxmSchemaRawString(Lcom/upsight/android/UpsightContext;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Cannot return null from a non-@Nullable @Provides method"

    .line 34
    invoke-static {v0, v1}, Ldagger/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
