// Dynamic site visitor data

const visitorData = {
    "Oct":213,
    "Sep":242,
    "Aug":431,
    "Jul":114,
    "Jun":396,
    "May":476,
};


const table = document.createElement("table");

for(const month in visitorData){
    const visitors = visitorData[month];

    const newTr = document.createElement("tr");

    const newTd1 = document.createElement("td");
    const newTd2 = document.createElement("td");

    newTd1.textContent = month;
    newTd2.textContent = visitors;

    newTr.appendChild(newTd1);
    newTr.appendChild(newTd2);

    table.appendChild(newTr);
}


document.querySelector("#tableContainer").appendChild(table);



// GDPR

const cookie = document.querySelector("#cookie");
const cookieLink = document.querySelector("#cookieLink");
cookieLink.addEventListener('click', acceptCookie);


function acceptCookie(){
    cookie.textContent = "Cookies were accepted. Would you like to revoke?";
    cookieLink.textContent = "Revoke";
    cookieLink.addEventListener('click', revoke);
    cookieLink.removeEventListener('click', acceptCookie);
}


function revoke(){
    cookie.textContent = "cookie Usage";
    cookieLink.textContent = "Accept Cookies";
    cookieLink.addEventListener('click', acceptCookie);
    cookieLink.removeEventListener('click', revoke);
}



// Reading assistance

const button = document.querySelector("#button");
button.addEventListener('click', readingAssistance);

function readingAssistance(){
  for(const e of document.querySelectorAll("*")){
    e.classList.add("readingAssistance");
  }
}



// Keyboard shortcut

document.addEventListener('keydown', (event)=>{
  if (event.code == 'KeyA' && (event.ctrlKey || event.metaKey)) {
    readingAssistance();
  }
});

	



