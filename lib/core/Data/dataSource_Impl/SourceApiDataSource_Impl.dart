import 'package:injectable/injectable.dart';
import 'package:news/core/Data/DataSource/SourcesDataSource.dart';
import 'package:news/core/Data/models/Source.dart';
import 'package:news/core/remote/network/api_manager.dart';
@Injectable(as: SourcesDataSource)
class SourceApiDataSourceImpl extends SourcesDataSource{
  ApiManager apiManager ;
  @factoryMethod
  SourceApiDataSourceImpl(this.apiManager) ;
  @override
  Future<List<Source>> getSources(String category)async {
  var sourceResponse = await apiManager.getSource(category) ;
  return sourceResponse?.sources??[] ;
  }
}