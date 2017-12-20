import React, { Component } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import {connect} from 'react-redux';
import ChangeColor  from './ChangeColor';


class Controller extends Component {
    onDownkey(){
        this.props.dispatch({type: 'DOWN'});
    }
    render() {
        return (
            <View style={styleController.controller}>
                <Text style={styleController.controllName}>CONTROLLER COMPONENT</Text>
                <ChangeColor />
                <View style={styleController.buttonContainer}>
                    <TouchableOpacity 
                    onPress={()=>{this.props.dispatch({type: 'UP'})}}
                    style={styleController.button}>
                        <Text style={styleController.buttonText}>+</Text>
                    </TouchableOpacity>
                    <TouchableOpacity 
                    onPress={this.onDownkey.bind(this)}
                    style={styleController.button}>
                        <Text style={styleController.buttonText}>-</Text>
                    </TouchableOpacity>
                </View>
            </View>
        );
    }
}

export default connect()(Controller);

const styleController = StyleSheet.create({
    controller: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'space-around',
        backgroundColor: 'yellow',
        alignSelf: 'stretch',
        margin: 20
    },
    controllName: {
        fontSize: 20,
        marginBottom: 10
    },
    buttonContainer: {
        flexDirection: 'row',
        alignItems: 'center'
    },
    button: {
        backgroundColor: 'black',
        paddingHorizontal: 50,
        paddingVertical: 25,
        margin: 10,
        borderRadius: 5
    },
    buttonText: {
        color: 'white',
        fontSize: 40
    }
});
