import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  Modal({Key key}) : super(key: key);

  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  int _state = 0;

  String _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(change(_state)['text']),
      content: Container(
          width: 326,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              change(_state)['step'],
              FlatButton(
                child: Text("Continuar"),
                disabledColor: Colors.blueGrey,
                onPressed: () {
                  setState(() {
                    _state = _state + 1;
                    if (_state > 2) {
                      Navigator.pushNamed(context, 'customer',arguments: {
                        'name': 'Barbaria Mario',
                        'image': 'https://image.freepik.com/vector-gratis/dibujado-mano-vintage-letrero-color-barberia-clasico-poste-letras-hechas-mano_113045-85.jpg',
                        'service': 'Corte de Pelo - Caballero',
                        'total': '250.0'
                      });
                    }
                  });
                },
                // child:
              )
            ],
          )),
    );
  }

  change(state) {
    switch (state) {
      case 0:
        return {
          "text": "Por favor seleccione un tipo de servicio ",
          "step": Drop()
        };
      case 1:
        return {
          "text": "Si desea Agregar detalles, porfavor escribalos(opcional)",
          "step": Coment()
        };
      case 2:
        return {"text": "Cotizacion", "step": Cotizacion()};
      default:
        return { "text": "Por favor seleccione un tipo de servicio ",
          "step": Drop()
        };
    }
  }

  Widget Drop() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text('Seleccione un servicio'),
          value: _dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              _dropdownValue = newValue;
            });
          },
          items: <String>['Corte Regular', 'Corte moicano', 'Tinte', 'Rasurado']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget Cotizacion() {
    return Center(
        child: Container(
            height: 120,
            child: Column(children: [
              Text(
                "Por este servicio se le cobrará",
              ),
              Text(
                "1,000 MXN",
              ),
            ])));
  }

  Widget Coment() {
    return Center(
        child: Container(
          height: 120,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Maximo 500 caracteres'),
          ),
        ));
  }
}
