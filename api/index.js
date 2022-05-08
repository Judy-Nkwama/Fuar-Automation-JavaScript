const http = require("http");

const options = {
    hostname : "localhost",
    port : 8000,
    protocol : "http:",
    path : "/api/koltuklar",
    headers : {
        "content-type" : "application/json"
    },
    method : 'POST',
};

//implementations of GET requests
let body = null;
let request = null;

const fullit = (i) => {
    request = http.request(options, (res) => {
        
        res.on('data', (chunk) => {
            console.log(`BODY: ${chunk}`);
        });
    
        res.on('end', () => {
            console.log('done');
            if(i <= 150 ){ fullit(i + 1);}
        });
            
    });
    
    request.on("error", err => {
        console.log(`An Error occured when sending the request : ${err.message}`);
    });
    
    body = JSON.stringify({
        "salon_id": 3,
        "koltuk_numarasi": "GAMMA-" + i
    });
    
    request.write(body);
    request.end();
}

fullit(1);


/*
fetch("http://localhost:8000/uyeler",
    {
        method : "POST",
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(body)
    }
).then(
    res => {
        console.log(JSON.parse(res));
    }
);*/

/*{
	"ad" : "Mete",
    "soyad" : "Atatüre",
    "email" : "mete@gmail.com",
    "tel" : "+90783674689",
    "internet_sitesi" : "https://www.phy.cam.ac.uk/directory/ataturem",
    "kurum" : "Cambridge University",
    "kurum_gorevi" : "Academisyen",
    "hakkinda" : "Bilkent Üniversitesi Fizik bölümünden 1996 yılında mezun oldu. Aynı yıl Boston Üniversitesi Kuantum Görüntüleme Laboratuvarinda çok parametreli dolanıklık ve kuantum girişim alanında doktora çalışmalarına başladı. 2002 yılında doktorasını alan Atatüre, ETH Zurih’te Profesör Atac Imamoglu’nun grubunda araştırma görevlisi olarak yer aldı. 2007 yılında Cambridge Üniversitesi Fizik bölümü ’nde öğretim üyesi olarak katılıp kendi araştırma grubunu kurdu, 2015 yılında profesör oldu. Halen aynı bölümde kuantum malzeme ve sistemler konusunda ekibiyle beraber araştırmalarına devam etmekte olan Atatüre, Institute of Physics ve Bilim Akademisi Derneği üyesidir. ", 
  	"ana_bilgi_alani_id" : 15,
    "meslek_id" : 21,
    "ulke_id" : 190,
    "sehir" : "Ankara",
    "sifre" : "54653"
}

{
  "baslik":"Bilim İnsanının Katmanları",
  "tarih":"2021-04-12",
  "konuya_giris_metni":"Eskiden bilim adamları nasıldı, peki şimdi nasıl? Mete Atatüre, günümüzün değişen bilim insanı kavramını katmanlarıyla açıklıyor. ",
  "baslangic_saati":"17:30:00",
  "bitis_saati":"21:00:00",
  "arka_plan_linki":"https://www.esciupfnews.com/wp-content/uploads/2021/01/Evolution-COVID19-Lao.jpg",
  "salon_id": 1,
  "etkinlik_dili_id": 2 ,
  "etkinlik_turu_id": 2
}


*/