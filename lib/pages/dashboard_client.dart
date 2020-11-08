import 'package:flutter/material.dart';

class DashboardClient extends StatefulWidget {
  DashboardClient({Key key}) : super(key: key);

  @override
  _DashboardClientState createState() => _DashboardClientState();
}

class _DashboardClientState extends State<DashboardClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.person_rounded,
              color: Color.fromRGBO(5, 109, 174, 1)),
          tooltip: 'Usuario',
          onPressed: () {},
        ),
        title: Text('Cliente'),
        actions: [
          Icon(Icons.notification_important,color: Color.fromRGBO(5, 109, 174, 1),)
        ]
      ),
      body: Container(
        child: Column(
          children: [
            _serach(),
             Text('Mejor rankeados'),
             IntrinsicHeight(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context,int index) {
                  return _card(
                    'Raymundo Sánchez',
                    'Barberia Mario',
                    'https://www.queestudiar.org/wp-content/uploads/2017/10/mecanico-720x350.jpg'
                  );
                },
              ),
            ),
            _item2()
          ],
        ),
      ),
    );
  }

  _serach() {
    return Container();
  }

  _item1() {
    return Container(
      child: Column(
        children: [
          Text(
            'Mejor Rankeados',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 24
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context,int index) {
                return _card(
                  'Raymundo Sánchez',
                  'Barberia Mario',
                  'https://www.queestudiar.org/wp-content/uploads/2017/10/mecanico-720x350.jpg'
                );
              },
          ),
          Text('Nuevos proveedores de servicios')
        ],
      ),
    );
  }

  _item2() {
    return Container();
  }

  _card(String name,String service,String image) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.yellow,
      child: Card(
        child: Column(
          children: [
            Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}