abstract class DatabaseService {
  Future<void> addData({required String tableName, required Map<String, dynamic> data});
  Future<void> updateData({required String tableName, required Map<String, dynamic> data});
  Future<void> deleteData({required String tableName, required String id});
  Future<List<Map<String, dynamic>>> getData({required String tableName});
}
