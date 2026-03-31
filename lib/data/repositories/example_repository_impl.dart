import 'package:flutter_app/data/models/example_model.dart';
import 'package:flutter_app/data/services/api_service.dart';
import 'package:flutter_app/domain/repositories/example_repository.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ApiService apiService;
  ExampleRepositoryImpl(this.apiService);

  @override
  Future<ExampleModel> getExample() async {
    final json = await apiService.fetchExample();
    return ExampleModel.fromJson(json);
  }
}
