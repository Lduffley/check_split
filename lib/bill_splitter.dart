import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  BillSplitter({Key key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int tipPercentage = 0;
  int personCounter = 1;
  var billAmount = 0.0;

  calcTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calcTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calcTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
        ),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent[100],
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total Per Person',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '\$ ${calcTotalPerPerson(billAmount, personCounter, tipPercentage)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey[100],
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Bill Amount',
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        billAmount = double.parse(value);
                      } catch (exception) {
                        billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Split',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: IconButton(
                              splashColor: Colors.blue,
                              color: Colors.black,
                              icon: Icon(Icons.minimize),
                              onPressed: () {
                                setState(() {
                                  personCounter--;
                                });
                              },
                            ),
                          ),
                          Text(
                            '$personCounter',
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                            child: IconButton(
                              splashColor: Colors.blue,
                              color: Colors.black,
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  personCounter++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tip',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$ ${calcTotalTip(billAmount, personCounter, tipPercentage).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '$tipPercentage %',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        inactiveColor: Colors.grey,
                        value: tipPercentage.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            tipPercentage = newValue.round();
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
