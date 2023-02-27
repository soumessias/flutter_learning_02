import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> transactions;
  void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top) *
          0.75,
      child: widget.transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 400,
                  child: Image.asset(
                    'assets/images/dollar_sign.png',
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(.2),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: widget.transactions.length,
              itemBuilder: (ctx, index) {
                final tr = widget.transactions[index];
                return Dismissible(
                  key: Key(tr.title.toString()),
                  background: Container(color: Colors.redAccent),
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    widget.onRemove(tr.id);
                    // setState(() {
                    //   widget.transactions.removeAt(index);
                    // });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Despesa ${tr.title} apagada!')));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.teal.shade300,
                                width: 3,
                              )),
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 5,
                            right: 5,
                          ),
                          child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2).replaceAll(".", ",")}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat('d MMM y').format(tr.date),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
