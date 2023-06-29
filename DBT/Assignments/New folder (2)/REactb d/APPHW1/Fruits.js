
import {Component} from "react"
export default class Fruits extends Component{
    
    constructor()
    {
        super()
        this.state={arr:[]}
    }

    handler=(e)=>{
        let fruit =e.target.value
        let temp=[...this.state.arr]
        temp.push(fruit)
        this.setState({arr:temp})
    }



    enter=()=>{
     return this.state.arr.map((element)=><option >{element}</option>)
    }

    





        render(){
            return<div  style={{borderStyle:"solid",textAlign:"center",width:"fit-content",margin:"auto",padding:"5px",marginTop:"2%"}}>
               Add Fruit Name : <input type="text" placeholder="Enter Fruit Names" onBlur={this.handler}/>
               <br></br>
               <br></br>
                Added List : <select >
                    <option>None</option>
                     {this.enter()}
                </select>
            </div>
        }   
}