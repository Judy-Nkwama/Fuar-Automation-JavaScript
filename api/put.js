//**************** POST REQUEST HANDLING ***************//

const tools = require("./tools");
const http = require("http");
const sqlReq = require("./sql");

//************ UYE ***************//

const puts = (app, pool) =>{

    //This function Creates a put request listener. 
    //It receives a [resourceName : string, table : string, sqlGenFunc : function, dataSchema : Joi.object()] 
    //"resourceName" : Is The name of the table in the request url /  "sqlGenFunc" is a sql generator statement function impoted from sql.js
    const putCreator = ( resourceName ,table, sqlGenFunc, dataSchema ) => {

        app.put(`/api/${resourceName}/:id`, ( req, res )=> {
            const id = req.params.id;

            //This function returns the object itself if it's valid
            const body = dataSchema.validate(req.body);

            //FIRST LET CHECK IF THE ID EXISTS IN THE TABLE
            const request = http.get( tools.reqOptionObj(`/api/${resourceName}/${id}`, "GET"));
            let data = "";
            request.on("response", response => {

                const { statusCode } = response;
                if(statusCode == 200){
                    
                    response.on("data", chunck => {
                        data += chunck; 
                    });
                    response.on("end", () => {//IF AN ERROR OCCURES WHEN CHEKING THE ID
                        if( !(JSON.parse(data).lengh == 0) ){// IF THE ID EXISTS

                            //SECONDLY WE CHECK IF THE DATA IS VALIDE
                            if(!(body.error)){//IF THE DATA IS VALIDE
                                
                                //THEN WE UPDATE THE DATA
                                pool.getConnection(( error, connection ) => { //
                                    
                                    if(!error){
                                        body.value.id = parseInt(id);//First that object doesn't contain the id. So, we Update add the id
                                        const updateReq = connection.query( sqlGenFunc(body.value), (error, results) => {
                                            if(!(error)){
                                                //We we add the Id of the updated element to the result object sent too the client
                                                results.updatedId = body.value.id
                                                res.send(JSON.stringify(results));
                                            }else{
                                                res.send(`An error occured when creating the connection with the db in oder to update your item : ${error.message}`);
                                            }
                                        });

                                    }else{
                                        res.status( 500 ).send(`An error occured when creating the connection with the db in oder to update your item : ${err.message}`);
                                    }
                                    
                                });
                        
                            }else{//IF THE DATA SENT BY THE CLIENT IS NOT VALIDE
                                res.status( 400 ).send(`An error occured. The data sent is invalid : ${body.error.message}`);
                            }

                        }else{// IF THE ID DOES NOT EXISTS
                            res.status( 404 ).send(`An error occured There's no such Id in the table`);
                        }
                    });
                
                    response.on("error", err => {//IF AN ERROR OCCURES WHEN CHEKING THE ID
                        res.status( 500 ).send(`An error occured when checking the existance of the PUT req Id: ${err.message}`);
                    });

                }else{//IF AN ERROR OCCURES WHEN CHEKING THE ID
                    switch(statusCode){
                        case 400 :
                            res.status( 400 ).send("An error occured when checking the existance of the PUT req Id: Bad Request");
                            break;
                        case 404 : 
                            res.status( 404 ).send("An error occured when checking the existance of the PUT req Id: Id not found");
                            break;
                        default :
                            res.status( 500 ).send("An error occured when waiting for the response : Server Error");
                            break;
                    }
                }
            });

            request.on("error", err => {//IF AN ERROR OCCURES WHEN CHEKING THE ID
                res.status( 500 ).send(`An error occured when waiting for the response : ${err.message}`);
            });
            
        });

    }

    putCreator("uyeler" ,"uyeler", sqlReq.updateUye, tools.validUyeSchema );//Handling uyeler requests 
    putCreator("bilgiAlanlari", "bilgi_alanlari", sqlReq.updateBilgiAlani, tools.validBilgiAlani );//Handling bilgiAlanlari requests 
    putCreator("diller" ,"diller", sqlReq.updateDil, tools.validDil );//Handling diller requests 
    putCreator("etkinlikTurleri" ,"etkinlik_turleri", sqlReq.updateEtkinlikTuru, tools.validEtkinlikTuru );//Handling etkinlik_turleri requests 
    putCreator("meslekler" ,"meslekler", sqlReq.updateMeslek, tools.validMeslek );//Handling meslekler requests 
    putCreator("salonlar", "salonlar", sqlReq.updateSalon, tools.validSalon);//Handling salonlar requests 
    putCreator("yoneticiler", "yoneticiler", sqlReq.updateYonetici, tools.validYonetici);//Handling yoneticiler requests 

    //PUTING KONUSMACILAR
    putCreator("konusmacilar", "konusmacilar", sqlReq.updateKonusmaci, tools.validKonusmaci);     
    putCreator("konusmaciDilleri", "konusmaci_dilleri", sqlReq.updateKonusmaciDili, tools.validKonusmaciDili);
    putCreator("konusmaciBilgiAlanlari", "konusmaciler_diger_bilgi_alanlar", sqlReq.updateKonusmaciBilgiAlani, tools.validKonusmaciBilgiAlani);

    //PUTING ETKINLIKLER
    putCreator("etkinlikler" ,"etkinlikler", sqlReq.updateEtkinlik, tools.validEtkinlik );
    putCreator("etkinliklerinKonusmacilari" ,"etkinliklerin_konusmacilari", sqlReq.updateEtkinliklerinKonusmacilari, tools.validatEtkinliklerinKonusmacilari );
    putCreator("etkinliklerinCanliBaglantilari" ,"etkinlik_canli_baglantilari", sqlReq.updateEtkinliklerinCanliBaglantilari, tools.validatetkinliklerinCanliBaglantilari );
    putCreator("etkinliklerinYonelikOlduklariBilgiAlanlari" ,"etkinliklerin_yonelik_olduklari_bilgi_alanlari", sqlReq.updateEtkinliklerinYonelikOlduklariBilgiAlanlari, tools.validatetkinliklerinYonelikOlduklariBilgiAlanlari );



    //PUTING ETKINLIKLER
    //putCreator("koltuklar", "koltuklar" , sql.updateKoltuk, tools.validKoltuk);  
}; 

module.exports = puts;
