import {useState} from "react"
export default function Upper(){

    let  [st,setst]=useState()
    let [msg,setm]=useState("")
    
    
        let str=""
    function handler(e){
        
         str=e.target.value
        setm(str)
    }

    function check(e){
        let value= e.target.value
        if(msg==""){
            let str1="Enter a string"
            setst(str1)
        }
        else{
            if(value==="uppercase"){
            setst(msg.toUpperCase())
             }else if(value==="lowercase"){
            setst(msg.toLowerCase())
            }else if(value==="titlecase"){
            setst(msg.charAt(0).toUpperCase().concat(msg.substring(1).toLowerCase()))
            }else{
            setst(msg)
            }
        }
    }



    return<div style={{borderStyle:"solid",textAlign:"center",width:"fit-content",margin:"auto",padding:"5px",marginTop:"2%"}}>
        <h3>String Formats</h3>
        Name :<input type="text" onBlur={handler}/>
        <br></br>
        <br></br>
        <label for="uppercase">Uppercase :</label><input type="radio"   name="uppercase"   value="uppercase"onChange={check}/>
        <br></br>
        <label for="titlecase"> Titlecase :</label><input type="radio"  name="uppercase"   value="titlecase"onChange={check}/>
        <br></br>
        <label for="lowercase">Lowercase :</label><input type="radio"  name="uppercase"   value="lowercase"onChange={check}/>
        <br></br>
        <p>{"Answer : "}{st}</p>
    </div>

}