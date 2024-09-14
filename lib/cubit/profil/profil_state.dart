part of 'profil_cubit.dart';

@immutable
sealed class ProfilState {}

final class ProfilInitial extends ProfilState {}
class ProfilLoading extends ProfilState {}

class ProfilSuccess extends ProfilState {}

class ProfilFailure extends ProfilState {
  final String? error;

  ProfilFailure({required this.error});
}