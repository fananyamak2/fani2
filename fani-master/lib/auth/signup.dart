import 'package:flutter/material.dart';
import 'package:fani/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cname = TextEditingController();
  final TextEditingController cpass = TextEditingController();
  final TextEditingController ccon = TextEditingController();
  final TextEditingController cemail = TextEditingController();
  final TextEditingController cmob = TextEditingController();
  bool obscured = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: cname,
                      decoration: InputDecoration(
                        labelText: 'اسم المستخدم',
                        helperText: '',
                        prefixIcon: Icon(Icons.person, color: db),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء ادخال الإسم';
                        } else {
                          print("the name is " + value + " " + cname.text);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: cpass,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        helperText: '',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: db,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscured ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black12,
                          ),
                          onPressed: () {
                            setState(() {
                              obscured = !obscured;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      obscureText: obscured,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال كلمة المرور';
                        } else {
                          print("the pass is " + value + " " + cpass.text);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: ccon,
                      decoration: InputDecoration(
                        labelText: 'تأكيد كلمة المرور',
                        helperText: '',
                        prefixIcon: Icon(Icons.lock, color: db),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value != cpass.text) {
                          return 'كلمات المرور غير متطابقات';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: cemail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'الإيميل',
                        helperText: '',
                        prefixIcon: Icon(Icons.email, color: db),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال الإيميل';
                        } else {
                          print("the email is " + value + " " + cemail.text);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: cmob,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'الهاتف',
                        helperText: '',
                        prefixIcon: Icon(Icons.phone, color: db),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخل رقم هاتفك';
                        } else {
                          print("the mobile is " + value + " " + cmob.text);
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamed("uort");
                          }
                        },
                        child: Text(
                          'أكمل عملية التسجيل',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(dy),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.only(right: 10),
                // margin: ,
                child: Row(
                  children: [
                    Text(
                      "هل لديك بالفعل حساب مِن قبل ؟ ",
                      style: TextStyle(fontWeight: FontWeight.bold, color: db),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("login");
                      },
                      child: Text(
                        "تسجيل دخول",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, color: dy),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
