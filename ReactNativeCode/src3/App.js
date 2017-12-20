import React,{Component} from 'react';
import { View, StyleSheet, Text, FlatList, TouchableOpacity } from 'react-native';
import SlideMenu from './SlideMenu';
export default class App extends Component{
   
    render(){
        return(
                <SlideMenu/>
        )
    }
}

const styles=StyleSheet.create({
    header:{
        flex:1,backgroundColor: '#D9D9D9',
         alignItems:'center',
        justifyContent:'space-between',
        flexDirection:'row',
    }
})
