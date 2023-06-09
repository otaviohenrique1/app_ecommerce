import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

String geraUuid() {
  Uuid uuid = const Uuid();
  String resultado = uuid.v4();
  return resultado;
}

String geraDataHoraFormatada() {
  return DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
}

String geraHoraFormatada() {
  return DateFormat('HH:mm:ss').format(DateTime.now());
}

String geraDataFormatada() {
  return DateFormat('dd/MM/yyyy').format(DateTime.now());
}
