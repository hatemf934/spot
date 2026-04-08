import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:spot/feature/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> loginUser({
    required String identifier,
    required String password,
  }) async {
    emit(SignInLoading());

    var result = await authRepo.signInWithEmailAndPassword(
      identifier: identifier,
      password: password,
    );

    result.fold(
      (failure) => emit(SignInFailure(errmessage: failure.message)),
      (userCredential) => emit(SignInSucsses(userCredential: userCredential)),
    );
  }
}
