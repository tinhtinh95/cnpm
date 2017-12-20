import React, { Component } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import {connect} from 'react-redux';


class ChangeColor extends Component {
    changeColor(){
        // alert("ahihi");
        this.props.dispatch({type: 'CHANGE_COLOR'});
        // alert(this.props.myHighlight);
    }
    render() {
        const color=this.props.myHighlight ? 'green': 'red';
        return (
            <TouchableOpacity 
            onPress={()=> {this.changeColor()}}
            >
                <Text style={{color,fontSize:20}}> Change color</Text>
            </TouchableOpacity>
        );
    }
}
function mapState(state){
    return {
        myHighlight:state.highlight,
    }
}

export default connect(mapState)(ChangeColor);
