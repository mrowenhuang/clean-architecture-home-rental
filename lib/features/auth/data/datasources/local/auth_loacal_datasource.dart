import 'package:hive_flutter/adapters.dart';

abstract class AuthLoacalDatasource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class AuthLoacalDatasourceImpl extends AuthLoacalDatasource {
  final Box _box;

  AuthLoacalDatasourceImpl(this._box);

  @override
  Future<void> deleteToken() async{
    await _box.delete('access_token');
  }

  @override
  Future<String?> getToken() async{
    return await _box.get('access_token');
  }

  @override
  Future<void> saveToken(String token) async{
    await _box.put('access_token', token);
  }
}
