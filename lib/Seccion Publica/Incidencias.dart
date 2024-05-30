import 'package:flutter/material.dart';
import 'package:intl/intl.dart';






class Incidencias extends StatefulWidget {
  const Incidencias({Key? key}) : super(key: key);

  @override
  _IncidenciasState createState() => _IncidenciasState();
}

class _IncidenciasState extends State<Incidencias> {
  final _formKey = GlobalKey<FormState>();
  final _fechaController = TextEditingController();
  String? _selectedMotivo;
  String _observaciones = '';
  String _estatus = 'Pendiente';

  final List<String> _motivos = [
    'Caida del Suministro Electrico',
    'Caida del Servicio de Internet',
    'Desastre Natural',
    'Desastre Humano',
    'Fallo Humano',
    'Vulneración del Sistema',
    'Fallo del Software',
    'Fallo de la Base de Datos'
  ];

  final List<Map<String, String>> _incidencias = [
    {
      'fecha': '2023-01-01',
      'motivo': 'Fallo Humano',
      'observaciones': 'Servidor no responde',
      'estatus': 'Pendiente',
    },
    {
      'fecha': '2023-02-15',
      'motivo': 'Caida del Suministro Electrico',
      'observaciones': 'Corte de luz en la zona',
      'estatus': 'Atendido',
    },
    {
      'fecha': '2023-03-20',
      'motivo': 'Fallo Humano',
      'observaciones': 'Error en configuración',
      'estatus': 'Atendido',
    },
  ];

  @override
  void dispose() {
    _fechaController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _fechaController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _incidencias.add({
          'fecha': _fechaController.text,
          'motivo': _selectedMotivo ?? '',
          'observaciones': _observaciones,
          'estatus': _estatus,
        });
      });
      _fechaController.clear();
      _selectedMotivo = null;
      _observaciones = '';
      _estatus = 'Pendiente';
      Navigator.of(context).pop(); // Cierra el formulario después de enviar
    }
  }

  void _showAddIncidenciaForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Agregar Nueva Incidencia',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _fechaController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fecha de la Incidencia',
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _selectDate(context);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese la fecha de la incidencia';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Motivo',
                      ),
                      value: _selectedMotivo,
                      items: _motivos.map((String motivo) {
                        return DropdownMenuItem<String>(
                          value: motivo,
                          child: Text(motivo),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMotivo = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor seleccione un motivo';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Observaciones',
                      ),
                      maxLines: 3,
                      onSaved: (value) {
                        _observaciones = value ?? '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese observaciones';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Guardar'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _editIncidencia(int index) {
    Map<String, String> incidencia = _incidencias[index];
    _fechaController.text = incidencia['fecha']!;
    _selectedMotivo = incidencia['motivo'];
    _observaciones = incidencia['observaciones']!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Editar Incidencia',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _fechaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fecha de la Incidencia',
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la fecha de la incidencia';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Motivo',
                    ),
                    value: _selectedMotivo,
                    items: _motivos.map((String motivo) {
                      return DropdownMenuItem<String>(
                        value: motivo,
                        child: Text(motivo),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMotivo = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor seleccione un motivo';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _observaciones,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Observaciones',
                    ),
                    maxLines: 3,
                    onSaved: (value) {
                      _observaciones = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese observaciones';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    _incidencias[index] = {
                      'fecha': _fechaController.text,
                      'motivo': _selectedMotivo ?? '',
                      'observaciones': _observaciones,
                      'estatus': 'Pendiente',
                    };
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Guardar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getBackgroundColor(String status) {
    if (status == 'Pendiente') {
      return Colors.yellow.shade100;
    } else if (status == 'Atendido') {
      return Colors.green.shade100;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF002345),
        title: Text(
          'Listado de Incidencias',
          style: TextStyle(
            fontFamily: 'Teko',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _showAddIncidenciaForm,
                child: Text('Agregar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: _incidencias.length,
                itemBuilder: (context, index) {
                  final incidencia = _incidencias[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    color: _getBackgroundColor(incidencia['estatus']!),
                    child: ListTile(
                      title: Text('Fecha: ${incidencia['fecha']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Motivo: ${incidencia['motivo']}'),
                          Text('Observaciones: ${incidencia['observaciones']}'),
                          Text('Estatus: ${incidencia['estatus']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editIncidencia(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
