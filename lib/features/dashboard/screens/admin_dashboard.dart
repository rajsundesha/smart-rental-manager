import 'package:flutter/material.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/property_overview_card.dart';
import '../widgets/revenue_chart.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Show notifications
            },
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Show profile options
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Actions Grid
            _buildQuickActionsGrid(),
            
            const SizedBox(height: 24),
            
            // Properties Overview
            _buildPropertiesOverview(),
            
            const SizedBox(height: 24),
            
            // Revenue Chart
            _buildRevenueSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Start property creation wizard
        },
        label: const Text('Add Property'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: const [
        QuickActionCard(
          title: 'Properties',
          icon: Icons.home,
          count: '12',
          color: Colors.blue,
        ),
        QuickActionCard(
          title: 'Tenants',
          icon: Icons.people,
          count: '45',
          color: Colors.green,
        ),
        QuickActionCard(
          title: 'Maintenance',
          icon: Icons.build,
          count: '3',
          color: Colors.orange,
        ),
        QuickActionCard(
          title: 'Payments',
          icon: Icons.payments,
          count: '₹52,000',
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildPropertiesOverview() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Properties Overview',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        PropertyOverviewCard(),
      ],
    );
  }

  Widget _buildRevenueSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Revenue Overview',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        RevenueChart(),
      ],
    );
  }
}
