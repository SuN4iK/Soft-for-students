function studentDelete() {
    var chekedCheckBoxes = document.getElementsByClassName("checkbox");
    var countChecked = 0;
    var idsToDelete ="";
    for(var i =0; i<chekedCheckBoxes.length; i++){
        if(chekedCheckBoxes[i].checked){
            countChecked++;
            idsToDelete = idsToDelete +chekedCheckBoxes[i].value + " ";
        }
    }
    if(countChecked ==0) {
        alert("Пожалуйста, выберите студента");
        return;
    }
    document.getElementById('hiddenIdsToDelete').value = idsToDelete;
    document.getElementById('formToDelete').submit();

}