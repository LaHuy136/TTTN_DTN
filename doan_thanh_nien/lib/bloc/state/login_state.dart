class LoginState {
  final String username;
  final String password;
  final bool isLoading;
  final String? errorMessage;

  LoginState({
    this.username = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
