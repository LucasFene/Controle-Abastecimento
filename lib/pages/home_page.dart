import 'package:flutter/material.dart';
import '../models/abastecimento.dart';
import '../services/abastecimento_service.dart';
import 'adicionar_abastecimento.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Abastecimento> lista = [];

  @override
  void initState() {
    super.initState();
    carregar();
  }

  Future<void> carregar() async {
    final dados = await AbastecimentoService().buscarTodos();
    setState(() {
      lista = dados;
    });
  }

  double calcularMedia() {
    if (lista.length < 2) return 0;
    final kmRodado = lista.last.km - lista.first.km;
    final litrosTotais = lista.fold(0.0, (sum, e) => sum + e.litros);
    return kmRodado / litrosTotais;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        elevation: 0,
        title: Text(
          'Abastecimentos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              children: [
                Text('Média de consumo', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text(
                  '${calcularMedia().toStringAsFixed(2)} km/L',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AdicionarAbastecimento()),
                    );
                    carregar();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF90CAF9),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: Icon(Icons.local_gas_station, color: Colors.white),
                  label: Text(
                    'Adicionar Combustível',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Histórico de abastecimentos',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (_, i) {
                final item = lista[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.local_gas_station, color: Colors.green),
                    title: Text('${item.km.toStringAsFixed(0)} km - ${item.litros.toStringAsFixed(2)} L'),
                    subtitle: Text(item.data),
                    trailing: Text(
                      'R\$ ${item.valor.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
