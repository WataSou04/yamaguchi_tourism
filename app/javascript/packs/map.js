(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.API_KEY
});

let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");


  map = new Map(document.getElementById("map"), {
    center: { lat: 34.25080, lng: 131.58422 },
    zoom: 10,
    mapTypeControl: false
  });

  var url = new URL(window.location.href);
  var paths = url.pathname.split('/');
  var id = paths.pop();
  var json_url = "";
  if(url.pathname.indexOf("/favorite/show") == 0 ){
    json_url = "/favorite/show.json";
  }
  else{
    json_url = `/admin/tourist_spots/${id}.json`;
  }
  console.log(url.pathname.indexOf("/favorite/show"));
  console.log(json_url);
  const response = await fetch(json_url).then((res) => res.json()).catch(error => console.error(error))
  if (response.data.items) {
    const items = response.data.items
    items.forEach((item) => {
      const Name = item.name;
      const Image = item.image;
      const address = item.address;
      const category = item.category;
      const marker = new google.maps.Marker({
        position: new google.maps.LatLng(item.latitude, item.longitude),
        map,
        title: Name,
      });
      const contentString = `
        <div class="information container p-0">
          <div class="mb-3">
            <img src="${Image}" width="180" height="130" loading="lazy">
          </div>
          <div>
            <h4 class="font-weight-bold">${Name}</h4>
            <p class="text-muted">${address}</p>
            <p>${category}</p>
          </div>
        </div>
      `;
      
      const infowindow = new google.maps.InfoWindow({
        content: contentString,
        ariaLabel: Name,
      });
      
      marker.addListener("click", () => {
          infowindow.open({
          anchor: marker,
          map,
        })
      });
    });
  }
}

initMap()