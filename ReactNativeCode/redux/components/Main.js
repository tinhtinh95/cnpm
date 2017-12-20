import React,{Component} from 'react';
import { View, StyleSheet, Text, FlatList, TouchableOpacity, TextInput } from 'react-native';
import getTem from '../api/getTem';
import {connect} from 'react-redux';
// import getTem from './getTem';

class App extends Component{
   constructor(props){
       super(props);
       this.state={
           cityName:''
       }
   }

    getWeatherMsg(){
        const {error,isLoading,cityName, temp}=this.props;
        if(isLoading) return '...Loading';
        if(error) return 'Vui long thu lai';
        if(!cityName) return 'Nhap ten chua dung';
        return `${cityName} hien tai la ${temp}oC`; // noi chuoi cua ES6
    }


   getTempByCityName(){
        getTem(this.state.cityName)
        .then(temp=>alert(temp))
        .catch(err=>alert(err));
   }


    render(){

        return(
            <View
            style={{flex:1, backgroundColor: 'yellow', alignSelf:'stretch'}}
            >   
                <Text>
                    {this.getWeatherMsg()}
                </Text>
                <TextInput
                style={styles.extInput}
                 value={this.state.cityName}
                 onChangeText={text=>this.setState({cityName:text})}
                />
                <TouchableOpacity
                onPress={this.getTempByCityName.bind(this)}
                >
                    <Text>Get temperature</Text>
                </TouchableOpacity>
               
            </View>
        )
    }
}
const styles=StyleSheet.create({
    textInput:{
       margin:10,
       height:40
    }
})

function mapStateToProps(state){
    return{ cityName: state.cityName, temp:state.temp, error: state.error,
    isLoading: state.isLoading}
}
 export default connect(mapStateToProps)(App);