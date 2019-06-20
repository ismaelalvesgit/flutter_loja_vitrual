import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';

class SliderBloc implements BlocBase{

  List<int> indicators = new List<int>();

  final StreamController<List<int>> _indicatorsController = StreamController<List<int>>();
  Stream<List<int>> get outIndicators => _indicatorsController.stream;


  void inicialize(){
    indicators.add(0);
  }

  void change(int index, int slider){
    indicators[index] = slider;
    _indicatorsController.sink.add(indicators);
    notifyListeners();
  }

  @override
  void dispose() {
    _indicatorsController.close();
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}