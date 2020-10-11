const CAT_STATE = {};

function toggleState(category){

  if(+CAT_STATE[category]){
    CAT_STATE[category] = 0;
  }else{
    CAT_STATE[category] = 1;
  }
  localStorage.setItem(category, CAT_STATE[category]);
  logFileText('bookmarks.csv');
}

function formatAMPM(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? 'pm' : 'am';
  hours = hours % 12;
  hours = hours ? hours : 12;
  minutes = minutes < 10 ? '0'+minutes : minutes;
  var sec = date.getSeconds();
  sec = sec < 10 ? '0'+sec : sec;
  var strTime = hours + ':' + minutes + ':' + sec + ' ' + ampm;
  return strTime;
}

const showMessage = async file => {
  const response = await fetch('message');
  const text = await response.text()
  document.querySelector("#message").innerHTML = text; 
}
showMessage();

const logFileText = async file => {
  const response = await fetch(file)
  const text = await response.text()
  const lines = text.split('\n').slice(1);
  const categories = {};
  lines.forEach( (line) =>{
    if(line.length == 0){
      return;
    }
    line = line.split(',');
    if(!categories[line[0]]){
      categories[line[0]] = [];
    }
    categories[line[0]].push(line.slice(1).map(a=>a.trim()));
  });

  let body = '';
  Object.keys(categories).forEach( (category) =>{

    if(localStorage.getItem(category) === null){
      localStorage.setItem(category, 1);
      CAT_STATE[category] = 1;
    }else{
      CAT_STATE[category] = +localStorage.getItem(category);
    }

    body += `<div class="name">
      ${category}: { 
      <button class="btn" onclick="toggleState('${category}')">${CAT_STATE[category] ? '[ - ]' : '[ + ]'}</button> ${ CAT_STATE[category] ? ' ' : '},' }
      </div>`

    if(CAT_STATE[category] == 1){
      body += '<ul>';
      categories[category].forEach( (line)  =>{
        body += this.getLineItemHTML(line);
      });
      body += '</ul>'
      body += `<div class="name">},</div>`
    }
  });

  console.log(CAT_STATE)

  document.querySelector("#links").innerHTML = body; 
}

function getLineItemHTML(line){
  return `<li>
            <a href="${line[2]}" rel="noreferrer">
              <img src="http://www.google.com/s2/favicons?domain=${line[2]}"></span>
              <span class="name">${line[0]}: </span>
              <span class="value">${line[1]}</span>
              <span class="name">,</span>
            </a>
          </li>`
}

logFileText('bookmarks.csv');

function currentTime(){

  document.querySelector(".clock").innerHTML = formatAMPM(new Date()); 
  var t = setTimeout(function () {
    currentTime()
  }, 1000);
}
currentTime()
