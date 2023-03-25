import  "package:flutter/material.dart";
import "package:card_loading/card_loading.dart";

class IndicatorLoader extends StatefulWidget {
  const IndicatorLoader({Key? key}) : super(key: key);

  @override
  State<IndicatorLoader> createState() => _IndicatorLoaderState();
}

class _IndicatorLoaderState extends State<IndicatorLoader> with SingleTickerProviderStateMixin  {

  @override
  Widget build(BuildContext context) {
    return CardLoading(
      height: 100,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
