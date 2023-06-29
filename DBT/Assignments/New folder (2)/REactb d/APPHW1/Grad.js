import { useState } from "react";
import Childg1 from"./Ug"
import Childg2 from "./Graduate"
import Childg3 from "./PG"

export default function Grad(){

        let [hideflag1,setflag1]=useState(true)
        let [hideflag2,setflag2]=useState(true)
        let [hideflag3,setflag3]=useState(true)
        let [name,setn]=useState("")
        let [email,sete]=useState()
        function check(e){
            setn(e.target.value) 
        }
        function check2(e){
            sete(e.target.value)
        
        }
        function checktrue(e){
            if(e.target.value=="UnderGrad"){
                setflag1(false)
                 setflag2(true)
                 setflag3(true)
            }
            else if(e.target.value=="Graduate"){
                setflag2(false)
                 setflag1(true)
                 setflag3(true)
            }
            else if(e.target.value=="PG"){
                setflag3(false)
                 setflag1(true)
                 setflag2(true)
            }
            else if(e.target.value=="Select"){
                setflag3(true)
                setflag1(true)
                setflag2(true)
            }
        }
        






    return<div style={{borderStyle:"solid",width:"fit-content",margin:"auto",padding:"7px",marginTop:"2%" }}>
        Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" placeholder="Enter name" onBlur={check}/>
        <br></br>
        <br></br>
        &nbsp;Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="email" placeholder="xyz@gmail.com" onBlur={check2}/>
        <br></br>
        <br></br>
        Qualification:&nbsp;&nbsp; <select onChange={checktrue}>
            <option>Select</option>
            <option>UnderGrad</option>
            <option>Graduate</option>
            <option>PG</option>
        </select>
         {hideflag1?"": <Childg1 Name={name} Email={email}  ></Childg1>}
         {hideflag2?"": <Childg2 Name={name} Email={email}  ></Childg2>}
         {hideflag3?"": <Childg3 Name={name} Email={email}  ></Childg3>}
         
    </div>
}