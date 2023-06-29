import {useState} from "react";

export default function Currencyconverter(){
        let[curr1,setcurr1]=useState("")
        let[curr2,setcurr2]=useState("")
        let [val1,getval1]=useState(0)
        let [val,setval]=useState(0)
        let x=0;
        function getval(e){
           
            x=e.target.value
            getval1(x)
            console.log(x)
            console.log(curr1)
            console.log(curr2)
            console.log(val)
          
        }
        


    return <div>
        <input type="number" id="i1" onBlur={getval}></input>
        <select onChange={(e)=>{setcurr1(e.target.value)}}>
            <option >select</option>
            <option value="Rupeese">Rupeese</option>
            <option value="Dollar">Dollar</option>
            <option value="Euro">Euro</option>
            </select> 
            <select onChange={(e)=>{setcurr2(e.target.value)}}>
            <option >select</option>
            <option value="Rupeese">Rupeese</option>
            <option value="Dollar">Dollar</option>
            <option value="Euro">Euro</option>
            </select><br></br>
            {(curr1=="Rupeese" && curr2=="Rupeese") ?val=(val1):""}
            {(curr1=="Rupeese" && curr2=="Dollar") ?val=(val1*82):""}
            {(curr1=="Rupeese" && curr2=="Euro") ?val=(val1*90):""}
            {(curr1=="Dollar" && curr2=="Rupeese") ?val=(val1*82):""}
            {(curr1=="Dollar" && curr2=="Dollar") ?val=(val1):""}
            {(curr1=="Dollar" && curr2=="Euro") ?val=(val1*(82/90)):""}
            {(curr1=="Euro" && curr2=="Euro") ?val=(val1):""}
            {(curr1=="Euro" && curr2=="Dollar") ?val=(val1*(90/82)):""}
            {(curr1=="Euro" && curr2=="Rupeese") ?val=(val1*90):""}
            
            <p>Converted value:{val}</p>
    </div>
}