import 'package:flutter/material.dart';
import 'package:safeloan/app/widgets/category_card.dart';

class ListCategoryByWeeks extends StatelessWidget {
  const ListCategoryByWeeks({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kategori Mingguan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
               CategoryCard(
                  icon: Icons.money,
                  judul: "Gaji Bulan Juni",
                  date: "24 Juni 2024",
                  nominal: "2.000.000",
                  colorNominal: Colors.green, // Income color
                ),
                CategoryCard(
                  icon: Icons.shopping_cart,
                  judul: "Belanja bulanan",
                  date: "24 Juni 2024",
                  nominal: "500.000",
                  colorNominal: Colors.red, // Expense color
                ),
                CategoryCard(
                  icon: Icons.fastfood,
                  judul: "Makan hari ini",
                  date: "24 Juni 2024",
                  nominal: "100.000",
                  colorNominal: Colors.red, // Expense color
                ),
                CategoryCard(
                  icon: Icons.work,
                  judul: "Bonus lembur",
                  date: "23 Juni 2024",
                  nominal: "500.000",
                  colorNominal: Colors.green, // Income color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}