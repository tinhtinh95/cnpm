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
export default class App extends Component<{}> {
constructor(props){
    super(props);
    this.state={
        // data:[{name:"Ti"},{name:"Tinh"}]
    }
}
state={
    data:[]
};
componentWillMount(){
    this.fetchData();
}
fetchData= async()=>{
    // const response=await fetch("https://randomuser.me/api?results=2");
    // const json=await response.json();
    // this.setState({data:json.result});

    fetch('https://randomuser.me/api?results=5000') 
    .then((response)=> response.json())
    .then((responseJson)=>{    
        this.setState({data: responseJson.results});
        
    })
    .catch((err)=>{
        console.log(err);
    });
}

  render() {
    return(
        <View style={sty.container}>
            <FlatList
            data={this.state.data}
            keyExtractor={(x,i)=> i}
            renderItem={({item})=>
            <Text>
             {item.name.first}{item.name.first}
            </Text>}
           
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
