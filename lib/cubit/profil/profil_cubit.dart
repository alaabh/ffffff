import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(ProfilInitial());
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final box = GetStorage();

  Future<void> getProfile() async {
    emit(ProfilLoading());

    final snapshot =
        await database.ref().child("client/${box.read("userId")}").get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }
}
