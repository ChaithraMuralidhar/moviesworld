import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navigationTitleHome => 'Movies World Home';

  @override
  String get home => 'Home';

  @override
  String get scanner => 'Ticket Scanner';

  @override
  String get googleMap => 'Theatres near me';

  @override
  String get apiService => 'Top Movies List';

  @override
  String get testingOffline => 'Movies Stored';

  @override
  String get notification => 'Notification';

  @override
  String get documentation => 'Support';

  @override
  String get logout => 'Logout';
}
