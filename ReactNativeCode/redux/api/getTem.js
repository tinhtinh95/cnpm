const getUrl='http://api.openweathermap.org/data/2.5/weather?appid=82240668cbdeb811598ba2db821dc06e&q=';
function getTem(cityName){
    return fetch(getUrl+cityName)
    .then(res=>res.json())
    .then(resJson=>resJson.main.temp);
}
// getTem('Tokyo')
// .then(temp=>console.log(temp))
// .catch(err=>console.log(err));

export default getTem;