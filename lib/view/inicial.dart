import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App IMC - SENAC",
      home: const TelaIMC(),
    );
  }
}

class TelaIMC extends StatefulWidget {
  const TelaIMC({super.key});

  @override
  State<TelaIMC> createState() => _TelaIMCState();
}

class _TelaIMCState extends State<TelaIMC> {
  int altura = 170; 
  int peso = 65;   
  String resultado = "";


  void calcularIMC() {
    double alturaMetros = altura / 100;
    double imc = peso / (alturaMetros * alturaMetros);

    String classificacao;
    if (imc < 18.5) {
    classificacao = "Magreza";
    } else if (imc < 24.9) {
    classificacao = "Normal";
    } else if (imc < 29.9) {
    classificacao = "Sobrepeso";
    } else if (imc < 39.9) {
    classificacao = "Obesidade";
    } else {
    classificacao = "Obesidade Grave";
    }


    setState(() {
    resultado = "IMC: ${imc.toStringAsFixed(1)} - $classificacao";
    });
  }


  Widget blocoValor({
    required int valor,
    required String unidade,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove_circle),
            iconSize: 80,
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$valor',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                unidade,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add_circle),
            iconSize: 80,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("App IMC - SENAC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            blocoValor(
              valor: altura,
              unidade: 'cm',
              onIncrement: () {
                setState(() {
                  altura++;
                });
              },
              onDecrement: () {
                setState(() {
                  altura--;
                });
              },
            ),
            blocoValor(
              valor: peso,
              unidade: 'Kg',
              onIncrement: () {
                setState(() {
                  peso++;
                });
              },
              onDecrement: () {
                setState(() {
                  peso--;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Calcular",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Resultado:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
