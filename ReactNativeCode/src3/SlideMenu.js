import React,{Component} from 'react';
import { View, StyleSheet, Text, FlatList, TouchableOpacity, AsyncStorage } from 'react-native';

export default class SlideMenu extends Component{
   
    save=async()=>{
        try{
            await AsyncStorage.setItem("@BBB:key","Ahihkei");
        }catch(e){
            console.log(e);
        }
    }
    get=async()=>{
        try{
            var v=await AsyncStorage.getItem("@BBB:key");
            alert(v);
        }catch(e){
            console.log(e);
        }
    }


    render(){
        return(
            <View
            style={styles.header}
            >
                <TouchableOpacity 
                onPress={()=>{this.save()}}
                style={styles.button}>
                    <Text style={styles.text}>SAVE</Text>
                </TouchableOpacity>
                <TouchableOpacity 
                onPress={()=>{this.get()}}
                style={styles.button}>
                    <Text style={styles.text}>GET</Text>
                </TouchableOpacity>

            </View>
        )
    }
}

const styles=StyleSheet.create({
    header:{
        flex:1,backgroundColor: 'yellow',
         alignItems:'center',
        justifyContent:'center',
        flexDirection:'column',
    },
    text:{
        color:'black',
        fontSize:30,
        padding:10,
        margin:20
    },
    button:{
        margin:10,
        borderWidth:1,
        borderColor:'green',
    }
})
