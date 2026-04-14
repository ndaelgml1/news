import 'package:news/core/Data/models/Source.dart';

abstract class SourceRepo {
  Future<List<Source>> getSources (String category);
}