import { useState } from "react";


export default function Square(){

    let[a,b]=useState();

   function handler(e){

       let sqr=e.target.value
       
         b(sqr*sqr);
   }  
    
return <div>

Enter num<input type="number" id="i1" onBlur={handler}></input>
<p >square is {a}</p>

</div>
}
