import React,{Component} from 'react';
import { View, StyleSheet, Text, FlatList, TouchableOpacity } from 'react-native';
import {connect} from 'react-redux';
import Word from './Word';
import Filter from './Filter';
import Header from './header';
import Form from './Form';


class App extends Component{
    getWordList(){
        const {myFilter, myWords}=this.props;
        if(myFilter === 'MEMORIZED') return myWords.filter(e=> e.memorized);
        if(myFilter === 'NEED_PRACTICE') return myWords.filter(e=> !e.memorized);
        return myWords;
    }
    render(){
        return(
            <View
            style={{flex:1, backgroundColor: 'yellow', alignSelf:'stretch'}}
            >
               <Header />

               <View style={{flex:10}}>

                {this.props.myIsAdding ?  <Form /> : null}
               
                <FlatList
                    data={this.getWordList()}
                    renderItem={({item}) => <Word myWord={item}/>}
                    keyExtractor={item =>item.id}
                    >
                     </FlatList>
               </View>
                <Filter />

               

            </View>
        )
    }
}
function mapState(state){
    return {
        myFilter: state.filterStatus,
        myWords: state.arrWords,
        myIsAdding:state.isAdding,
    }; // tra ve objec {}
}
const styles=StyleSheet.create({
    header:{
        flex:1,backgroundColor: '#D9D9D9',
         alignItems:'center',
        justifyContent:'space-between',
        flexDirection:'row',
    }
})

export default connect(mapState)(App);