// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../ui/home/details%20home/viewModel/articleviewModel.dart' as _i906;
import '../../ui/home/details%20home/viewModel/detailsScreenViewModel.dart'
    as _i133;
import '../Data/DataSource/article_data_source.dart' as _i880;
import '../Data/DataSource/SourcesDataSource.dart' as _i22;
import '../Data/dataSource_Impl/ArticlesApiDataSource_Impl.dart' as _i871;
import '../Data/dataSource_Impl/SourceApiDataSource_Impl.dart' as _i150;
import '../Data/sourceRepoImpl/article_repo_impl.dart' as _i587;
import '../Data/sourceRepoImpl/source_repo_impl.dart' as _i533;
import '../remote/network/api_manager.dart' as _i133;
import '../Source%20Repo/article_repo.dart' as _i1034;
import '../Source%20Repo/source_repo.dart' as _i830;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i133.ApiManager>(() => _i133.ApiManager());
    gh.factory<_i22.SourcesDataSource>(
      () => _i150.SourceApiDataSourceImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i830.SourceRepo>(
      () => _i533.SourceRepoImpl(gh<_i22.SourcesDataSource>()),
    );
    gh.factory<_i880.ArticleDataSource>(
      () => _i871.ArticlesApiDataSourceImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i1034.ArticleRepo>(
      () => _i587.ArticleRepoImpl(gh<_i880.ArticleDataSource>()),
    );
    gh.factory<_i133.DetailsScreenViewModel>(
      () => _i133.DetailsScreenViewModel(gh<_i830.SourceRepo>()),
    );
    gh.factory<_i906.ArticleViewModel>(
      () => _i906.ArticleViewModel(gh<_i1034.ArticleRepo>()),
    );
    return this;
  }
}
