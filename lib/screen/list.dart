

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/home.dart';

class Listpage extends StatelessWidget {
   Listpage({super.key});

  final _namecontroller=TextEditingController();

  final _agecontroller=TextEditingController();

  final _clascontroller=TextEditingController();

  final _addresscontroller=TextEditingController();

  final _form=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  Color.fromARGB(255, 21, 156, 177),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key:_form,
            child: Column(
              children: [
                CircleAvatar(child:IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.add_a_photo)),
                  radius: 60,),
                  SizedBox(
                    height: 20,
                  ),
               TextFormField(
                 keyboardType:TextInputType.text ,
             //   inputFormatters:[FilteringTex̣tInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
                controller: _namecontroller,
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  hintText:'Name',
                  prefixIcon:Icon(Icons.person),
                  //helperText: 'enter name',
                ),
                  validator: (value){
                 
                  if(value==null||value.isEmpty)
                  {
                    return 'value is empty';
                  }else{
                    return null;
                  }
                  },
               ),
               SizedBox(
                height: 20,
               ),
               TextFormField(
                 keyboardType:TextInputType.phone ,

            inputFormatters:[
              FilteringTextInputFormatter.digitsOnly
            ],
                controller: _agecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Age',
                  prefixIcon: Icon(Icons.calendar_month_rounded),
                
                ), validator: (value){
                 
                  if(value==null||value.isEmpty)
                  {
                    return 'value is empty';
                  }else{
                    return null;
                  }
                  },
                
                
               ),SizedBox(
                
                height: 20,
               ),
               TextFormField(
                controller:_clascontroller,
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  hintText: 'Class',
                  prefixIcon: Icon(Icons.class_sharp),
                ),
                 validator: (value){
                 
                  if(value==null||value.isEmpty)
                  {
                    return 'value is empty';
                  }else{
                    return null;
                  }
                  },
               ),
               SizedBox(
                height: 20,
               ),
               TextFormField(
                 keyboardType:TextInputType.phone ,

            inputFormatters:[
              FilteringTextInputFormatter.digitsOnly
            ],
                controller: _addresscontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'phone number',
                  prefixIcon: Icon(Icons.phone),
                ),
                 validator: (value){
                 
                  if(value==null||value.isEmpty)
                  {
                    return 'value is empty';
                  }else{
                    return null;
                  }
                  },
               ),
               SizedBox(
                height: 20,
               ),
               ElevatedButton.icon(onPressed: (){
                if(_form.currentState!.validate()){
                _onaddstdclicked();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>home(),));
                }
               },
                icon: Icon(Icons.save),
                 label: Text('submit'),),
              ],
              
            ),
          ),
        ),
      ),
      
    );
  }

  Future<void> _onaddstdclicked()async{
    final _name=_namecontroller.text.trim();
    final _age=_agecontroller.text.trim();
    final _class=_clascontroller.text.trim();
    final _address=_addresscontroller.text.trim();
    if (_name.isEmpty || _age.isEmpty || _class.isEmpty || _address.isEmpty) {
      }
      print('$_name $_age $_class $_address');
        
       final _Std= StdModel(name: _name,
         age: _age,
          clas: _class,
           address: _address);

      addstudent(_Std);
  }
}