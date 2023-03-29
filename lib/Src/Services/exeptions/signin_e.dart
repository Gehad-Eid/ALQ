class SignWithEmailAndPasswordFailure {
  final String message;

  const SignWithEmailAndPasswordFailure(
      [this.message = 'An unknowen error oucred']);

  factory SignWithEmailAndPasswordFailure.code(String code) {
    //***************** check on the messges and fix it
    switch (code) {
      case 'weak-password':
        return const SignWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const SignWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignWithEmailAndPasswordFailure(
            'An account already exists for this email.');
      case 'operation-not-allowed':
        return const SignWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const SignWithEmailAndPasswordFailure(
            'There is no user corresponding to the given email.');
      case 'wrong-password':
        return const SignWithEmailAndPasswordFailure(
            'wrong email or password , Please try again');
      default:
        return const SignWithEmailAndPasswordFailure();
    }
  }
}
