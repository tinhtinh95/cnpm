import React,{Component} from 'react';
import { View, StyleSheet, Text, FlatList, TouchableOpacity, TextInput } from 'react-native';
import getTem from '../api/getTem';
import {Provider} from 'react-redux';
import App from './components/Main';
import store from './reducer/store';
// import getTem from './getTem';

export default class App extends Component{
    render(){

        return(
            <Provider store={store}>
                <Main />
            </Provider>
        )
    }
}
