import 'package:baseapp/common/enum/app_environment.dart';

class Env {
  Env({
    required this.baseUrl,
    required this.imageUrl,
    required this.appEnvironment,
    required this.signatureKey,
  });

  final String baseUrl;
  final String imageUrl;
  final AppEnvironment appEnvironment;
  final String signatureKey;
}

class EnvValue {
  static final Env development = Env(
    baseUrl: 'https://api.chucknorris.io/jokes/random',
    imageUrl: 'https://api.chucknorris.io/jokes',
    appEnvironment: AppEnvironment.development,
    signatureKey: "uat_test",
  );

  static final Env production = Env(
    baseUrl: 'https://api.chucknorris.io/jokes',
    imageUrl: 'https://api.chucknorris.io/jokes',
    appEnvironment: AppEnvironment.production,
    signatureKey: '',
  );
}
