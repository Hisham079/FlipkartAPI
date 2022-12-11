import 'package:flipkart_page/apiRepo/api_repo.dart';
import 'package:flipkart_page/product_model.dart';
import 'package:flipkart_page/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Products>> futureProduct;
  @override
  void initState() {
   
    futureProduct = ApiRepo().fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  ApiRepo().add_product(
                    ' shirt',
                    '2000',
                    'Mens casual shirt ',
                    'Fashion',
                    'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                    {"rate": 3.9, "count": 120},
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        backgroundColor: Color.fromRGBO(234, 233, 233, 1),
        body: FutureBuilder<List<Products>>(
          future: futureProduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 450,
                    crossAxisCount: 2,
                    crossAxisSpacing: 3.5,
                    mainAxisSpacing: 3.5),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    product: snapshot.data![index],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
