import 'package:flutter/material.dart';
import '../models/abastecimento.dart';
import '../services/abastecimento_service.dart';

class AdicionarAbastecimento extends StatefulWidget {
  @override
  _AdicionarAbastecimentoState createState() => _AdicionarAbastecimentoState();
}

class _AdicionarAbastecimentoState extends State<AdicionarAbastecimento> {
  final _formKey = GlobalKey<FormState>();
  final _dataController = TextEditingController();
  final _kmController = TextEditingController();
  final _litrosController = TextEditingController();
  final _valorController = TextEditingController();

  void salvar() async {
    if (_formKey.currentState!.validate()) {
      final novo = Abastecimento(
        data: _dataController.text,
        km: double.parse(_kmController.text),
        litros: double.parse(_litrosController.text),
        valor: double.parse(_valorController.text),
      );

      await AbastecimentoService().salvar(novo);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _dataController.dispose();
    _kmController.dispose();
    _litrosController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Abastecimento'),
        backgroundColor: Color(0xFF90CAF9),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(labelText: 'Data'),
                validator: (v) => v == null || v.isEmpty ? 'Informe a data' : null,
              ),
              TextFormField(
                controller: _kmController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quilometragem'),
                validator: (v) => v == null || v.isEmpty ? 'Informe o km' : null,
              ),
              TextFormField(
                controller: _litrosController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Litros abastecidos'),
                validator: (v) => v == null || v.isEmpty ? 'Informe os litros' : null,
              ),
              TextFormField(
                controller: _valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Valor total'),
                validator: (v) => v == null || v.isEmpty ? 'Informe o valor' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: salvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF90CAF9),
                ),
                child: Text('Salvar', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
