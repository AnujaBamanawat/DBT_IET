import { Component } from "react";

export default class Square1 extends  Component{

    constructor(){
        super()
        this.sq=""
        this.state={s:""}
    }

    handler=(e)=>{
        this.sq=e.target.value
        let ans=this.sq *this.sq;
        this.setState({s:ans})
        }


    render(){
        return<div>
             Enter Number :<input type="number" onChange={this.handler}/> 
            <p>value {this.state.s}</p>
            </div>
    }
    

    
}