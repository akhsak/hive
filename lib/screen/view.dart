import 'package:flutter/material.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: stdListNotifier,
      builder:(BuildContext context, List<StdModel>StdList, Widget?child){
        return ListView.separated(
        itemBuilder: (context,index){
          final data=StdList[index];
          return ListTile(
            title:Text(data.name),
            subtitle: Text(data.age),
            trailing: 
            Row(mainAxisSize: MainAxisSize.min,
              children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit),),         
            IconButton(onPressed: (){             
               deleteStudent(index); 
            },
            icon: Icon(Icons.delete,color: Color.fromARGB(255, 106, 52, 47),)),           
           ],
          )
          );
        },
         separatorBuilder: (context, index){
            return const Divider();
         } ,
         itemCount: StdList.length);
      },
    );

      }
}
  