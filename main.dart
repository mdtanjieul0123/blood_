import 'package:flutter/material.dart';

void main() {
  runApp(const BloodRequestApp());
}

class BloodRequestApp extends StatelessWidget {
  const BloodRequestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Requests',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF12376B),
        ),
      ),
      home: const BloodRequestsPage(),
    );
  }
}

class BloodRequestsPage extends StatelessWidget {
  const BloodRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 18),

            // Page Title
            const Text(
              'Blood Requests',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xFF172B4D),
              ),
            ),

            const SizedBox(height: 28),

            // Request Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                children: const [
                  BloodRequestCard(
                    bloodGroup: 'O-',
                    units: '3 Units',
                  ),
                  SizedBox(height: 20),
                  BloodRequestCard(
                    bloodGroup: 'O+',
                    units: '2 Units',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  final String bloodGroup;
  final String units;

  const BloodRequestCard({
    super.key,
    required this.bloodGroup,
    required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE3E7EB),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Red left border
            Container(
              width: 7,
              color: const Color(0xFFE51C2A),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Urgent + Units
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE3E5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'URGENT',
                            style: TextStyle(
                              color: Color(0xFFD91E2B),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.water_drop,
                              size: 22,
                              color: Color(0xFFE51C2A),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              units,
                              style: const TextStyle(
                                color: Color(0xFF202938),
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Blood group title
                    Text(
                      '$bloodGroup Blood Needed',
                      style: const TextStyle(
                        color: Color(0xFF12376B),
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        height: 1.15,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Location
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF7A8798),
                          size: 24,
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Text(
                            'Khulna City Medical College Hospital, KDA Ave...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF718096),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // View Details button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFF12376B),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}