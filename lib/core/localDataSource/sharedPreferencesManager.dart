import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoredUser {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final String? phone;

  const StoredUser({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.phone,
  });

  factory StoredUser.fromJson(Map<String, dynamic> json) => StoredUser(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    avatarUrl: json['avatarUrl'] as String?,
    phone: json['phone'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'avatarUrl': avatarUrl,
    'phone': phone,
  };
}

class StoredFavEvent {
  final String id;
  final String title;
  final String dateTime;
  final String imageUrl;
  final int imageBgColor;

  const StoredFavEvent({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.imageUrl,
    required this.imageBgColor,
  });

  factory StoredFavEvent.fromJson(Map<String, dynamic> json) => StoredFavEvent(
    id: json['id'] as String,
    title: json['title'] as String,
    dateTime: json['dateTime'] as String,
    imageUrl: json['imageUrl'] as String,
    imageBgColor: json['imageBgColor'] as int,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'dateTime': dateTime,
    'imageUrl': imageUrl,
    'imageBgColor': imageBgColor,
  };
}

class SharedPreferencesManager {
  SharedPreferencesManager._();
  static final SharedPreferencesManager instance = SharedPreferencesManager._();

  late SharedPreferences _prefs;
  final FlutterSecureStorage _secure = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _kOnboardingSeen = 'onboarding_seen';
  static const _kIsLoggedIn = 'is_logged_in';
  static const _kUser = 'stored_user';
  static const _kFavEvents = 'fav_events';

  static const _kRememberMe = 'remember_me';
  static const _kSavedEmail = 'saved_email';
  static const _kSavedPassword = 'saved_password';

  static const _kRegisteredEmail = 'registered_email';
  static const _kRegisteredPassword = 'registered_password';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> registerLocally({
    required StoredUser user,
    required String password,
  }) async {
    await _prefs.setString(_kUser, jsonEncode(user.toJson()));
    await _prefs.setBool(_kIsLoggedIn, true);

    await _secure.write(key: _kRegisteredEmail, value: user.email);
    await _secure.write(key: _kRegisteredPassword, value: password);
  }

  Future<StoredUser?> verifyLocalLogin({
    required String email,
    required String password,
  }) async {
    final storedEmail = await _secure.read(key: _kRegisteredEmail);
    final storedPassword = await _secure.read(key: _kRegisteredPassword);

    if (storedEmail == null || storedPassword == null) return null;

    if (storedEmail.toLowerCase() != email.toLowerCase()) return null;
    if (storedPassword != password) return null;
    return currentUser;
  }

  Future<bool> get hasLocalAccount async {
    final email = await _secure.read(key: _kRegisteredEmail);
    return email != null;
  }

  // hasSeenOnboarding
  bool get hasSeenOnboarding => _prefs.getBool(_kOnboardingSeen) ?? false;

  // markOnboardingSeen
  Future<void> markOnboardingSeen() => _prefs.setBool(_kOnboardingSeen, true);

  // isLoggedIn
  bool get isLoggedIn => _prefs.getBool(_kIsLoggedIn) ?? false;

  Future<void> saveLoginSession({
    required StoredUser user,
    required bool rememberMe,
    String? email,
    String? password,
  }) async {
    await _prefs.setBool(_kIsLoggedIn, true);
    await _prefs.setString(_kUser, jsonEncode(user.toJson()));

    await _secure.write(key: _kRememberMe, value: rememberMe.toString());

    if (rememberMe && email != null && password != null) {
      await _secure.write(key: _kSavedEmail, value: email);
      await _secure.write(key: _kSavedPassword, value: password);
    } else {
      await _secure.delete(key: _kSavedEmail);
      await _secure.delete(key: _kSavedPassword);
    }
  }

  Future<void> logout() async {
    await _prefs.setBool(_kIsLoggedIn, false);
    await _prefs.remove(_kUser);

    final remember = await rememberMe;
    if (!remember) {
      await _secure.delete(key: _kSavedEmail);
      await _secure.delete(key: _kSavedPassword);
    }
  }

  Future<bool> get rememberMe async {
    final val = await _secure.read(key: _kRememberMe);
    return val == 'true';
  }

  Future<String?> get savedEmail => _secure.read(key: _kSavedEmail);

  Future<String?> get savedPassword => _secure.read(key: _kSavedPassword);

  StoredUser? get currentUser {
    final raw = _prefs.getString(_kUser);
    if (raw == null) return null;
    try {
      return StoredUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> updateUser(StoredUser user) =>
      _prefs.setString(_kUser, jsonEncode(user.toJson()));

  List<StoredFavEvent> get favEvents {
    final raw = _prefs.getString(_kFavEvents);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => StoredFavEvent.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  bool isFavourited(String eventId) => favEvents.any((e) => e.id == eventId);

  Future<void> addFavEvent(StoredFavEvent event) async {
    final list = favEvents;
    if (list.any((e) => e.id == event.id)) return;
    list.add(event);
    await _prefs.setString(
      _kFavEvents,
      jsonEncode(list.map((e) => e.toJson()).toList()),
    );
  }

  Future<void> removeFavEvent(String eventId) async {
    final list = favEvents..removeWhere((e) => e.id == eventId);
    await _prefs.setString(
      _kFavEvents,
      jsonEncode(list.map((e) => e.toJson()).toList()),
    );
  }

  Future<void> toggleFavEvent(StoredFavEvent event) async {
    isFavourited(event.id)
        ? await removeFavEvent(event.id)
        : await addFavEvent(event);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
    await _secure.deleteAll();
  }
}
