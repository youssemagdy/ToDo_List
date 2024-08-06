import 'package:flutter/material.dart';
import 'package:todo_list_3/layout/home/home_page.dart';
import 'package:todo_list_3/shared/reusable_component/constans.dart';
import 'package:todo_list_3/shared/reusable_component/custom_form_fild.dart';
import 'package:todo_list_3/style/app_color.dart';

class RegesterPage extends StatefulWidget {
  RegesterPage({Key? key}) : super(key: key);
  static const String routeName = '/RegesterPage';

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  bool isObscure = true;
  bool isConfirmObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
          title: const Text('Create Account', style: TextStyle(color: Colors.white),),
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
                // TODO Form Full name
                CustomFormFiled(
                  keyboardType: TextInputType.name,
                  controller: fullNameController,
                  label: 'Full Name',
                  validation: (value){
                    if (value == null || value.isEmpty){
                      return "This Filed can't By Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                // TODO Form Email
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
                // TODO Form password
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
                const SizedBox(height: 10,),
                // TODO Form confirm password
                CustomFormFiled(
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  label: 'Confirm Password',
                  obscureText: isConfirmObscure,
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        isConfirmObscure = !isConfirmObscure;
                      });
                    },
                    icon: Icon(
                      isConfirmObscure ? Icons.visibility_off : Icons.visibility,
                      size: 25,
                      color: AppColor.primaryLightColor,
                    ),
                  ),
                  validation: (value){
                    if (value != passwordController.text){
                      return 'Don\'t match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    if (formKey.currentState?.validate() ?? false){
                      Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryLightColor,
                  ),
                  child: const Text(
                    'Regester',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
