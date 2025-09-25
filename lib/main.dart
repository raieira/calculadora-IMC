import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppIMC());
}

class MeuAppIMC extends StatelessWidget {
  const MeuAppIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App IMC - SENAC",
      home: const TelaIMC(),
    );
  }
}

class TelaIMC extends StatelessWidget {
  const TelaIMC({super.key});


  Widget blocoValor(String valor, String unidade) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
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
            onPressed: () {},
            icon: const Icon(Icons.remove_circle),
            iconSize: 50, 
          ),
          const SizedBox(width: 15),
          Text(
            valor,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            " $unidade",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
            iconSize: 50, 
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
            
            blocoValor("170", "cm"),

            blocoValor("65", "Kg"),

            const SizedBox(height: 20),

        
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
            const Text(
              "...",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
