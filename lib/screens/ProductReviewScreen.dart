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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ChoiceChip(
            label: Text('Más recientes'),
            selected: selectedFilter == 'recientes',
            onSelected: (_) => setState(() => selectedFilter = 'recientes'),
          ),
          SizedBox(width: 8),
          ChoiceChip(
            label: Text('Mejor puntuados'),
            selected: selectedFilter == 'mejores',
            onSelected: (_) => setState(() => selectedFilter = 'mejores'),
          ),
          SizedBox(width: 8),
          ChoiceChip(
            label: Text('Más útiles'),
            selected: selectedFilter == 'utiles',
            onSelected: (_) => setState(() => selectedFilter = 'utiles'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Parte superior con imagen y texto
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/hamburguesa.jpg',
                      width: 90,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hamburguesa Clásica',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Vendido por: Juan Pérez',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),

              // Califica tu compra
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Califica tu compra",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return IconButton(
                          padding: EdgeInsets.zero,
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
                    SizedBox(height: 8),
                    TextField(
                      controller: _controller,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Comparte tu experiencia con este producto...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitReview,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF004AAD),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text("Enviar Reseña",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildFilterChips(),
              SizedBox(height: 12),
              ...reviews.map((review) => Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Text(review['name'][0]),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(review['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          _buildStarRating(rating: review['rating'].toDouble()),
                          SizedBox(height: 4),
                          Text(review['comment']),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
