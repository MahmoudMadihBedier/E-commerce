import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertasks/theminng/colors.dart';

import 'maps_componatnt/api_functionality/fetch_prudect.dart';
import 'maps_componatnt/categiers.dart';
import 'maps_componatnt/product_map.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> futureProducts;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureProducts = _apiService.fetchProducts();

    // Show the dialog after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      _showDialog(context);
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Time\'s Up!'),
          content: Text('You will be redirected to the login screen.'),
          actions: <Widget>[
            TextButton(
              child: Text('Go to Login'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushNamed('/login'); // Navigate to login screen
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            // Categories section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    catigoris.length,
                        (index) {
                      return Card(
                        semanticContainer: true,
                        borderOnForeground: true,
                        color: AppTheme.blueGray,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(Icons.category),
                                iconSize: 40.0,
                              ),
                              Text(
                                catigoris[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Products section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Product>>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No products found');
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(product.image),
                            title: Text(product.title),
                            subtitle: Text(
                              product.description,
                              maxLines: 1, // Limit subtitle to one line
                              overflow: TextOverflow.ellipsis, // Handle overflow
                            ),
                            trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
