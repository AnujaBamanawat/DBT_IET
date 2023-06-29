import {useSate, useState} from "react"
export default function Curr2(){

        let [st,setst]=useState("")
        let[f,setf]=useState("")
        let[t,sett]=useState("")
        let val;
        let from;
        let t;
        let ans;
        handler=(e)=>{
            val=e.target.value
           setst(val) 
        }
        
        check=()=>{
             from=e.target.value
            setf(from)
        }
        check2=()=>{
             t=e.target.value
            sett(t)
        }


        final=()=>{
            switch(from){
                case "Dollar":
                if(t=="Dollar"){
                   ans=val
                   setst(ans)
                }else if()
            }
        }




    return<div>

        Amount:<input type="number" onBlur={handler}/>
        From :<select onBlur={check}>
            <option>Dollar</option>
            <option>Rupee</option>
        </select>
        To :<select onBlur={check2}>
            <option>Dollar</option>
            <option>Rupee</option>
        </select>
        <p>Convert Amount :</p>
        <button onClick={final}>Convert</button>
    </div>
}