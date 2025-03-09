import 'package:gotrue/src/types/user.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyai/features/auth/repository/auth_repository.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(this._supabaseAuth);
  final GoTrueClient _supabaseAuth;

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _supabaseAuth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    await _supabaseAuth.signUp(
      password: password,
      email: email,
      data: {
        'full_name': 'Anonymous',
      },
    );
  }

  @override
  Future<void> signOut() async => _supabaseAuth.signOut();

  @override
  Stream<User?> getCurrentUser() {
    return _supabaseAuth.onAuthStateChange.map((event) => event.session?.user);
  }

  @override
  User? getSignedInUser() => _supabaseAuth.currentUser;
}
