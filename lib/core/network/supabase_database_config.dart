import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_errors.dart';

class SupabaseDatabaseConfig {
  final _supabase = Supabase.instance.client;

  Future<dynamic> addData({required String tableName, required Map<String, dynamic> data}) async {
    try {
      return await _supabase.from(tableName).insert(data).select();
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future<void> deleteData({required String tableName, required String id}) async {
    try {
      await _supabase.from(tableName).delete().eq('id', id);
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future<List<Map<String, dynamic>>> getData({required String tableName}) async {
    try {
      final res = await _supabase.from(tableName).select();
      Logger().d(res.runtimeType);
      Logger().d(res);
      return res;
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future<List<Map<String, dynamic>>> getDataByID({
    required String tableName,
    required String id,
  }) async {
    try {
      final res = await _supabase.from(tableName).select().eq('id', id);

      return res;
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future<void> updateData({required String tableName, required Map<String, dynamic> data}) async {
    try {
      await _supabase.from(tableName).update(data).eq('id', data['id']);
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future fetchRPC(String tableName) async {
    try {
      final res = await _supabase.rpc(tableName);
      Logger().d(res.runtimeType);
      Logger().d(res);
      return res;
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future fetchRPCWithParams(String tableName, {required Map<String, dynamic> params}) async {
    try {
      final res = await _supabase.rpc(tableName, params: params);
      Logger().d(res.runtimeType);
      Logger().d(res);
      return res;
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }
}
