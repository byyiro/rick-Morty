import 'dart:io';

enum FixtureType { model, dto, responseData, serviceResponseData }

String fixtureFeature(String name, String feature, FixtureType type) {
  String _type;
  switch (type) {
    case FixtureType.model:
      _type = 'domain/models';
      break;
    case FixtureType.dto:
      _type = 'data/dtos';
      break;
    case FixtureType.responseData:
      _type = 'data/repositories';
      break;
    default:
      _type = 'domain/model';
  }
  try {
    return File('../test/features/$feature/$_type/fixtures/$name').readAsStringSync();
  } catch (e) {
    return File('./test/features/$feature/$_type/fixtures/$name').readAsStringSync();
  }
}
