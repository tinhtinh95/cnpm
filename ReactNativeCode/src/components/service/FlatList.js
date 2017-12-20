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
  TouchableOpacity,Dimensions, FlatList
} from 'react-native';

var width = Dimensions.get('window').width;
export default class App extends React.Component {
constructor(props){
    super(props);
    this.state={
        data:[]
    }
}
// state={
//     data:[]
// };
componentWillMount(){
    this.fetchData();
}
fetchData= async()=>{
    // const response=await fetch("https://randomuser.me/api?results=2");
    // const json=await response.json();
    // this.setState({data:json.result});

    fetch('http://192.168.1.13/Service/nghesi.php') 
    .then((response)=> response.json())
    .then((responseJson)=>{    
        this.setState({data: responseJson});
        
    })
    .catch((err)=>{
        console.log(err);
    });
}

  render() {
    return(
        <View style={sty.container}>
            <FlatList style={{flex:1}}
            data={this.state.data}
            keyExtractor={(x,i)=> i}
            renderItem={({item})=>
            <View style={sty.text}>
              <Text>{item.ten}  {item.vaitro}</Text>
              <Image source={require('./mh.jpg')} style={{width:70,height:70}}/>
             
            </View>
            
        }
            
            />

        </View>
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
        padding:10,
        backgroundColor:'#ecf0f1',
        marginBottom:5,
        borderWidth:1,
        width:width*1,
    },

})
