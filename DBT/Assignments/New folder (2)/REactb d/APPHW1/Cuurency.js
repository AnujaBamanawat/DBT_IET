import { Component } from "react";

export default class Currency extends Component {
    constructor() {
        super()
        this.num = ""
        this.from = ""
        this.to = ""
        this.state = { res: "" }
    }

    check1 = (e) => {
        this.num = e.target.value
    }
    check2 = (e) => {
        this.from = e.target.value
    }
    check3 = (e) => {
        this.to = e.target.value
    }

    buttn = () => {
        switch (this.from) {
            case "dollar":
                if (this.to == "dollar") {
                    this.setState({ res: this.num + " $ " })
                } else if (this.to == "rupee") {
                    let x = this.num * 80
                    this.setState({ res: x + " ₹ " })
                } else if (this.to == "euro") {
                    let x = this.num * (90 / 80)
                    this.setState({ res: x + " € " })
                }
                break;

            case "rupee":
                if (this.to == "rupee") {
                    this.setState({ res: this.num + " ₹ " })
                } else if (this.to == "dollar") {
                    console.log(this.num)
                    let x = this.num / 80
                    this.setState({ res: x + " $ " })
                } else if (this.to == "euro") {
                    let x = this.num / 90
                    this.setState({ res: x + " € " })
                }
                break;

            case "euro":
                if (this.to == "euro") {
                    this.setState({ res: this.num + " € " })
                } else if (this.to == "rupee") {
                    let x = this.num * 90
                    this.setState({ res: x + " ₹ " })
                } else if (this.to == "dollar") {
                    let x = this.num * (80 / 90)
                    this.setState({ res: x + " $ " })
                }
                break;
        }
    }


    render() {
        return <div style={{ borderStyle: "solid", textAlign: "center", width: "fit-content", margin: "auto", padding: "5px", marginTop: "2%" }} >
            <h3>Currency Calculator</h3>
            <label for="Value"> <b>Enter Value :</b></label>
            <input type="Number" name="Value" placeholder="Enter a number" onBlur={this.check1} />

            <b>From :</b> <select onChange={this.check2}>
                <option>select</option>
                <option value="dollar">Dollar</option>
                <option value="rupee">Rupee</option>
                <option value="euro">Euro</option>
            </select>

            <b>To :</b> <select onChange={this.check3}>
                <option>select</option>
                <option value="dollar">Dollar</option>
                <option value="rupee">Rupee</option>
                <option value="euro">Euro</option>
            </select><br></br>
            <button onClick={this.buttn}>Convert</button>

            <b> <p> Converted :{this.state.res}</p></b>
        </div>
    }
}


