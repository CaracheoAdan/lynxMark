import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  @override
  _ProductReviewScreenState createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  double _rating = 4;
  final _controller = TextEditingController();
  String selectedFilter = 'recientes';

  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'María González',
      'rating': 5,
      'comment':
          '¡Excelente hamburguesa! La carne estaba perfectamente cocida y los ingredientes muy frescos. Definitivamente volveré a comprar.',
    },
    {
      'name': 'Carlos Ruiz',
      'rating': 4,
      'comment':
          'Muy buena relación calidad-precio. La entrega fue rápida y la comida llegó caliente.',
    },
    {
      'name': 'Ana Martínez',
      'rating': 3,
      'comment':
          'La hamburguesa estaba bien, pero me hubiera gustado que tuviera más opciones de personalización.',
    },
  ];

  double get averageRating {
    if (reviews.isEmpty) return 0;
    return reviews.map((r) => r['rating'] as int).reduce((a, b) => a + b) /
        reviews.length;
  }

  void _submitReview() {
    if (_controller.text.trim().length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Tu comentario debe tener al menos 10 caracteres.')),
      );
      return;
    }

    setState(() {
      reviews.insert(0, {
        'name': 'Usuario Anónimo',
        'rating': _rating.toInt(),
        'comment': _controller.text,
      });
      _controller.clear();
      _rating = 4;
    });
  }

  Widget _buildStarRating({double rating = 0}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 16,
        );
      }),
    );
  }

  Widget _buildFilterChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChoiceChip(
          label: Text('Más recientes'),
          selected: selectedFilter == 'recientes',
          onSelected: (_) => setState(() => selectedFilter = 'recientes'),
        ),
        ChoiceChip(
          label: Text('Mejor puntuados'),
          selected: selectedFilter == 'mejores',
          onSelected: (_) => setState(() => selectedFilter = 'mejores'),
        ),
        ChoiceChip(
          label: Text('Más útiles'),
          selected: selectedFilter == 'utiles',
          onSelected: (_) => setState(() => selectedFilter = 'utiles'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hamburguesa Clásica')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Vendido por: Juan Pérez', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              'Calificación promedio: ${averageRating.toStringAsFixed(1)} ⭐',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Califica tu compra',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() => _rating = index + 1.0);
                  },
                );
              }),
            ),
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Comparte tu experiencia con este producto...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => _controller.clear(),
                    child: Text('Limpiar')),
              ],
            ),
            ElevatedButton(
              onPressed: _submitReview,
              child: Text('Enviar Reseña'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            Divider(height: 30),
            _buildFilterChips(),
            Divider(),
            ...reviews.map((review) => Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(review['name'][0]),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(review['name'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        _buildStarRating(rating: review['rating'].toDouble()),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(review['comment']),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
