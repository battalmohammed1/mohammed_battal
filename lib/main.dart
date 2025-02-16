import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String carType = "صغيرة";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'إدلب',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView( // إضافة ScrollView لحل مشكلة Overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'acsset/image.png', 
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  CustomButton(
                    icon: Icons.event, // أيقونة التاريخ
                    label: 'التاريخ',
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey[300]!,
                  ),
                  CustomButton(
                    icon: Icons.access_time, // أيقونة الوقت
                    label: 'الوقت',
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey[300]!,
                  ),
                  CustomButton(
                    icon: Icons.person_outline, // أيقونة عدد الأشخاص
                    label: 'عدد الأشخاص',
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey[300]!,
                  ),
                  GestureDetector(
                    onTap: () => _showCarTypeDialog(),
                    child: CustomButton(
                      icon: Icons.directions_car, // أيقونة السيارة
                      label: 'نوع السيارة',
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey[300]!,
                    ),
                  ),
                  CustomButton(
                    icon: Icons.location_on_outlined, // أيقونة الموقع
                    label: 'الموقع',
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey[300]!,
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'موافق',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  void _showCarTypeDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اختر نوع السيارة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              RadioListTile(
                title: Text('صغيرة'),
                value: 'صغيرة',
                groupValue: carType,
                onChanged: (value) {
                  setState(() {
                    carType = value.toString();
                    Navigator.pop(context);
                  });
                },
              ),
              RadioListTile(
                title: Text('متوسطة'),
                value: 'متوسطة',
                groupValue: carType,
                onChanged: (value) {
                  setState(() {
                    carType = value.toString();
                    Navigator.pop(context);
                  });
                },
              ),
              RadioListTile(
                title: Text('كبيرة'),
                value: 'كبيرة',
                groupValue: carType,
                onChanged: (value) {
                  setState(() {
                    carType = value.toString();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color borderColor;

  const CustomButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 28), // تكبير الأيقونة قليلاً
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
