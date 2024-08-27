import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  Future<void> signUp(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      emit(SignupLoading());

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("client/${userCredential.user!.uid}");

      await ref.set({
        "name": name,
        "email": email,
        "phone": phone,
      }).then((_) {
        emit(SignupSuccess());
      }).catchError((error) {
        print(error);
        emit(SignupFailure(error: error.message));
      });
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(error: e.message));
      print(e);
    } catch (e) {
      emit(SignupFailure(error: 'An unexpected error occurred'));
      print(e);
    }
  }
}
