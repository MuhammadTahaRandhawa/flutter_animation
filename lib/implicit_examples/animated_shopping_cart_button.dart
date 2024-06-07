import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool _isExpended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpended = !_isExpended;
            });
          },
          child: AnimatedContainer(
            width: _isExpended ? 200 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: _isExpended ? Colors.green : Colors.blue,
              borderRadius: _isExpended
                  ? BorderRadius.circular(30.0)
                  : BorderRadius.circular(10.0),
            ),
            duration: const Duration(seconds: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                if (_isExpended)
                  const Text(
                    'Added To Cart!',
                    style: TextStyle(color: Colors.white),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
