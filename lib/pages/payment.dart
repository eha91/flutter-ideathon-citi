import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  int _state = 1;

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
              child: _state == 1 ? _paymetod() : _qr(),
            ),

            SizedBox(
              height: 80,
            ),
            FlatButton(
                onPressed: null,

                child: Container(
                  width: 250,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: Center(child: Text("Cancelar",style: TextStyle(fontSize: 16, color: Colors.blue),)),
                ))
          ],
        ));
  }

  Widget _qr() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Por favor escanee el código QR para realizar su pago.',
            textAlign: TextAlign.left,
          ),
          Text(
            'No se le cobrará ninguna comisión.',
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 55,
          ),
          QrImage(
            data: 'Los Forkis',
            gapless: true,
            foregroundColor: Colors.black,
            size: 200,
          ),

        ],
      ),
    );
  }

  Widget _paymetod () {
    return Container(
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
                      setState(() {
                        _state = _state + 1;

                      });
                    },
                    child: Container(
                        width: 150,
                        height: 150,
                        child: Container(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Image.network(
                                  'https://www.qrcode-monkey.com/img/blog/qrcode-classic-blue.png',
                                  height: 80,
                                ),
                              ),
                              Text("Código QR")
                            ],
                          ),
                        )),
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
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Image.network(
                                  'https://cdn0.iconfinder.com/data/icons/banking-essentials/100/Finance_Cash_Transfer-512.png',
                                  height: 80,
                                ),
                              ),
                              Text("Transferencia")
                            ],
                          ),
                        )),
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
                      child: Center(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Image.network(
                                'https://i.pinimg.com/originals/71/81/e8/7181e84d50cb87fa4ab9a5a8ab613dbe.jpg',
                                height: 80,
                              ),
                            ),
                            Text("Mercado Pago")
                          ],
                        ),
                      ),
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
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Image.network(
                                  'https://media.istockphoto.com/vectors/mastercard-credit-blue-color-debit-card-icon-vector-id1225849081?k=6&m=1225849081&s=170667a&w=0&h=UWY7M4gXB3iEPnJmjwAQoPotOYFclJN2UOM8uBzQSu8=',
                                  height: 80,
                                ),
                              ),
                              Text(
                                "Tarjeta de crédito/débito",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
