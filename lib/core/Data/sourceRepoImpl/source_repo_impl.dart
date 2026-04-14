import 'package:injectable/injectable.dart';
import 'package:news/core/Data/DataSource/SourcesDataSource.dart';
import 'package:news/core/Data/models/Source.dart';
import 'package:news/core/Source%20Repo/source_repo.dart';
@Injectable(as: SourceRepo)
class SourceRepoImpl extends SourceRepo {
  SourcesDataSource dataSource ;
  SourceRepoImpl(this.dataSource) ;
  @override
  Future<List<Source>> getSources(String category) async{
 var response = await dataSource.getSources(category);

 return response ;
  }

}