import React,{Component} from 'react';
import { View, StyleSheet, Text, FlatList, TouchableOpacity } from 'react-native';
import {connect} from 'react-redux';

class Header extends Component{
 
    render(){
        return(
           
                <View style={styles.header}>
                    <Text>My Words</Text>
                    <TouchableOpacity
                    onPress={()=>this.props.dispatch({type:'TOGGLE_ISADDING'})}
                    >
                        <Text>+</Text>
                    </TouchableOpacity>
                </View>

              
        )
    }
}

export default connect()(Header);


const styles=StyleSheet.create({
    header:{
        flex:1,backgroundColor: '#D9D9D9',
         alignItems:'center',
        justifyContent:'space-between',
        flexDirection:'row',
    }
})

