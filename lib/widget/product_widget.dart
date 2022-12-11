import 'package:flipkart_page/apiRepo/api_repo.dart';
import 'package:flipkart_page/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  ProductWidget({super.key, required this.product});
  Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurStyle: BlurStyle.normal,
            )
          ],
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 245, 243, 243)),
      height: 305,
      width: 180,
      child: Column(
        children: [
          Image.network(
            product.image.toString(),
            width: 115,
            height: 140,
          ),
          Text(product.id.toString()),
          Text(
            product.title.toString(),
            style: GoogleFonts.adamina(fontSize: 12),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                FontAwesomeIcons.star,
                size: 13,
                color: Color.fromARGB(255, 167, 154, 45),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(product.rating.toString())
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 86),
            child: Text(
              product.title.toString(),
            ),
          ),
          Text(
            product.category.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.adamina(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 129),
            child: Text(product.price.toString()),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              TextButton(
                  onPressed: () {
                    ApiRepo().update_product(
                        product.id.toString(), 'Name changed', '1000');
                  },
                  child: Text(
                    'Update',
                    style: GoogleFonts.adamina(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 16, 110, 187)),
                  )),
              const SizedBox(
                width: 15,
                height: 45,
              ),
              TextButton(
                  onPressed: () {
                    ApiRepo().delet_product(product.id.toString());
                  },
                  child: Text(
                    'Delete',
                    style: GoogleFonts.adamina(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 16, 110, 187)),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
