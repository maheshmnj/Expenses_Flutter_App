import 'package:expense_manager/constants/exports.dart';
import 'package:expense_manager/model/model.dart';
import 'package:expense_manager/utils/settings.dart';
import 'package:flutter/material.dart';

class ExpenseListTile extends StatefulWidget {
  ExpenseListTile(
      {Key? key,
      required this.index,
      required this.model,
      required this.controller,
      required this.durationInMilliSeconds})
      : super(key: key);

  final AnimationController controller;
  final double durationInMilliSeconds;
  Expense model;
  final int index;

  @override
  State<ExpenseListTile> createState() => _ExpenseListTileState();
}

class _ExpenseListTileState extends State<ExpenseListTile> {
  late Animation<Offset> _animation;
  late double start;
  late double end;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start = (widget.durationInMilliSeconds * widget.index).toDouble() * 0.2;
    end = start + widget.durationInMilliSeconds;
    _animation = Tween<Offset>(
      begin: Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(
          start,
          end,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, snapshot) {
          List<String> labels = [];
          if (!widget.model.label!.isEmpty) {
            labels = widget.model.label!.split(',').toList();
          }
          return SlideTransition(
            position: _animation,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ExpenseTheme.isDark
                    ? ExpenseTheme.darkColorScheme.surface
                    : ExpenseTheme.lightColorScheme.primary,
              ),
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.model.description!,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 24),
                        child: TotalSpentValue(
                          currency: Settings.currency.symbol,
                          value: widget.model.amount!,
                          hasLabel: false,
                          color: ExpenseTheme.darkColorScheme.primary,
                        ),
                      )
                    ],
                  ),
                  labels.isEmpty
                      ? SizedBox()
                      : Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (int i = 0; i < labels.length; i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Chip(label: Text('${labels[i]}')),
                                )
                            ],
                          ),
                        )
                ],
              ),
            ),
          );
        });
  }
}
