import 'package:flutter_app/data/models/example_model.dart';

abstract class ExampleRepository {
  Future<ExampleModel> getExample();
}
