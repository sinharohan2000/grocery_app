import 'package:groceryapp/export.dart';

class ProductItems2 extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProductItems2({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<ProductModel2>(context);

    final cart = Provider.of<Cart>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.network(
                  imageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Card(
              color: Colors.brown[50],
              child: Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          name,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 3),
                                content: Text('Item Added to Cart'),
                              ));
                              cart.addItem(pdt.id, pdt.productName, pdt.price);
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
