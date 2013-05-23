function showUserOrComLogin(id){
	if(id == 1){
		$("#userLoginObj").css("text-decoration","underline");
		$("#companyLoginObj").css("text-decoration","none");
		$("#userLogin").show();
		$("#companyLogin").hide();
	}else if(id == 2){
		$("#userLoginObj").css("text-decoration","none");
		$("#companyLoginObj").css("text-decoration","underline");
		$("#userLogin").hide();
		$("#companyLogin").show();
	}
}
