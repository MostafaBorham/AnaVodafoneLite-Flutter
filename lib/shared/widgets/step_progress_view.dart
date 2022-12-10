import 'package:flutter/material.dart';

class StepProgressView extends StatelessWidget {
  final double _width;

  final List<String> _titles;
  final int _curStep;
  final Color _activeColor=Colors.redAccent;
  final Color _inactiveColor = Colors.grey.shade300;
  final Color _doneColor = Colors.green;
  final double lineWidth = 3.0;

  StepProgressView(
      {Key? key,
      required int curStep,
      required List<String> titles,
      required double width,})
      : _titles = titles,
        _curStep = curStep,
        _width = width,
        assert(width > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: _width,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: _width*0.75,
                child: Row(
                  children: _iconViews(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _titleViews(context),
              ),
            ],
          )),
    );
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor =
          _curStep ==i ? _activeColor : (_curStep<i) ? _inactiveColor :_doneColor;
      var lineColor = _curStep > i ? _doneColor : _inactiveColor;
      var iconColor =circleColor;

      list.add(
        Container(
          width: 20.0,
          height: 20.0,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            /* color: circleColor,*/
            borderRadius: const BorderRadius.all(Radius.circular(22.0)),
            border: Border.all(
              color: circleColor,
              width: 2.0,
            ),
          ),
          child: Icon(
            Icons.circle,
            color: iconColor,
            size: 12.0,
          ),
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  List<Widget> _titleViews(context) {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(SizedBox(
        width: _width*0.3,
          child: Text(text,maxLines: 1,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: _curStep>=i? Colors.black : Colors.grey.shade300,
          ))));
    });
    return list;
  }
}
