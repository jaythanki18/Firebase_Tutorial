// import 'package:flutter/material.dart';
// import 'package:smartclass/utils/utils.dart';
// import 'package:smartclass/widgets/round_button.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }
//
// class _AddPostScreenState extends State<AddPostScreen> {
//   bool loading=false;
//   final postController=TextEditingController();
//   final databaseRef=FirebaseDatabase.instance.ref('Post');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Post"),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             SizedBox(height: 30,),
//             TextFormField(
//               maxLines: 4,
//               controller: postController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'What is in your mind?'
//               ),
//             ),
//             SizedBox(height: 30,),
//             RoundButton(
//                 title: 'add',
//                 loading: loading,
//                 onTap: (){
//                   setState(() {
//                     loading=true;
//                   });
//                   databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).child('Comments').set({
//                     'title': postController.text.toString(),
//                     'id': DateTime.now().millisecondsSinceEpoch.toString(),
//                   }).then((value){
//                     Utils().toastMessage('Post added');
//                     setState(() {
//                       loading=false;
//                     });
//                   }).onError((error, stackTrace){
//                     Utils().toastMessage(error.toString());
//                     setState(() {
//                       loading=false;
//                     });
//                   });
//             })
//           ],
//         ),
//       ),
//
//     );
//   }
// }
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/round_button.dart';


class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final postController =TextEditingController();
  bool loading = false ;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'What is in your mind?' ,
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add',
                loading: loading,
                onTap: (){
                  setState(() {
                    loading = true ;
                  });


                  String id  = DateTime.now().millisecondsSinceEpoch.toString() ;
                  databaseRef.child(id).set({
                    'title' : postController.text.toString() ,
                    'id' : DateTime.now().millisecondsSinceEpoch.toString()
                  }).then((value){
                    Utils().toastMessage('Post added');
                    setState(() {
                      loading = false ;
                    });
                  }).onError((error, stackTrace){
                    Utils().toastMessage(error.toString());
                    setState(() {
                      loading = false ;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}