import React,{Component} from 'react';
import {  View,StyleSheet, Text, TouchableOpacity, FlatList } from 'react-native';
import {connect} from 'react-redux';
import Word from './Word';

class Filter extends Component{
    getTextStyle(statusName){
        const {myFilterStatus}=this.props;
        if(statusName == myFilterStatus) return {color: 'yellow',fontWeight:'bold'}
        return styles.buttonText;
    }
    setFilterStatus(actionType){
        this.props.dispatch({type:actionType}); // day la truyen vao thuoc tinh type co san roi
    }

    render(){
        return(
            <View style={styles.container}>
                <TouchableOpacity onPress={()=> this.setFilterStatus('FILTER_SHOW_ALL')}>
                    <Text style={this.getTextStyle('SHOW_ALL')}>SHOW ALL</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={()=> this.setFilterStatus('FILTER_MEMORIZED')}>
                    <Text style={this.getTextStyle('MEMORIZED')}>MEMORIZED</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={()=> this.setFilterStatus('FILTER_NEED_PRACTICE')}>
                    <Text style={this.getTextStyle('NEED_PRACTICE')}>NEED PRACTICE</Text>
                </TouchableOpacity>
            </View> 
        )
    }
}
const styles=StyleSheet.create
({
    container:{
        flex:1,flexDirection:'row',
        alignItems:'center',
        justifyContent:'space-around',
        backgroundColor:'black',
    },
    buttonText:{
        color:'red',
    }
});

function mapState(state){
return {myFilterStatus: state.filterStatus}
}
export default connect(mapState)(Filter);