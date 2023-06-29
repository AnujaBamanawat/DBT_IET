export default function Trial(props){

let str=props.string

    // if(props.fun!=undefined){
    //     props.fun()
    // }

    return<div> 
        <p>String = {str}</p>
        <p>array ={props.array}</p>
        <p>Object = Name : {props.obj.Name } Age :{props.obj.Age}</p>
        <p>function = {props.fun()}</p>
        <p> Boolean :{props.flag?"Konichiwa":"Baka"}</p>
        


    </div>
}