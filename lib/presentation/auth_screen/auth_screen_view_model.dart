import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_event.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_state.dart';

class AuthScreenViewModel with ChangeNotifier {
  final FirestoreRepo _storeRepo;
  final FirebaseStorageRepo _storageRepo;
  AuthScreenViewModel(
      {required FirestoreRepo storeRepo,
      required FirebaseStorageRepo storageRepo})
      : _storeRepo = storeRepo,
        _storageRepo = storageRepo;

  AuthScreenState _state = AuthScreenState(
    isSignIn: true,
    email: '',
    password: '',
    confirmPassword: '',
    name: '',
    image: null,
    isLoading: false,
    isValidEmail: false,
    isValidPassword: false,
    isValidConfirmPassword: false,
    isValidName: false,
  );
  AuthScreenState get state => _state;

  final _eventController = StreamController<AuthScreenEvent>.broadcast();
  Stream<AuthScreenEvent> get eventStream => _eventController.stream;

  void toggleAuthMode() {
    _state = _state.copyWith(
      isSignIn: !_state.isSignIn,
      email: '',
      password: '',
      confirmPassword: '',
      name: '',
      image: null,
      isLoading: false,
      isValidEmail: false,
      isValidPassword: false,
      isValidConfirmPassword: false,
    );
    notifyListeners();
  }

  set email(String value) {
    _state = _state.copyWith(email: value);
    notifyListeners();
  }

  set name(String value) {
    _state = _state.copyWith(name: value);
    notifyListeners();
  }

  set password(String value) {
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  set confirmPassword(String value) {
    _state = _state.copyWith(confirmPassword: value);
    notifyListeners();
  }

  set image(Uint8List? value) {
    _state = _state.copyWith(image: value);
    notifyListeners();
  }

  Future<void> onAuthButtonClick() async =>
      state.isSignIn ? _signIn() : _signUp();

  Future<void> _signIn() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: state.email, password: state.password);

      _state = _state.copyWith(
        email: '',
        password: '',
        confirmPassword: '',
        name: '',
        image: null,
        isValidEmail: false,
        isValidPassword: false,
        isValidConfirmPassword: false,
        isValidName: false,
      );

      _eventController.sink.add(const AuthScreenEvent.onSignInSuccess());
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('????????? ??????????????????.'));
          break;
        case 'user-disabled':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('??????????????? ???????????????.'));
          break;
        case 'user-not-found':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('????????? ?????? ???????????????.'));
          break;
        case 'wrong-password':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('????????? ?????????????????????.'));
          break;
        case 'too-many-requests':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('????????? ?????? ??????????????????.'));
          break;

        default:
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('??? ??? ?????? ????????? ??????????????????.'));
          break;
      }
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> _signUp() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    try {
      final nameExists = await _storeRepo.checkNameExists(state.name);

      if (nameExists) {
        _eventController.sink
            .add(const AuthScreenEvent.onAuthError('?????? ???????????? ???????????????.'));
        return;
      }

      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      final user = userCredential.user!;
      await user.updateDisplayName(state.name);
      await _storeRepo.updateDisplayName(state.name);
      await user.sendEmailVerification();
      _eventController.sink.add(const AuthScreenEvent.onSignUpSuccess());
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('?????? ???????????? ??????????????????.'));
          break;
        case 'invalid-email':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('?????????????????? ??????????????????.'));
          break;
        case 'operation-not-allowed':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('???????????? ?????? ???????????????.'));
          break;
        case 'weak-password':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('??? ??? ?????? ??????????????? ??????????????????.'));
          break;
        default:
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('??? ??? ?????? ????????? ??????????????????.'));
          break;
      }
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  void skipProfileImage() {
    _state = _state.copyWith(image: null);
    _eventController.sink.add(const AuthScreenEvent.onProfileSettingDone());
  }

  Future<void> updateUserPhoto() async {
    try {
      await _storageRepo.updateUserPhoto(state.image!);
      _state = _state.copyWith(image: null);
      _eventController.sink.add(const AuthScreenEvent.onProfileSettingDone());
    } on FirebaseException catch (e) {
      _eventController.sink.add(
        const AuthScreenEvent.onAuthError('????????? ?????? ????????? ??????????????????.'),
      );
    } catch (e) {
      rethrow;
    }
  }

  void onProfileTap() {
    _eventController.sink.add(const AuthScreenEvent.onProfileTap());
  }

  bool get isValid => state.isSignIn
      ? state.isValidEmail && state.isValidPassword
      : state.isValidEmail &&
          state.isValidPassword &&
          state.isValidConfirmPassword &&
          state.isValidName;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      _state = _state.copyWith(isValidEmail: false);

      return '????????? ????????? ??????????????????.';
    }

    final isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!isValidEmail) {
      _state = _state.copyWith(isValidEmail: false);

      return '????????? ????????? ???????????? ????????????';
    }

    _state = _state.copyWith(isValidEmail: true);
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      _state = _state.copyWith(isValidPassword: false);

      return '??????????????? ??????????????????.';
    }

    if (value.length < 8) {
      _state = _state.copyWith(isValidPassword: false);
      return '8??? ???????????? ??????????????? ??????????????????.';
    }

    _state = _state.copyWith(isValidPassword: true);
    return null;
  }

  String? validateConfirmPassword(String? value) {
    // print(value);
    // print(state.password);
    // print(state.confirmPassword);
    // print(state.confirmPassword == value);

    if (value == null || value.isEmpty) {
      _state = _state.copyWith(isValidConfirmPassword: false);
      return '??????????????? ?????? ??????????????????.';
    }

    if (value != state.password) {
      _state = _state.copyWith(isValidConfirmPassword: false);
      return '??????????????? ???????????? ????????????.';
    }

    _state = _state.copyWith(isValidConfirmPassword: true);
    return null;
  }

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      _state = _state.copyWith(isValidName: false);

      return '???????????? ??????????????????.';
    }

    if (name.length < 2) {
      _state = _state.copyWith(isValidName: false);

      return '2??? ???????????? ???????????? ??????????????????.';
    }

    if (name.length > 10) {
      _state = _state.copyWith(isValidName: false);

      return '10??? ????????? ???????????? ??????????????????.';
    }

    _state = _state.copyWith(isValidName: true);

    return null;
  }
}
