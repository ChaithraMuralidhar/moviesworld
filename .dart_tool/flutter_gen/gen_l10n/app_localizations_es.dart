import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get navigationTitleHome => 'Inicio del kit de inicio de Flutter';

  @override
  String get home => 'Hogar';

  @override
  String get scanner => 'Escáner';

  @override
  String get googleMap => 'Mapa de Google';

  @override
  String get apiService => 'Servicio API';

  @override
  String get testingOffline => 'Movies Stored';

  @override
  String get notification => 'Notification';

  @override
  String get documentation => 'Documentación';

  @override
  String get logout => 'Cerrar sesión';
}
