class AuthUser {
  final String email;
  final String authToken;
  final String refreshToken;

  const AuthUser(
      this.email,
      this.authToken,
      this.refreshToken
      );
  }