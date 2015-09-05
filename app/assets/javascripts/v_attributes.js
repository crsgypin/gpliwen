var vAddField = function(e,object){
	e.preventDefault();
	var fieldGroupName = $(object).attr('vFieldAdd').replace(/\[/g,'\\[').replace(/\]/g,'\\]')
	var vAttrFieldGroup = new vFieldGroup($('[vFieldGroup=' + fieldGroupName + ']')[0])
	//$(object).closest('[vFieldGroup=' + fieldGroupName + ']') failed to find
	vAttrFieldGroup.addField();
}

var vAttributeRemoveRow = function(e,object){
	e.preventDefault();
	var vAttrField = new vField($(object).closest('.attribute-field')[0])
	vAttrField.remove_this();
}

//regex find last number match(/(\d+)(?!.*\d)/)[0]

var vFieldGroup = function(html){
	this.html = html;
	this.object = $(html);
	this.fieldName = this.object.attr('vFieldGroup')
	this.maxIndex = function(){
		var _this = this;
		var maxIndex = -1;
		var findFieldName = this.fieldName.replace(/\[/g,'\\[').replace(/\]/g,'\\]')
		for(index = 0;index<20;index++){
			var field = this.object.find('[vField=' + findFieldName + '\\[' + index + '\\]]')[0]
			if (field){
				if (maxIndex<index){
					maxIndex = index;
				}
			}
		}
		return maxIndex;
	}
	this.addField = function(){
		var maxIndex = this.maxIndex();
		var newIndex = maxIndex +1;
		var findFieldName = this.fieldName.replace(/\[/g,'\\[').replace(/\]/g,'\\]')
		var vAF = new vField(this.object.find('[vField=' + findFieldName + '\\[' + 0 + '\\]]')[0])
		this.object.find('[vField=' + findFieldName + '\\[' + maxIndex + '\\]]').after(vAF.clone(newIndex));
	}
	this.removeField = function(index){

	}
}

var vField = function(html){
	this.html = html;
	this.object = $(html);
	this.idValue = "";
	this.fieldName= this.object.attr('vField')
	this.index = parseInt(this.fieldName.match(/(\d+)(?!.*\d)/)[0])
	this.destroyName = this.fieldName + "[_destroy]"
	this.fieldIDName = this.fieldName.match(/\w+/g).join('_');

	this.init = function(){
		var _this = this;
		this.object.find('*').each(function(index,element){
			var name = $(element).attr('name');
			if(name){
				var nameAttrs = name.match(/\w+/g);
				if(nameAttrs[3]=="id"){
					_this.idValue = $(element).attr('value');
				}
			}
		})
	}
	this.clone = function(newIndex){
		var _this = this;
		var newObject = this.object.clone();

		var fieldName = this.fieldName;
		var newFieldName = this.newFieldName(newIndex);
		var fieldIDName = this.fieldIDName;
		var newFieldIDName = this.newFieldIDName(newIndex);

		newObject.find('*').andSelf().each(function(index,element){
			var list = ['name','vfield','vfieldremove','vfieldadd']
			list.forEach(function(str){
				var elmAttr = $(element).attr(str);
				if(elmAttr){
					$(element).attr(str,elmAttr.replace(fieldName, newFieldName));
				}
			})
			var id = $(element).attr('id');
			if(id){
				$(element).attr('id', id.replace(fieldIDName, newFieldIDName) );
			};

			if ($(element).prop('tagName').toLowerCase() != 'option'){
				if($(element).attr('value')){
					$(element).attr('value',"")
				};
				$(element).val("");
			}
		})
		return newObject;
	}
	this.remove_this = function(){
		if(this.idValue==""){
			this.object.remove();
		}else{
			var hiddenInput = $("<input type='hidden' name=" + this.destroyName + " value='1'>")[0]
				this.object.prepend(hiddenInput);
			this.object.hide();
		}
	}

	this.newFieldName = function(newIndex){
		var lastIndex = this.fieldName.length;
		for(i=this.fieldName.length ; i>0;i--){
			if(this.fieldName[i]=='['){
				lastIndex = i;
				break;
			}
		}
		return this.fieldName.substring(0,lastIndex) + "[" + newIndex + "]";
	}

	this.newFieldIDName = function(newIndex){
		var lastIndex = this.fieldIDName.length;
		for(i=this.fieldIDName.length; i>0;i--){
			if(this.fieldIDName[i]=='_'){
				lastIndex = i;
				break;
			}			
		}
		return this.fieldIDName.substring(0,lastIndex) + "_" + newIndex;
	}

	this.init();
}



