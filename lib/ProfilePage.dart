import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
  
  
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  TextEditingController customController = new TextEditingController();
  creatAlertDialog(BuildContext context)
  {
    return showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        title: Text("Your Name?"),
        content: TextField(
          controller: customController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Submit'),
            onPressed:(){
              Navigator.of(context).pushNamed('/profile');
            },
          )
        ],
      );
    });
  }

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async{
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }
  Widget build(BuildContext cx) {
    
    return new Scaffold(
      appBar: AppBar(
        title: const Text('DouDou'),
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(child:
                      Container(
                        height: 200.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(image: new AssetImage("android/assets/merlion.jpeg"), fit: BoxFit.cover,),
                        ),
                      ),)
                    ],
                    ),
                    Positioned(
                      top: 100.0,
                      child: Container(
                        height: 190.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: new AssetImage("android/assets/cony.jpg"),
                            ),
                            border: Border.all(
                                color: Colors.white,
                                width: 6.0
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
              alignment: Alignment.bottomRight,
              height: 110.0,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Color(0xff476cfb),
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ]
              )
              ),

              SizedBox(height: 12.0,),
              Container(
                alignment: Alignment.center,
                //height: 130.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Cony Yang', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0
                    ),),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: IconButton(
                            icon: Icon(Icons.border_color),
                            color: Color(0xff476cfb),
                            onPressed: (){
                              creatAlertDialog(cx);
                            }
                        ),
                      ),
                    ),
                    /*FlatButton(
                        child: Icon(
                          Icons.border_color,
                          color: Color(0xff476cfb),
                          size: 20,
                        ),
                      onPressed: (){
                          creatAlertDialog(cx);
                      },
                    )*/
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.tag_faces,color: Color(0xff476cfb),),
                            onPressed: () {
                              //print("Pressed on a RaisedButton");
                              Navigator.of(cx).pushNamed('/'); //route
                            }
                        ),
                        Text('Preference',style: TextStyle(
                            color: Colors.blueAccent
                        ),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.star,color: Colors.black),
                            onPressed: () {
                              //print("Pressed on a RaisedButton");
                              Navigator.of(cx).pushNamed('/'); //route
                            }
                        ),
                        Text('Reputation',style: TextStyle(
                            color: Colors.black
                        ),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.more_vert,color: Colors.black),
                          onPressed: (){
                            _showMoreOption(cx);
                          },
                        ),
                        Text('More',style: TextStyle(
                            color: Colors.black
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Column(
                  children: <Widget>[

                    SizedBox(height: 10.0,),
                    Row(children: <Widget>[
                      Icon(Icons.phone_android),
                      SizedBox(width: 5.0,),
                      Text('Cantact',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('+65 86183957',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 15.0,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.border_color,
                            color: Color(0xff476cfb),
                            size: 20,
                          ),
                        ),
                      ),
                    ],),

                    SizedBox(height: 10.0,),
                    Row(children: <Widget>[
                      Icon(Icons.email),
                      SizedBox(width: 5.0,),
                      Text('Email',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('yangyubei0218@gmail.com',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 15.0,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.border_color,
                            color: Color(0xff476cfb),
                            size: 20,
                          ),
                        ),
                      ),
                    ],),

                    SizedBox(height: 10.0,),
                    Row(children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 5.0,),
                      Text('Study at',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('NTU',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 15.0,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.border_color,
                            color: Color(0xff476cfb),
                            size: 20,
                          ),
                        ),
                      ),
                    ],),


                    SizedBox(height: 10.0,),
                    Row(children: <Widget>[
                      Icon(Icons.home),
                      SizedBox(width: 5.0,),
                      Text('Lives in',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('Singapore',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 15.0,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.border_color,
                            color: Color(0xff476cfb),
                            size: 20,
                          ),
                        ),
                      ),
                    ],),


                    SizedBox(height: 10.0,),
                    Row(children: <Widget>[
                      Icon(Icons.location_on),
                      SizedBox(width: 5.0,),
                      Text('From',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('ChongQing, China',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 15.0,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.border_color,
                            color: Color(0xff476cfb),
                            size: 20,
                          ),
                        ),
                      ),
                    ],),



                    SizedBox(height: 10.0,),
                    Row(children: <Widget>[
                      Icon(Icons.list),
                      SizedBox(width: 5.0,),
                      Text('Already Taken',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('58 DouDou Rides',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),)
                    ],),

                    SizedBox(height: 20.0,),
                    Row(children: <Widget>[
                      Expanded(
                          child: new MaterialButton(
                            height: 30.0,
                            minWidth: 50.0,
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: new Text("To be a Driver"),
                            onPressed: () {
                              print("Pressed on a RaisedButton");
                              Navigator.of(cx).pushNamed('/'); //route
                            },
                            splashColor: Colors.yellowAccent,
                          )
                      )
                    ],),
                    Container(
                      height: 10.0,
                      child:
                      Divider(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              )

            ],
          )
        ],
      ),
    );

  }

  _showMoreOption(cx) {

    showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {

        return new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>
          [
            Container(
              padding: EdgeInsets.all(10.0),
              child:
              Row(children: <Widget>[
                Icon(Icons.feedback,
                  color: Colors.black,),
                SizedBox(width: 10.0,),
                Text('Give feedback or report this profile',
                  style: TextStyle(
                      fontSize: 18.0
                  ),)
              ],),),

            Container(
              padding: EdgeInsets.all(10.0),
              child:
              Row(children: <Widget>[
                Icon(Icons.link,
                  color: Colors.black,),
                SizedBox(width: 10.0,),
                Text('Copy link to profile',
                  style: TextStyle(
                      fontSize: 18.0
                  ),)
              ],),),



            Container(
              padding: EdgeInsets.all(10.0),
              child:
              Row(children: <Widget>[
                Icon(Icons.delete,
                  color: Colors.black,),
                SizedBox(width: 10.0,),
                Text('Delete Profile',
                  style: TextStyle(
                      fontSize: 18.0
                  ),)
              ],),)
          ],
        );
      },
    );
  }
}
