const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
let count = 0;
const db = mysql.createConnection({
    host:'us-cdbr-east-04.cleardb.com',
    user: 'b16e212df88717',
    password:'eaf52ea9',
    database:'heroku_8f1a510753748e7'
})

// mysql://b16e212df88717:eaf52ea9@us-cdbr-east-04.cleardb.com/heroku_8f1a510753748e7?reconnect=true
db.connect((err)=>{
    if(err){
        console.log(err);
    }
    else{
        console.log("connected");
    }
})
require('dotenv').config();

const app = express();
const port = process.env.PORT || 9000;



app.use(cors());
app.use(express.json());

// Shoe Screen
app.get("/shoe",(req,res)=>{
    const sql = "SELECT * FROM shoes_for_sale";
    db.query(sql,(err,result)=>{
        if(!err){
            res.send(result);
            count +=1;
            console.log("receieved",(count));
        }
        else{
            res.send(err);
            console.log("errror");
        }
        
    })
})
// get all suppliers
app.get("/supplier",(req,res)=>{
    console.log("supplier called");
    const sql = "SELECT * FROM Supplier";
    db.query(sql,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else{
            res.send(err);
            console.log("errror");
        }
        
    })
})
// Add to to invoice
//Add to customer 


// app.get("/", (req,res) =>{ 
//     const sqlInsert = "SELECT * FROM shoes_for_sale";
    
// } )

app.listen(port,()=> {
    console.log("Server Started: Port", port);
})