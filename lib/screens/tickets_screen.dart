import 'package:flutter/material.dart';
import 'package:museo_punchao/utils/app_theme.dart';
import 'package:museo_punchao/widgets/primary_button.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  int _adultsCount = 1;
  int _childrenCount = 0;
  int _seniorsCount = 0;

  final double _adultPrice = 15.0;
  final double _childPrice = 8.0;
  final double _seniorPrice = 10.0;

  double get _totalPrice =>
      (_adultsCount * _adultPrice) +
      (_childrenCount * _childPrice) +
      (_seniorsCount * _seniorPrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Entradas'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ENTRADAS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textWhite,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Selecciona la cantidad de entradas',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(height: 32),
                // Adults
                _buildTicketCounter(
                  'Adultos',
                  'S/ $_adultPrice',
                  _adultsCount,
                  (value) => setState(() => _adultsCount = value),
                  Icons.person,
                ),
                const SizedBox(height: 16),
                // Children
                _buildTicketCounter(
                  'Niños (5-12 años)',
                  'S/ $_childPrice',
                  _childrenCount,
                  (value) => setState(() => _childrenCount = value),
                  Icons.child_care,
                ),
                const SizedBox(height: 16),
                // Seniors
                _buildTicketCounter(
                  'Tercera Edad (60+)',
                  'S/ $_seniorPrice',
                  _seniorsCount,
                  (value) => setState(() => _seniorsCount = value),
                  Icons.elderly,
                ),
                const SizedBox(height: 32),
                // Total
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.accentTurquoise.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.accentTurquoise,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textWhite,
                        ),
                      ),
                      Text(
                        'S/ ${_totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentTurquoise,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Purchase Button
                PrimaryButton(
                  text: 'COMPRAR ENTRADAS',
                  icon: Icons.shopping_cart,
                  width: double.infinity,
                  onPressed: _totalPrice > 0
                      ? () {
                          _showPurchaseDialog();
                        }
                      : () {},
                ),
                const SizedBox(height: 16),
                // Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppColors.accentTurquoise,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Información',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        '• Horario: Martes a Domingo de 9:00 AM a 6:00 PM\n'
                        '• Las entradas son válidas por un día\n'
                        '• Los niños menores de 5 años entran gratis\n'
                        '• Descuento especial para estudiantes con carnet',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketCounter(
    String title,
    String price,
    int count,
    Function(int) onChanged,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryPurpleLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accentTurquoise.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentTurquoise,
            ),
            child: Icon(
              icon,
              color: AppColors.textWhite,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: AppColors.accentTurquoise,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: count > 0
                    ? () => onChanged(count - 1)
                    : null,
                icon: const Icon(Icons.remove_circle_outline),
                color: AppColors.accentTurquoise,
              ),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => onChanged(count + 1),
                icon: const Icon(Icons.add_circle_outline),
                color: AppColors.accentTurquoise,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.primaryPurpleLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          '¡Compra Exitosa!',
          style: TextStyle(color: AppColors.textWhite),
        ),
        content: Text(
          'Has comprado:\n'
          '${_adultsCount > 0 ? '• $_adultsCount adulto(s)\n' : ''}'
          '${_childrenCount > 0 ? '• $_childrenCount niño(s)\n' : ''}'
          '${_seniorsCount > 0 ? '• $_seniorsCount tercera edad\n' : ''}'
          '\nTotal: S/ ${_totalPrice.toStringAsFixed(2)}\n\n'
          'Recibirás un correo con tus tickets.',
          style: const TextStyle(color: AppColors.textWhite),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'ACEPTAR',
              style: TextStyle(color: AppColors.accentTurquoise),
            ),
          ),
        ],
      ),
    );
  }
}
