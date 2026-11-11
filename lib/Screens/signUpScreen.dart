/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';

import 'loginSecreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
        }, icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title:  const Text('SignUp',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
            fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(

          padding: const EdgeInsets.all(5.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                textScreen('First Name'),
                const SizedBox(height: 15,),
                textScreen('Last Name'),
                const SizedBox(height: 15,),
                textScreen('UserName'),
                const SizedBox(height: 15,),
                textScreen('Email'),
                const SizedBox(height: 15,),
                textScreen('Phone'),
                const SizedBox(height: 15,),
                textScreen('Password'),
                const SizedBox(height: 15,),
                textScreen('Confirm Password'),
                const SizedBox(height: 50,),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Loginscreen()));
                }, child: const Text('SignUp'))
              ],
            ),

        ),
      ),
    );
  }
}
Widget textScreen(String inputData){
  return TextFormField(
    style: TextStyle
      (backgroundColor: Colors.grey[200],
    ),
    decoration: InputDecoration(
      label: Text(inputData),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)))

    ),
  );

}*/ //make by me

/*import 'package:flutter/material.dart';
import 'loginSecreen.dart'; // تأكد من صحة اسم الملف لديك

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  // 1. إنشاء مفتاح الفورم (Form Key)
  final _formKey = GlobalKey<FormState>();

  // 2. إنشاء وحدات التحكم لقراءة البيانات ومقارنة كلمة المرور
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // تنظيف الـ controllers من الذاكرة عند إغلاق الصفحة
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginscreen()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          'SignUp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0), // زيادة الحشو لتبدو الحقول متناسقة
          child: Form(
            key: _formKey, // 3. ربط الفورم بالمفتاح
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40,), // تقليل الارتفاع العلوي ليتناسب مع الحقول الكثيرة

                textScreen('First Name', _firstNameController, (value) {
                  if (value == null || value.trim().isEmpty) return 'الرجاء إدخال الاسم الأول';
                  return null;
                }),
                const SizedBox(height: 15,),

                textScreen('Last Name', _lastNameController, (value) {
                  if (value == null || value.trim().isEmpty) return 'الرجاء إدخال الاسم الأخير';
                  return null;
                }),
                const SizedBox(height: 15,),

                textScreen('UserName', _userNameController, (value) {
                  if (value == null || value.trim().isEmpty) return 'الرجاء إدخال اسم المستخدم';
                  return null;
                }),
                const SizedBox(height: 15,),

                textScreen('Email', _emailController, (value) {
                  if (value == null || value.trim().isEmpty) return 'الرجاء إدخال البريد الإلكتروني';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'البريد الإلكتروني غير صالح';
                  return null;
                }),
                const SizedBox(height: 15,),

                textScreen('Phone', _phoneController, (value) {
                  if (value == null || value.trim().isEmpty) return 'الرجاء إدخال رقم الهاتف';
                  if (value.length < 8) return 'رقم الهاتف غير صالح';
                  return null;
                }),
                const SizedBox(height: 15,),

                textScreen('Password', _passwordController, (value) {
                  if (value == null || value.isEmpty) return 'الرجاء إدخال كلمة المرور';
                  if (value.length < 6) return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
                  return null;
                }, isPassword: true),
                const SizedBox(height: 15,),

                textScreen('Confirm Password', _confirmPasswordController, (value) {
                  if (value == null || value.isEmpty) return 'الرجاء تأكيد كلمة المرور';
                  if (value != _passwordController.text) return 'كلمتا المرور غير متطابقتين';
                  return null;
                }, isPassword: true),
                const SizedBox(height: 50,),

                ElevatedButton(
                  onPressed: () {
                    // 4. فحص الفالتيديت عند الضغط على الزر
                    if (_formKey.currentState!.validate()) {
                      // إذا كانت كل البيانات صحيحة، يتم الانتقال
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم تسجيل الحساب بنجاح')),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginscreen()));
                    }
                  },
                  child: const Text('SignUp'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 5. تعديل الـ Widget لتستقبل الـ Controller وفانكشن الـ Validator
Widget textScreen(
    String inputData,
    TextEditingController controller,
    String? Function(String?)? validator,
    {bool isPassword = false}
    ) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: isPassword, // إخفاء النص إذا كانت كلمة مرور
    decoration: InputDecoration(
      labelText: inputData,
      filled: true,
      fillColor: Colors.grey[200], // تعديل طريقة الخلفية الرمادية لتظهر بشكل صحيح
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}*/

import 'package:flutter/material.dart';
import 'loginSecreen.dart'; // تأكد من صحة اسم الملف لديك لصفحة تسجيل الدخول
import 'custom_text_field.dart'; // استيراد ويدجت الحقل المشترك

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  // 1. مفتاح الفورم للتحقق من البيانات (Validation)
  final _formKey = GlobalKey<FormState>();

  // 2. وحدات التحكم لقراءة النصوص ومقارنة كلمة المرور
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // 3. تنظيف الذاكرة وإغلاق الـ controllers عند مغادرة الصفحة
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginscreen()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          'SignUp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Form(
            key: _formKey, // ربط الفورم بالمفتاح لعمل الفالتيديت
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // استخدام الـ CustomTextField الجاهز مع شروط التحقق لكل حقل
                CustomTextField(
                  labelData: 'First Name',
                  controller: _firstNameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'الرجاء إدخال الاسم الأول';
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  labelData: 'Last Name',
                  controller: _lastNameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'الرجاء إدخال الاسم الأخير';
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  labelData: 'UserName',
                  controller: _userNameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'الرجاء إدخال اسم المستخدم';
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  labelData: 'Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'الرجاء إدخال البريد الإلكتروني';
                    // التحقق من صيغة الإيميل الصحيحة
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'البريد الإلكتروني غير صالح';
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  labelData: 'Phone',
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'الرجاء إدخال رقم الهاتف';
                    if (value.length < 8) return 'رقم الهاتف غير صالح';
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  labelData: 'Password',
                  controller: _passwordController,
                  isPassword: true, // إخفاء أحرف كلمة المرور
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'الرجاء إدخال كلمة المرور';
                    if (value.length < 6) return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  labelData: 'Confirm Password',
                  controller: _confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'الرجاء تأكيد كلمة المرور';
                    // مقارنة كلمة المرور الحالية بكلمة المرور الأولى للتأكد من تطابقهما
                    if (value != _passwordController.text) return 'كلمتا المرور غير متطابقتين';
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    // فحص الفالتيديت عند الضغط على زر التسجيل
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم تسجيل الحساب بنجاح')),
                      );
                      // الانتقال لصفحة تسجيل الدخول بعد النجاح
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginscreen()));
                    }
                  },
                  child: const Text('SignUp'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

