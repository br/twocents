var options = 2;
function add_fields() {
  if(options < 4){
    options++;
    var objTo = document.getElementById('room_fileds')
    var divtest = document.createElement("div");
    divtest.innerHTML = '<div class="content"><span><input type="text" placeholder="Option Title" /></span></div>';

    objTo.appendChild(divtest)
  }
  else {
    document.getElementById("more_fields").style.visibility = "hidden";
     document.getElementById("more_fields").disabled=true;
}
}
