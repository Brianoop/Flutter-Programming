import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _studentNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _studentNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  String? _validateStudentNumber(String? value) 
  {
    if(value == null || value.trim().isEmpty) 
    {
      return 'Please enter your student number';
    }

    return null;
  }

  String? _validatePassword(String? value) 
 {
  if(value == null || value.trim().isEmpty)
    {
      return 'Please enter your password';
    }

    if(value.length < 6)
    {
      return 'Password must be atleast 6 characters';
    }

    return null;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen'),
      centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints){
        bool isWideScreen = constraints.maxWidth > 500;


        return SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isWideScreen ? 800 : constraints.maxWidth
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: isWideScreen ? Row(children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network("https://ristalbridgeacademy.org/pluginfile.php/1/theme_lambda/logo/1713540911/Logo.jpeg"
                            ,height: 150,
                            ),
                            SizedBox(height: 20,),
                            Text("Welcome to Ristal Bridge Academy, to use your account, please enter your student number", 
                            textAlign: TextAlign.center,
                            )
                          ],
                          )), 
                
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _studentNumberController,
                                  decoration: InputDecoration(
                                    labelText: 'Student Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)
                                    )
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: _validateStudentNumber,
                                ),
                                SizedBox(height: 20,), 
                                TextFormField(
                                  controller: _passwordController,
                                   decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)
                                    ), 
                                    suffixIcon: IconButton(
                                      icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                                      onPressed: (){
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      )
                                  ),
                                  obscureText: !_passwordVisible,
                                  validator: _validatePassword,
                                ), 
                                SizedBox(height: 20,),
                                SizedBox( 
                                  width: constraints.maxWidth * 0.25,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      if(_formKey.currentState?.validate() ?? false) 
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Logging in...'),)
                                        );
                                      }
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green, 
                                      foregroundColor: Colors.white
                                    ),
                                    child: Text('Login')
                                    ),
                                )
                             
                              ],
                              ),)
                
                
                  ],) : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

Image.network("https://ristalbridgeacademy.org/pluginfile.php/1/theme_lambda/logo/1713540911/Logo.jpeg"
                            ,height: 150,
                            ),
                            SizedBox(height: 20,),
                            Text("Welcome to Ristal Bridge Academy, to use your account, please enter your student number", 
                            textAlign: TextAlign.center,
                            ),
                             SizedBox(height: 20,),
                         TextFormField(
                                  controller: _studentNumberController,
                                  decoration: InputDecoration(
                                    labelText: 'Student Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)
                                    )
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: _validateStudentNumber,
                                ),
                                SizedBox(height: 20,), 
                                TextFormField(
                                  controller: _passwordController,
                                   decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)
                                    ), 
                                    suffixIcon: IconButton(
                                      icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                                      onPressed: (){
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      )
                                  ),
                                  obscureText: !_passwordVisible,
                                  validator: _validatePassword,
                                ), 
                                SizedBox(height: 20,),
                                SizedBox( 
                                  width: constraints.maxWidth * 0.50,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      if(_formKey.currentState?.validate() ?? false) 
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Logging in...'),)
                                        );
                                      }
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green, 
                                      foregroundColor: Colors.white
                                    ),
                                    child: Text('Login')
                                    ),
                                )
                             

                    ],),
                  ),
              ),


              ),),
        );
      }),
      
      
      );
  }
}