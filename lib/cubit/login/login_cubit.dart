import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final box = GetStorage();

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Access and store UID
      final userId = userCredential.user!.uid;
      
      box.write("userId", userId);
      box.write("email", userCredential.user!.email);
      print(box.read("userId"));
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(error: e.message));
      print(e);
    } catch (e) {
      emit(LoginFailure(error: 'An unexpected error occurred'));
            print(e);

    }
  }
}
