import 'package:expense_manager/constants/exports.dart';
import 'package:expense_manager/model/model.dart';
import 'package:flutter/material.dart';

class ExpenseListTile extends StatelessWidget {
  ExpenseListTile({Key? key, required this.model}) : super(key: key);
  Expense model;

  @override
  Widget build(BuildContext context) {
    Color dismissColor = ExpenseTheme.dismissedRight;
    return Dismissible(
        direction: DismissDirection.startToEnd,
        dismissThresholds: {
          DismissDirection.startToEnd: 0.4,
          DismissDirection.endToStart: 0.4
        },
        background: Container(
          color: dismissColor,
        ),
        onDismissed: (direction) {
          // bloc.removeExpenseItem(snapshot.data[item].id);
          if (direction == DismissDirection.startToEnd) {
            dismissColor = ExpenseTheme.dismissedRight;
            bloc.removeExpenseItem(model);
          } else {
            dismissColor = ExpenseTheme.dismissedLeft;
          }
        },
        key: Key("expenseItem${model.id}"),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: Text(
                    model.description!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            model.datetime!.formatDate(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: Text(
                                '₹',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Text(
                                  model.amount.toString(),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
          height: MediaQuery.of(context).size.width / 4,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ));
  }
}
