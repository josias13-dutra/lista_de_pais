import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/pais_controlles.dart';
import '../models/pais_models.dart';

class BookListView extends StatelessWidget {
  final CountryController _controller = CountryController();

  BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paises de Lingua Portuguesa para Visitar'),
        backgroundColor: Colors.blue, // Cor de fundo do AppBar
      ),
      body: FutureBuilder<List<Country>>(
        future: _controller.getCountries(), // Alterado para getCountries()
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar os Paises: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          } else if (snapshot.hasData) {
            final countries = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(country.image), // Alterado para country.image
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                country.name.toUpperCase(), // Alterado para country.name
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Latitude: ${country.latitude}', // Alterado para country.latitude
                                style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Map Link: ${country.mapLink}', // Alterado para country.mapLink
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}