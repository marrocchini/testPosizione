// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';

Future<String> ritornaApiCall(List<String> nome) async {
  // Add your function code here!
  try {
    final client = HttpClient();
    final request = await client.postUrl(Uri.parse(
        'https://us-central1-beeto-test.cloudfunctions.net/perTutti'));
    // Aggiungi un header di autorizzazione se necessario
    request.headers.add("Content-Type", "application/json");
    final bearerToken =
        "ya29.a0Ad52N39DLDZ3fJm3J2OZQGX8Fi5Ceec3IEYim3qJDFgkd-aBJvQwpIPAJ2ro5zqH_4RzjgWU7BRKoBTuMtRZT8ZY_kpCsOXzEoJsMF6iq5DRrMVPWaqh5B6jBDd3IVBcrvsPZ39Aid6MtD0rP4m9BPW0sLsVi7LBCJaDfXnScpntpx2D6Ch-3pbmSplsfANyj0Ru0dYHPZ2NS44Ymg-XCpbGNsQyVYn9rNuCaDbabeqXkV8VIy5aBMi8GNNB7eNJ68Clhas1XBgu32bVVNLiu5mnrOkM8pI729LdStG_OByZi2si6TOv94g4PUVFjk17H7xewPNBsd5d4rp1P8rny5ucLF3Jkh9qD9JbkbCsB58gr7Z5Yls8U3kFHSuxAAtDriPVaiTtranmQCgAKJta-oXfsdkaCgYKAQ8SARESFQHGX2MiU6zqlp1az2f7AK19TcrMdw0418";
    // Crea una mappa JSON con i dati del corpo
    request.headers.add("Authorization", "Bearer $bearerToken");
    final jsonData = {'nome': nome};

    // Codifica la mappa JSON in una stringa
    final jsonString = jsonEncode(jsonData);

    // Aggiungi la stringa JSON al corpo della richiesta
    request.add(utf8.encode(jsonString));

    // Invia la richiesta e attendi la risposta
    final response = await request.close();

    // Controlla lo stato della risposta
    if (response.statusCode == HttpStatus.ok) {
      return "La richiesta è andata a buon fine";
    } else {
      return "Si è verificato un errore";

      // Si è verificato un errore
    }
  } catch (e) {
    return e.toString();
  }
}
