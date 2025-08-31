///
/// Firebase Auth 에러 코드
///
enum FirebaseAuthErrorCode {
  ADMIN_ONLY_OPERATION('admin-restricted-operation', '관리자 전용 작업입니다.'),
  ARGUMENT_ERROR('argument-error', '잘못된 인자가 전달되었습니다.'),
  APP_NOT_AUTHORIZED('app-not-authorized', '앱이 인증되지 않았습니다.'),
  APP_NOT_INSTALLED('app-not-installed', '앱이 설치되어 있지 않습니다.'),
  CAPTCHA_CHECK_FAILED('captcha-check-failed', '캡차 인증에 실패했습니다.'),
  CODE_EXPIRED('code-expired', '코드가 만료되었습니다.'),
  CORDOVA_NOT_READY('cordova-not-ready', 'Cordova 환경이 준비되지 않았습니다.'),
  CORS_UNSUPPORTED('cors-unsupported', 'CORS가 지원되지 않는 환경입니다.'),
  CREDENTIAL_ALREADY_IN_USE('credential-already-in-use', '이미 사용 중인 자격 증명입니다.'),
  CREDENTIAL_MISMATCH('custom-token-mismatch', '자격 증명이 일치하지 않습니다.'),
  CREDENTIAL_TOO_OLD_LOGIN_AGAIN('requires-recent-login', '최근 로그인이 필요합니다.'),
  DEPENDENT_SDK_INIT_BEFORE_AUTH('dependent-sdk-initialized-before-auth', 'Auth보다 SDK가 먼저 초기화되었습니다.'),
  DYNAMIC_LINK_NOT_ACTIVATED('dynamic-link-not-activated', 'Dynamic Link가 활성화되지 않았습니다.'),
  EMAIL_CHANGE_NEEDS_VERIFICATION('email-change-needs-verification', '이메일 변경 시 인증이 필요합니다.'),
  EMAIL_EXISTS('email-already-in-use', '이미 가입된 이메일입니다.'),
  EMULATOR_CONFIG_FAILED('emulator-config-failed', '에뮬레이터 설정에 실패했습니다.'),
  EXPIRED_OOB_CODE('expired-action-code', '만료된 액션 코드입니다.'),
  EXPIRED_POPUP_REQUEST('cancelled-popup-request', '팝업 요청이 취소되었습니다.'),
  INTERNAL_ERROR('internal-error', '내부 오류가 발생했습니다.'),
  INVALID_API_KEY('invalid-api-key', '잘못된 API 키입니다.'),
  INVALID_APP_CREDENTIAL('invalid-app-credential', '잘못된 앱 자격 증명입니다.'),
  INVALID_APP_ID('invalid-app-id', '잘못된 앱 ID입니다.'),
  INVALID_AUTH('invalid-user-token', '잘못된 사용자 토큰입니다.'),
  INVALID_AUTH_EVENT('invalid-auth-event', '잘못된 인증 이벤트입니다.'),
  INVALID_CERT_HASH('invalid-cert-hash', '잘못된 인증서 해시입니다.'),
  INVALID_CODE('invalid-verification-code', '잘못된 인증 코드입니다.'),
  INVALID_CONTINUE_URI('invalid-continue-uri', '잘못된 continue URI입니다.'),
  INVALID_CORDOVA_CONFIGURATION('invalid-cordova-configuration', '잘못된 Cordova 설정입니다.'),
  INVALID_CUSTOM_TOKEN('invalid-custom-token', '잘못된 커스텀 토큰입니다.'),
  INVALID_DYNAMIC_LINK_DOMAIN('invalid-dynamic-link-domain', '잘못된 Dynamic Link 도메인입니다.'),
  INVALID_EMAIL('invalid-email', '잘못된 이메일 형식입니다.'),
  INVALID_EMULATOR_SCHEME('invalid-emulator-scheme', '잘못된 에뮬레이터 스킴입니다.'),
  INVALID_IDP_RESPONSE('invalid-credential', '잘못된 비밀번호이거나 존재하지 않는 이메일입니다.'),
  INVALID_MESSAGE_PAYLOAD('invalid-message-payload', '잘못된 메시지 페이로드입니다.'),
  INVALID_MFA_SESSION('invalid-multi-factor-session', '잘못된 다중 인증 세션입니다.'),
  INVALID_OAUTH_CLIENT_ID('invalid-oauth-client-id', '잘못된 OAuth 클라이언트 ID입니다.'),
  INVALID_OAUTH_PROVIDER('invalid-oauth-provider', '잘못된 OAuth 제공자입니다.'),
  INVALID_OOB_CODE('invalid-action-code', '잘못된 액션 코드입니다.'),
  INVALID_ORIGIN('unauthorized-domain', '허용되지 않은 도메인입니다.'),
  INVALID_PASSWORD('wrong-password', '잘못된 비밀번호입니다.'),
  INVALID_PERSISTENCE('invalid-persistence-type', '잘못된 지속성 유형입니다.'),
  INVALID_PHONE_NUMBER('invalid-phone-number', '잘못된 전화번호입니다.'),
  INVALID_PROVIDER_ID('invalid-provider-id', '잘못된 제공자 ID입니다.'),
  INVALID_RECIPIENT_EMAIL('invalid-recipient-email', '잘못된 수신 이메일입니다.'),
  INVALID_SENDER('invalid-sender', '잘못된 발신자입니다.'),
  INVALID_SESSION_INFO('invalid-verification-id', '잘못된 세션 정보입니다.'),
  INVALID_TENANT_ID('invalid-tenant-id', '잘못된 테넌트 ID입니다.'),
  LOGIN_BLOCKED('login-blocked', '로그인이 차단되었습니다.'),
  MFA_INFO_NOT_FOUND('multi-factor-info-not-found', '다중 인증 정보가 없습니다.'),
  MFA_REQUIRED('multi-factor-auth-required', '다중 인증이 필요합니다.'),
  MISSING_ANDROID_PACKAGE_NAME('missing-android-pkg-name', 'Android 패키지명이 없습니다.'),
  MISSING_APP_CREDENTIAL('missing-app-credential', '앱 자격 증명이 없습니다.'),
  MISSING_AUTH_DOMAIN('auth-domain-config-required', '인증 도메인 설정이 필요합니다.'),
  MISSING_CODE('missing-verification-code', '인증 코드가 없습니다.'),
  MISSING_CONTINUE_URI('missing-continue-uri', 'continue URI가 없습니다.'),
  MISSING_IFRAME_START('missing-iframe-start', 'iframe 시작이 없습니다.'),
  MISSING_IOS_BUNDLE_ID('missing-ios-bundle-id', 'iOS 번들 ID가 없습니다.'),
  MISSING_OR_INVALID_NONCE('missing-or-invalid-nonce', 'nonce가 없거나 잘못되었습니다.'),
  MISSING_MFA_INFO('missing-multi-factor-info', '다중 인증 정보가 없습니다.'),
  MISSING_MFA_SESSION('missing-multi-factor-session', '다중 인증 세션이 없습니다.'),
  MISSING_PHONE_NUMBER('missing-phone-number', '전화번호가 없습니다.'),
  MISSING_PASSWORD('missing-password', '비밀번호가 없습니다.'),
  MISSING_SESSION_INFO('missing-verification-id', '세션 정보가 없습니다.'),
  MODULE_DESTROYED('app-deleted', '앱이 삭제되었습니다.'),
  NEED_CONFIRMATION('account-exists-with-different-credential', '다른 인증 수단으로 이미 가입된 계정입니다.'),
  NETWORK_REQUEST_FAILED('network-request-failed', '네트워크 요청 실패'),
  NULL_USER('null-user', '사용자 정보가 없습니다.'),
  NO_AUTH_EVENT('no-auth-event', '인증 이벤트가 없습니다.'),
  NO_SUCH_PROVIDER('no-such-provider', '해당 제공자가 없습니다.'),
  OPERATION_NOT_ALLOWED('operation-not-allowed', '허용되지 않은 작업입니다.'),
  OPERATION_NOT_SUPPORTED('operation-not-supported-in-this-environment', '이 환경에서는 지원되지 않는 작업입니다.'),
  POPUP_BLOCKED('popup-blocked', '팝업이 차단되었습니다.'),
  POPUP_CLOSED_BY_USER('popup-closed-by-user', '팝업이 사용자에 의해 닫혔습니다.'),
  PROVIDER_ALREADY_LINKED('provider-already-linked', '이미 연결된 제공자입니다.'),
  QUOTA_EXCEEDED('quota-exceeded', '할당량이 초과되었습니다.'),
  REDIRECT_CANCELLED_BY_USER('redirect-cancelled-by-user', '리디렉션이 사용자에 의해 취소되었습니다.'),
  REDIRECT_OPERATION_PENDING('redirect-operation-pending', '리디렉션 작업이 대기 중입니다.'),
  REJECTED_CREDENTIAL('rejected-credential', '자격 증명이 거부되었습니다.'),
  SECOND_FACTOR_ALREADY_ENROLLED('second-factor-already-in-use', '이미 등록된 2차 인증입니다.'),
  SECOND_FACTOR_LIMIT_EXCEEDED('maximum-second-factor-count-exceeded', '2차 인증 등록 한도를 초과했습니다.'),
  TENANT_ID_MISMATCH('tenant-id-mismatch', '테넌트 ID가 일치하지 않습니다.'),
  TIMEOUT('timeout', '요청 시간이 초과되었습니다.'),
  TOKEN_EXPIRED('user-token-expired', '인증 토큰이 만료되었습니다.'),
  TOO_MANY_ATTEMPTS_TRY_LATER('too-many-requests', '요청이 너무 많습니다. 나중에 다시 시도하세요.'),
  UNAUTHORIZED_DOMAIN('unauthorized-continue-uri', '허용되지 않은 continue URI입니다.'),
  UNSUPPORTED_FIRST_FACTOR('unsupported-first-factor', '지원되지 않는 1차 인증입니다.'),
  UNSUPPORTED_PERSISTENCE('unsupported-persistence-type', '지원되지 않는 지속성 유형입니다.'),
  UNSUPPORTED_TENANT_OPERATION('unsupported-tenant-operation', '지원되지 않는 테넌트 작업입니다.'),
  UNVERIFIED_EMAIL('unverified-email', '이메일이 인증되지 않았습니다.'),
  USER_CANCELLED('user-cancelled', '사용자가 취소했습니다.'),
  USER_DELETED('user-not-found', '사용자를 찾을 수 없습니다.'),
  USER_DISABLED('user-disabled', '비활성화된 계정입니다.'),
  USER_MISMATCH('user-mismatch', '사용자가 일치하지 않습니다.'),
  USER_SIGNED_OUT('user-signed-out', '사용자가 로그아웃되었습니다.'),
  WEAK_PASSWORD('weak-password', '비밀번호가 너무 약합니다.'),
  WEB_STORAGE_UNSUPPORTED('web-storage-unsupported', '웹 스토리지가 지원되지 않습니다.'),
  ALREADY_INITIALIZED('already-initialized', '이미 초기화되었습니다.'),
  RECAPTCHA_NOT_ENABLED('recaptcha-not-enabled', 'reCAPTCHA가 활성화되지 않았습니다.'),
  MISSING_RECAPTCHA_TOKEN('missing-recaptcha-token', 'reCAPTCHA 토큰이 없습니다.'),
  INVALID_RECAPTCHA_TOKEN('invalid-recaptcha-token', '잘못된 reCAPTCHA 토큰입니다.'),
  INVALID_RECAPTCHA_ACTION('invalid-recaptcha-action', '잘못된 reCAPTCHA 동작입니다.'),
  MISSING_CLIENT_TYPE('missing-client-type', '클라이언트 타입이 없습니다.'),
  MISSING_RECAPTCHA_VERSION('missing-recaptcha-version', 'reCAPTCHA 버전이 없습니다.'),
  INVALID_RECAPTCHA_VERSION('invalid-recaptcha-version', '잘못된 reCAPTCHA 버전입니다.'),
  INVALID_REQ_TYPE('invalid-req-type', '잘못된 요청 타입입니다.'),
  UNSUPPORTED_PASSWORD_POLICY_SCHEMA_VERSION('unsupported-password-policy-schema-version', '지원되지 않는 비밀번호 정책 버전입니다.'),
  PASSWORD_DOES_NOT_MEET_REQUIREMENTS('password-does-not-meet-requirements', '비밀번호가 요구 사항을 충족하지 않습니다.'),
  UNDEFINED('undefined', '알 수 없는 오류입니다.');

  final String code;
  final String message;
  const FirebaseAuthErrorCode(this.code, this.message);

  /// 문자열 코드에서 enum 으로 변환 (없으면 null)
  static FirebaseAuthErrorCode? fromCode(String? code) {
    if (code == null) return null;
    return FirebaseAuthErrorCode.values.firstWhere(
          (e) => e.code == code,
      orElse: () => FirebaseAuthErrorCode.UNDEFINED,
    );
  }
}

/// 모든 항목에 대한 편의 getter (isXxx)
extension FirebaseAuthErrorCodeX on FirebaseAuthErrorCode {
  bool get isAdminOnlyOperation => this == FirebaseAuthErrorCode.ADMIN_ONLY_OPERATION;
  bool get isArgumentError => this == FirebaseAuthErrorCode.ARGUMENT_ERROR;
  bool get isAppNotAuthorized => this == FirebaseAuthErrorCode.APP_NOT_AUTHORIZED;
  bool get isAppNotInstalled => this == FirebaseAuthErrorCode.APP_NOT_INSTALLED;
  bool get isCaptchaCheckFailed => this == FirebaseAuthErrorCode.CAPTCHA_CHECK_FAILED;
  bool get isCodeExpired => this == FirebaseAuthErrorCode.CODE_EXPIRED;
  bool get isCordovaNotReady => this == FirebaseAuthErrorCode.CORDOVA_NOT_READY;
  bool get isCorsUnsupported => this == FirebaseAuthErrorCode.CORS_UNSUPPORTED;
  bool get isCredentialAlreadyInUse => this == FirebaseAuthErrorCode.CREDENTIAL_ALREADY_IN_USE;
  bool get isCredentialMismatch => this == FirebaseAuthErrorCode.CREDENTIAL_MISMATCH;
  bool get isCredentialTooOldLoginAgain => this == FirebaseAuthErrorCode.CREDENTIAL_TOO_OLD_LOGIN_AGAIN;
  bool get isDependentSdkInitBeforeAuth => this == FirebaseAuthErrorCode.DEPENDENT_SDK_INIT_BEFORE_AUTH;
  bool get isDynamicLinkNotActivated => this == FirebaseAuthErrorCode.DYNAMIC_LINK_NOT_ACTIVATED;
  bool get isEmailChangeNeedsVerification => this == FirebaseAuthErrorCode.EMAIL_CHANGE_NEEDS_VERIFICATION;
  bool get isEmailExists => this == FirebaseAuthErrorCode.EMAIL_EXISTS;
  bool get isEmulatorConfigFailed => this == FirebaseAuthErrorCode.EMULATOR_CONFIG_FAILED;
  bool get isExpiredOobCode => this == FirebaseAuthErrorCode.EXPIRED_OOB_CODE;
  bool get isExpiredPopupRequest => this == FirebaseAuthErrorCode.EXPIRED_POPUP_REQUEST;
  bool get isInternalError => this == FirebaseAuthErrorCode.INTERNAL_ERROR;
  bool get isInvalidApiKey => this == FirebaseAuthErrorCode.INVALID_API_KEY;
  bool get isInvalidAppCredential => this == FirebaseAuthErrorCode.INVALID_APP_CREDENTIAL;
  bool get isInvalidAppId => this == FirebaseAuthErrorCode.INVALID_APP_ID;
  bool get isInvalidAuth => this == FirebaseAuthErrorCode.INVALID_AUTH;
  bool get isInvalidAuthEvent => this == FirebaseAuthErrorCode.INVALID_AUTH_EVENT;
  bool get isInvalidCertHash => this == FirebaseAuthErrorCode.INVALID_CERT_HASH;
  bool get isInvalidCode => this == FirebaseAuthErrorCode.INVALID_CODE;
  bool get isInvalidContinueUri => this == FirebaseAuthErrorCode.INVALID_CONTINUE_URI;
  bool get isInvalidCordovaConfiguration => this == FirebaseAuthErrorCode.INVALID_CORDOVA_CONFIGURATION;
  bool get isInvalidCustomToken => this == FirebaseAuthErrorCode.INVALID_CUSTOM_TOKEN;
  bool get isInvalidDynamicLinkDomain => this == FirebaseAuthErrorCode.INVALID_DYNAMIC_LINK_DOMAIN;
  bool get isInvalidEmail => this == FirebaseAuthErrorCode.INVALID_EMAIL;
  bool get isInvalidEmulatorScheme => this == FirebaseAuthErrorCode.INVALID_EMULATOR_SCHEME;
  bool get isInvalidIdpResponse => this == FirebaseAuthErrorCode.INVALID_IDP_RESPONSE;
  bool get isInvalidMessagePayload => this == FirebaseAuthErrorCode.INVALID_MESSAGE_PAYLOAD;
  bool get isInvalidMfaSession => this == FirebaseAuthErrorCode.INVALID_MFA_SESSION;
  bool get isInvalidOauthClientId => this == FirebaseAuthErrorCode.INVALID_OAUTH_CLIENT_ID;
  bool get isInvalidOauthProvider => this == FirebaseAuthErrorCode.INVALID_OAUTH_PROVIDER;
  bool get isInvalidOobCode => this == FirebaseAuthErrorCode.INVALID_OOB_CODE;
  bool get isInvalidOrigin => this == FirebaseAuthErrorCode.INVALID_ORIGIN;
  bool get isInvalidPassword => this == FirebaseAuthErrorCode.INVALID_PASSWORD;
  bool get isInvalidPersistence => this == FirebaseAuthErrorCode.INVALID_PERSISTENCE;
  bool get isInvalidPhoneNumber => this == FirebaseAuthErrorCode.INVALID_PHONE_NUMBER;
  bool get isInvalidProviderId => this == FirebaseAuthErrorCode.INVALID_PROVIDER_ID;
  bool get isInvalidRecipientEmail => this == FirebaseAuthErrorCode.INVALID_RECIPIENT_EMAIL;
  bool get isInvalidSender => this == FirebaseAuthErrorCode.INVALID_SENDER;
  bool get isInvalidSessionInfo => this == FirebaseAuthErrorCode.INVALID_SESSION_INFO;
  bool get isInvalidTenantId => this == FirebaseAuthErrorCode.INVALID_TENANT_ID;
  bool get isLoginBlocked => this == FirebaseAuthErrorCode.LOGIN_BLOCKED;
  bool get isMfaInfoNotFound => this == FirebaseAuthErrorCode.MFA_INFO_NOT_FOUND;
  bool get isMfaRequired => this == FirebaseAuthErrorCode.MFA_REQUIRED;
  bool get isMissingAndroidPackageName => this == FirebaseAuthErrorCode.MISSING_ANDROID_PACKAGE_NAME;
  bool get isMissingAppCredential => this == FirebaseAuthErrorCode.MISSING_APP_CREDENTIAL;
  bool get isMissingAuthDomain => this == FirebaseAuthErrorCode.MISSING_AUTH_DOMAIN;
  bool get isMissingCode => this == FirebaseAuthErrorCode.MISSING_CODE;
  bool get isMissingContinueUri => this == FirebaseAuthErrorCode.MISSING_CONTINUE_URI;
  bool get isMissingIframeStart => this == FirebaseAuthErrorCode.MISSING_IFRAME_START;
  bool get isMissingIosBundleId => this == FirebaseAuthErrorCode.MISSING_IOS_BUNDLE_ID;
  bool get isMissingOrInvalidNonce => this == FirebaseAuthErrorCode.MISSING_OR_INVALID_NONCE;
  bool get isMissingMfaInfo => this == FirebaseAuthErrorCode.MISSING_MFA_INFO;
  bool get isMissingMfaSession => this == FirebaseAuthErrorCode.MISSING_MFA_SESSION;
  bool get isMissingPhoneNumber => this == FirebaseAuthErrorCode.MISSING_PHONE_NUMBER;
  bool get isMissingPassword => this == FirebaseAuthErrorCode.MISSING_PASSWORD;
  bool get isMissingSessionInfo => this == FirebaseAuthErrorCode.MISSING_SESSION_INFO;
  bool get isModuleDestroyed => this == FirebaseAuthErrorCode.MODULE_DESTROYED;
  bool get isNeedConfirmation => this == FirebaseAuthErrorCode.NEED_CONFIRMATION;
  bool get isNetworkRequestFailed => this == FirebaseAuthErrorCode.NETWORK_REQUEST_FAILED;
  bool get isNullUser => this == FirebaseAuthErrorCode.NULL_USER;
  bool get isNoAuthEvent => this == FirebaseAuthErrorCode.NO_AUTH_EVENT;
  bool get isNoSuchProvider => this == FirebaseAuthErrorCode.NO_SUCH_PROVIDER;
  bool get isOperationNotAllowed => this == FirebaseAuthErrorCode.OPERATION_NOT_ALLOWED;
  bool get isOperationNotSupported => this == FirebaseAuthErrorCode.OPERATION_NOT_SUPPORTED;
  bool get isPopupBlocked => this == FirebaseAuthErrorCode.POPUP_BLOCKED;
  bool get isPopupClosedByUser => this == FirebaseAuthErrorCode.POPUP_CLOSED_BY_USER;
  bool get isProviderAlreadyLinked => this == FirebaseAuthErrorCode.PROVIDER_ALREADY_LINKED;
  bool get isQuotaExceeded => this == FirebaseAuthErrorCode.QUOTA_EXCEEDED;
  bool get isRedirectCancelledByUser => this == FirebaseAuthErrorCode.REDIRECT_CANCELLED_BY_USER;
  bool get isRedirectOperationPending => this == FirebaseAuthErrorCode.REDIRECT_OPERATION_PENDING;
  bool get isRejectedCredential => this == FirebaseAuthErrorCode.REJECTED_CREDENTIAL;
  bool get isSecondFactorAlreadyEnrolled => this == FirebaseAuthErrorCode.SECOND_FACTOR_ALREADY_ENROLLED;
  bool get isSecondFactorLimitExceeded => this == FirebaseAuthErrorCode.SECOND_FACTOR_LIMIT_EXCEEDED;
  bool get isTenantIdMismatch => this == FirebaseAuthErrorCode.TENANT_ID_MISMATCH;
  bool get isTimeout => this == FirebaseAuthErrorCode.TIMEOUT;
  bool get isTokenExpired => this == FirebaseAuthErrorCode.TOKEN_EXPIRED;
  bool get isTooManyAttemptsTryLater => this == FirebaseAuthErrorCode.TOO_MANY_ATTEMPTS_TRY_LATER;
  bool get isUnauthorizedDomain => this == FirebaseAuthErrorCode.UNAUTHORIZED_DOMAIN;
  bool get isUnsupportedFirstFactor => this == FirebaseAuthErrorCode.UNSUPPORTED_FIRST_FACTOR;
  bool get isUnsupportedPersistence => this == FirebaseAuthErrorCode.UNSUPPORTED_PERSISTENCE;
  bool get isUnsupportedTenantOperation => this == FirebaseAuthErrorCode.UNSUPPORTED_TENANT_OPERATION;
  bool get isUnverifiedEmail => this == FirebaseAuthErrorCode.UNVERIFIED_EMAIL;
  bool get isUserCancelled => this == FirebaseAuthErrorCode.USER_CANCELLED;
  bool get isUserDeleted => this == FirebaseAuthErrorCode.USER_DELETED;
  bool get isUserDisabled => this == FirebaseAuthErrorCode.USER_DISABLED;
  bool get isUserMismatch => this == FirebaseAuthErrorCode.USER_MISMATCH;
  bool get isUserSignedOut => this == FirebaseAuthErrorCode.USER_SIGNED_OUT;
  bool get isWeakPassword => this == FirebaseAuthErrorCode.WEAK_PASSWORD;
  bool get isWebStorageUnsupported => this == FirebaseAuthErrorCode.WEB_STORAGE_UNSUPPORTED;
  bool get isAlreadyInitialized => this == FirebaseAuthErrorCode.ALREADY_INITIALIZED;
  bool get isRecaptchaNotEnabled => this == FirebaseAuthErrorCode.RECAPTCHA_NOT_ENABLED;
  bool get isMissingRecaptchaToken => this == FirebaseAuthErrorCode.MISSING_RECAPTCHA_TOKEN;
  bool get isInvalidRecaptchaToken => this == FirebaseAuthErrorCode.INVALID_RECAPTCHA_TOKEN;
  bool get isInvalidRecaptchaAction => this == FirebaseAuthErrorCode.INVALID_RECAPTCHA_ACTION;
  bool get isMissingClientType => this == FirebaseAuthErrorCode.MISSING_CLIENT_TYPE;
  bool get isMissingRecaptchaVersion => this == FirebaseAuthErrorCode.MISSING_RECAPTCHA_VERSION;
  bool get isInvalidRecaptchaVersion => this == FirebaseAuthErrorCode.INVALID_RECAPTCHA_VERSION;
  bool get isInvalidReqType => this == FirebaseAuthErrorCode.INVALID_REQ_TYPE;
  bool get isUnsupportedPasswordPolicySchemaVersion => this == FirebaseAuthErrorCode.UNSUPPORTED_PASSWORD_POLICY_SCHEMA_VERSION;
  bool get isPasswordDoesNotMeetRequirements => this == FirebaseAuthErrorCode.PASSWORD_DOES_NOT_MEET_REQUIREMENTS;
}
