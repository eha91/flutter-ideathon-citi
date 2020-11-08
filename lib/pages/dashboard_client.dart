import 'package:flutter/material.dart';
import 'search.dart';

class DashboardClient extends StatefulWidget {
  DashboardClient({Key key}) : super(key: key);
  final List<String> listist = [
    "Fotógrafo",
    "Periodista",
    "Actor",
    "Relojero",
    "Pintor",
    "Programador",
    "Peluquero",
    "Ingles",
    "Musico",
    "Cantante",
    "Matematico",
    "Doctor",
    "Psicologo",
    "Dentista",
    "Barberia Mario"
  ];
  @override
  _DashboardClientState createState() => _DashboardClientState();
}

class _DashboardClientState extends State<DashboardClient> {

  final images1 = [
    'https://image.freepik.com/vector-gratis/dibujado-mano-vintage-letrero-color-barberia-clasico-poste-letras-hechas-mano_113045-85.jpg',
    'https://www.queestudiar.org/wp-content/uploads/2017/10/mecanico-720x350.jpg',
    'https://oaxaca.quadratin.com.mx/www/wp-content/uploads/2020/06/plomeria-1160x700.jpg'
  ];

  final images2 = [
    'https://blog.lancopaints.com/wp-content/uploads/2019/03/shutterstock_659553058-1.jpg',
    'https://previews.123rf.com/images/dolgachov/dolgachov1610/dolgachov161012005/64860816-profesi%C3%B3n-carpinter%C3%ADa-ebanister%C3%ADa-y-el-concepto-de-la-gente-carpintero-con-tablones-de-madera-martillo-y-un.jpg',
    'https://fundacioncarlosslim.org/wp-content/uploads/2020/05/curso-estilista-1.jpg'
  ];

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/originals/19/87/90/198790eb7e08830027c1ae1686496c72.png'),
          ),
          tooltip: 'Usuario',
          onPressed: () {},
        ),
        title: Center(
          child: Image(
            height: 40,
            image: AssetImage('assets/logo.jpeg'),
          ),
        ),
        actions: [
          Icon(Icons.notification_important,color: Color.fromRGBO(5, 109, 174, 1),)
        ]
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _serach(),
            SizedBox(
              height: 20,
            ),
             Container(
               padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
               width: double.infinity,
               child: Text(
                 'Mejor rankeados',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
               ),
             ),
             Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context,int index) {
                  final name1 = [
                    'Raymundo Sanchez',
                    'Eduardo Hernandez',
                    'Raphael Vazquez'
                  ];
                  final services1 = [
                    'Barberia Mario',
                    'Mecanico Tallachas',
                    'Plomeria Express'
                  ];
                  return _card(
                    name1[index],
                    services1[index],
                    images1[index],
                    context
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
               padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
               width: double.infinity,
               child: Text(
                 'Nuevos proveedores de servicios',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
               ),
             ),
             Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context,int index) {
                  final name1 = [
                    'Luis Sanches',
                    'Eusebio Gonzales',
                    'Maria Martinez'
                  ];
                  final services1 = [
                    'Pintura y acabados',
                    'Carpintero',
                    'Estilista'
                  ];
                  return _card(
                    name1[index],
                    services1[index],
                    images2[index],
                    context
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _serach() {
    return Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Stack(
                  children: [
                    Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                      ),
                    ),

                    child: GestureDetector(
                      onTap: () {
                        showSearch(context: context, delegate: Search(widget.listist));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color.fromRGBO(5, 109, 174, 1),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text("Buscar por oficio o código postal")

                        ],
                      ),
                    ),
                  ),
                  ]
                ),
              ),
            );
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
                final name1 = [
                  'Raymundo Sanchez',
                  'Eduardo Hernandez',
                  'Raphael Vazquez'
                ];
                final services1 = [
                  'Barberia Mario',
                  'Mecanico Tallachas',
                  'Plomeria Express'
                ];
                return _card(
                  name1[index],
                  services1[index],
                  images1[index],
                  context
                );
              },
          ),
          Text(
            'Mejor Rankeados',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 24
            ),
          ),
        ],
      ),
    );
  }

  _item2() {
    return Container();
  }

  _card(String name,String service,String image,BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 300,
      height: 200,
      child: GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, 'info-detail')
        },
        child: Card(
          child: Column(
            children: [
              Image(
                height: 130,
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              Container(
                color: Color.fromRGBO(5, 109, 174, 1),
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                children: [
                  Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  Center(
                    child: Text(
                      service,
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
            ],
          ),
        ),
      ),
    );
  }
}