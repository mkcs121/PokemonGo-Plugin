.class public Lcom/google/android/gms/internal/zzkb;
.super Lcom/google/android/gms/common/internal/zzj;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/zzj",
        "<",
        "Lcom/google/android/gms/internal/zzkd;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 13

    const/16 v3, 0x4a

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/common/internal/zzj;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method


# virtual methods
.method protected synthetic zzW(Landroid/os/IBinder;)Landroid/os/IInterface;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzkb;->zzam(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzkd;

    move-result-object v0

    return-object v0
.end method

.method protected zzam(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzkd;
    .registers 3

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd$zza;->zzao(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzkd;

    move-result-object v0

    return-object v0
.end method

.method protected zzfK()Ljava/lang/String;
    .registers 2

    const-string v0, "com.google.android.gms.auth.api.accountstatus.START"

    return-object v0
.end method

.method protected zzfL()Ljava/lang/String;
    .registers 2

    const-string v0, "com.google.android.gms.auth.api.accountstatus.internal.IAccountStatusService"

    return-object v0
.end method
