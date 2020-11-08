import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Regresar',
              style: TextStyle(color: Color.fromRGBO(5, 109, 174, 1))),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color.fromRGBO(5, 109, 174, 1)),
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(5, 109, 174, 1),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Corte de cabello - Hombre',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '\$1,000.00',
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total a pagar: ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '\$1,000.00',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Métodos de pago',
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Center(child: Text('Código QR'),)
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Center(child: Text('Transferencia'),)
                            ),
                          ),
                        ),
                      
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Center(child: Text('Tarjeta de débito'),),
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Center( child: Text('Mercado pago'),)
                            ),
                          ),
                        ),
                      
                      ],
                    )
                  
                  ],
                ))
          ],
        ));
  }
}
