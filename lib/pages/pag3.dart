import 'package:flutter/material.dart';

class pag3 extends StatefulWidget {
  @override
  _pag3State createState() => _pag3State();
}

class _pag3State extends State<pag3> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro Pessoal',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 241, 159, 17),
          title: Center(
            child: Text(
              'Cadastro Pessoal',
              style: TextStyle(
                color: Color.fromARGB(181, 48, 43, 43),
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome Completo:',
                    ),
                    enabled: _isEditing,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Sexo:',
                    ),
                    enabled: _isEditing,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Idade:',
                    ),
                    keyboardType: TextInputType.number,
                    enabled: _isEditing,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CPF:',
                    ),
                    enabled: _isEditing,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'RG:',
                    ),
                    enabled: _isEditing,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telefone:',
                    ),
                    keyboardType: TextInputType.phone,
                    enabled: _isEditing,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Tipo Sanguíneo:',
                    ),
                    enabled: _isEditing,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Condições Médicas:',
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    enabled: _isEditing,
                  ),
                  SizedBox(height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _isEditing
                              ? () {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    setState(() {
                                      _isEditing = false;
                                    });
                                  }
                                }
                              : null,
                          child: Text(
                            'Salvar',
                            style:
                                TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _isEditing = true;
                            });
                          },
                          child: Text(
                            'Editar',
                            style:
                                TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
