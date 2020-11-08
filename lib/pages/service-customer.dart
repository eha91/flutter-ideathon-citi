import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ServiceCustomer extends StatefulWidget {
  @override
  _ServiceCustomerState createState() => _ServiceCustomerState();
}

class _ServiceCustomerState extends State<ServiceCustomer> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    print('Argumentes');
    print(arguments);
    final size = MediaQuery.of(context).size;
    final widthScreen = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar', style: TextStyle(color: Color.fromRGBO(5, 109, 174, 1))),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(5, 109, 174, 1)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              _user(arguments),
              SizedBox(height: 10),
              _date(widthScreen),
              SizedBox(height: 10),
              // _amount(widthScreen),
              SizedBox(height: 10),
              _pay(widthScreen),
              SizedBox(height: 10),
              // _review(widthScreen),
              SizedBox(height: 10),
              _methodPay(widthScreen),
              FlatButton(
                color: Colors.green,
                minWidth: widthScreen,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  ElevatedButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Yay! A SnackBar!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the Scaffold in the widget tree and use
                      // it to show a SnackBar.
                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    child: Text('Show SnackBar'),
                  );
                },
                child: Text(
                  "Finalizar",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _user(arguments) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
              child: Image(
                image: NetworkImage(arguments['image']),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      arguments['name'],
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    child: Text(
                      arguments['service'],
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _date(widthScreen) {
    return Container(
      width: widthScreen,
      height: 59.0,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom:10),
            child: Text(
              'Fecha:',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: Colors.black
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            child: Text(
              'Domingo, 07 noviembre del 2020, 09:00 a.m. ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: Colors.black
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pay(width) {
    return SizedBox(
      width: width,
      height: 56.0,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 0.0, 362.0, 56.0),
            size: Size(362.0, 56.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(17.0, 15.0, 42.0, 27.0),
            size: Size(362.0, 56.0),
            child: Text(
              'Total',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Colors.black
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(261.0, 15.0, 91.0, 27.0),
            size: Size(362.0, 56.0),
            child: Text(
              '\$250',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Colors.black
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _methodPay(widthScreen) {
    return SizedBox(
      width: widthScreen,
      height: 194.0,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 0.0, 362.0, 194.0),
            size: Size(362.0, 194.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 362.0, 194.0),
                  size: Size(362.0, 194.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(15.0, 7.0, 89.0, 16.0),
                  size: Size(362.0, 194.0),
                  pinLeft: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Método de pago',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: Colors.black
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                // Pinned.fromSize(
                //   bounds: Rect.fromLTWH(14.5, 30.5, 344.0, 1.0),
                //   size: Size(362.0, 194.0),
                //   pinLeft: true,
                //   pinRight: true,
                //   pinTop: true,
                //   fixedHeight: true,
                //   child: SvgPicture.string(
                //     '<svg viewBox="21.5 570.5 344.0 1.0" ><path transform="translate(21.5, 570.5)" d="M 0 0 L 344 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                //     allowDrawingOutsideViewBox: true,
                //     fit: BoxFit.fill,
                //   ),
                // ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(17.0, 44.0, 337.0, 141.0),
                  size: Size(362.0, 194.0),
                  pinLeft: true,
                  pinRight: true,
                  pinBottom: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          _typePay('Generar QR'),
                          _typePay('Tarjeta de credito')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _typePay(String name) {
    return SizedBox(
      width: 216.0,
      height: 39.0,
      child: FlatButton(
        onPressed: _showMyDialog,
        child: Stack(
          children: <Widget>[
            Pinned.fromSize(
              bounds: Rect.fromLTWH(0.0, 0.0, 216.0, 39.0),
              size: Size(216.0, 39.0),
              pinLeft: true,
              pinRight: true,
              pinTop: true,
              pinBottom: true,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: Colors.white),
                ),
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(41.0, 12.0, 134.0, 16.0),
              size: Size(216.0, 39.0),
              fixedWidth: true,
              fixedHeight: true,
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(186.0, 12.0, 15.0, 15.0),
              size: Size(216.0, 39.0),
              pinRight: true,
              fixedWidth: true,
              fixedHeight: true,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escanea el código'),
          content: Container(
              width: 200,
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: QrImage(
                      data: 'Los Forkis',
                      gapless: true,
                      foregroundColor: Colors.black,
                      size: 180,
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
