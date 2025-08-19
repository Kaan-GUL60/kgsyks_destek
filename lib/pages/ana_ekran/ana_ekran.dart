import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

// Pasta grafiği ve derslerin verilerini tutacak model sınıfı.
// Bu sınıf, her bir dilim için isim, değer ve renk bilgisini saklar.
class SubjectData {
  final String name;
  final int value;
  final Color color;

  const SubjectData(this.name, this.value, this.color);
}

// Dashboard sayfasını oluşturan ana widget.
class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181B24), // Sayfanın arka plan rengi
      body: SafeArea(
        child: SingleChildScrollView(
          // İçerik ekrana sığmazsa kaydırılabilir hale getirir.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Üst kısım: "Hoşgeldin, Kaan GÜL" ve kamera ikonu.
                _buildHeader(),
                const SizedBox(height: 20),

                // Pasta grafiği ve ders listesini içeren kart.
                _buildChartCard(),
                const SizedBox(height: 20),

                // En alttaki "Keşfet" butonu.
                _buildExploreButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // "Hoşgeldin, Kaan GÜL" başlık ve ikonunun widget'ı.
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hoşgeldin,',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Kaan GÜL',
              style: GoogleFonts.inter(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: Color(0xFF2E3340),
          child: Icon(
            Icons.videocam_rounded,
            color: Color(0xFF4C8DFE),
            size: 28,
          ),
        ),
      ],
    );
  }

  // Pasta grafiği ve ders listesini içeren büyük kart widget'ı.
  Widget _buildChartCard() {
    final List<SubjectData> subjects = [
      const SubjectData('Matematik', 132, Color(0xFF28A0C4)),
      const SubjectData('Türkçe', 29, Color(0xFF9B409E)),
      const SubjectData('Geometri', 11, Color(0xFF6B45F8)),
      const SubjectData('Biyoloji', 40, Color(0xFF27D059)),
      const SubjectData('Coğrafya', 10, Color(0xFFF99D41)),
      const SubjectData('Kimya', 29, Color(0xFFE44342)),
      const SubjectData('Tarih', 11, Color(0xFF338144)),
      const SubjectData('Fizik', 21, Color(0xFFB5B5B5)),
      const SubjectData('Felsefe', 8, Color(0xFF000000)),
      const SubjectData('Din', 8, Color(0xFFE5D53D)),
    ];

    return Card(
      color: const Color(0xFF2E3340),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Toplam Soru Sayısı',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '256',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            _buildPieChart(subjects),
            const SizedBox(height: 60),
            _buildLegend(subjects),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart(List<SubjectData> subjects) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: subjects.map((data) {
            return PieChartSectionData(
              color: data.color,
              value: data.value.toDouble(),
              title: data.value.toString(),
              radius: 80,
              titleStyle: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }).toList(),
          borderData: FlBorderData(show: false),
          sectionsSpace: 4,
          centerSpaceRadius: 60,
        ),
      ),
    );
  }

  Widget _buildLegend(List<SubjectData> subjects) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16.0,
      runSpacing: 10.0,
      children: subjects.map((subject) {
        return _buildLegendItem(subject.name, subject.color);
      }).toList(),
    );
  }

  Widget _buildLegendItem(String name, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 8),
        Text(
          name,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.white54,
        ),
      ],
    );
  }

  Widget _buildExploreButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF445084),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Keşfet',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
