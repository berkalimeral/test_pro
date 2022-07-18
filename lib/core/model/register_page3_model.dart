class RegisterModel {
  final String title;
  RegisterModel({
    required this.title,
  });
}

class RegisterModels {
  int currentValue = 3;
  static final List<RegisterModel> registerItems = [
    RegisterModel(title: 'What is your sex?'),
    RegisterModel(title: 'How old are you?'),
    RegisterModel(title: 'How much is your lenght?'),
    RegisterModel(title: 'How much is your weight?'),
  ];
}
