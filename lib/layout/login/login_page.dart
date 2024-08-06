import 'package:flutter/material.dart';
import 'package:todo_list_3/layout/home/home_page.dart';
import 'package:todo_list_3/layout/regester/regester_page.dart';
import 'package:todo_list_3/shared/reusable_component/constans.dart';
import 'package:todo_list_3/shared/reusable_component/custom_form_fild.dart';
import 'package:todo_list_3/style/app_color.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomFormFiled(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'Email',
                  validation: (value){
                    if (value == null || value.isEmpty){
                      return "This Filed can't By Empty";
                    }
                    if (!RegExp(Constants.emailRegex).hasMatch(value)){
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                CustomFormFiled(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  label: 'Password',
                  obscureText: isObscure,
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      size: 25,
                      color: AppColor.primaryLightColor,
                    ),
                  ),
                  validation: (value){
                    if (value == null || value.isEmpty){
                      return "This Filed can't By Empty";
                    }
                    if (value.length < 8 ){
                      return "Password should be at least 8 char";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    if (formKey.currentState?.validate() ?? false){
                      Navigator.pushReplacementNamed(context, HomePage.routeName);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryLightColor,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('If don\'t have an Account go to'),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RegesterPage.routeName);
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: AppColor.primaryLightColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
