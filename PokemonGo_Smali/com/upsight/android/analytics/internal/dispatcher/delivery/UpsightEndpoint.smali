.class Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;
.super Ljava/lang/Object;
.source "UpsightEndpoint.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint$Response;
    }
.end annotation


# static fields
.field private static final CONNECTION_CLOSE:Ljava/lang/String; = "close"

.field private static final CONNECTION_TIMEOUT_MS:I = 0x7530

.field private static final CONTENT_ENCODING_GZIP:Ljava/lang/String; = "gzip"

.field private static final CONTENT_TYPE_APPLICATION_JSON:Ljava/lang/String; = "application/json"

.field private static final EMPTY_STRING:Ljava/lang/String; = ""

.field static final HTTP_HEADER_REF_ID:Ljava/lang/String; = "X-US-Ref-Id"

.field static final HTTP_HEADER_US_DIGEST:Ljava/lang/String; = "X-US-DIGEST"

.field public static final LOG_TEXT_POSTING:Ljava/lang/String; = "POSTING:       "

.field public static final LOG_TEXT_RECEIVING:Ljava/lang/String; = "RECEIVING:     "

.field public static final LOG_TEXT_REQUEST_BODY:Ljava/lang/String; = "\nREQUEST BODY:  "

.field public static final LOG_TEXT_RESPONSE_BODY:Ljava/lang/String; = "\nRESPONSE BODY: "

.field public static final LOG_TEXT_RESPONSE_BODY_NONE:Ljava/lang/String; = "[NONE]"

.field public static final LOG_TEXT_STATUS_CODE:Ljava/lang/String; = "\nSTATUS CODE:   "

.field public static final LOG_TEXT_TO:Ljava/lang/String; = "\nTO:            "

.field private static final POST_METHOD_NAME:Ljava/lang/String; = "POST"

.field public static final SIGNED_MESSAGE_SEPARATOR:Ljava/lang/String; = ":"

.field private static final USER_AGENT_ANDROID:Ljava/lang/String;

.field private static final USE_GZIP:Z


# instance fields
.field private mEndpointAddress:Ljava/lang/String;

.field private mGson:Lcom/google/gson/Gson;

.field private mJsonParser:Lcom/google/gson/JsonParser;

.field private mLogger:Lcom/upsight/android/logger/UpsightLogger;

.field private mRequestLoggingGson:Lcom/google/gson/Gson;

.field private mSignatureVerifier:Lcom/upsight/android/analytics/internal/dispatcher/delivery/SignatureVerifier;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Android-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->USER_AGENT_ANDROID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/upsight/android/analytics/internal/dispatcher/delivery/SignatureVerifier;Lcom/google/gson/Gson;Lcom/google/gson/JsonParser;Lcom/google/gson/Gson;Lcom/upsight/android/logger/UpsightLogger;)V
    .registers 7
    .param p1, "endpointAddress"    # Ljava/lang/String;
    .param p2, "signatureVerifier"    # Lcom/upsight/android/analytics/internal/dispatcher/delivery/SignatureVerifier;
    .param p3, "gson"    # Lcom/google/gson/Gson;
    .param p4, "jsonParser"    # Lcom/google/gson/JsonParser;
    .param p5, "requestLoggingGson"    # Lcom/google/gson/Gson;
    .param p6, "logger"    # Lcom/upsight/android/logger/UpsightLogger;

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput-object p1, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mEndpointAddress:Ljava/lang/String;

    .line 165
    iput-object p2, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mSignatureVerifier:Lcom/upsight/android/analytics/internal/dispatcher/delivery/SignatureVerifier;

    .line 166
    iput-object p3, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mGson:Lcom/google/gson/Gson;

    .line 167
    iput-object p4, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mJsonParser:Lcom/google/gson/JsonParser;

    .line 168
    iput-object p5, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mRequestLoggingGson:Lcom/google/gson/Gson;

    .line 169
    iput-object p6, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mLogger:Lcom/upsight/android/logger/UpsightLogger;

    .line 170
    return-void
.end method

.method private getRequestBodyBytes(Ljava/lang/String;Z)[B
    .registers 4
    .param p1, "requestBody"    # Ljava/lang/String;
    .param p2, "useGzip"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    if-eqz p2, :cond_7

    invoke-static {p1}, Lcom/upsight/android/internal/util/GzipHelper;->compress(Ljava/lang/String;)[B

    move-result-object v0

    :goto_6
    return-object v0

    :cond_7
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    goto :goto_6
.end method

.method private getVerifiedResponse(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .registers 15
    .param p1, "urlConnection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 271
    const-string v3, ""

    .line 273
    .local v3, "respBody":Ljava/lang/String;
    const-string v9, "X-US-Ref-Id"

    invoke-virtual {p1, v9}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 274
    .local v2, "refId":Ljava/lang/String;
    const-string v9, "X-US-DIGEST"

    invoke-virtual {p1, v9}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 275
    .local v4, "signature":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_54

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_54

    .line 276
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 277
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_54

    .line 278
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v8

    .line 279
    .local v8, "unverifiedRespBody":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_54

    .line 281
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 282
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ":"

    .line 283
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 284
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 285
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 286
    .local v7, "signedMessage":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    .line 290
    .local v6, "signedBytes":[B
    const/16 v9, 0x8

    :try_start_47
    invoke-static {v4, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    .line 293
    .local v5, "signatureBytes":[B
    iget-object v9, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mSignatureVerifier:Lcom/upsight/android/analytics/internal/dispatcher/delivery/SignatureVerifier;

    invoke-interface {v9, v6, v5}, Lcom/upsight/android/analytics/internal/dispatcher/delivery/SignatureVerifier;->verify([B[B)Z
    :try_end_50
    .catch Ljava/lang/IllegalArgumentException; {:try_start_47 .. :try_end_50} :catch_55

    move-result v9

    if-eqz v9, :cond_54

    .line 295
    move-object v3, v8

    .line 305
    .end local v1    # "is":Ljava/io/InputStream;
    .end local v5    # "signatureBytes":[B
    .end local v6    # "signedBytes":[B
    .end local v7    # "signedMessage":Ljava/lang/String;
    .end local v8    # "unverifiedRespBody":Ljava/lang/String;
    :cond_54
    :goto_54
    return-object v3

    .line 297
    .restart local v1    # "is":Ljava/io/InputStream;
    .restart local v6    # "signedBytes":[B
    .restart local v7    # "signedMessage":Ljava/lang/String;
    .restart local v8    # "unverifiedRespBody":Ljava/lang/String;
    :catch_55
    move-exception v0

    .line 298
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v9, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mLogger:Lcom/upsight/android/logger/UpsightLogger;

    const-string v10, "Upsight"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Message signature is not valid Base64. X-US-DIGEST: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-interface {v9, v10, v0, v11, v12}, Lcom/upsight/android/logger/UpsightLogger;->e(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_54
.end method


# virtual methods
.method public send(Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightRequest;)Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint$Response;
    .registers 16
    .param p1, "request"    # Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    .line 182
    .local v4, "refId":Ljava/lang/String;
    const/4 v9, 0x0

    .line 184
    .local v9, "urlConnection":Ljava/net/HttpURLConnection;
    :try_start_9
    iget-object v10, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mGson:Lcom/google/gson/Gson;

    invoke-virtual {v10, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 185
    .local v5, "requestBody":Ljava/lang/String;
    iget-object v10, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mRequestLoggingGson:Lcom/google/gson/Gson;

    invoke-virtual {v10, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "logRequestBody":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "POSTING:       "

    .line 189
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 190
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\nTO:            "

    .line 191
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mEndpointAddress:Ljava/lang/String;

    .line 192
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\nREQUEST BODY:  "

    .line 193
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 194
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 195
    .local v7, "sb":Ljava/lang/StringBuilder;
    iget-object v10, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mLogger:Lcom/upsight/android/logger/UpsightLogger;

    const-string v11, "Upsight"

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Object;

    invoke-interface {v10, v11, v12, v13}, Lcom/upsight/android/logger/UpsightLogger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 197
    const/4 v10, 0x0

    invoke-direct {p0, v5, v10}, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->getRequestBodyBytes(Ljava/lang/String;Z)[B

    move-result-object v1

    .line 199
    .local v1, "body":[B
    new-instance v10, Ljava/net/URL;

    iget-object v11, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mEndpointAddress:Ljava/lang/String;

    invoke-direct {v10, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v9, v0

    .line 201
    const-string v10, "POST"

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 203
    const-string v10, "X-US-Ref-Id"

    invoke-virtual {v9, v10, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const-string v10, "Content-Type"

    const-string v11, "application/json"

    invoke-virtual {v9, v10, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    const-string v10, "User-Agent"

    sget-object v11, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->USER_AGENT_ANDROID:Ljava/lang/String;

    invoke-virtual {v9, v10, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    const-string v10, "Connection"

    const-string v11, "close"

    invoke-virtual {v9, v10, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    const/16 v10, 0x7530

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 212
    const/16 v10, 0x7530

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 214
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 215
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 216
    array-length v10, v1

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 218
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    invoke-static {v1, v10}, Lorg/apache/commons/io/IOUtils;->write([BLjava/io/OutputStream;)V

    .line 220
    const/4 v6, 0x0

    .line 221
    .local v6, "respBody":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8

    .line 223
    .local v8, "statusCode":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "RECEIVING:     "

    .line 224
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 225
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\nSTATUS CODE:   "

    .line 226
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 227
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 229
    const/16 v10, 0xc8

    if-ne v8, v10, :cond_cf

    .line 230
    invoke-direct {p0, v9}, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->getVerifiedResponse(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v6

    .line 233
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_e8

    const-string v3, "[NONE]"

    .line 236
    .local v3, "logRespBody":Ljava/lang/String;
    :goto_c6
    const-string v10, "\nRESPONSE BODY: "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 237
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .end local v3    # "logRespBody":Ljava/lang/String;
    :cond_cf
    iget-object v10, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mLogger:Lcom/upsight/android/logger/UpsightLogger;

    const-string v11, "Upsight"

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Object;

    invoke-interface {v10, v11, v12, v13}, Lcom/upsight/android/logger/UpsightLogger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 242
    new-instance v10, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint$Response;

    invoke-direct {v10, v8, v6}, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint$Response;-><init>(ILjava/lang/String;)V
    :try_end_e2
    .catchall {:try_start_9 .. :try_end_e2} :catchall_f5

    .line 244
    if-eqz v9, :cond_e7

    .line 245
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_e7
    return-object v10

    .line 233
    :cond_e8
    :try_start_e8
    iget-object v10, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mRequestLoggingGson:Lcom/google/gson/Gson;

    iget-object v11, p0, Lcom/upsight/android/analytics/internal/dispatcher/delivery/UpsightEndpoint;->mJsonParser:Lcom/google/gson/JsonParser;

    .line 235
    invoke-virtual {v11, v6}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/google/gson/Gson;->toJson(Lcom/google/gson/JsonElement;)Ljava/lang/String;
    :try_end_f3
    .catchall {:try_start_e8 .. :try_end_f3} :catchall_f5

    move-result-object v3

    goto :goto_c6

    .line 244
    .end local v1    # "body":[B
    .end local v2    # "logRequestBody":Ljava/lang/String;
    .end local v5    # "requestBody":Ljava/lang/String;
    .end local v6    # "respBody":Ljava/lang/String;
    .end local v7    # "sb":Ljava/lang/StringBuilder;
    .end local v8    # "statusCode":I
    :catchall_f5
    move-exception v10

    if-eqz v9, :cond_fb

    .line 245
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_fb
    throw v10
.end method
