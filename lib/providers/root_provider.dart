import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//arquivo para gerenciar providers
class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => BookcaseProvider()),
    ];
  }
}
