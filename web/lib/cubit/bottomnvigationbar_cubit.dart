import 'package:cubit/cubit.dart';
import 'package:equatable/equatable.dart';

part 'bottomnvigationbar_state.dart';

class BottomnvigationbarCubit extends Cubit<BottomnvigationbarState> {
  BottomnvigationbarCubit() : super(BottomnvigationbarState());

  void changePage(int index) => emit(BottomnvigationbarState(index: index));
}
