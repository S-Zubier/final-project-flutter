/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';
import 'package:mobile_project/Screens/signUpScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen1()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          'Welcome To Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          textScreen('userName'),
          const SizedBox(
            height: 10,
          ),
          textScreen('Password'),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen1()));
              },
              child: const Text('Login')),
         const SizedBox(height: 20,),
           Container(
             padding: const EdgeInsets.only(bottom: 0.10),
             decoration: const BoxDecoration(
               border: Border(
                 bottom: BorderSide(
                   color: Colors.blue, // لون الخط
                   width: 1,         // سمك الخط
                 ),
               ),
             ),

             child:  const Text(
              'ليس لديك حساب ؟ قم بانشاء حساب',
              style: TextStyle(
                  color: Colors.blue,
                 // decoration: TextDecoration.underline,
                 // decorationColor: Colors.blue,
             // decorationStyle:TextDecorationStyle.solid
              ),

                       ),
           ),
         const SizedBox(height: 50,),
         Container(
           margin: const EdgeInsets.only(right: 135, left: 135),
           child: ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signupscreen()));
           },
                   child: const Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                    Icon(Icons.login),
                   SizedBox(width: 20,),
                   Text('SignUp'),
                              ],
                            ),
                 ),
         ),

        ],
      ),
    );
  }
}*/ //make by me

/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';
import 'package:mobile_project/Screens/signUpScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // 1. إنشاء مفتاح الفورم (Form Key) الخاص بصفحة تسجيل الدخول
  final _formKey = GlobalKey<FormState>();

  // 2. إنشاء وحدات التحكم (Controllers) لقراءة المدخلات
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // تنظيف الـ controllers عند الخروج من الصفحة
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen1()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          'Welcome To Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      // استخدام SingleChildScrollView لمنع حدوث مشكلة بكسل الشاشة (Overflow) عند ظهور لوحة المفاتيح
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // 3. ربط الفورم بالمفتاح
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              // تمرير الكنترولر وشروط الفحص لاسم المستخدم
              textScreen('userName', _userNameController, (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء إدخال اسم المستخدم';
                }
                return null;
              }),
              const SizedBox(height: 10),

              // تمرير الكنترولر وشروط الفحص لكلمة المرور وإخفاء النص
              textScreen('Password', _passwordController, (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال كلمة المرور';
                }
                return null;
              }, isPassword: true),
              const SizedBox(height: 50),

              ElevatedButton(
                  onPressed: () {
                    // 4. عمل فحص (Validate) عند الضغط على زر الدخول
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen1()));
                    }
                  },
                  child: const Text('Login')),
              const SizedBox(height: 20),

              // جعل النص قابل للضغط (GestureDetector) للانتقال لصفحة التسجيل أيضاً عند النقر عليه
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signupscreen()));
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 0.10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    'ليس لديك حساب ؟ قم بانشاء حساب',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              Container(
                margin: const EdgeInsets.only(right: 135, left: 135),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Signupscreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 20),
                      Text('SignUp'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 5. ميثود الـ textScreen المشتركة والمعدلة لاستقبال الفالتيدشن
Widget textScreen(
    String inputData,
    TextEditingController controller,
    String? Function(String?)? validator,
    {bool isPassword = false}
    ) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0), // حشو جانبي لتبدو الحقول متناسقة ومتوازية
    child: TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: inputData,
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ),
  );
}*/

import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';
import 'package:mobile_project/Screens/signUpScreen.dart'; // تأكد من صحة مسار صفحة الساين اب لديك
import 'custom_text_field.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // مفتاح الفورم للتحقق من البيانات
  final _formKey = GlobalKey<FormState>();

  // وحدات التحكم لقراءة المدخلات
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // تنظيف الذاكرة عند الخروج من الصفحة
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen1()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          'Welcome To Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // ربط الفورم بالمفتاح
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              CustomTextField(
                labelData: 'userName',
                controller: _userNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please Enter Your UserName And Do not put Spacer Only ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              CustomTextField(
                labelData: 'Password',
                controller: _passwordController,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' Please Enter The Correct Password And Do not put Spacer Only ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),

              ElevatedButton(
                  onPressed: () {
                    // فحص الفالتيديت عند الضغط
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen1()));
                    }
                  },
                  child: const Text('Login')),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signupscreen()));
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 0.10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    'ليس لديك حساب ؟ قم بانشاء حساب',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              Container(
                margin: const EdgeInsets.only(right: 135, left: 135),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Signupscreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 20),
                      Text('SignUp'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
