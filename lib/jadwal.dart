import 'package:flutter/material.dart';
import 'janji.dart'; // Import Janji screen

void main() {
  runApp(MaterialApp(
    home: Jadwal(selectedImunisasiJenis: ''),
  ));
}

class Jadwal extends StatefulWidget {
  final String selectedImunisasiJenis;

  Jadwal({required this.selectedImunisasiJenis});

  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  String selectedOption = '';
  Map<String, String> selectedDoctor = {};
  Map<String, String> selectedImunisasi = {
    'jenis': 'BCG,POLIO,MMR',
    'tanggal': '2023-07-10'
  };

  void _selectOption(String option, Map<String, String> doctor) {
    setState(() {
      selectedOption = option;
      selectedDoctor = doctor;
    });
    _navigateToJanji(context, selectedDoctor);
  }

  void _navigateToJanji(BuildContext context, Map<String, String> doctor) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Janji(
          selectedDoctor: doctor,
          selectedImunisasi: selectedImunisasi,
          selectedImunisasiJenis: selectedOption // Make sure this is filled with the selected option in Imunisasi
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFEFEFEF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'CAHYA AMALIA',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rollerfont',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hallo, pengguna1',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jadwal Dokter',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Pilih jadwal sesuai\nkebutuhan Anda',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    'assets/images/jadwal.png',
                    height: 150,
                  ),
                ],
              ),
              SizedBox(height: 30),
              _buildJadwalOption(
                context,
                'Dr.Rahaya Anisa',
                {
                  'dokter': 'Dr.Rahaya Anisa',
                  'spesialis': 'Spesialis Anak',
                  'hari': 'Senin - Rabu',
                  'jam': '09.00 - 11.00',
                },
                'assets/images/dokter1.png',
                selectedOption == 'Dr.Rahaya Anisa',
              ),
              SizedBox(height: 30),
              _buildJadwalOption(
                context,
                'Dr.M.Mulyohadi Ali',
                {
                  'dokter': 'Dr.M.Mulyohadi Ali',
                  'spesialis': 'Spesialis Gigi',
                  'hari': 'Selasa - Kamis',
                  'jam': '09.00 - 11.00',
                },
                'assets/images/dokter2.png',
                selectedOption == 'Dr.M.Mulyohadi Ali',
              ),
              SizedBox(height: 30),
              _buildJadwalOption(
                context,
                'Dr.Robert Carlos',
                {
                  'dokter': 'Dr.Robert Carlos',
                  'spesialis': 'Spesialis Imunisasi',
                  'hari': 'Kamis - Sabtu',
                  'jam': '13.00 - 16.00',
                },
                'assets/images/dokter3.png',
                selectedOption == 'Dr.Robert Carlos',
              ),
              SizedBox(height: 30),
              _buildJadwalOption(
                context,
                'Dr.Alexander Wisnu',
                {
                  'dokter': 'Dr.Alexander Wisnu',
                  'spesialis': 'Spesialis Umum',
                  'hari': 'Senin - Jumat',
                  'jam': '08.00 - 16.00',
                },
                'assets/images/dokter4.png',
                selectedOption == 'Dr.Alexander Wisnu',
              ),
              SizedBox(height: 30),
              _buildJadwalOption(
                context,
                'Dr.Maulana Hanif',
                {
                  'dokter': 'Dr.Maulana Hanif',
                  'spesialis': 'Spesialis Mata',
                  'hari': 'Kamis - Sabtu',
                  'jam': '10.00 - 14.00',
                },
                'assets/images/dokter5.png',
                selectedOption == 'Dr.Maulana Hanif',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJadwalOption(BuildContext context, String title, Map<String, String> doctor, String imagePath, bool selected) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: selected ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: selected ? Colors.blue : Colors.transparent, width: 2.0),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 50,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${doctor['spesialis']}\n${doctor['hari']}\n${doctor['jam']}',
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _selectOption(title, doctor),
            child: Text(
              selected ? 'Dipilih' : 'Pilih',
              style: TextStyle(color: selected ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
