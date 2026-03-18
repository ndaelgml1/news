

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/models/Source.dart';
import 'package:news/core/remote/network/api_manager.dart';

class DetailsScreenViewModel extends Cubit<ParentState>{
  DetailsScreenViewModel(): super(LoadingState()) ;

   getSources(String category)async{
    try{
      emit(LoadingState()) ;
      var response = await ApiManager.getSource(category) ;
    if(response?.status== "error") {
     emit(ErrorState(response?.message??"")) ;

    }else{
      emit(SuccessState(response?.sources??[])) ;

    }

    }catch(e){
      emit(ErrorState(e.toString())) ;

    }
  }
}

abstract class ParentState {}

class LoadingState extends ParentState {
}
class SuccessState extends ParentState {
  List<Source>sources ;
  SuccessState(this.sources) ;

}
class ErrorState extends ParentState {
  String errorMessage ;
  ErrorState(this.errorMessage) ;
}
