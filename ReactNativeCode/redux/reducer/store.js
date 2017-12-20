import {createStore} from 'redux';

const defaultState={
    cityName: null,
    temp:null,
    isLoading:false,
    error:null
}

const reducer=(state=defaultState,action)=>{
    switch(action.type){
        case 'START_FETCH':
            return {cityName:null, error:null, isLoading :true, temp:nul}
        case 'FETCH_SUCCESS':
             return {cityName:action.cityName,error:false, isLoading :false, temp:action.temp}
        case 'FETCH_ERROR':
             return {cityName:null, error:true, isLoading :false, temp:nul}
        default:
        return state;
    }
};
const store=createStore(reducer);
export default store;