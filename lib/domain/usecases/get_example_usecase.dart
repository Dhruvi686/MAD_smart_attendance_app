import 'package:flutter_app/domain/repositories/example_repository.dart';
import 'package:flutter_app/data/models/example_model.dart';

class GetExampleUseCase {
  final ExampleRepository repository;
  GetExampleUseCase(this.repository);

  Future<ExampleModel> call() async {
    return repository.getExample();
  }
}
