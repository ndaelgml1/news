import 'package:news/core/Data/models/Source.dart';

abstract class SourcesDataSource {
  Future<List<Source>>getSources(String category);
}