import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/database_service.dart';

import 'errors.dart';

class SupabaseDatabaseConfig extends DatabaseService {
  final _supabase = Supabase.instance.client;

  @override
  Future<void> addData({required String tableName, required Map<String, dynamic> data}) async {
    try {
      await _supabase.from(tableName).insert(data);
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  @override
  Future<void> deleteData({required String tableName, required String id}) async{
  }

  @override
  Future<List<Map<String, dynamic>>> getData({required String tableName}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData({required String tableName, required Map<String, dynamic> data}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
