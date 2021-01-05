import 'package:mygarment/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(
        code: 'vi', value: 'Vietnamese', imagePath: 'assets/pngs/vi.png'),
    LanguageEntity(
        code: 'en', value: 'English', imagePath: 'assets/pngs/en.png'),
  ];
}
