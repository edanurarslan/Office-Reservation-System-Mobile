import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/common/common.dart';

class FloorplanPage extends ConsumerWidget {
  const FloorplanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppLayout(
      currentRoute: '/floorplan',
      title: 'Kat Planı',
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1. Kat - Ofis A',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      DropdownButton<String>(
                        value: '1. Kat',
                        items: ['1. Kat', '2. Kat', '3. Kat']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Simplified floorplan grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      final isOccupied = index % 3 == 0;
                      return InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Masa ${index + 1} seçildi')),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isOccupied ? Colors.red[100] : Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isOccupied ? Colors.red : Colors.green,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.desk,
                                color: isOccupied ? Colors.red[700] : Colors.green[700],
                                size: 20,
                              ),
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: isOccupied ? Colors.red[700] : Colors.green[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegend('Müsait', Colors.green),
                      const SizedBox(width: 24),
                      _buildLegend('Dolu', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(String label, Color color) {
    final bgColor = color == Colors.green ? Colors.green[100]! : Colors.red[100]!;
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
