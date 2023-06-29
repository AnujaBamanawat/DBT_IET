import {useState } from "react"
export default function Upper1(){


    let[msg,setm]=useState("")
    let[st,setst]=useState()
    let x=""
    function handler(e){
         x=e.target.value;
        setm(e.target.value)
    }

    function vali(e){
        let value=e.target.value
        let ans;
        if(value=="lowercase"){
            console.log(msg)
             ans=msg.toLowerCase()
             console.log(ans)
            setst(ans)
        }else if(value=="uppercase"){
             ans=msg.toUpperCase()
            setst(ans)
        }else if(value=="samecase"){
            ans=msg
            setst(ans)
        }
    }
    return<div>
        String :<input type="text"  id="i1" onBlur={handler}/><br></br>
        Uppercase :<input type="radio" name="xyz" value="uppercase" onChange={vali}/><br></br>
        Lowercase :<input type="radio"name="xyz" value="lowercase" onChange={vali}/><br></br>
        Samecase :<input type="radio"  name="xyz" value="samecase" onChange={vali}/><br></br>
        <p>{st}</p>
    </div>
}