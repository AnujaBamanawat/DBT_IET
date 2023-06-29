import { Component } from "react";

export default class Squareclass extends Component{

    constructor(){
        super();
        this.num=0;
        this.state={sqr:0}
    }

    textinput=(e)=>{
      this.num=e.target.value;

      this.setState({sqr:this.num*this.num})
    }

    render(){
        return <div>
            Enter num:<input type="number" onBlur={this.textinput}></input>

            <p>{this.state.sqr}</p>
        </div>
    }
}