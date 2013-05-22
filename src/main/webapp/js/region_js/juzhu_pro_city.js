function scity_j(pname,cname,sf,cs){
	/*
		自定义函数中pname代表传进来的省份下拉框的name值，
		cname代表传进来的城市下拉框的name值
		sf代表传进来的省份值
		cs代表传进来的城市值
	*/
	//定义省份数组
	var province=["北京市","天津市","河北省","山西省","内蒙古","辽宁省","吉林省","黑龙江省","上海市"," 江苏省","浙江省",
				  "安徽省","福建省","江西省","山东省","河南省","湖北省","湖南省","广东省","广西自治区","海南省",
				  "重庆市","四川省","贵州省","云南省","西藏自治区","陕西省","甘肃省","青海省","宁夏回族自治区",
				  "维吾尔自治区","香港特别行政区","澳门特别行政区","台湾省","其它"];
				/*
					省份下拉框
				*/	
					document.write('<select id="pro_j" onchange="select_city_j(this)" name="'+pname+'">');
							document.write('<option value="">--请选择省份--</option>');
						var a=0;
						for(var i=0;i<province.length;i++){					
							if(typeof(sf)!="undefined"){
								if(province[i]==sf){
									var sel="selected";
									a=i;
									}
								else
									var sel="";			
							}else{
								var sel="";
							}
							document.write('<option '+sel+' value="'+province[i]+'">'+province[i]+'</option>');
						}
					document.write('</select>');
					
				/*
					省份对应的城市下拉框
				*/	
					document.write('<select id="city_j" name="'+cname+'">');
							document.write('<option value="">--请选择城市--</option>');			
					document.write('</select>');
				if(a>0){
					select_city_j(document.getElementById("pro_j"),a,cs);
				}
					//
				}
function select_city_j(pro_obj,a,cs){
	
	if(typeof(a)!="undefined"){
		var index=a;
	}else{
		var index=pro_obj.selectedIndex-1;
	}
	var city_obj=document.getElementById("city_j");
		city_obj.innerHTML="";
	if(index>=0){
		for(var i=0;i<city[index].length;i++){
			if(typeof(cs)!=undefined){
				if(city[index][i]==cs){
					var sel="selected";
				}else
					var sel="";
			}else{
				var sel="";
			}
			var option=document.createElement("option");
			var text=city[index][i];
				option.value=text;
				option.selected=sel;
				option.innerHTML=text;
				city_obj.appendChild(option);
			}
		}else{
			var option=document.createElement("option");
				option.innerHTML="--请选择城市--";
				city_obj.appendChild(option);
	}
	
}				