class LoginState {
  final String studentID;
  final String password;
  final bool isLoading;
  final String? errorMessage;

  LoginState({
    this.studentID = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    String? studentID,
    String? password,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      studentID: studentID ?? this.studentID,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
