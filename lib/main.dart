
import 'package:flutter/material.dart';

void main() {
  runApp(const TatweerApp());
}

const gold = Color(0xFFD4AF37);
const dark = Color(0xFF101010);

class TatweerApp extends StatelessWidget {
  const TatweerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطوير الذات',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: gold,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: dark,
          foregroundColor: gold,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  final pages = const [
    HomeContent(),
    SimplePage(title: 'جدولي الأسبوعي', icon: Icons.calendar_month),
    SimplePage(title: 'إدارة المهام', icon: Icons.task_alt),
    SimplePage(title: 'أكاديمية البرمجة', icon: Icons.code),
    SimplePage(title: 'أهدافي وعاداتي', icon: Icons.flag),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تطوير الذات',
            style: TextStyle(
              color: gold,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFF191919),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.auto_awesome, color: gold, size: 42),
                    SizedBox(height: 10),
                    Text(
                      'تطوير الذات',
                      style: TextStyle(
                        color: gold,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('رحلتك نحو نسخة أفضل منك'),
                  ],
                ),
              ),
              menuItem(Icons.dashboard, 'الرئيسية', 0),
              menuItem(Icons.calendar_month, 'جدولي الأسبوعي', 1),
              menuItem(Icons.task_alt, 'إدارة المهام', 2),
              menuItem(Icons.code, 'أكاديمية البرمجة', 3),
              menuItem(Icons.flag, 'أهدافي وعاداتي', 4),
            ],
          ),
        ),
        body: pages[selected],
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xFF191919),
          indicatorColor: gold.withValues(alpha: 0.2),
          selectedIndex: selected,
          onDestinationSelected: (index) {
            setState(() => selected = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: gold),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'الجدول',
            ),
            NavigationDestination(
              icon: Icon(Icons.check_circle_outline),
              label: 'المهام',
            ),
            NavigationDestination(
              icon: Icon(Icons.code),
              label: 'البرمجة',
            ),
            NavigationDestination(
              icon: Icon(Icons.flag),
              label: 'الأهداف',
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: gold),
      title: Text(title),
      onTap: () {
        setState(() => selected = index);
        Navigator.pop(context);
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const SizedBox(height: 10),
        const Text(
          'أهلاً بيك 👋',
          style: TextStyle(
            fontSize: 27,
            color: gold,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'كل يوم فرصة جديدة تكون أفضل من امبارح.',
          style: TextStyle(fontSize: 15, color: Colors.white70),
        ),
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF493817), Color(0xFF201A10)],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: gold.withValues(alpha: 0.5)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('إنجازك اليومي', style: TextStyle(color: gold)),
              SizedBox(height: 15),
              Text(
                'ابدأ بخطوة صغيرة',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('الاستمرار أهم من الكمال.'),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'أقسام رحلتك',
          style: TextStyle(
            color: gold,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        const SectionCard(
          icon: Icons.mosque,
          title: 'العبادات والدين',
          subtitle: 'صلواتك وأذكارك وورد القرآن',
        ),
        const SectionCard(
          icon: Icons.favorite,
          title: 'الصحة والجسم',
          subtitle: 'النوم والمياه والنشاط اليومي',
        ),
        const SectionCard(
          icon: Icons.school,
          title: 'العقل والتعلم',
          subtitle: 'الدراسة والقراءة وتعلم المهارات',
        ),
        const SectionCard(
          icon: Icons.self_improvement,
          title: 'الراحة النفسية',
          subtitle: 'الامتنان والهدوء وتسجيل المشاعر',
        ),
        const SectionCard(
          icon: Icons.emoji_events,
          title: 'التحديات والإنجازات',
          subtitle: 'تحدياتك ونقاطك ومستوياتك',
        ),
        const SectionCard(
          icon: Icons.smart_toy,
          title: 'المساعد الذكي',
          subtitle: 'مساعدك في تنظيم يومك',
        ),
        const SectionCard(
          icon: Icons.person_search,
          title: 'اعرف نفسك',
          subtitle: 'اكتشف أهدافك ونقاط قوتك',
        ),
      ],
    );
  }
}

class SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1D1D1D),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: gold.withValues(alpha: 0.25)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: gold.withValues(alpha: 0.15),
          child: Icon(icon, color: gold),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_back_ios, color: gold, size: 16),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  final IconData icon;

  const SimplePage({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: gold, size: 65),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              color: gold,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text('سيتم تجهيز هذا القسم في المرحلة القادمة'),
        ],
      ),
    );
  }
}
