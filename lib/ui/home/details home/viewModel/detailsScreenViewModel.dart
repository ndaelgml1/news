

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/Source%20Repo/source_repo.dart';

import '../../../../core/Data/models/Source.dart';
@injectable
class DetailsScreenViewModel extends Cubit<DetailsScreenState>{
  @factoryMethod
  DetailsScreenViewModel(this.sourceRepo): super(LoadingState()) ;
  SourceRepo sourceRepo ;

   getSources(String category)async{
    try{
      emit(LoadingState()) ;
      var source = await sourceRepo.getSources(category) ;
    // if(response?.status== "error") {
    //  emit(ErrorState(response?.message??"")) ;

    // }else{
      emit(SuccessState(source)) ;
    //
    // }
    //
     }catch(e){
      emit(ErrorState(e.toString())) ;

    }
  }
}

abstract class DetailsScreenState {}

class LoadingState extends DetailsScreenState {
}
class SuccessState extends DetailsScreenState {
  List<Source>sources ;
  SuccessState(this.sources) ;

}
class ErrorState extends DetailsScreenState {
  String errorMessage ;
  ErrorState(this.errorMessage) ;
}
