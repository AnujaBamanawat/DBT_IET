import { Component } from "react";

export default class Square extends Component{

    constructor(){
        super()
        this.num=" ";
        this.state={s:""}

    }

    square=(e)=>{
        this.num=e.target.value
        let sqr=this.num * this.num
        this.setState({s:sqr})
    }

    render(){
        return<div style={{borderStyle:"solid",textAlign:"center",width:"fit-content",margin:"auto",padding:"5px",marginTop:"2%"}}>
        <h3>Square Calculate</h3>
            Enter a number :<input type="number" onBlur={this.square}></input>
            <p> Ans :{this.state.s}</p>
            
        </div>
    }
}