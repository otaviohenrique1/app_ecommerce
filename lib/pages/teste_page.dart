import 'package:flutter/material.dart';

class TestePage extends StatefulWidget {
  const TestePage({super.key, required this.title});

  final String title;

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            // Exibir layout para telas maiores
            return const Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to Flutter Web - 1200',
                    style: TextStyle(fontSize: 40),
                  ),
                  Row(
                    children: [
                      CampoTeste1(),
                      CampoTeste1(),
                      CampoTeste1(),
                      CampoTeste1(),
                      CampoTeste1(),
                      CampoTeste1(),
                    ],
                  ),
                ],
              ),
            );
          } else if (constraints.maxWidth > 800) {
            // Exibir layout para telas maiores
            return const Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to Flutter Web - 800',
                    style: TextStyle(fontSize: 32),
                  ),
                  Row(
                    children: [
                      CampoTeste1(),
                      CampoTeste1(),
                      CampoTeste1(),
                    ],
                  ),
                  Row(
                    children: [
                      CampoTeste1(),
                      CampoTeste1(),
                      CampoTeste1(),
                    ],
                  ),
                ],
              ),
            );
          } else if (constraints.maxWidth > 600) {
            // Exibir layout para telas maiores
            return const Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to Flutter Web - 600',
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    children: [
                      CampoTeste1(),
                      CampoTeste1(),
                    ],
                  ),
                  Row(
                    children: [
                      CampoTeste1(),
                      CampoTeste1(),
                    ],
                  ),
                  Row(
                    children: [
                      CampoTeste1(),
                      CampoTeste1(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            // Exibir layout para telas menores
            return const Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to Flutter Web - Small Screen',
                    style: TextStyle(fontSize: 16),
                  ),
                  Column(
                    children: [
                      CampoTeste2(),
                      CampoTeste2(),
                      CampoTeste2(),
                      CampoTeste2(),
                      CampoTeste2(),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class CampoTeste1 extends StatelessWidget {
  const CampoTeste1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(decoration: InputDecoration(hintText: "CampoTeste1")),
      ),
    );
  }
}

class CampoTeste2 extends StatelessWidget {
  const CampoTeste2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(decoration: InputDecoration(hintText: "CampoTeste2")),
    );
  }
}
