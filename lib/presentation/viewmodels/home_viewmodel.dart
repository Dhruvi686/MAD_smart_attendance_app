import 'package:flutter/material.dart';
import 'package:flutter_app/domain/usecases/get_example_usecase.dart';
import 'package:flutter_app/data/models/example_model.dart';

class HomeViewModel extends ChangeNotifier {
  final GetExampleUseCase getExampleUseCase;
  HomeViewModel({required this.getExampleUseCase});

  ExampleModel? example;
  bool isLoading = false;
  String? error;

  Future<void> loadExample() async {
    isLoading = true;
    notifyListeners();
    try {
      example = await getExampleUseCase.call();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
