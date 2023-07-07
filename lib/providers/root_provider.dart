import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:minha_estante/providers/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => BookcaseProvider()),
      ChangeNotifierProvider(create: (_) => ConfigProvider()),
    ];
  }
}
