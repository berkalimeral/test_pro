import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_pro/core/pages/register_page3.dart';
import 'package:test_pro/core/product/padding/page_padding.dart';
import 'package:test_pro/core/services/persons_services.dart';
import 'package:test_pro/core/ui/my_text_field.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({Key? key}) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final TextEditingController _nameController = TextEditingController();

  PersonsServices _personsServices = PersonsServices();

  String gender = "Men";
  int lenght = 176;
  int weight = 67;
  int age = 22;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
      ),
      body: Padding(
        padding: const PagePadding.all(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Name?',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextField(
                visible: false,
                  labelText: 'Your Name',
                  icon: const SizedBox(),
                  controller: _nameController),
              const SizedBox(
                height: 180,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    _personsServices.addPerson(
                        _nameController.text, gender, age, lenght, weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage3()));
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
