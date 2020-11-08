import 'package:flutter/material.dart';

import 'modal.dart';

class InfoDetail extends StatefulWidget {
  const InfoDetail({Key key}) : super(key: key);

  @override
  _InfoDetailState createState() => _InfoDetailState();
}

class _InfoDetailState extends State<InfoDetail> {

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar', style: TextStyle(color: Color.fromRGBO(5, 109, 174, 1))),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(5, 109, 174, 1)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _infoBussines(context),
            _detail(),
            _actions(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: _reserve(),
            ),
            _horus(),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }



  _infoBussines(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            child: Image(
              image: NetworkImage('https://image.freepik.com/vector-gratis/dibujado-mano-vintage-letrero-color-barberia-clasico-poste-letras-hechas-mano_113045-85.jpg'),
              fit: BoxFit.cover,
              height: size.height*.4,
              width: size.width,
            ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            color: Colors.lightBlueAccent,
            child: Text(
              'Barberia Mario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              )
            ),
          ),
        )
      ],
    );
  }

  _detail() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Maza de Juarez #45,Campamento 2 de Octubre,Iztacalco,CP. 08930'),
            subtitle: Text('A 3 km'),
          ),
          ListTile(
            leading: Icon(Icons.speaker_notes),
            title: Text('Habla Español, Ingles'),
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('40 consultas'),
          )
        ],
      ),
    );
  }

  _actions() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Icon(Icons.phone),
                SizedBox(height: 10),
                Text('Llamar')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Icon(Icons.message),
                SizedBox(height: 10),
                Text('Enviar Mensaje')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Icon(Icons.star_outline),
                SizedBox(height: 10),
                Text('Favoritos')
              ],
            ),
          )
        ],
      ),
    );
  }

  _reserve() {
   return DefaultTabController(
     length: 7,
     initialIndex: 0,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         TabBar(
          labelColor: Colors.black,
          isScrollable: true,
          tabs: [
            _itemDay('Lunes', '07'),
            _itemDay('Martes', '08'),
            _itemDay('Miercoles', '09'),
            _itemDay('Jueves', '10'),
            _itemDay('Viernes', '11'),
            _itemDay('Sabado', '07'),
            _itemDay('Domingo', '07'),
          ],
        ),
        //_horus()
       ],
     ),
   );
  }

  _itemDay(String day,String numero) {
    return Container(
           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
           width: 90,
           child: Column(
             children: [
               Text(day),
               Text(numero)
             ],
           ),
         );
  }

  _horus() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              itemHour('09:00', true),
              itemHour('10:30', false),
              itemHour('12:30', true)
            ],
          ),
          Row(
            children: [
              itemHour('13:00', false),
              itemHour('16:00', false),
              itemHour('12:30', true)
            ],
          ),
          Row(
            children: [
              itemHour('09:00', false),
              itemHour('10:30', true),
              itemHour('12:30', true)
            ],
          ),
        ],
      ),
    );
  }

  itemHour(String hour,bool status) {
    return Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  if(status) {
                    // Navigator.pushNamed(context, 'customer',arguments: {
                    //   'name': 'Barbaria Mario',
                    //   'image': 'https://image.freepik.com/vector-gratis/dibujado-mano-vintage-letrero-color-barberia-clasico-poste-letras-hechas-mano_113045-85.jpg',
                    //   'service': 'Corte de Pelo - Caballero',
                    //   'total': '250.0'
                    // });
                    // Navigator.push(context, route)
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Modal();
                        });
                    // _alert();
                    // Modal();
                  }
                },
                child: Card(
                  color: status ? Colors.lightBlue[50]:Colors.lightBlueAccent,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Text(
                      hour,
                      style: TextStyle(
                        fontSize: 20
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          );
  }

  Widget _alert( ) {
    print("se hizo");
    return AlertDialog(
      content: Modal(),
    );
  }
  
}
