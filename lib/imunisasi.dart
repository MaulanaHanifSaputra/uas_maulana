import 'package:flutter/material.dart';
import 'jadwal.dart'; // Import Jadwal screen

class Imunisasi extends StatefulWidget {
  @override
  _ImunisasiState createState() => _ImunisasiState();
}

class _ImunisasiState extends State<Imunisasi> {
  String selectedOption = '';
  bool isButtonEnabled = false; // State to control button enable/disable

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
      isButtonEnabled = true; // Enable the button when an option is selected
    });
  }

  void _navigateToJadwal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Jadwal(selectedImunisasiJenis: selectedOption)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back.png'), // Path to your back icon image
          onPressed: () {
            Navigator.pop(context); // Back action
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
                    fontFamily: 'Rollerfont', // Ensure the font is added in pubspec.yaml
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
                      backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with your logo path
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
                          'Imunisasi',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Pilih berbagai\nlayanan imunisasi',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16), // Spacer between text and image
                  Image.asset(
                    'assets/images/imun.jpeg', // Replace with your icon path
                    height: 150,
                  ),
                ],
              ),
              SizedBox(height: 30),
              _buildImunisasiOption(
                context,
                'BCG',
                'Bacillus Calmette-Guérin: Melindungi terhadap tuberkulosis.',
                selectedOption == 'BCG',
              ),
              SizedBox(height: 30),
              _buildImunisasiOption(
                context,
                'POLIO',
                'Melindungi terhadap polio\n(poliomyelitis).',
                selectedOption == 'POLIO',
              ),
              SizedBox(height: 30),
              _buildImunisasiOption(
                context,
                'MMR',
                'Measles, Mumps, Rubella: Melindungi terhadap campak, gondongan (mumps), dan rubella.',
                selectedOption == 'MMR',
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: isButtonEnabled ? () => _navigateToJadwal(context) : null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.grey; // Disabled color
                        }
                        return Colors.blue; // Enabled color
                      },
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Text(
                      'Lanjut',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImunisasiOption(
      BuildContext context, String title, String description, bool selected) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: selected ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
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
                  description,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _selectOption(title),
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

void main() {
  runApp(MaterialApp(
    home: Imunisasi(),
  ));
}
