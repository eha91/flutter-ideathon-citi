import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ServiceCustomer extends StatefulWidget {
  @override
  _ServiceCustomerState createState() => _ServiceCustomerState();
}

class _ServiceCustomerState extends State<ServiceCustomer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

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
        title: const Text('Pago Servicio'),
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
                  "Flat Button",
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
                        color: const Color(0xff707070),
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
                        color: const Color(0xff707070),
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
            child: Text(
              'Fecha',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xff707070),
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
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _amount(widthScreen) {
    return Container(
        width: widthScreen,
        height: 144.0,
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
            SizedBox(
              width: widthScreen,
              height: 23.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 348.0, 23.0),
                    size: Size(348.0, 23.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(7.0, 3.0, 41.0, 16.0),
                    size: Size(348.0, 23.0),
                    child: Text(
                      'Servicio',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: const Color(0xff707070),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(308.0, 2.0, 33.0, 16.0),
                    size: Size(348.0, 23.0),
                    child: Text(
                      'Precio',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: const Color(0xff707070),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widthScreen,
              height: 94.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 355.0, 94.0),
                    size: Size(355.0, 94.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(258.0, 4.0, 87.0, 82.0),
                    size: Size(355.0, 94.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(9.0, 4.0, 249.0, 82.0),
                    size: Size(355.0, 94.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
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
                fontSize: 20,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(261.0, 15.0, 91.0, 27.0),
            size: Size(362.0, 56.0),
            child: Text(
              'MXN \$250',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _review(widthScreen) {
    return SizedBox(
      width: widthScreen,
      height: 105.0,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 0.0, 362.0, 105.0),
            size: Size(362.0, 105.0),
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
            bounds: Rect.fromLTWH(14.0, 8.0, 94.0, 24.0),
            size: Size(362.0, 105.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(30.0, 12.0, 58.0, 16.0),
            size: Size(362.0, 105.0),
            child: Text(
              'calificacion',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(14.0, 44.0, 344.0, 53.0),
            size: Size(362.0, 105.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(14.0, 44.0, 33.0, 53.0),
            size: Size(362.0, 105.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromSize(
              bounds: Rect.fromLTWH(90.5, 12.6, 15.0, 14.6),
              size: Size(362.0, 105.0),
              child: Text('D')
              // Adobe XD layer: 'Icon ionic-ios-star' (shape)
              // SvgPicture.string(
              //   '<svg viewBox="97.5 431.6 15.0 14.6" ><path transform="translate(95.29, 428.18)" d="M 16.68080520629883 8.418886184692383 L 11.75558090209961 8.418886184692383 L 10.2589282989502 3.746286392211914 C 10.18526744842529 3.518610715866089 9.981026649475098 3.375 9.75 3.375 C 9.518972396850586 3.375 9.314731597900391 3.518610715866089 9.241070747375488 3.746286392211914 L 7.744420051574707 8.418886184692383 L 2.785714387893677 8.418886184692383 L 2.785714387893677 8.418886184692383 C 2.491071462631226 8.418886184692383 2.25 8.67108154296875 2.25 8.979318618774414 C 2.25 9.010842323303223 2.253348112106323 9.045869827270508 2.260044813156128 9.073891639709473 C 2.266741037368774 9.19648551940918 2.3203125 9.333090782165527 2.484375 9.469696044921875 L 6.532366275787354 12.4539966583252 L 4.978794097900391 17.17913627624512 C 4.901785373687744 17.40681266784668 4.978794097900391 17.66250991821289 5.162946224212646 17.80962181091309 C 5.260044097900391 17.8831787109375 5.350446224212646 17.94622802734375 5.464285373687744 17.94622802734375 C 5.574776649475098 17.94622802734375 5.705357551574707 17.88668251037598 5.799106597900391 17.82013130187988 L 9.75 14.87436199188232 L 13.70089244842529 17.82013130187988 C 13.79464244842529 17.89018630981445 13.9252233505249 17.94622802734375 14.0357141494751 17.94622802734375 C 14.1495532989502 17.94622802734375 14.23995494842529 17.88668251037598 14.33370590209961 17.80962181091309 C 14.52120494842529 17.66250991821289 14.5948657989502 17.41031455993652 14.51785755157471 17.17913627624512 L 12.9642858505249 12.45399570465088 L 16.97879600524902 9.44167423248291 L 17.07589530944824 9.354106903076172 C 17.1629467010498 9.256031036376953 17.25 9.122928619384766 17.25 8.979317665100098 C 17.25 8.67108154296875 16.9754467010498 8.418886184692383 16.68080520629883 8.418886184692383 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              //   allowDrawingOutsideViewBox: true,
              //   fit: BoxFit.fill,
              // ),
              ),
          Pinned.fromSize(
              bounds: Rect.fromLTWH(23.0, 63.6, 15.0, 14.0),
              size: Size(362.0, 105.0),
              child: Text('D')
              // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
              // SvgPicture.string(
              //   '<svg viewBox="30.0 482.6 15.0 14.0" ><path transform="translate(30.0, 480.0)" d="M 8.618847846984863 15.70955085754395 L 7.875627517700195 16.42125129699707 C 7.560930252075195 16.72260284423828 7.052058696746826 16.72260284423828 6.74070930480957 16.42125129699707 L 0.2325071543455124 10.19226264953613 C -0.08218986541032791 9.890911102294922 -0.08218986541032791 9.403620719909668 0.2325071543455124 9.105474472045898 L 6.74070930480957 2.873278856277466 C 7.05540657043457 2.571927547454834 7.564278602600098 2.571927547454834 7.875627517700195 2.873278856277466 L 8.618847846984863 3.584980010986328 C 8.936893463134766 3.889537334442139 8.930196762084961 4.386445999145508 8.605456352233887 4.684590816497803 L 4.571309089660645 8.364920616149902 L 14.19300270080566 8.364920616149902 C 14.63826560974121 8.364920616149902 14.99648475646973 8.707948684692383 14.99648475646973 9.13432788848877 L 14.99648475646973 10.16020393371582 C 14.99648475646973 10.58658313751221 14.63826560974121 10.92961025238037 14.19300270080566 10.92961025238037 L 4.571309089660645 10.92961025238037 L 8.605456352233887 14.60994052886963 C 8.933545112609863 14.90808582305908 8.940240859985352 15.40499401092529 8.618847846984863 15.70955085754395 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              //   allowDrawingOutsideViewBox: true,
              //   fit: BoxFit.fill,
              // ),
              ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(325.0, 44.0, 33.0, 53.0),
            size: Size(362.0, 105.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromSize(
              bounds: Rect.fromLTWH(334.0, 62.6, 15.0, 14.0),
              size: Size(362.0, 105.0),
              child: Text('D')
              // Adobe XD layer: 'Icon awesome-arrow-…' (shape)
              // SvgPicture.string(
              //   '<svg viewBox="341.0 481.6 15.0 14.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 355.99, 498.29)" d="M 8.618847846984863 15.70955085754395 L 7.875627517700195 16.42125129699707 C 7.560930252075195 16.72260284423828 7.052058696746826 16.72260284423828 6.74070930480957 16.42125129699707 L 0.2325071543455124 10.19226264953613 C -0.08218986541032791 9.890911102294922 -0.08218986541032791 9.403620719909668 0.2325071543455124 9.105474472045898 L 6.74070930480957 2.873278856277466 C 7.05540657043457 2.571927547454834 7.564278602600098 2.571927547454834 7.875627517700195 2.873278856277466 L 8.618847846984863 3.584980010986328 C 8.936893463134766 3.889537334442139 8.930196762084961 4.386445999145508 8.605456352233887 4.684590816497803 L 4.571309089660645 8.364920616149902 L 14.19300270080566 8.364920616149902 C 14.63826560974121 8.364920616149902 14.99648475646973 8.707948684692383 14.99648475646973 9.13432788848877 L 14.99648475646973 10.16020393371582 C 14.99648475646973 10.58658313751221 14.63826560974121 10.92961025238037 14.19300270080566 10.92961025238037 L 4.571309089660645 10.92961025238037 L 8.605456352233887 14.60994052886963 C 8.933545112609863 14.90808582305908 8.940240859985352 15.40499401092529 8.618847846984863 15.70955085754395 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              //   allowDrawingOutsideViewBox: true,
              //   fit: BoxFit.fill,
              // ),
              ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(57.0, 45.0, 27.0, 15.0),
            size: Size(362.0, 105.0),
            child: Text(
              'name',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 11,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(57.0, 60.0, 251.0, 33.0),
            size: Size(362.0, 105.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(59.0, 66.0, 31.0, 15.0),
            size: Size(362.0, 105.0),
            child: Text(
              'review',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 11,
                color: const Color(0xff707070),
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
                    'Metodo de Pago',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: const Color(0xff707070),
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
                      Border.all(width: 1.0, color: const Color(0xff707070)),
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
                  color: const Color(0xff707070),
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
          title: Text('Escanea el codigo'),
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
                      foregroundColor: Colors.white,
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
