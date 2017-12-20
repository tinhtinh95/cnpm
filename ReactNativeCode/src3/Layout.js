import React,{Component} from 'react';
import { View, StyleSheet, Text, FlatList, TouchableOpacity } from 'react-native';
import SlideMenu from './SlideMenu';
export default class App extends Component{
   
    render(){
        return(
            <View style={styles.container}>
                <View style={styles.ovuong}></View>
                <View style={styles.ovuong}></View>
                <View style={styles.ovuong}></View>
            </View>
        )
    }
}

const styles=StyleSheet.create({
    container:{
        backgroundColor: 'yellow',
        flex:1, // so voi man hinh xung quanh
        //  alignItems:'center',
        // justifyContent:'space-between',
        // flexDirection:'row',
    },
    ovuong:{
        backgroundColor:'red',
        borderWidth:1,
        // width:70,
        flex:1
    }
})
