import { useState } from "react";

export default function Login(){

let[unamee,setu]=useState("")
let[pwdd,setp]=useState("")   
let [ans,seta]=useState("")
 
    let arr=[
        { uname: "xxx" ,password :"123"},
        { uname: "rrr" ,password :"13"},
        { uname: "xeex" ,password :"23"},
    ]

    let result="dfdrtted"

  
    function check(e){
        console.log(1)
        for(let i=0;i<arr.length;i++){
            console.log(2)
            if(arr[i].uname=unamee && arr[i].password==pwdd){
                 seta("Login Success")
                 break;
            }else{
                seta("Wrong Credentials, Try Again")
            }
        }
    }


    return<div>
        Name :<input type="text" placeholder="Enter name" onBlur={(e)=>{setu(e.target.value)}}/>
        Password : <input type="password"  onBlur={(e)=>{setp(e.target.value)}}/>
        <button onClick={check}>Submit</button>
        <p>{ans}</p>
    </div>
}