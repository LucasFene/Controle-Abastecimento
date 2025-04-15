import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/abastecimento.dart';

class AbastecimentoService {
  static const _key = 'abastecimentos';

  Future<void> salvar(Abastecimento ab) async {
    final prefs = await SharedPreferences.getInstance();
    final lista = await buscarTodos();
    lista.add(ab);
    final jsonList = lista.map((e) => jsonEncode(e.toMap())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  Future<List<Abastecimento>> buscarTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList.map((e) => Abastecimento.fromMap(jsonDecode(e))).toList();
  }
}
