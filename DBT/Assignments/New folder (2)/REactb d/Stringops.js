// Use function component - Accept a string from user in a textfield , accept
// the checkbox value for uppercase , lowercase, titlecase
// 3.
// Depending on which checkbox is checked show the input string in upper,
// lower or title case
// EVENT - onBlur of textfield = collect the data
// Event - onchange on each check box = show different output in different
// <p> tags

import {useState }from "react"
export default function Stringops(){
    let str=""
    let [a,b]=useState("");
    let [x,y]=useState("")



    function texthandler(e){
        str=e.target.value;
        b(str)
    }

    function buttonhandler(e){
        let str1=e.target.value

        switch(str1){
            case "lc":
                   y(a.toLowerCase()); 
                break;
            case "up":
                y(a.toUpperCase()); 
             break;
            case "tc":
                 y(a.charAt(0).toUpperCase().concat(a.substring(1).toLowerCase())); 
             break;

        }

    }




return <div>

Enter a string <input type="text" id="i4" onBlur={texthandler} ></input> 
uppercase<input type="checkbox" id="i1" name="dd"  value="up" onChange={buttonhandler} ></input>
Lowercase<input type="checkbox" id="i2" name="dd" value="lc" onChange={buttonhandler} ></input>
Titlecase<input type="checkbox" id="i3" name="dd" value="tc" onChange={buttonhandler} ></input>
<p id="p1">Result String:{x}</p>
</div>
}