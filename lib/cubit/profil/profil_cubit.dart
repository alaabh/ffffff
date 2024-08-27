import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(ProfilInitial());
}
