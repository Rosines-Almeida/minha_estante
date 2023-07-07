import 'package:flutter/material.dart';
import 'package:minha_estante/commons/helpers/calculate_percetage.dart';
import 'package:minha_estante/entities/books_entity.dart';
import 'package:minha_estante/providers/bookcase_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BarProgressComponents extends StatefulWidget {
  final int index;
  const BarProgressComponents({super.key, required this.index});

  @override
  State<BarProgressComponents> createState() => _BarProgressComponentsState();
}

class _BarProgressComponentsState extends State<BarProgressComponents> {
  late double valueToBarProgress;
  late BookcaseProvider store;

  double onValueToBarProgress() {
    final BooksEntity item = store.listBook.elementAt(widget.index);
    return calculatePercetage(item.numberPageRead, item.numberPage) / 100;
  }

  @override
  void initState() {
    valueToBarProgress = widget.index / 100;
    print(valueToBarProgress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BookcaseProvider>(context);
    return Container(
      child: LinearPercentIndicator(
        width: 200.0,
        lineHeight: 20.0,
        percent: onValueToBarProgress(),
        backgroundColor: Color.fromARGB(255, 206, 199, 199),
        progressColor: Color(0xff606C5D),
        animation: true,
        animationDuration: 1000,
        barRadius: Radius.circular(10),
      ),
    );
  }
}
