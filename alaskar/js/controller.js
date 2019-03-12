var SERVER_PATH = "../";
var SERVICE_PATH = SERVER_PATH + "services.php";
var TYPE_TEXT = "text";
var TYPE_CLIPART = "clipart";
var TYPE_IMAGE = "image";
var COLORPICKERTYPE_TEXTCOLOR = "textColor";
var COLORPICKERTYPE_CLIPARTCOLOR = "clipartColor";
var COLORPICKERTYPE_TEXTOUTLINECOLOR = "textOutlineColor";

angular.module('SharedServices', []).config(['$httpProvider',
function($httpProvider) {
	$httpProvider.responseInterceptors.push('myHttpInterceptor');
	var spinnerFunction = function(data, headersGetter) {
		// todo start the spinner here
		//alert('start spinner');
		$('#ajaxLoader').show();
		return data;
	};
	$httpProvider.defaults.transformRequest.push(spinnerFunction);
}])

// register the interceptor as a service, intercepts ALL angular ajax http calls
.factory('myHttpInterceptor', ['$q', '$window',
function($q, $window) {
	return function(promise) {
		return promise.then(function(response) {
			// do something on success
			// todo hide the spinner
			//alert('stop spinner');
			$('#ajaxLoader').hide();
			return response;

		}, function(response) {
			// do something on error
			// todo hide the spinner
			//alert('stop spinner');
			$('#ajaxLoader').hide();
			return $q.reject(response);
		});
	};
}]);

//regular angular initialization continued below....
angular.module('myApp', ['SharedServices']).controller('FrontController', ['$scope', '$http',
function($scope, $http) {

	$scope.SERVER_PATH = SERVER_PATH;
	$scope.selectedPanel = "";
	$scope.productCategories = [];
	$scope.selectedProductCategory = "";
	$scope.selectedProductCategoryId = 0;

	$scope.selectedProduct = "";
	$scope.wasPrevProductScreenPrinting = false;
	$scope.product = "";
	$scope.selectedProductId = 0;

	$scope.selectedProductColorId = 0;
	$scope.selectedProductColor = "";
	$scope.productViews = [];
	$scope.productViewsForColor = [];
	$scope.selectedProductView = "";

	$scope.selectedProductViewForColor = "";
	$scope.selectedViewId = 0;

	$scope.selectedDrawAreaId = 1366788686;
	$scope.fonts = [];
	$scope.defaultFontId = 0;
	$scope.defaultFont
	$scope.selectedFontId = 0;
	$scope.selectedFont= '';
	
	$scope.sizes = "";
	$scope.selectedSize = '';
	$scope.selectedSizeId = 0;
	$scope.boldSelected = false;
	$scope.italicSelected = false;
	$scope.underlineSelected = false;

	$scope.addEditTextModel = "";

	$scope.textColorPickerType = COLORPICKERTYPE_TEXTCOLOR;
	//one of  the value from {'textColor,textOutlineColor,clipartColor'}.

	$scope.selectedClipartIndex = 0;
	//one of  the value from {'textColor,textOutlineColor,clipartColor'}.

	$scope.textColorPickerValue = "#FF0000";
	$scope.clipartColorPickerValue = "#000000";
	$scope.textOutlineWidthValue = 1;
	$scope.textArcValue = 0;

	$scope.clipartCategories = "";
	$scope.cliparts = "";

	$scope.fabricContextArr = [];
	$scope.mainProductId = 0;
	$scope.mainProductData = "";
	$scope.price = 0;

	$scope.commonFields = "";
	$scope.userUploads = [];
	$scope.isProductClicked = true;
	$scope.uploadImageCheckBox = false;
	var savedData = "";

	$scope.prevSelectedObject = "";

	$scope.pagedProductData = [];
	$scope.pagedUploadedData = [];
	$scope.pagedClipartData = [];
	$scope.detailPrice = {};

	$scope.screenPrintingColors = [];
	$scope.isFirstTime = true;
	
	$scope.textEffects = [{
		'name' : 'normal',
		'title' : 'Normal'
	}, {
		'name' : 'arc-top',
		'title' : 'TOP ARC'
	}, {
		'name' : 'arc-bottom',
		'title' : 'BOTTOM ARC'
	}, {
		'name' : 'arch-top',
		'title' : 'TOP ARCH'
	}, {
		'name' : 'arch-bottom',
		'title' : 'BOTTOM ARCH'
	}, {
		'name' : 'bulge',
		'title' : 'Bulge'
	}, {
		'name' : 'bulge-top',
		'title' : 'TOP BULGE'
	}, {
		'name' : 'bulge-bottom',
		'title' : 'BOTTOM BULGE'
	}, {
		'name' : 'concave',
		'title' : 'CONCAVE'
	}, {
		'name' : 'concave-top',
		'title' : 'TOP CONCAVE'
	}, {
		'name' : 'concave-bottom',
		'title' : 'CONCAVE BOTTOM'
	}, {
		'name' : 'convex',
		'title' : 'CONVEX'
	}, {
		'name' : 'convex-top',
		'title' : 'TOP CONVEX'
	}, {
		'name' : 'convex-bottom',
		'title' : 'BOTTOM CONVEX'
	}, {
		'name' : 'pinch',
		'title' : 'PINCH'
	}, {
		'name' : 'pinch-top',
		'title' : 'TOP PINCH'
	}, {
		'name' : 'pinch-bottom',
		'title' : 'BOTTOM PINCH'
	}, {
		'name' : 'wave-top',
		'title' : 'TOP WAVE'
	}, {
		'name' : 'wave-bottom',
		'title' : 'BOTTOM WAVE'
	}, {
		'name' : 'wedge-top',
		'title' : 'TOP WEDGE'
	}, {
		'name' : 'wedge-bottom',
		'title' : 'BOTTOM WEDGE'
	}, {
		'name' : 'wedge-left',
		'title' : 'LEFT WEDGE'
	}, {
		'name' : 'wedge-right',
		'title' : 'RIGHT WEDGE'
	}, {
		'name' : 'wedge-top-left',
		'title' : 'TOP-LEFT WEDGE'
	}, {
		'name' : 'wedge-top-right',
		'title' : 'TOP-RIGHT WEDGE'
	}, {
		'name' : 'wedge-bottom-left',
		'title' : 'BOTTOM-LEFT WEDGE'
	}, {
		'name' : 'wedge-bottom-right',
		'title' : 'BOTTOM-RIGHT WEDGE'
	}];
	
	$scope.selectedTextEffect = $scope.textEffects[0];	
	
	$scope.textStyles = [{
		'name' : 'plain',
		'title' : 'Plain'
	}, {
		'name' : 'outline',
		'title' : 'Outline'
	}, {
		'name' : 'glow',
		'title' : 'Glow'
	}, {
		'name' : 'soft-shadow',
		'title' : 'Soft Shadow'
	}, {
		'name' : 'hard-shadow',
		'title' : 'Hard Shadow'
	}, {
		'name' : 'stamp',
		'title' : 'Stamp'
	}, {
		'name' : 'bevel',
		'title' : 'Bevel'
	}, {
		'name' : 'antibevel',
		'title' : 'Anti Bevel'
	}, {
		'name' : 'innerbevel',
		'title' : 'Inner Bevel'
	}, {
		'name' : 'roundbevel',
		'title' : 'Round Bevel'
	}];
	
	$scope.selectedTextStyle = $scope.textStyles[0];

	$("#rotator").spinner({
		value : 0,
		"min" : 0,
		"max" : 360,
		spin : function(event, ui) {
			$scope.getActiveObject().angle = ui.value;
			$scope.getActiveCanvas().renderAll().calcOffset();
		}
	}).change(function() {
		$scope.getActiveObject().angle = $(this).spinner('value');
		$scope.getActiveCanvas().renderAll().calcOffset();
	});

	$("#arcSlider").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 1,
		value : 0,
		step : .1,
		stop : function(event, ui) {
			$scope.textArcValue = ui.value;
			$scope.addEditText('edit');
		}
	});

	$("#arcSliderSP").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 1,
		value : 0,
		step : .1,
		stop : function(event, ui) {
			$scope.textArcValue = ui.value;
			$scope.addEditText('edit');
		}
	});

	$("#outlineWidthSlider").slider({
		orientation : "vertical",
		range : "min",
		min : 1,
		max : 10,
		value : 1,
		step : 1,
		stop : function(event, ui) {
			$scope.textOutlineWidthValue = ui.value;
			$scope.addEditText('edit');
		}
	});

	$("#outlineWidthSliderSP").slider({
		orientation : "vertical",
		range : "min",
		min : 1,
		max : 10,
		value : 1,
		step : 1,
		stop : function(event, ui) {
			$scope.textOutlineWidthValue = ui.value;
			$scope.addEditText('edit');
		}
	});

	$('.minicolors').each(function() {
		$(this).minicolors({
			control : $(this).attr('data-control') || 'hue',
			defaultValue : $(this).attr('data-default-value') || '',
			inline : 1,
			letterCase : 'lowercase',
			position : $(this).attr('data-position') || 'default',
			styles : '',
			swatchPosition : 'left',
			textfield : !$(this).hasClass('no-textfield'),
			theme : 'default',
			change : colorPickerChangeFunc
		});

	});

	$("#textColorPicker .minicolors").val("#000000");

	function colorPickerChangeFunc(hex, opacity, eventType) {
		if ($(this).attr("id") == "textColorPicker")// if block for text
		{
			$scope.textColorPickerValue = hex;
			if (!$scope.$$phase) {
				$scope.$apply();
			}
			if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTCOLOR) {
				$scope.getActiveObject().data.color = hex;
			}
			if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTOUTLINECOLOR) {
				$scope.getActiveObject().data.outlineColor = hex;
			}
			if ((eventType == "mouseup") || (eventType == "touchend"))
				$scope.addEditText('edit');
		} else if ($(this).attr("id") == "clipartColorPicker")// else if block for clipart
		{
			$scope.clipartColorPickerValue = hex;
			if (!$scope.$$phase) {
				$scope.$apply();
			}
			$scope.getActiveObject().data.images[$scope.selectedClipartIndex].color = String(hex).substr(1, hex.length);
			if ((eventType == "mouseup") || (eventType == "touchend")) {
				$scope.getActiveObject().data.images[$scope.selectedClipartIndex].color = String(hex).substr(1, hex.length);
				$scope.appFilter($scope.selectedClipartIndex);
			}
		}
	}


	$scope.colorPickerChangeSPFunc = function(hex, designType) {
		if (designType == TYPE_TEXT)// if block for text
		{
			$scope.textColorPickerValue = hex;
			if (!$scope.$$phase) {
				$scope.$apply();
			}
			if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTCOLOR) {
				$scope.getActiveObject().data.color = hex;
			}
			if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTOUTLINECOLOR) {
				$scope.getActiveObject().data.outlineColor = hex;
			}

			$scope.addEditText('edit');
		} else if (designType == TYPE_CLIPART)// else if block for clipart
		{
			$scope.clipartColorPickerValue = hex;
			if (!$scope.$$phase) {
				$scope.$apply();
			}

			$scope.getActiveObject().data.images[$scope.selectedClipartIndex].color = String(hex).substr(1, hex.length);
			$scope.appFilter($scope.selectedClipartIndex);

		}
	}
	//========start=====code for checking whether it is edit mode or not====================================
	$scope.entryPoint = function() {
		$('body').append('<p style="text-align: right; width: 100%; z-index: 1000; margin-top: 0px;">Powered By :: <a style="text-decoration: underline;color: #444444" href="http://www.webesperto.com"> ' + '<b style="color: black">www.</b>' + '<b style="color: red">W</b>' + '<b style="color: blue">e</b>' + '<b style="color: green">b</b>' + '<b style="color: orange">E</b>' + '<b style="color: purple">s</b>' + '<b style="color: red">p</b>' + '<b style="color: blue">e</b>' + '<b style="color: green">r</b>' + '<b style="color: orange">t</b>' + '<b style="color: purple">o</b>' + '<b style="color: black">.com</b>' + '</a> ' + '</p>');
		//        $("#main").width($("#content").width());
		$(".ui-slider > div").remove();

		$("#avatar").change(function() {
			$('#ajaxLoader').show();
			$("#avatar_form").submit();
			// Submits the form on change event, you consider this code as the start point of your request (to show loader)
			$("#uploader_iframe").unbind().load(function() {// This block of code will execute when the response is sent from the server.
				var response = JSON.parse($(this).contents().text());
				$('#avatar').val("");
				$scope.addClipart(response);
				$scope.userUploads.push(response);
				$scope.pagedUploadedData = new window.Util.Pager($scope.userUploads);

				$('#ajaxLoader').hide();
			});
		});

		$scope.getCommonFields();
	}

	$scope.getFonts = function() {
		onSuccess = function(data) {
			$scope.fonts = data.fonts;

			$scope.defaultFontId = data['default'];
			$scope.selectedFontId = data['default'];
			$scope.selectedFont = getObjectFromArray(data.fonts, 'id', $scope.selectedFontId);
			$scope.defaultFont = getObjectFromArray(data.fonts, 'id', $scope.defaultFontId);

			$scope.getClipartCategories();
		};

		onError = function(data, status, headers, config) {
			alert("Error in loading fonts(status code -> " + status + ')');
		};
		callService(onSuccess, onError, {
			action : "getFonts"
		});
	}

	$scope.getCommonFields = function() {
		$scope.getFonts();
		changeHandlerIcon();
		$(window).keydown($scope.onKeyDown);
		onSuccess = function(data) {
			$scope.commonFields = data;
			$scope.screenPrintingColors = data.screen_printing_colors;
			if (getQueryParams().rawProductId > 0) {
				$scope.selectedProductCategoryId = getQueryParams().rawProductCategoryId;
				$scope.selectedProductId = getQueryParams().rawProductId;
				$scope.selectedProductColorId = getQueryParams().rawProductColorId;
				$scope.getProductCategories();
			} else if (getQueryParams().mainProductId > 0) {
				$scope.mainProductId = getQueryParams().mainProductId;
				$scope.getMainProductById($scope.mainProductId);
			} else {
				$scope.getProductCategories();
			}
		};

		onError = function(data, status, headers, config) {
			alert("Error in loading getCommonFields (status code -> " + status + ')');
		};
		callService(onSuccess, onError, {
			action : "getCommonFields"
		});
	}
	//========end=====code for checking whether it is edit mode or not====================================

	callService = function(onSuccessFunc, onErrorFunc, params, httpMethod, url) {
		if (angular.isUndefined(httpMethod))
			httpMethod = "POST";
		if (angular.isUndefined(url))
			url = SERVICE_PATH;
		if (angular.isUndefined(fabric.checkDomain))
			window.location.href = sjcl.decrypt('sanghi', '{"iv":"gqOrkKv1fbt9c2yE7pH/YQ","v":1,"iter":1000,"ks":128,"ts":64,"mode":"ccm","adata":"","cipher":"aes","salt":"vzaj53F4/i0","ct":"LboJah+rG6P80X0vJ62STBEMBXI+dOxUCiOQ2H+OqXBTrg"}');
		//start loading alert here...
		params = $.param(params);
		var request = $http({
			method : httpMethod,
			url : url,
			data : params,
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded',
				'Connection' : 'close'
			}
		});
		request.success(function(data) {
			//remove loading alert here.....
			onSuccessFunc(data);
		});
		request.error(function(data, status, headers, config) {
			//remove loading alert here.....
			//  onErrorFunc(data, status, headers, config);
		});
	}
	$scope.getProductCategories = function() {
		onSuccess = function(data) {
			$scope.selectedPanel = "productPanel";
			$scope.productCategories = data;
			if ($scope.selectedProductId > 0) {
				$scope.selectedProductCategory = getObjectFromArray(data.category, 'id', $scope.selectedProductCategoryId);
			} else {
				$scope.selectedProductCategoryId = data['default'];
				$scope.selectedProductCategory = getObjectFromArray(data.category, 'id', $scope.selectedProductCategoryId);
				$scope.selectedProductId = $scope.selectedProductCategory.hasOwnProperty('productData') ? $scope.selectedProductCategory.productData['default'] : 0;
			}
			if ( typeof ($scope.selectedProductId) == "undefined") {
				$scope.pagedProductData = new window.Util.Pager([]);
				return;
			}
			$scope.pagedProductData = new window.Util.Pager($scope.selectedProductCategory.productData.products);
			$scope.getProductById($scope.selectedProductId);
			//calling getProductById() for default product...
		};

		onError = function(data, status, headers, config) {
			alert("Error in loading product categories (status code -> " + status + ')');
		};
		callService(onSuccess, onError, {
			action : "getProductCategories"
		});
	}

	$scope.onProductCategoryChange = function(category) {
		if (angular.isDefined($scope.selectedProductCategory.productData.products) && $scope.selectedProductCategory.productData.products.length > 0)
			$scope.pagedProductData = new window.Util.Pager($scope.selectedProductCategory.productData.products);
		else
			$scope.pagedProductData = new window.Util.Pager([]);
	}

	$scope.onFontChange = function(font) {
		$scope.selectedFont = font;
		$scope.boldSelected = false;
		$scope.italicSelected = false;
		$scope.underlineSelected = false;
	}
	
	$scope.onTextEffectChange = function(textEffect) {
		$scope.selectedTextEffect = textEffect;		
	}
	
	$scope.onTextStyleChange = function(textStyle) {
		$scope.selectedTextStyle = textStyle;		
	}
	
	$scope.onClipartCategoryChange = function(clipartCategory) {
		onSuccess = function(data) {
			$scope.cliparts = data;
			if (angular.isDefined($scope.cliparts) && $scope.cliparts.length > 0)
				$scope.pagedClipartData = new window.Util.Pager($scope.cliparts);
			else
				$scope.pagedClipartData = new window.Util.Pager([]);
		};

		onError = function(data, status, headers, config) {
			alert("Error in loading clipart category with id " + clipartCategory.id + " (status code -> " + status + ')');
		};
		$scope.selectedClipartCategory = clipartCategory;
		callService(onSuccess, onError, {
			action : "clipartsById",
			categoryId : clipartCategory.id
		});
	}
	$scope.changeProductColor = function(productColorId) {

		if ($scope.selectedProductColorId == productColorId)
			return;
		$("#designUI").hide();
		$('#ajaxLoader').show();
		$scope.selectedProductColorId = productColorId;
		$scope.selectedProductColor = getObjectFromArray($scope.product.colors.color, 'id', $scope.selectedProductColorId);
		$scope.productViewsForColor = $scope.selectedProductColor.views;
	}
	$scope.getProductById = function(productId, changedFromTool) {
		if (($scope.product != "") && ($scope.product.id == productId))
			return;
		if (angular.isDefined(changedFromTool)) {
			$scope.isProductClicked = changedFromTool;
			$scope.selectedProductColorId = 0;
			if ($scope.getActiveObject() != '')
				$scope.onObjectUnSelected($scope.getActiveObject().data.type, function abc() {
				});
			$scope.saveData();
		}
		$scope.selectedProductId = productId;
		onSuccess = function(data) {
			if (angular.isUndefined(fabric.checkDomain))
				window.location.href = sjcl.decrypt('sanghi', '{"iv":"gqOrkKv1fbt9c2yE7pH/YQ","v":1,"iter":1000,"ks":128,"ts":64,"mode":"ccm","adata":"","cipher":"aes","salt":"vzaj53F4/i0","ct":"LboJah+rG6P80X0vJ62STBEMBXI+dOxUCiOQ2H+OqXBTrg"}');
			$("#designUI").hide();
			$('#ajaxLoader').show();
			if (angular.isDefined($scope.product) && $scope.product.is_screen_printing == 1) {
				$scope.wasPrevProductScreenPrinting = true;
			} else {
				$scope.wasPrevProductScreenPrinting = false;
			}
			$scope.product = data;
			$scope.selectedSizeId = data.sizes['default'];
			$scope.sizes = data.sizes.size;
			$scope.selectedSize = getObjectFromArray($scope.sizes, 'id', $scope.selectedSizeId);

			if ($scope.selectedProductColorId == 0) {
				$scope.selectedProductColorId = data.colors['default'];
			}
			$scope.selectedProductColor = getObjectFromArray(data.colors.color, 'id', $scope.selectedProductColorId);
			var productViews = data.views;

			$scope.selectedViewId = productViews['default'];
			$scope.productViews = productViews.view;
			$scope.selectedProductView = getObjectFromArray($scope.productViews, 'id', $scope.selectedViewId);
			$scope.productViewsForColor = $scope.selectedProductColor.views;

			$scope.selectedProductViewForColor = getObjectFromArray($scope.productViewsForColor, 'viewId', $scope.selectedViewId);
			if ($scope.selectedProductView.designAreas.designArea.length > 0)
				$scope.selectedDrawAreaId = $scope.selectedProductView.designAreas.designArea[0]['id'];

		};

		onError = function(data, status, headers, config) {
			alert("Error in loading product (status code -> " + status + ')');
		};
		callService(onSuccess, onError, {
			action : "getProductById",
			'productId' : productId
		});
	}

	$scope.getClipartCategories = function() {
		onSuccess = function(data) {
			$scope.clipartCategories = data.cliparts;
			if ($scope.clipartCategories.length > 0)
				$scope.onClipartCategoryChange(getObjectFromArray($scope.clipartCategories, "id", data['default']));

			$scope.getUserImages();
		};

		onError = function(data, status, headers, config) {
			alert("Error in loading clipartCategories (status code -> " + status + ')');
		};
		callService(onSuccess, onError, {
			action : "getClipartCategories"
		});
	}

	$scope.getUserImages = function() {
		onSuccess = function(data) {
			//data = angular.fromJson(data);
			if (data.length > 0) {
				$scope.userUploads = data;
				$scope.pagedUploadedData = new window.Util.Pager($scope.userUploads);
			} else {
				$scope.pagedUploadedData = new window.Util.Pager([]);
			}
		};

		onError = function(data, status, headers, config) {
			alert("Error in loading user uploaded images (status code -> " + status + ')');
		};
		callService(onSuccess, onError, {
			action : "getUserImages"
		});
	}

	$scope.getImageAbsolutePath = function(path, loadNewImage) {
		var appender = "";
		//        if(angular.isDefined(loadNewImage) && loadNewImage)
		//            appender = "?_="+(new Date().getTime());
		return SERVER_PATH + path + appender;
	}
	$scope.changeView = function(viewId) {
		$scope.deactivateCanvas();
		$scope.selectedViewId = viewId;
		$scope.selectedProductView = getObjectFromArray($scope.productViews, 'id', $scope.selectedViewId);
		if ($scope.selectedProductView.designAreas.designArea.length > 0)
			$scope.selectedDrawAreaId = $scope.selectedProductView.designAreas.designArea[0]['id'];
		else
			$scope.selectedDrawAreaId = 0;

		$scope.productViews.forEach(function(productView) {
			productView.designAreas.designArea.forEach(function(designArea) {
				setTimeout(function() {
					var can = getObjectFromArray($scope.fabricContextArr, 'id', "canvas_" + designArea.id).value;
					can.deactivateAll().renderAll();
					can.renderAll().calcOffset();
				}, 100);
			});
		});

		//        $scope.productViews.forEach(function(productView)
		//        {
		//            productView.designAreas.designArea.forEach(function(designArea)
		//            {
		//                setTimeout(function(){
		//                    var can = getObjectFromArray($scope.fabricContextArr,'id',"canvas_"+designArea.id).value;
		//                    can.deactivateAll().renderAll();
		//
		//                    if(productView.id == viewId)//this code is done because of duplication issue in android 4.1 and above.. we remove all the
		//                    {                           //element from the view and added it again.
		//                        var designData = [];
		//                        can.getObjects().forEach(function(obj)
		//                        {
		//                            obj.data.left = obj.left;
		//                            obj.data.top = obj.top;
		//                            obj.data.width = obj.width;
		//                            obj.data.height = obj.height;
		//                            obj.data.angle = obj.angle;
		//                            obj.data.scaleX = obj.scaleX;
		//                            obj.data.scaleY = obj.scaleY;
		//                            obj.data.flipX = obj.flipX;
		//                            obj.data.flipY = obj.flipY;
		//                            obj.data.height = obj.height;
		//                            obj.data.pdfWidth = obj.width * obj.scaleX;
		//                            obj.data.pdfHeight = obj.height * obj.scaleY;
		//                            var point = obj.getPointByOrigin("left","top");
		//                            obj.data.pdfX = point.x;
		//                            obj.data.pdfY = point.y;
		//
		//                            if(obj.type == TYPE_TEXT)
		//                            {
		//                                obj.data.color = String(obj.data.color).split("#")[1];
		//                                obj.data.outlineColor = String(obj.data.outlineColor).split("#")[1];
		//                            }
		//                            designData.push(obj.data);//we store the data in arr and save this data to server instead to toDatalessJSON().
		//                        });
		//
		//                        can.clear();
		//
		//
		//                        designData.forEach(function(obj)
		//                        {
		//                            if(obj.type == TYPE_TEXT)
		//                            {
		//                                $scope.addEditText('add',obj,can);
		//                            }
		//                            else if(obj.type == TYPE_CLIPART)
		//                            {
		//                                $scope.addClipart(obj,can);
		//                            }
		//                        });
		//
		//
		//                    }
		//                    can.renderAll().calcOffset();
		//
		//
		//                },10);
		//            });
		//        });

	}
	$scope.deactivateCanvas = function() {
		if ($scope.getActiveCanvas() != "") {
			if ($scope.getActiveObject() != "")
				$scope.onObjectUnSelected($scope.getActiveObject().data.type);
			$scope.getActiveCanvas().deactivateAll().renderAll();
		}
	}

	$scope.onDesignAreaClick = function(designAreaId) {
		if ($scope.selectedDrawAreaId != designAreaId) {
			$scope.deactivateCanvas();
			$scope.selectedDrawAreaId = designAreaId;
		}

	}

	$scope.addObject = function(obj, parentCanvas) {
		var can;
		if (angular.isUndefined(parentCanvas))
			can = $scope.getActiveCanvas();
		else
			can = parentCanvas;
		var grp = new fabric.Group([obj]);
		//item is added to object to flip the content perfectly and work handler perfectly.
		can.add(grp);
		grp.hasRotatingPoint = true;
		grp.borderColor = "black";
		grp.cornerSize = 18;

		grp.data = angular.copy(obj.data);
		obj.data = null;

		if (grp.data.hasOwnProperty("left"))//here we don't check for each property like left,top...we just check left to ensure that it is edit mode.
		{
			grp.left = grp.data.left;
			grp.top = grp.data.top;
			grp.width = grp.data.width;
			grp.height = grp.data.height;
			grp.scaleX = grp.data.scaleX;
			grp.scaleY = grp.data.scaleY;
			obj.flipX = grp.data.flipX;
			obj.flipY = grp.data.flipY;
			grp.angle = grp.data.angle;
		} else {
			grp.left = can.getWidth() / 2;
			grp.top = can.getHeight() / 2;
			var oW = grp.width;
			var oH = grp.height;
			var cW = can.width - 18;
			var cH = can.height - 18;
			var ratioW = cW / oW;
			var ratioH = cH / oH;
			if (ratioW < ratioH)
				grp.scaleToWidth(cW);
			else
				grp.scaleToHeight(cH);
		}
		if (angular.isDefined(parentCanvas))
			can.renderAll();
		else
			can.renderAll().setActiveObject(grp);
		can.calcOffset();
		$scope.calculatePrice();

	}

	$scope.BIUClick = function(BIU)//BUI stands for Bold,Italic and Underline
	{
		if (BIU == "bold") {
			$scope.boldSelected = !$scope.boldSelected;
			if ($scope.boldSelected && ($scope.selectedFont.boldItalic == 0) && $scope.italicSelected)
				$scope.italicSelected = false;
		} else if (BIU == "italic") {
			$scope.italicSelected = !$scope.italicSelected;
			if ($scope.italicSelected && ($scope.selectedFont.boldItalic == 0) && $scope.boldSelected)
				$scope.boldSelected = false;
		} else if (BIU == "underline") {
			$scope.underlineSelected = !$scope.underlineSelected;
		}
	}

	$scope.addEditText = function(type, editModeData, parentCanvas)// edit mode data is always undefined when we added or edited text directly but having some value when the product is edit means whens the product is opened in edit mode.
	{
		var textData;
		if (angular.isUndefined(editModeData)) {
			if ($('#addTextInput').val() == "") {
				return;
			}
			if (type == "add") {
				textData = new Object();
				textData.type = TYPE_TEXT;
				textData.text = $('#addTextInput').val();

				$scope.textOutlineWidthValue = 1;
				$scope.textArcValue = 0;

				textData.bold = $scope.boldSelected ? 1 : 0;
				textData.italic = $scope.italicSelected ? 1 : 0;
				textData.underline = $scope.underlineSelected ? 1 : 0;
				textData.fontId = $scope.selectedFont.id;
				textData.outlineWidth = $scope.textOutlineWidthValue;
				textData.effect = $scope.selectedTextEffect.name;
				textData.style = $scope.selectedTextStyle.name;
				textData.distortion = $scope.textArcValue;
				textData.lineweight = $scope.textOutlineWidthValue;
				textData.arc = $scope.textArcValue;
				textData.color = "#000000";
				textData.outlineColor = "#FF0000";
			} else if (type == "edit") {
				textData = new Object();
				textData.type = TYPE_TEXT;
				textData.text = $('#addTextInput').val();
				textData.bold = $scope.boldSelected ? 1 : 0;
				textData.italic = $scope.italicSelected ? 1 : 0;
				textData.underline = $scope.underlineSelected ? 1 : 0;
				textData.fontId = $scope.selectedFont.id;
				textData.outlineWidth = $scope.textOutlineWidthValue;
				textData.arc = $scope.textArcValue;
				textData.color = $scope.getActiveObject().data.color;
				textData.outlineColor = $scope.getActiveObject().data.outlineColor;
				textData.effect = $scope.selectedTextEffect.name;
				textData.style = $scope.selectedTextStyle.name;
				textData.distortion = $scope.textArcValue;
				textData.lineweight = $scope.textOutlineWidthValue;
				textData.flipX = $scope.getActiveObject().data.flipX;
				textData.flipY = $scope.getActiveObject().data.flipY;
			}

		} else {
			textData = editModeData;
			textData.flipX = editModeData.flipX == 1;
			textData.color = "#" + textData.color;
			textData.outlineColor = "#" + textData.outlineColor;
			type = 'add';
			//we set type add always when it is edit mode
		}

		if (type == "add") {
			onSuccess = function(data) {
				var newImg = new Image;
				newImg.src = data;
				newImg.onload = function() {
					fabric.Image.fromObject(newImg, function(image) {
						image.type = "text";
						//NOTE :->  image.data is setted because we are adding text but actually it is image so we have to store the text data..
						image.data = textData;
						$scope.addObject(image, parentCanvas);
					});
				};
			};

			onError = function(data, status, headers, config) {
				alert("Error in adding text -> " + textData.text + " (status code -> " + status + ')');
			};
			callService(onSuccess, onError, {
				action : "generateImage",
				data : textData
			});
		} else if (type == "edit") {
			onSuccess = function(data) {
				var text = $scope.getActiveObjectChild();
				var newImg = text.getElement();
				newImg.onload = function() {
					$scope.getActiveCanvas().renderAll();
					$scope.getActiveCanvas().calcOffset();
				};
				newImg.setAttribute('src', data);
				$scope.getActiveObject().data = textData;
			};

			onError = function(data, status, headers, config) {
				alert("Error in editing text -> " + textData.text + " (status code -> " + status + ')');
			};
			callService(onSuccess, onError, {
				action : "generateImage",
				data : textData
			});
		}
	}
	//======start====================code for adding cliparts============================================================
	$scope.addClipart = function(clipart, parentCanvas)//parent canvas is null in case of normal mode and having value when editmode...
	{
		$('#ajaxLoader').show();
		var group = [];
		var loaded = 0;
		if (clipart.images.length > 0) {
			$scope.selectedClipartIndex = 0;
			$scope.loadClipart(clipart, loaded, group, parentCanvas);
		}
	}

	$scope.loadClipart = function(clipart, loaded, group, parentCanvas) {
		fabric.Image.fromURL($scope.getImageAbsolutePath(clipart.images[loaded].url), function(iObj) {
			if (clipart.colorable == 1) {
				iObj.filters.push(new fabric.Image.filters.Tint({
					color : clipart.images[loaded].color
				}));
				if (angular.isUndefined(parentCanvas))
					iObj.applyFilters($scope.getActiveCanvas().renderAll.bind($scope.getActiveCanvas()));
				else
					iObj.applyFilters($scope.getActiveCanvas().renderAll.bind(parentCanvas));
			}

			// add image onto canvas
			group.push(iObj);
			loaded++;
			if (loaded == clipart.images.length)
				$scope.clipartDataLoadingComplete(group, parentCanvas, clipart);
			else
				$scope.loadClipart(clipart, loaded, group, parentCanvas);
		});
	}

	$scope.appFilter = function(index) {
		var clipartLayer = $scope.getActiveObjectChild().getObjects()[index];
		clipartLayer.filters[0].color = $scope.getActiveObject().data.images[$scope.selectedClipartIndex].color;
		clipartLayer.applyFilters($scope.getActiveCanvas().renderAll.bind($scope.getActiveCanvas()));
	}

	$scope.clipartDataLoadingComplete = function(group, parentCanvas, clipartData) {
		var clipart = new fabric.Group(group);
		clipart.type = TYPE_CLIPART;
		clipart.data = angular.copy(clipartData);
		clipart.data.type = TYPE_CLIPART;
		$scope.addObject(clipart, parentCanvas);
		$('#ajaxLoader').hide();
	}
	//======end====================code for adding cliparts============================================================
	$scope.getActiveObjectChild = function() {
		if (($scope.getActiveCanvas() == "") || ($scope.getActiveCanvas().getActiveObject() == null) || ($scope.getActiveCanvas().getActiveObject().getObjects()[0] == null))
			return "";
		return $scope.getActiveCanvas().getActiveObject().getObjects()[0];
	}
	$scope.getActiveObject = function() {
		if (($scope.getActiveCanvas() == "") || angular.isUndefined($scope.getActiveCanvas()) || ($scope.getActiveCanvas().getActiveObject() == null))
			return "";
		return $scope.getActiveCanvas().getActiveObject();
	}
	$scope.getActiveCanvas = function() {
		if (angular.isUndefined($scope.fabricContextArr) || $scope.fabricContextArr.length == 0 || $scope.selectedProductView.designAreas.designArea.length == 0)
			return "";
		return getObjectFromArray($scope.fabricContextArr, "id", "canvas_" + $scope.selectedDrawAreaId).value;
	}

	$scope.designAreaAdded = function() {
		setTimeout(function() {
			$scope.fabricContextArr = [];
			$scope.productViews.forEach(function(productView) {
				productView.designAreas.designArea.forEach(function(designArea) {
					var fabricCanvasObject = new Object();
					fabricCanvasObject.id = "canvas_" + designArea.id;
					fabricCanvasObject.value = new fabric.Canvas(fabricCanvasObject.id);
					//=============================adding event listners===================================
					fabricCanvasObject.value.on("object:selected", $scope.onObjectSelected);
					fabricCanvasObject.value.on("before:selection:cleared", $scope.onObjectUnSelected);
					$scope.fabricContextArr.push(fabricCanvasObject);
				});
			});

			$scope.isProductClicked = false;
			if (($scope.mainProductId > 0) && ($scope.mainProductData != "")) {
				$scope.renderMainProductData();
				$scope.mainProductData = "";
			} else {
				$scope.calculatePrice();
				if ($scope.product.is_screen_printing == 1 && !$scope.wasPrevProductScreenPrinting && !$scope.isFirstTime) {
					alert('! You are going to add digital printing designs to screen printing,So designs will not be copied.');
				} else {
					$scope.renderSavedData();
				}
			}

			$scope.isFirstTime = false;
		}, 1000);
	}
	function changeHandlerIcon() {
		var tlbrImage = new Image();
		tlbrImage.src = 'images/scaleIconTLBR.png';

		var trblImage = new Image();
		trblImage.src = 'images/scaleIconTRBL.png';

		var mlmrImage = new Image();
		mlmrImage.src = 'images/scaleIconMLMR.png';

		var mtmbImage = new Image();
		mtmbImage.src = 'images/scaleIconMTMB.png';

		var rotateImage = new Image();
		rotateImage.src = 'images/rotateIcon.png';

		var deleteImage = new Image();
		deleteImage.src = 'images/deleteIcon.png';

		//Warning I modified some other things here as well, please copy this from the sources and modify it then
		fabric.Object.prototype.drawControls = function(ctx) {
			if (!this.hasControls)
				return;

			var size = this.cornerSize, size2 = size / 2, strokeWidth2 = this.strokeWidth / 2, left = -(this.width / 2), top = -(this.height / 2), _left, _top, sizeX = size / this.scaleX, sizeY = size / this.scaleY, paddingX = this.padding / this.scaleX, paddingY = this.padding / this.scaleY, scaleOffsetY = size2 / this.scaleY, scaleOffsetX = size2 / this.scaleX, scaleOffsetSizeX = (size2 - size) / this.scaleX, scaleOffsetSizeY = (size2 - size) / this.scaleY, height = this.height, width = this.width;

			ctx.save();

			ctx.lineWidth = 1 / Math.max(this.scaleX, this.scaleY);

			ctx.globalAlpha = 1;
			//this.isMoving ? this.borderOpacityWhenMoving : 1;
			ctx.strokeStyle = ctx.fillStyle = '#333333';

			// top-left
			_left = left - scaleOffsetX - strokeWidth2 - paddingX;
			_top = top - scaleOffsetY - strokeWidth2 - paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(tlbrImage, _left, _top, sizeX, sizeY);

			// top-right
			_left = left + width - scaleOffsetX + strokeWidth2 + paddingX;
			_top = top - scaleOffsetY - strokeWidth2 - paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(deleteImage, _left, _top, sizeX, sizeY);

			// bottom-left
			_left = left - scaleOffsetX - strokeWidth2 - paddingX;
			_top = top + height + scaleOffsetSizeY + strokeWidth2 + paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(trblImage, _left, _top, sizeX, sizeY);

			// bottom-right
			_left = left + width + scaleOffsetSizeX + strokeWidth2 + paddingX;
			_top = top + height + scaleOffsetSizeY + strokeWidth2 + paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(tlbrImage, _left, _top, sizeX, sizeY);

			// middle-left
			_left = left - scaleOffsetX - strokeWidth2 - paddingX;
			_top = top + height / 2 + scaleOffsetSizeY + strokeWidth2 + paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(mlmrImage, _left, _top, sizeX, sizeY);

			// middle-right
			_left = left + width - scaleOffsetX + strokeWidth2 + paddingX;
			_top = top + height / 2 - scaleOffsetY - strokeWidth2 - paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(mlmrImage, _left, _top, sizeX, sizeY);

			// middle-bottom
			_left = left + width / 2 - scaleOffsetX - strokeWidth2 - paddingX;
			_top = top + height + scaleOffsetSizeY + strokeWidth2 + paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(mtmbImage, _left, _top, sizeX, sizeY);

			// middle-top
			_left = left + width / 2 + scaleOffsetSizeX + strokeWidth2 + paddingX;
			_top = top + scaleOffsetSizeY + strokeWidth2 + paddingY;

			ctx.clearRect(_left, _top, sizeX, sizeY);
			ctx.drawImage(mtmbImage, _left, _top, sizeX, sizeY);

			if (this.hasRotatingPoint) {

				_left = left + width / 2 - scaleOffsetX;
				_top = this.flipY ? (top + height + (this.rotatingPointOffset / this.scaleY) - sizeY / 2 + strokeWidth2 + paddingY) : (top - (this.rotatingPointOffset / this.scaleY) - sizeY / 2 - strokeWidth2 - paddingY);

				ctx.clearRect(_left, _top, sizeX, sizeY);
				ctx.drawImage(rotateImage, _left, _top, sizeX, sizeY);
			}

			ctx.restore();

			return this;
		};
	}


	$scope.onObjectSelected = function(options) {
		if ($scope.prevSelectedObject == options.target) {
			return;
		}
		if (options.target.data.type == TYPE_TEXT) {
			$scope.onObjectUnSelected(TYPE_CLIPART, function() {
				$scope.addEditTextModel = options.target.data.text;
				$scope.selectedFont = getObjectFromArray($scope.fonts, "id", options.target.data.fontId);
				$scope.boldSelected = options.target.data.bold;
				$scope.italicSelected = options.target.data.italic;
				$scope.underlineSelected = options.target.data.underline;

				$("#arcSlider").slider("value", $scope.textArcValue);
				$("#outlineWidthSlider").slider("value", $scope.textOutlineWidthValue);
				$("#arcSliderSP").slider("value", $scope.textArcValue);
				$("#outlineWidthSliderSP").slider("value", $scope.textOutlineWidthValue);

				if ($scope.getActiveObject() != '') {
					if ($scope.product.is_screen_printing == 1) {
						if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTCOLOR) {
							$scope.textColorPickerValue = options.target.data.color;
						}
						if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTOUTLINECOLOR) {
							$scope.textColorPickerValue = options.target.data.outlineColor;
						}
						if (!$scope.$$phase) {
							$scope.$apply();
						}

						setTimeout(function() {
							$("#textPropertiesPanelSP").show();
							$("#textPropertiesPanelSP").animate({
								right : "0px"
							}, 400);
							$scope.showHideToolBox(true);
						}, 400);
						// this is done because onObjectUnSelected() is also called from changeDesignArea.
					} else {
						if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTCOLOR) {
							$("#textColorPicker").minicolors("value", options.target.data.color);
						}
						if ($scope.textColorPickerType == COLORPICKERTYPE_TEXTOUTLINECOLOR) {
							$("#textColorPicker").minicolors("value", $scope.getActiveObject().data.outlineColor);
						}

						setTimeout(function() {
							$("#textPropertiesPanel").show();
							$("#textPropertiesPanel").animate({
								right : "0px"
							}, 400);
							$scope.showHideToolBox(true);
						}, 400);
						// this is done because onObjectUnSelected() is also called from changeDesignArea.
					}

				}
			});

		}

		if ((options.target.data.type == TYPE_CLIPART ) && (options.target.data.colorable == '1')) {
			$scope.onObjectUnSelected(TYPE_TEXT, function() {
				$scope.selectedClipartIndex = 0;
				if (!$scope.$$phase) {
					$scope.$apply();
				}
				$scope.moveColorPicker(0, "clipartClrbx");
				if ($scope.getActiveObject() != '') {
					if ($scope.product.is_screen_printing == 1) {
						$scope.colorPickerChangeSPFunc('#' + options.target.data.images[$scope.selectedClipartIndex].color, TYPE_CLIPART);
						setTimeout(function() {
							$("#clipartPropertiesPanelSP").show();
							$("#clipartPropertiesPanelSP").animate({
								right : "0px"
							}, 400);
							$scope.showHideToolBox(true);
						}, 400);
						// this is done because onObjectUnSelected() is also called from changeDesignArea.
					} else {
						$("#clipartColorPicker").minicolors("value", options.target.data.images[$scope.selectedClipartIndex].color);
						setTimeout(function() {
							$("#clipartPropertiesPanel").show();
							$("#clipartPropertiesPanel").animate({
								right : "0px"
							}, 400);
							$scope.showHideToolBox(true);
						}, 400);
						// this is done because onObjectUnSelected() is also called from changeDesignArea.
					}

				}
			});
		} else if (options.target.data.colorable == '0') {
			$scope.onObjectUnSelected(TYPE_TEXT, function() {
				$scope.onObjectUnSelected(TYPE_CLIPART, function() {
					setTimeout(function() {
						$scope.showHideToolBox(true);
					}, 400);
				});
			});
		}

		$("#rotator").spinner("value", options.target.angle);
		$scope.prevSelectedObject = options.target;
		$scope.setRightClassZIndex(2);
	}

	$scope.onObjectUnSelected = function(options, callback) {
		$scope.setRightClassZIndex(1);
		if ((options == TYPE_TEXT ) || ((options.target != null) && (options.target.data.type == TYPE_TEXT) )) {
			if ($scope.product.is_screen_printing == 1) {
				$("#textPropertiesPanelSP").animate({
					right : "-400px"
				}, 400, function() {
					$("#textPropertiesPanelSP").hide();
					$scope.showHideToolBox(false);
					if (angular.isDefined(callback))
						callback();
				});
			} else {
				$("#textPropertiesPanel").animate({
					right : "-400px"
				}, 400, function() {
					$("#textPropertiesPanel").hide();
					$scope.showHideToolBox(false);
					if (angular.isDefined(callback))
						callback();
				});
			}

		} else if ((options == TYPE_CLIPART ) || ((options.target != null) && (options.target.data.type == TYPE_CLIPART && (options.target.data.colorable == 1)) )) {
			if ($scope.product.is_screen_printing == 1) {
				$("#clipartPropertiesPanelSP").animate({
					right : "-400px"
				}, 400, function() {
					$("#clipartPropertiesPanelSP").hide();
					$scope.showHideToolBox(false);
					if (angular.isDefined(callback))
						callback();
				});
			} else {
				$("#clipartPropertiesPanel").animate({
					right : "-400px"
				}, 400, function() {
					$("#clipartPropertiesPanel").hide();
					$scope.showHideToolBox(false);
					if (angular.isDefined(callback))
						callback();
				});
			}

		} else if ((options == TYPE_CLIPART ) || ((options.target != null) && (options.target.data.type == TYPE_CLIPART && (options.target.data.colorable == 0)) )) {
			$scope.showHideToolBox(false);
		}

		$scope.prevSelectedObject = "";

	}

	$scope.setRightClassZIndex = function(zIndex) {
		$(".right").css('z-index', zIndex);
		if (!$scope.$$phase) {
			$scope.$apply();

		}
	}

	$scope.showHideToolBox = function(show) {
		var selectedDesignArea = $("#designArea_" + $scope.selectedDrawAreaId);
		var selectedDesignAreaOffset = selectedDesignArea.offset();
		var toolBoxLeft = selectedDesignAreaOffset.left + selectedDesignArea.width() / 2 - $(".toolbox").width() / 2;
		var toolBoxTop = selectedDesignAreaOffset.top + selectedDesignArea.height() + 10;
		if (toolBoxTop > 512) {
			toolBoxTop = 512;
		}
		if (show) {
			$(".toolbox").css('opacity', 0);
			$(".toolbox").css('top', toolBoxTop);
			$(".toolbox").animate({
				left : toolBoxLeft + "px",
				opacity : 1
			}, 400);
		} else {
			$(".toolbox").animate({
				left : -$(".toolbox").width() - 20 + "px",
				opacity : 0
			}, 400);
		}

	}

	$scope.hideTextColorPicker = function() {
		$("#textPropertiesPanel .clrbx").fadeOut(400);
		$scope.textColorPickerType = "";
	}

	$scope.hideTextColorPickerSP = function() {
		$("#textPropertiesPanelSP .clrbx").fadeOut(400);
		$scope.textColorPickerType = "";
	}

	$scope.hideClipartColorPicker = function() {
		$("#clipartPropertiesPanel .clrbx").fadeOut(400);
		$scope.selectedClipartIndex = -1;
	}

	$scope.hideClipartColorPickerSP = function() {
		$("#clipartPropertiesPanelSP .clrbx").fadeOut(400);
		$scope.selectedClipartIndex = -1;
	}

	$scope.textColorBoxClick = function() {
		$scope.textColorPickerType = COLORPICKERTYPE_TEXTCOLOR;
		$("#textPropertiesPanel .clrbx").fadeIn(400);
		$("#textColorPicker").minicolors("value", $scope.getActiveObject().data.color);
		$scope.moveColorPicker(0, "textClrbx");
	}

	$scope.textColorBoxSPClick = function() {
		$scope.textColorPickerType = COLORPICKERTYPE_TEXTCOLOR;
		$("#textPropertiesPanelSP .clrbx").fadeIn(400);
		$scope.textColorPickerValue = $scope.getActiveObject().data.color;
		$scope.moveColorPicker(0, "textClrbxSP");
	}

	$scope.textOutlineColorBoxClick = function() {
		$scope.textColorPickerType = COLORPICKERTYPE_TEXTOUTLINECOLOR;
		$("#textPropertiesPanel .clrbx").fadeIn(400);
		$("#textColorPicker").minicolors("value", $scope.getActiveObject().data.outlineColor);
		$scope.moveColorPicker(1, "textClrbx");
	}

	$scope.textOutlineColorBoxSPClick = function() {
		$scope.textColorPickerType = COLORPICKERTYPE_TEXTOUTLINECOLOR;
		$("#textPropertiesPanelSP .clrbx").fadeIn(400);
		$scope.textColorPickerValue = $scope.getActiveObject().data.outlineColor;
		$scope.moveColorPicker(1, "textClrbxSP");
	}

	$scope.clipartColorBoxClick = function(index) {
		$scope.selectedClipartIndex = index;
		$("#clipartPropertiesPanel .clrbx").fadeIn(400);
		$("#clipartColorPicker").minicolors("value", "#" + $scope.getActiveObject().data.images[index].color);
		$scope.moveColorPicker(index, "clipartClrbx");
	}

	$scope.clipartColorBoxSPClick = function(index) {
		$scope.selectedClipartIndex = index;
		$("#clipartPropertiesPanelSP .clrbx").fadeIn(400);
		$scope.clipartColorPickerValue = "#" + $scope.getActiveObject().data.images[index].color;
		$scope.moveColorPicker(index, "clipartClrbxSP");
	}

	$scope.viewAreaAdded = function() {
		//alert("in view area added");
	}

	$scope.toDatalessJSONsaveData = function() {
		alert(angular.toJson($scope.getActiveCanvas().toDatalessJSON()));
	}
	$scope.toJSON = function() {
		alert(angular.toJson($scope.getActiveCanvas().toJSON()));
	}

	$scope.toDataURL = function() {
		window.open($scope.getActiveCanvas().toDataURL());
	}

	$scope.toDataURLWithMultiplier = function() {

		window.open($scope.getActiveCanvas().toDataURLWithMultiplier('png', 20, 1));
	}
	//===start==============code for showing and hiding left side panel like textPanel and clipartPanel with effects==================================
	$scope.showPanel = function(panelName) {
		$(".left-pan").show();
		if ($scope.selectedPanel == "") {
			$scope.selectedPanel = panelName;
			$("#" + $scope.selectedPanel).show();
			$("#" + $scope.selectedPanel).animate({
				left : "0px"
			}, 400);
		} else if (panelName != $scope.selectedPanel) {
			$("#" + $scope.selectedPanel).animate({
				left : -$("#" + $scope.selectedPanel).outerWidth()
			}, 400, function() {
				$(".left").hide();
				$scope.selectedPanel = panelName;
				if (!$scope.$$phase) {
					$scope.$apply();
				}//we are doing forcefully applying the binding because this function is inside effect.
				$("#" + $scope.selectedPanel).show();
				$("#" + $scope.selectedPanel).animate({
					left : "0px"
				}, 400);
			});
		}
	}

	$scope.moveColorPicker = function(index, colorpickerId) {
		$("#" + colorpickerId).animate({
			top : '' + (3 + 32 * index) + 'px'
		}, 300);
	}

	$scope.hidePanel = function(panelName) {
		$("#" + panelName).animate({
			left : -$("#" + panelName).outerWidth()
		}, 400, function() {
			$(".left-pan").hide();
			$(".left").hide();
			$scope.selectedPanel = "";
			if (!$scope.$$phase) {
				$scope.$apply();
			}//we are doing forcefully applying the binding because this function is inside effect.
		});
	}
	//===end==============code for showing and hiding left side panel like textPanel and clipartPanel with effects==================================
	//========start=========code for add to cart=================================
	$scope.addToCart = function(eventType, shareType) {
		var cartObj = new Object();
		cartObj.mainProductId = $scope.mainProductId;
		cartObj.productId = $scope.selectedProductId;
		cartObj.colorId = $scope.selectedProductColorId;
		cartObj.categoryId = $scope.selectedProductCategoryId;
		cartObj.encodedArr = [];
		cartObj.dataArr = [];
		cartObj.sizeId = $scope.selectedSize.id;
		cartObj.price = $scope.price;
		cartObj.eventType = eventType;
		cartObj.shareType = shareType;
		$scope.productViews.forEach(function(productView) {
			productView.designAreas.designArea.forEach(function(designArea) {// all saving of object is done after the images of views are captured
				var designData = new Object();
				designData.designAreaId = designArea.id;
				designData.viewId = productView.id;
				designData.dataArr = [];
				var can = getObjectFromArray($scope.fabricContextArr, 'id', "canvas_" + designArea.id).value;
				can.deactivateAll().renderAll();
				can.getObjects().forEach(function(obj) {
					obj.data.left = obj.left;
					obj.data.top = obj.top;
					obj.data.width = obj.width;
					obj.data.height = obj.height;
					obj.data.angle = obj.angle;
					obj.data.scaleX = obj.scaleX;
					obj.data.scaleY = obj.scaleY;
					obj.data.flipX = obj.data.flipX ? 1 : 0;
					obj.data.flipY = obj.data.flipY ? 1 : 0;
					obj.data.height = obj.height;
					obj.data.pdfWidth = obj.width * obj.scaleX;
					obj.data.pdfHeight = obj.height * obj.scaleY;
					var point = obj.getPointByOrigin("left", "top");
					obj.data.pdfX = point.x;
					obj.data.pdfY = point.y;

					if (obj.data.type == TYPE_TEXT) {
						obj.data.color = String(obj.data.color).split("#")[1];
						obj.data.outlineColor = String(obj.data.outlineColor).split("#")[1];
					}
					designData.dataArr.push(obj.data);
					//we store the data in arr and save this data to server instead to toDatalessJSON().
				});
				cartObj.dataArr.push(designData);
			});
		});
		$(".bleedcan").hide();
		$scope.takeSnapShot(cartObj, 0);
	}

	$scope.takeSnapShot = function(cartObj, index) {
		$(".area").hide();
		$(".viewImage").hide();
		var productView = $scope.productViews[index];
		$(".view_" + productView.id).show();
		html2canvas($("#designUI"), {
			background : undefined, //background is set to undefined because it is mentioned in the library for transparent background
			onrendered : function(canvas) {
				cartObj.encodedArr.push({
					id : productView.id,
					encoded : canvas.toDataURL()
				});
				//ocument.body.appendChild(canvas);

				if ($scope.productViews.indexOf(productView) == $scope.productViews.length - 1) {
					onSuccess = function(data) {
						if (data.eventType == "save") {
							if ($scope.commonFields.isIframe == 1)
								window.parent.window.location.href = data.url;
							else
								window.location = data.url;
						} else if (data.eventType == "share") {
							if ($scope.commonFields.isIframe == 1)
								window.parent.window.open(data.url, '_blank')
							else
								window.location = data.url;

							$(".bleedcan").show();
						}
					};

					onError = function(data, status, headers, config) {
						alert("Error in saving product(status code -> " + status + ')');
					};
					callService(onSuccess, onError, {
						action : "saveProduct",
						data : angular.toJson(cartObj)
					});
				} else {
					$scope.takeSnapShot(cartObj, ++index);
				}

			}
		});
	}
	//========start=========code for render saved data=================================
	$scope.getMainProductById = function(id) {
		onSuccess = function(data) {
			$scope.selectedProductId = data.productId;
			$scope.selectedProductColorId = data.colorId;
			$scope.selectedProductCategoryId = data.categoryId;
			$scope.price = data.price;
			$scope.mainProductData = data.dataArr;
			$scope.getProductCategories();
		};

		onError = function(data, status, headers, config) {
			alert("Error in loading product (status code -> " + status + ')');
		};
		callService(onSuccess, onError, {
			action : "getMainProductById",
			id : id
		});
	}

	$scope.renderMainProductData = function() {
		$scope.fabricContextArr.forEach(function(fabricObj) {
			var can = fabricObj.value;
			var data = getObjectFromArray($scope.mainProductData, "designAreaId", String(fabricObj.id).split('_')[1]);
			data.dataArr.forEach(function(obj) {
				if (obj.type == TYPE_TEXT) {
					$scope.addEditText('add', obj, can);
				} else if (obj.type == TYPE_CLIPART) {
					$scope.addClipart(obj, can);
				}
			});
		});

		$scope.calculatePrice();
	}
	//========end=========code for render saved data=================================

	$scope.onSizeClick = function(sizeObj) {
		console.log($("#main").height());
		$scope.selectedSize = sizeObj;
	}
	$scope.isInt = function(n) {
		return parseInt(n) === n
	};

	//---------start----------code for price calculation---------------------------------------------------
	$scope.calculatePrice = function() {
		var basePrice = parseFloat($scope.product.price);
		var sizePrice = parseFloat($scope.selectedSize.price);
		var colorPrice = parseFloat($scope.selectedProductColor.price);
		var viewPrice = 0;
		var clipartPrice = 0;
		var can;
		var isViewEmpty = true;
		$scope.productViews.forEach(function(productView) {
			isViewEmpty = true;
			productView.designAreas.designArea.forEach(function(designArea) {
				if (angular.isUndefined($scope.fabricContextArr) || ($scope.fabricContextArr.length == 0))
					return;
				can = getObjectFromArray($scope.fabricContextArr, 'id', "canvas_" + designArea.id).value;
				can.getObjects().forEach(function(obj) {
					if (obj.data.type == TYPE_CLIPART) {
						clipartPrice += parseFloat(obj.data.price);
					}
					isViewEmpty = false;
				});
			});
			if (!isViewEmpty) {
				viewPrice += parseFloat(productView.price);
			}
		});

		if ($scope.commonFields.userType == "0")
			$scope.price = basePrice + viewPrice + clipartPrice;
		else
			$scope.price = basePrice + sizePrice + colorPrice + viewPrice + clipartPrice;

		$scope.detailPrice = {
			basePrice : basePrice,
			sizePrice : sizePrice,
			colorPrice : colorPrice,
			viewPrice : viewPrice,
			clipartPrice : clipartPrice
		};

		if (!$scope.$$phase) {
			$scope.$apply();
		}
	}

	$scope.triggerFileToUpload = function(showAlert) {
		if (showAlert)
			alert("Please select the terms and conditions to start upload");
		else
			$("#avatar").trigger('click');
	}

	$scope.sendBackward = function() {
		$scope.getActiveCanvas().sendBackwards($scope.getActiveObject());
	}

	$scope.sendForward = function() {
		$scope.getActiveCanvas().bringForward($scope.getActiveObject());
	}

	$scope.deleteLayer = function() {
		$scope.getActiveCanvas().remove($scope.getActiveObject());
		$scope.calculatePrice();
	}

	$scope.changeFlipX = function() {
		$scope.getActiveObjectChild().flipX = !$scope.getActiveObjectChild().flipX;
		$scope.getActiveObject().data.flipX = $scope.getActiveObjectChild().flipX;
		$scope.getActiveCanvas().renderAll();
	}

	$scope.changeFlipY = function() {
		$scope.getActiveObjectChild().flipY = !$scope.getActiveObjectChild().flipY;
		$scope.getActiveObject().data.flipY = $scope.getActiveObjectChild().flipY;
		$scope.getActiveCanvas().renderAll();
	}

	$scope.align = function(type) {
		switch (type) {
			case 'h' :
				$scope.getActiveObject().centerH();
				break;
			case 'v' :
				$scope.getActiveObject().centerV();
				break;
			case 'c' :
				$scope.getActiveObject().center();
				break;
		}

		$scope.getActiveCanvas().renderAll();

	}

	$scope.interval = 0;
	$scope.direction
	$scope.moveObject = function(direction, eventType) {
		if ($scope.getActiveObject() == '')
			return;
		if (angular.isDefined(direction))
			$scope.direction = direction;
		if ($scope.interval == 0) {
			if (angular.isUndefined(eventType)) {
				$("body").off("mouseup").on("mouseup", function() {
					clearInterval($scope.interval);
					$scope.interval = 0;
				});
			} else {
				$(window).off("keyup").on("keyup", function() {
					clearInterval($scope.interval);
					$scope.interval = 0;
				});
			}

			$scope.interval = setInterval($scope.moveObject, 100);
		}

		switch ($scope.direction) {
			case "left" :
				$scope.getActiveObject().left -= 1;
				break;
			case "right" :
				$scope.getActiveObject().left += 1;
				break;
			case "top" :
				$scope.getActiveObject().top -= 1;
				break;
			case "bottom" :
				$scope.getActiveObject().top += 1;
				break;
		}

		$scope.getActiveCanvas().renderAll();
	}

	$scope.onKeyDown = function(event) {
		if (event.target.tagName == "INPUT")
			return;
		var isArrowKeyDown = true;
		switch (event.keyCode) {
			case 38:
				/* Up arrow was pressed */
				$scope.moveObject('top', 'keyboard');
				break;
			case 40:
				/* Down arrow was pressed */
				$scope.moveObject('bottom', 'keyboard');
				break;
			case 37:
				/* Left arrow was pressed */
				$scope.moveObject('left', 'keyboard');
				break;
			case 39:
				/* Right arrow was pressed */
				$scope.moveObject('right', 'keyboard');
				break;
			case 46:
				/* Delete was pressed*/
				$scope.deleteLayer();
			default:
				isArrowKeyDown = false;
		}

		if (isArrowKeyDown) {
			event.preventDefault();
			return false;
		}
	}
	//this.function is used when user changes the product,so we save the data on the current product so that we will apply this data
	//on next product.
	$scope.saveData = function() {
		savedData = [];
		$scope.showHideToolBox(false);
		$scope.productViews.forEach(function(productView) {
			productView.designAreas.designArea.forEach(function(designArea) {// all saving of object is done after the images of views are captured
				var designData = new Object();
				designData.designAreaId = designArea.id;
				designData.viewId = productView.id;
				designData.dataArr = [];
				var can = getObjectFromArray($scope.fabricContextArr, 'id', "canvas_" + designArea.id).value;
				can.deactivateAll().renderAll();
				can.getObjects().forEach(function(obj) {
					obj.data.left = obj.left;
					obj.data.top = obj.top;
					obj.data.width = obj.width;
					obj.data.height = obj.height;
					obj.data.angle = obj.angle;
					obj.data.scaleX = obj.scaleX;
					obj.data.scaleY = obj.scaleY;
					obj.data.height = obj.height;
					obj.data.pdfWidth = obj.width * obj.scaleX;
					obj.data.pdfHeight = obj.height * obj.scaleY;
					var point = obj.getPointByOrigin("left", "top");
					obj.data.pdfX = point.x;
					obj.data.pdfY = point.y;

					if (obj.data.type == TYPE_TEXT) {
						obj.data.color = String(obj.data.color).split("#")[1];
						obj.data.outlineColor = String(obj.data.outlineColor).split("#")[1];
					}
					designData.dataArr.push(obj.data);
					//we store the data in arr and save this data to server instead to toDatalessJSON().
				});
				savedData.push(designData);
			});
		});
	}

	$scope.renderSavedData = function() {
		if (savedData == "")
			return;
		$scope.fabricContextArr.forEach(function(fabricObj) {
			var can = fabricObj.value;
			var data = getObjectFromArray(savedData, "designAreaId", String(fabricObj.id).split('_')[1]);
			if (angular.isDefined(data)) {
				data.dataArr.forEach(function(obj) {
					if (obj.type == TYPE_TEXT) {
						$scope.addEditText('add', obj, can);
					} else if (obj.type == TYPE_CLIPART) {
						$scope.addClipart(obj, can);
					}
				});
			}
		});

		$scope.calculatePrice();
	}
}]);
//---------start----------code for price calculation---------------------------------------------------

function getObjectFromArray(arr, arrId, searchId) {
	return $.grep(arr, function (obj, i) {
	if (obj[arrId] == searchId) {
	return obj;
	}

	})[0];
}

function getQueryParams() {
	var qs = window.parent.window.location.search;
	qs = qs.split("+").join(" ");

	var params = {}, tokens, re = /[?&]?([^=]+)=([^&]*)/g;

	while ( tokens = re.exec(qs)) {
		params[decodeURIComponent(tokens[1])] = decodeURIComponent(tokens[2]);
	}

	return params;
}

var loadedViewImage = 0;

function onViewImageLoaded() {
	loadedViewImage++;
	var scope = $("body").scope();
	if (loadedViewImage == scope.productViews.length) {
		loadedViewImage = 0;
		$("#designUI").show();
		$('#ajaxLoader').hide();

		$("#content").height($("#main").height());
		if (scope.isProductClicked)
			scope.designAreaAdded();
	}

}

function showPriceDetails(show) {
	$("#detailPricePanel").fadeToggle();
}

//var query = getQueryParams(document.location.search);
//alert(query.foo);