class TableModel {
  final List<String> headers;
  final List<List<String>> rows;
  final bool? isNumeric;
  final void Function(int index)? onRowTap;

  TableModel({required this.headers, required this.rows, this.onRowTap, this.isNumeric});
}
