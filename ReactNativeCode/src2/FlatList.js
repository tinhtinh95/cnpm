import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
  Image,
  Button,
  ListView,
  Alert,
  TextInput,
  TouchableOpacity,Dimensions, KeyboardAvoidingView
} from 'react-native';

var width = Dimensions.get('window').width;
export default class App extends React.Component {
constructor(props){
    super(props);
    this.state={
        hoten:"",
        username:"",
        password:"",
        id:"...",
    }
}

 _sendToServer(){
    // alert(this.state.so1+""+ this.state.so2);
    if((this.state.hoten!="") && (this.state.username!="")&& (this.state.password!="")){
    fetch('http://192.168.1.13/service/dangky.php',{
        method: 'POST',  
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },  
        body: JSON.stringify({
            hoten: this.state.hoten,
            username: this.state.username,
            password: this.state.password,
        }),
      }) 
    .then((response)=> response.json())
    .then((responseJson)=>{    
        // alert("+++++++");
        this.setState({id: responseJson.id});
    })
    .catch((err)=>{
        // console.log(err);
        alert("error");
    });
}
}
  render() {
    return(
        <KeyboardAvoidingView style={sty.container}>
            <TextInput placeholder="Ho ten" style={sty.text}  onChangeText={(hoten)=>{ this.setState({hoten})}} value={this.state.hoten} />
            <TextInput placeholder="Username" style={sty.text} onChangeText={(username)=> {this.setState({username})}} value={this.state.username} />
            <TextInput placeholder="Password" style={sty.text} onChangeText={(password)=> {this.setState({password})}} value={this.state.password} />
            <TouchableOpacity style={sty.submit}  onPress={()=> this._sendToServer()}>
                <Text>Submit</Text>
            </TouchableOpacity>
            <Text> Result: {this.state.id}</Text>
        </KeyboardAvoidingView>
    )
  }
 
}
const sty=StyleSheet.create({
    container:{
        flex:1,
        justifyContent:'center',
        alignItems:'center',
    },
    text:{
        color:'#34495e',
        padding:10,
        height:40,
        backgroundColor:'#ecf0f1',
        marginBottom:5,
        fontWeight:'bold',
        width:width* .8,
    },
    submit:{
        backgroundColor:"#f0f",
        padding:10,
        
    }
})

