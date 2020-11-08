import 'package:flutter/material.dart';

import 'modal.dart';

class InfoDetail extends StatefulWidget {
  const InfoDetail({Key key}) : super(key: key);

  @override
  _InfoDetailState createState() => _InfoDetailState();
}

class _InfoDetailState extends State<InfoDetail> {

  TabController tabController;
  bool isSwitched = false;

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
            //_actions(),
            _moth(),
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
          top: 10,
          right: 10,
          child: Container(
            child: Row(
              children: [
                Icon(Icons.star_outline,color: Colors.blue,),
                Icon(Icons.star_outline,color: Colors.blue,),
                Icon(Icons.star_outline,color: Colors.blue,),
                Icon(Icons.star_outline,color: Colors.blue,),
                Icon(Icons.star_outline,color: Colors.blue,),
              ],
            ),
          ),
        ),
        Positioned(
          width: 300,
          bottom: 15,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            color: Color.fromRGBO(5, 109, 174, 1),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Raymundo Sanchez',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Center(
                  child: Text(
                    'Barberia Mario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    )
                  ),
                )
              ],
            )
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
            leading: Icon(Icons.location_on,color: Color.fromRGBO(5, 109, 174, 1)),
            title: Text('Maza de Juarez #45,Campamento 2 de Octubre,Iztacalco,CP. 08930'),
            subtitle: Text('A 3 km'),
          ),
          ListTile(
            leading: Icon(Icons.public,color: Color.fromRGBO(5, 109, 174, 1)),
            title: Text('Habla Español, Ingles'),
          ),
          ListTile(
            leading: Icon(Icons.trending_up,color: Color.fromRGBO(5, 109, 174, 1)),
            title: Text('40 Servicios Realizados'),
          ),
          ListTile(
            leading: Switch(value: isSwitched, onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            }),
            title: Text('¿Agregar a mi red?'),
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
              itemHour('9 - 10 am', true),
              itemHour('10 a 11 am', false),
              itemHour('11 a 12 am', true)
            ],
          ),
          Row(
            children: [
              itemHour('1 a 2 pm', false),
              itemHour('2 a 3 pm', false),
              itemHour('4 a 5 pm', true)
            ],
          ),
        ],
      ),
    );
  }

  itemHour(String hour,bool status) {
    return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
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
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        child: Text(
                          hour,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: status ? Colors.blue:Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          status ? 'Disponible':'No disponible',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
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
  
  _moth() {
    return Container(
      child: Column(
        children: [
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Center(
              child: Text('Agenda - Noviembre'),
            ),
            trailing: Icon(Icons.chevron_right),
            
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
  
}
