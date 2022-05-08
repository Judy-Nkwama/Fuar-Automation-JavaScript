const tools = require("./tools");
const sql = require("./sql");

//**************** POST REQUEST HANDLING ***************/

const posts = (app, pool) => {
    //This function creates a post basic post request listeners
    const postCreator = (resourceName, sqlReq, dataSchema ) => {
        /*{
            resourceName : string, // The name of the ressouce. (The name used in the request url)
            sqlReq : [function], // Receives the SQL statement creator function imported from "sql.js". Returns the SQL STATEMENT and the respective VALUES Array
            dataSchema : [Joi.object()] // The data structure validator imported from "tools.js"
        }*/
        app.post(`/api/${resourceName}`, (req, res)=>{
            
            if(req.body == null){ 
                res.status( 400 ).send("The request body object has to be specified for the POST request. Bad request");
            }else{
                pool.getConnection((error, connection) => {
                    if( error ){ 
                        res.status(500).send(`DataBase connection error. An error occured when trying to connect to the db : ${error.message}`);
                    }else{
                        const { value, error} = dataSchema.validate(req.body);
                        if(error){
                            res.status(400).send(`Body validation error. The data you sent to be added to the db is not valide : ${error.message}`);
                        }else{
                            connection.query(sqlReq(value).request, sqlReq(value).values, (error, addedElement)=> {
                                if( error ){
                                    res.status(500).send(`Data POSTING error. An error occured when posting your data to the db table : ${error.message}`);
                                }else{
                                    res.send(JSON.stringify(addedElement));
                                }
                            });
                        }
                    }
                });
            }
        });
    };

    postCreator("uyeler", sql.newUye, tools.validUyeSchema);//Handling uyeler post requests
    postCreator("bilgiAlanlari", sql.newBilgiAlani, tools.validBilgiAlani);//Handling bilgiAlanlari post requests
    postCreator("diller", sql.newDil, tools.validDil );//Handling diller post requests 
    postCreator("etkinlikTurleri", sql.newEtkinlikTuru, tools.validEtkinlikTuru);//Handling etkinlik_turleri post requests
    postCreator("meslekler", sql.newMeslek, tools.validMeslek, tools.newMeslek);//Handling etkinlik_turleri post requests 
    postCreator("salonlar", sql.newSalon, tools.validSalon);//Handling yoneticiler requests 
    postCreator("koltuklar", sql.newKoltuk, tools.validKoltuk);//Handling koltuklar requests
    postCreator("yoneticiler", sql.newEtkinlik, tools.validYonetici);//Handling salonlar requests 

    //POSTING A NEW KONUSMACI
    postCreator("konusmacilar", sql.newKonusmaci, tools.validKonusmaci);
    postCreator("konusmaciDilleri", sql.newKonusmaciDili, tools.validKonusmaciDili);
    postCreator("konusmaciBilgiAlanlari", sql.newKonusmaciBilgiAlani, tools.validKonusmaciBilgiAlani);

    //POSTING A NEW ETKINLIK
    postCreator("etkinlikler", sql.newEtkinlik, tools.validEtkinlik);
    postCreator("etkinliklerinKonusmacilari", sql.newEtkinliklerinKonusmacilari, tools.validatEtkinliklerinKonusmacilari);
    postCreator("etkinliklerinCanliBaglantilari", sql.newEtkinliklerinCanliBaglantilari, tools.validatetkinliklerinCanliBaglantilari);
    postCreator("etkinliklerinYonelikOlduklariBilgiAlanlari", sql.newEtkinliklerinYonelikOlduklariBilgiAlanlari, tools.validatetkinliklerinYonelikOlduklariBilgiAlanlari);

    //POSTING A NEW BILET KOLTUK
    postCreator("biletler", sql.newBilet, tools.validBilet);
    postCreator("biletKoltuklari", sql.newBiletKolkuk, tools.validBiletKoltuk);
};

module.exports = posts;