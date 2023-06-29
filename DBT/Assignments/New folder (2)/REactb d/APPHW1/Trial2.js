import { Component } from "react";

export default class Trial2 extends Component{
    constructor(props){
        super()
        this.num=props.number
        this.str=props.string
        this.arr=props.array
        this.object=props.obj
         this.func=props.fun
    }
    
    
    
    render(){
               return <div>
                    <p> Number :{this.num}</p> 
                    <p>String :{this.str}</p>
                    <p>Array :{this.arr}</p>
                    <p>Object :{this.object.Name},{this.object.Age}</p>
                    <p>function :{this.func()}</p>
                
                </div>

    }
}